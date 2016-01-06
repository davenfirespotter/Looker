- connection: bq_connection

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# NOTE: please see https://www.looker.com/docs/r/dialects/bigquery
# NOTE: for BigQuery specific considerations

# - explore: call

# - explore: call_feedback

# - explore: call_leg

# - explore: company

# - explore: company_note

# - explore: credit_card_transaction

# - explore: deleted_office

# - explore: e911_address

# - explore: invoice

# - explore: office

# - explore: office_cancellation

# - explore: plan

# - explore: plan_history

# - explore: plan_update

# - explore: referral_signup

# - explore: room

# - explore: sprint_customer

# - explore: sprint_customer_activity

# - explore: sure_tax_record

# - explore: target_note

# - explore: uber_phone

# - explore: user_device

# - explore: user_profile

# - explore: video

# - explore: voice_recording

# - explore: weebly_auth_request
#   joins:
#     - join: weebly_user
#       type: left_outer #_each
#       sql_on: ${weebly_auth_request.weebly_user_id} = ${weebly_user.weebly_user_id}
#       relationship: many_to_one


# - explore: weebly_payment

# - explore: weebly_user

