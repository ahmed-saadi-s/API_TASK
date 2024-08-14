<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {

        return [
            'first_name' => 'nullable|string|max:255',
            'last_name' => 'nullable|string|max:255',
            'email' => 'nullable|email|unique:users,email,' . $this->user()->id,
            'phone_number' => 'nullable|string|max:15',
            'date_of_birth' => 'nullable|date',
            'gender' => 'nullable|string|in:male,female',
            'nationality' => 'nullable|string|max:255',
            'country_id' => 'nullable|exists:countries,id',
            'city_id' => 'nullable|exists:cities,id',
            'account_type' => 'nullable|string|in:seeking_room,seeking_roommate',
            'job' => 'nullable|string|max:255',
            'marital_status' => 'nullable|string|in:single,married,divorced,widowed',
            'profile_picture' => 'nullable|image|max:2048',
        ];
    }
    public function messages(): array
    {
        return [
            'first_name.required' => 'First name is required',
            'last_name.required' => 'Last name is required',
            'email.required' => 'Email is required',
            'email.email' => 'The email must be a valid email address',
            'email.unique' => 'The email has already been taken',
            'phone_number.required' => 'Phone number is required',
            'birthday.required' => 'Birthday is required',
            'birthday.date' => 'The birthday must be a valid date',
            'gender.required' => 'Gender is required',
            'gender.in' => 'The selected gender is invalid',
            'nationality.required' => 'Nationality is required',
            'country_id.required' => 'Country is required',
            'country_id.exists' => 'The selected country is invalid',
            'city_id.required' => 'City is required',
            'city_id.exists' => 'The selected city is invalid',
            'account_type.required' => 'Account type is required',
            'account_type.exists' => 'The selected account type is invalid',
            'job.required' => 'Job is required',
            'marital_status.required' => 'Marital status is required',
            'marital_status.in' => 'The selected marital status is invalid',
        'profile_picture.image' => 'The profile picture must be a valid image file.',
            'profile_picture.max' => 'The profile picture may not be greater than :max kilobytes.'
        ];
    }
}
