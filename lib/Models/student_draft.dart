class StudentDraft {
  // BASIC INFO
  static String? fullName;
  static String? enrollmentNo;
  static String? email;
  static String? mobile;
  static String? dob;
  static String? gender;
  static String? city;

  // ACADEMIC DETAILS
  static String? college;
  static String? course;
  static String? semester;
  static String? marks;

  // INTERNSHIP DETAILS
  static String? company;
  static String? role;
  static String? duration;

  // MENTOR DETAILS
  static String? mentorName;
  static String? mentorEmail;
  static String? mentorMobile;
  static String? mentorFeedbackStatus;

  // SKILLS & INTERESTS
  static String? technicalSkills;
  static String? softSkills;
  static String? interests;
  static String? careerGoal;

  // LOGIN CREDENTIALS
  static String? username;
  static String? password;

  /// CLEAR ALL DATA AFTER SUCCESSFUL SIGNUP
  static void clear() {
    fullName = null;
    enrollmentNo = null;
    email = null;
    mobile = null;
    dob = null;
    gender = null;
    city = null;

    college = null;
    course = null;
    semester = null;
    marks = null;

    company = null;
    role = null;
    duration = null;

    mentorName = null;
    mentorEmail = null;
    mentorMobile = null;
    mentorFeedbackStatus = null;

    technicalSkills = null;
    softSkills = null;
    interests = null;
    careerGoal = null;

    username = null;
    password = null;
  }
}