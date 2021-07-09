Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6873C20E8
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 10:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhGIIjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 04:39:19 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38951 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231361AbhGIIjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Jul 2021 04:39:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 1lztm2Gl748Zv1lzumiyaQ; Fri, 09 Jul 2021 10:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625819794; bh=OFeuJmOX2Y6CYSddIiCgkKHAyCxj47aBuwldkwmWGYs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=k65dJXdm3g5W2xA4S9EZzM6uhKvp3Wbo50AArhRkIehFzscUWHqD9zTN67ZvtsOlb
         C7jkqsmZqzEAVs7Jxse/taQAyKYzGh9ty9nQQ3QnOjO6PwUOojAVxKfAIgh0jv0RuW
         x1XVA6DCGO4j0ykc4jA9NrXQGx67ah9RtWqjpi7ou6c3gK0sLIPcGLQc1koSL4YqoV
         +nvU4sfe005ntWnoAMcOVSO1Rei6IVygkKLSntjmMp5j4gvN+rZsY+T95ndWbXBGxY
         ZFlvJ2FXiAZLl8G/tQkmuoCOp53i/GoC6UzzMfCd08Eacz3qkGUd/OlHxMGSEYiX6x
         7NmnuV0ui6qYg==
Subject: Re: [PATCH v2] cec: expand Timer Programming tests and emulation
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <20210708222020.25636-1-deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9310caf0-f6fa-8d8d-88f6-1cad9e07b863@xs4all.nl>
Date:   Fri, 9 Jul 2021 10:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708222020.25636-1-deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfABubf9EWy7IY79QuHq8YMP6hUKkLyYOBZ5XVH1dWC8VkFljCNrzvgmiRHx8398a9J3gCOMJ5u36/aE4eHQNvHEwOYDaM1Y6fjGsco99hCpAdok10zTC
 ljgN9uCXPF1AkkBzlSMzMKYWwNf8Cj10QML+0R/fw6zWHWbKmIHWT8xDzJhZhWSIWgRVZsLDhzOobUB9W+X4jdVIWlXwZSjjwEQxIsdGhWI1jgJ5Kzf1OIrD
 M+sK+oRiVYPY7F4m1OFnzm2o7rS0mYsxuRk6OCgrHMms4rJ4adFS05aHgV3dJvYGc/isYUx+H+iHFEBWZgNuATa8k7DsoUXJ/TgFNmLWSOop67KG2v6DvnEO
 W/ywQJn2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/07/2021 00:20, Deborah Brouwer wrote:
> Check that Timer Status and Time Cleared Status replies have a valid
> operand. Send timers with out-of-range dates and check follower's
> response. Send a duplicate timer and check that the timer is not set.
> Set overlapping timers and check that the timers are adjusted. In the
> follower, emulating the recordings as programmed with a finite storage
> space.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
> This is part of an Outreachy project to expand the testing of
> Timer Programming messages as handled by CEC adapters.
> 
> Changes since v1:
> 	- rename functions for clarity
> 	- set most test timers as a function of current time, not fixed times
> 	- use time_t instead of struct tm to hold start/stop times
> 	- use std::set instead of std::list to hold timers
> 	- add repeat timers (recording sequence) emulation
> 
>  utils/cec-compliance/cec-test.cpp     | 406 +++++++++++++++++++++-----
>  utils/cec-follower/cec-follower.cpp   |  29 ++
>  utils/cec-follower/cec-follower.h     |  43 +++
>  utils/cec-follower/cec-processing.cpp |  36 +++
>  utils/cec-follower/cec-tuner.cpp      | 275 +++++++++++++++--
>  5 files changed, 695 insertions(+), 94 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 6c421eed..2ca030e1 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -13,6 +13,11 @@
>  
>  #include "cec-compliance.h"
>  
> +enum Months { Jan = 1, Feb, March, April, May, June, July, Aug, Sept, Oct, Nov, Dec };

Let's stick to the standard 3 character abbreviations for the months. So Mar, Apr, Jun, Jul and Sep.

> +
> +time_t current_time = time(nullptr);
> +struct tm now = *(localtime(&current_time));

I wouldn't do that here. Instead, just add current_time to struct node and
set it up in main() (around line 1238 where other node fields are also
initialized). Skip localtime, more about that below.

> +
>  struct remote_test {
>  	const char *name;
>  	const unsigned tags;
> @@ -112,6 +117,73 @@ static bool rec_status_is_a_valid_error_status(__u8 rec_status)
>  	}
>  }
>  
> +static int timer_status_is_valid(const struct cec_msg &msg)
> +{
> +	__u8 timer_overlap_warning;
> +	__u8 media_info;
> +	__u8 prog_info;
> +	__u8 prog_error;
> +	__u8 duration_hr;
> +	__u8 duration_min;
> +
> +	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
> +	                     &prog_error, &duration_hr, &duration_min);
> +	fail_on_test(media_info > CEC_OP_MEDIA_INFO_NO_MEDIA);
> +	if (prog_info)
> +		fail_on_test(prog_info < CEC_OP_PROG_INFO_ENOUGH_SPACE ||
> +		             prog_info > CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE);
> +	else
> +		fail_on_test(prog_error < CEC_OP_PROG_ERROR_NO_FREE_TIMER ||
> +		             (prog_error > CEC_OP_PROG_ERROR_CLOCK_FAILURE &&
> +		              prog_error != CEC_OP_PROG_ERROR_DUPLICATE));
> +
> +	return OK;
> +}
> +
> +static int timer_cleared_status_is_valid(const struct cec_msg &msg)
> +{
> +	__u8 timer_cleared_status;
> +
> +	cec_ops_timer_cleared_status(&msg, &timer_cleared_status);
> +	fail_on_test(timer_cleared_status != CEC_OP_TIMER_CLR_STAT_RECORDING &&
> +	             timer_cleared_status != CEC_OP_TIMER_CLR_STAT_NO_MATCHING &&
> +	             timer_cleared_status != CEC_OP_TIMER_CLR_STAT_NO_INFO &&
> +	             timer_cleared_status != CEC_OP_TIMER_CLR_STAT_CLEARED);
> +
> +	return OK;
> +}
> +
> +static int timer_is_set(const struct cec_msg &msg)
> +{
> +	__u8 timer_overlap_warning;
> +	__u8 media_info;
> +	__u8 prog_info;
> +	__u8 prog_error;
> +	__u8 duration_hr;
> +	__u8 duration_min;
> +
> +	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
> +	                     &prog_error, &duration_hr, &duration_min);
> +
> +	return prog_error;
> +}
> +
> +static int timer_overlap_warning_is_set(const struct cec_msg &msg)
> +{
> +	__u8 timer_overlap_warning;
> +	__u8 media_info;
> +	__u8 prog_info;
> +	__u8 prog_error;
> +	__u8 duration_hr;
> +	__u8 duration_min;
> +
> +	cec_ops_timer_status(&msg, &timer_overlap_warning, &media_info, &prog_info,
> +	                     &prog_error, &duration_hr, &duration_min);
> +	fail_on_test(timer_overlap_warning != CEC_OP_TIMER_OVERLAP_WARNING_OVERLAP);
> +
> +	return OK;
> +}
> +
>  /* System Information */
>  
>  int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1499,26 +1571,18 @@ static const vec_remote_subtests one_touch_rec_subtests{
>  
>  /* Timer Programming */
>  
> -/*
> -  TODO: These are very rudimentary tests which should be expanded.
> - */
> -
>  static int timer_prog_set_analog_timer(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/* TODO: Check the timer status for possible errors, etc. */
> -
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_set_analogue_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				     CEC_OP_ANA_BCAST_TYPE_CABLE,
> -				     7668, // 479.25 MHz
> -				     node->remote[la].bcast_sys);
> +	/* Set timer to start tomorrow, at current time, for 2hr, 30 min. */
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, now.tm_hour,

This can be done much simpler.

You have current_time, so just add the total number of seconds in a day (24 * 60 * 60), then
call localtime and you have the right values you can stick in here.

> +	                           now.tm_min, 2, 30, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
>  	fail_on_test(!transmit_timeout(node, &msg, 10000));
> -	if (timed_out(&msg)) {
> -		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
> -		return OK_PRESUMED;
> -	}
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
> @@ -1526,13 +1590,13 @@ static int timer_prog_set_analog_timer(struct node *node, unsigned me, unsigned
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
>  
> -	return 0;
> +	fail_on_test(timer_status_is_valid(msg));
> +
> +	return OK;
>  }
>  
>  static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/* TODO: Check the timer status for possible errors, etc. */
> -
>  	struct cec_msg msg;
>  	struct cec_op_digital_service_id digital_service_id = {};
>  
> @@ -1541,77 +1605,69 @@ static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned
>  	digital_service_id.channel.minor = 1;
>  	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_set_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				    &digital_service_id);
> +	/* Set timer to start 2 days from now, at current time, for 4hr, 30 min. */
> +	cec_msg_set_digital_timer(&msg, true, (now.tm_mday % 27) + 2 , now.tm_mon, now.tm_hour,
> +	                          now.tm_min, 4, 30, CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);

Ditto.

>  	fail_on_test(!transmit_timeout(node, &msg, 10000));
> -	if (timed_out(&msg)) {
> -		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
> -		return OK_PRESUMED;
> -	}
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	fail_on_test(timer_status_is_valid(msg));
>  
>  	return 0;
>  }
>  
>  static int timer_prog_set_ext_timer(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/* TODO: Check the timer status. */
> -
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_set_ext_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -			      CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
> +	/* Set timer to start 3 days from now, at current time, for 6hr, 30 min. */
> +	cec_msg_set_ext_timer(&msg, true, (now.tm_mday % 27) + 3 , now.tm_mon, now.tm_hour,
> +	                      now.tm_min, 6, 30, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                      CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);

Ditto.

>  	fail_on_test(!transmit_timeout(node, &msg, 10000));
> -	if (timed_out(&msg)) {
> -		warn("Timed out waiting for Timer Status. Assuming timer was set.\n");
> -		return OK_PRESUMED;
> -	}
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	fail_on_test(timer_status_is_valid(msg));
>  
>  	return 0;
>  }
>  
>  static int timer_prog_clear_analog_timer(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/* TODO: Check the timer cleared status. */
> -
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_clear_analogue_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				     CEC_OP_ANA_BCAST_TYPE_CABLE,
> -				     7668, // 479.25 MHz
> -				     node->remote[la].bcast_sys);
> +	/* Clear timer set to start tomorrow, at current time, for 2hr, 30 min. */
> +	cec_msg_clear_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, now.tm_hour,
> +	                             now.tm_min, 2, 30, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                             CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);

Ditto.

>  	fail_on_test(!transmit_timeout(node, &msg, 10000));
> -	if (timed_out(&msg)) {
> -		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
> -		return OK_PRESUMED;
> -	}
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	fail_on_test(timer_cleared_status_is_valid(msg));
>  
>  	return 0;
>  }
>  
>  static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/* TODO: Check the timer cleared status. */
> -
>  	struct cec_msg msg;
>  	struct cec_op_digital_service_id digital_service_id = {};
>  
> @@ -1620,43 +1676,40 @@ static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsign
>  	digital_service_id.channel.minor = 1;
>  	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_clear_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				    &digital_service_id);
> +	/* Clear timer set to start 2 days from now, at current time, for 4hr, 30 min. */
> +	cec_msg_clear_digital_timer(&msg, true, (now.tm_mday % 27) + 2 , now.tm_mon, now.tm_hour,
> +	                            now.tm_min, 4, 30, CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);

Ditto

>  	fail_on_test(!transmit_timeout(node, &msg, 10000));
> -	if (timed_out(&msg)) {
> -		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
> -		return OK_PRESUMED;
> -	}
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	fail_on_test(timer_cleared_status_is_valid(msg));
>  
>  	return 0;
>  }
>  
>  static int timer_prog_clear_ext_timer(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/* TODO: Check the timer cleared status. */
> -
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_clear_ext_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
> +	/* Clear timer set to start 3 days from now, at current time, for 6hr, 30 min. */
> +	cec_msg_clear_ext_timer(&msg, true, (now.tm_mday % 27) + 3 , now.tm_mon, now.tm_hour,
> +	                        now.tm_min, 6, 30, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                        CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);

Ditto

>  	fail_on_test(!transmit_timeout(node, &msg, 10000));
> -	if (timed_out(&msg)) {
> -		warn("Timed out waiting for Timer Cleared Status. Assuming timer was cleared.\n");
> -		return OK_PRESUMED;
> -	}
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	fail_on_test(timer_cleared_status_is_valid(msg));
>  
>  	return 0;
>  }
> @@ -1676,37 +1729,240 @@ static int timer_prog_set_prog_title(struct node *node, unsigned me, unsigned la
>  	return OK_PRESUMED;
>  }
>  
> -static int timer_prog_timer_status(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int timer_errors(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg;
>  
> +	/* Day error: Nov.31, at current time, for 1hr. */

No need to use current time, you can pick any time for this. Same for the other tests below.

>  	cec_msg_init(&msg, me, la);
> -	cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
> -			     CEC_OP_MEDIA_INFO_NO_MEDIA,
> -			     CEC_OP_PROG_INFO_ENOUGH_SPACE,
> -			     0, 0, 0);
> -	fail_on_test(!transmit_timeout(node, &msg));
> +	cec_msg_set_analogue_timer(&msg, true, 31, Nov, now.tm_hour, now.tm_min, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
> -	if (refused(&msg))
> -		return OK_REFUSED;
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
>  
> -	return OK_PRESUMED;
> +	/* Day error: Dec.32, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 32, Dec, now.tm_hour, now.tm_min, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Day error: 0, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 0, now.tm_mon, now.tm_hour, now.tm_min, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Month error: 0, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, 0, now.tm_hour, now.tm_min, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Month error: 13, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, 13, now.tm_hour, now.tm_min, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Start hour error: 24, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, now.tm_mon, 24, now.tm_min, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Start min error: 60, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, now.tm_mon, now.tm_hour, 60, 1, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Recording duration error: current time for 0hr, 0 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, now.tm_mon, now.tm_hour, now.tm_min, 0, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Duplicate timer error: set timer for tomorrow at current time, for 1hr, 10 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, now.tm_hour,
> +	                           now.tm_min, 1, 10, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, now.tm_hour,
> +	                           now.tm_min, 1, 10, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, now.tm_hour,
> +	                             now.tm_min, 1, 10, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                             CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +
> +	/* Recording sequence error: 0xff, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, now.tm_mday, now.tm_mon, now.tm_hour, now.tm_min, 1, 0,
> +	                           0xff, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Error in last day of February, at current time, for 1hr. */
> +	cec_msg_init(&msg, me, la);
> +	int year = now.tm_year;
> +	if (now.tm_mon > Feb)
> +		year++; /* The timer will be for next year. */
> +
> +	if (year%4 == 0) {

Spaces around %

And let's do this right:

	if (!(year % 4) && ((year % 100) || !(year % 400)))

Admittedly, the chances that this code will still be used in 2100 are pretty slim,
but stranger things have happened. Thinking like that caused the millenium bug, after all...

> +		cec_msg_set_analogue_timer(&msg, true, 30, Feb, now.tm_hour, now.tm_min, 1, 0,
> +		                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +		                           7668, // 479.25 MHz
> +		                           node->remote[la].bcast_sys);
> +	} else {
> +		cec_msg_set_analogue_timer(&msg, true, 29, Feb, now.tm_hour, now.tm_min, 1, 0,
> +		                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +		                           7668, // 479.25 MHz
> +		                           node->remote[la].bcast_sys);
> +	}
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	return OK;
>  }
>  
> -static int timer_prog_timer_clear_status(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int timer_overlap_warning(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
> -	fail_on_test(!transmit_timeout(node, &msg));
> +	/* Set timer for tomorrow at 9:00am for 2hr, 1 min. */
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, 9, 0, 2, 1,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);

Here too just add the number of seconds in a day to the current_time and call localtime().

> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
> -	if (refused(&msg))
> -		return OK_REFUSED;
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
>  
> -	return OK_PRESUMED;
> +	/* Overlap the tail-end. Set timer for tomorrow at 10:00am for 1hr, 45 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, 10, 0, 1, 45,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap the front-end. Set timer for tomorrow at 8:00am, for 1hr, 45 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, 8, 0, 1, 45,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap the entire timer. Set timer for tomorrow at 7:00am, for 5hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, 7, 0, 5, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, (now.tm_mday % 27) + 1, now.tm_mon, 7, 0, 5, 0,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +
> +	return OK;
>  }
>  
>  static const vec_remote_subtests timer_prog_subtests{
> @@ -1717,8 +1973,8 @@ static const vec_remote_subtests timer_prog_subtests{
>  	{ "Clear Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_analog_timer },
>  	{ "Clear Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_digital_timer },
>  	{ "Clear External Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_clear_ext_timer },
> -	{ "Timer Status", CEC_LOG_ADDR_MASK_RECORD, timer_prog_timer_status },
> -	{ "Timer Cleared Status", CEC_LOG_ADDR_MASK_RECORD, timer_prog_timer_clear_status },
> +	{ "Set Timers with Errors", CEC_LOG_ADDR_MASK_RECORD, timer_errors },
> +	{ "Set Overlapping Timers", CEC_LOG_ADDR_MASK_RECORD, timer_overlap_warning },
>  };
>  
>  static const char *hec_func_state2s(__u8 hfs)
> @@ -1998,6 +2254,8 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
>  
>  	int ret = 0;
>  
> +	now.tm_mon += 1; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */

now.tm_mon++;

(it's the same, but more common in C than += 1)

> +
>  	for (const auto &test : tests) {
>  		if ((test.tags & test_tags) != test.tags)
>  			continue;
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 2816fb85..52f2ef19 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -47,6 +47,7 @@ bool show_msgs;
>  bool show_state;
>  bool show_warnings = true;
>  unsigned warnings;
> +std::set<struct Timer> programmed_timers;
>  
>  static struct option long_options[] = {
>  	{ "device", required_argument, nullptr, OptSetDevice },
> @@ -296,6 +297,33 @@ int cec_named_ioctl(int fd, const char *name,
>  	return retval == -1 ? e : (retval ? -1 : 0);
>  }
>  
> +void print_timers(struct node *node)
> +{
> +	if(show_info) {

Space after if!

> +		printf("\nTimers Set:\n");
> +		for (auto &t : programmed_timers) {
> +			std::string start = ctime(&(t.start_time));

No need to add () around t.start_time.

> +			std::string end = ctime(&(t.end_time));
> +			/* Remove the seconds because timer is precise only to the minute. */
> +			start.erase (16, 3);

No space before (

> +			end.erase (16, 3);
> +			/* Remove the new line characters. */
> +			start.erase(start.end()-1);

Spaces around -

> +			end.erase(end.end()-1);
> +			/* Remove the start year if it is the same as the end year. */
> +			if ((start.compare(start.size() - 4, 5, end, end.size() - 4, 5) == 0))
> +				start.erase(start.size() - 5, 5);
> +			printf("\t%s - %s", start.c_str(), end.c_str());
> +			printf(" %d %s\n", t.media_space_required, "MB.");
> +		}
> +		printf("Total media space available for recording: ");
> +		if(node->state.media_space_available >= 0)
> +			printf("%d MB.\n\n", node->state.media_space_available);
> +		else
> +			printf("0 MB.\n\n");

It would be nice if the recording sequence (if any) is shown as well.

> +	}
> +}
> +
>  void state_init(struct node &node)
>  {
>  	if (options[OptStandby])
> @@ -319,6 +347,7 @@ void state_init(struct node &node)
>  	node.state.deck_skip_start = 0;
>  	node.state.one_touch_record_on = false;
>  	node.state.record_received_standby = false;
> +	node.state.media_space_available = 36000; /* In MB; space for 10 hours @ 1MB/sec */
>  	tuner_dev_info_init(&node.state);
>  	node.state.last_aud_rate_rx_ts = 0;
>  }
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 833dec5e..b73c41ba 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -19,12 +19,16 @@
>  
>  #include <cec-info.h>
>  #include <cec-log.h>
> +#include <set>
> +#include <ctime>
>  
>  extern bool show_info;
>  extern bool show_msgs;
>  extern bool show_state;
>  extern bool show_warnings;
>  extern unsigned warnings;
> +extern std::set<struct Timer> programmed_timers;
> +extern void print_timers(struct node *node);
>  
>  struct state {
>  	__u16 active_source_pa;
> @@ -55,6 +59,7 @@ struct state {
>  	__u64 deck_skip_start;
>  	bool one_touch_record_on;
>  	bool record_received_standby;
> +	int media_space_available;
>  	time_t toggle_power_status;
>  	__u64 last_aud_rate_rx_ts;
>  };
> @@ -82,6 +87,44 @@ struct node {
>  	unsigned short ignore_opcode[256];
>  };
>  
> +struct Timer {
> +	time_t start_time;
> +	time_t end_time;
> +	int media_space_required;
> +	__u8 recording_seq;
> +	struct cec_op_record_src src;
> +
> +	Timer()
> +	{
> +		start_time = 0;
> +		end_time = 0;
> +		media_space_required = 0;
> +		recording_seq = 0;
> +		src = {};
> +	}
> +
> +	Timer(const Timer& timer)
> +	{
> +		start_time = timer.start_time;
> +		end_time = timer.end_time;
> +		media_space_required = timer.media_space_required;
> +		recording_seq = timer.recording_seq;
> +		src = timer.src;
> +	}
> +
> +	bool operator<(const Timer &right) const
> +	{
> +		return start_time < right.start_time ||
> +		       (start_time == right.start_time && end_time < right.end_time);

I would include src_type and recording_seq as well.

Otherwise when adding identical timers except for e.g. src_type to the set, the
second timer would overwrite the first, since std::set doesn't allow for
duplicates. For that std::multi_set is needed.

I think it is fine to sort on src_type and recording_seq as well.

> +	}
> +
> +	bool operator==(const Timer &right) const
> +	{
> +		return start_time == right.start_time && end_time == right.end_time &&
> +		       src.type == right.src.type && recording_seq == right.recording_seq;
> +	}
> +};
> +
>  struct la_info {
>  	__u64 ts;
>  	struct {
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 32375966..b8431aa0 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -1164,6 +1164,42 @@ void testProcessing(struct node *node, bool wallclock)
>  			node->state.deck_skip_start = 0;
>  			update_deck_state(node, me, CEC_OP_DECK_INFO_PLAY);
>  		}
> +
> +		/*
> +		 * Start recording if any timers have been programmed for the current time.
> +		 * Delete timers when finished recording. For recurring timers, set next timer.
> +		 */
> +		if (programmed_timers.size() > 0) {

Use !programmed_timers.empty() instead.

> +			time_t current_time = time(nullptr);
> +			std::set<struct Timer>::iterator it = programmed_timers.begin();
> +
> +			if (it->start_time < current_time && it->end_time > current_time)
> +				node->state.one_touch_record_on = true;

Hmm. What are you supposed to do if the deck is already recording when a timer kicks in?

I think you should add a TODO comment for that, but otherwise do not spend time on it.

> +
> +			if (node->state.one_touch_record_on &&
> +			    it->start_time < current_time && it->end_time < current_time){
> +				node->state.one_touch_record_on = false;
> +				node->state.media_space_available -= it->media_space_required;

We are only ever decreasing the amount of space available, there is no heuristic that
reclaims that space. Add a TODO comment about that.

> +
> +				if (it->recording_seq) {
> +					struct tm now = *(localtime(&current_time));

current_time isn't right, I think. Instead use it->start_time.

> +					int next_wday = (now.tm_wday + 1) % 7;
> +					int days_to_move_ahead = 1;
> +
> +					while((it->recording_seq & (1 << next_wday)) == 0) {

Space after 'while'.

> +						days_to_move_ahead++;
> +						next_wday = (next_wday + 1) % 7;
> +					}

If all the 'day' bits are set, then this will go into an infinite loop!

> +					struct Timer next_timer = {};
> +					next_timer = *it;
> +					next_timer.start_time += days_to_move_ahead * 86400; /* 86,400 sec/day */

This doesn't take DST into account.

I think you can use mktime here:

					now.tm_mday += days_to_move_ahead;
					now.tm_isdst = -1;
					next_timer.start_time = mktime(&now);

> +					next_timer.end_time += days_to_move_ahead * 86400;

Perhaps it is easier to store the start_time and duration instead of start_time and
end_time. That way the end_time doesn't need to be updated, and it avoids problems
if DST comes into effect in the middle of a recording.

> +					programmed_timers.insert(next_timer);
> +				}
> +				programmed_timers.erase(*it);
> +				print_timers(node);
> +			}
> +		}
>  	}
>  	mode = CEC_MODE_INITIATOR;
>  	doioctl(node, CEC_S_MODE, &mode);
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index e1d8b8fc..d8bcf098 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -4,8 +4,8 @@
>   */
>  
>  #include <array>
> -#include <ctime>
>  #include <string>
> +#include <list>
>  
>  #include <sys/ioctl.h>
>  
> @@ -17,6 +17,183 @@
>  #define TOT_ANALOG_FREQS analog_freqs_khz[0][0].size()
>  #define TOT_DIGITAL_CHANS digital_arib_data[0].size() + digital_atsc_data[0].size() + digital_dvb_data[0].size()
>  
> +enum Months { Jan = 1, Feb, March, April, May, June, July, Aug, Sept, Oct, Nov, Dec };

Just use three characters.

> +
> +static struct Timer get_timer_from_message(const struct cec_msg &msg)
> +{
> +	struct Timer timer = {};
> +
> +	__u8 day = 0;
> +	__u8 month = 0;
> +	__u8 start_hr = 0;
> +	__u8 start_min = 0;
> +	__u8 duration_hr = 0;
> +	__u8 duration_min = 0;
> +	__u8 ext_src_spec = 0;
> +	__u8 plug = 0;
> +	__u16 phys_addr = 0;
> +
> +	switch (msg.msg[1]) {
> +	case CEC_MSG_CLEAR_ANALOGUE_TIMER:
> +	case CEC_MSG_SET_ANALOGUE_TIMER:
> +		timer.src.type = CEC_OP_RECORD_SRC_ANALOG;
> +		cec_ops_set_analogue_timer(&msg, &day, &month, &start_hr, &start_min,
> +		                           &duration_hr, &duration_min, &timer.recording_seq,
> +		                           &timer.src.analog.ana_bcast_type, &timer.src.analog.ana_freq,
> +		                           &timer.src.analog.bcast_system);
> +		break;
> +	case CEC_MSG_CLEAR_DIGITAL_TIMER:
> +	case CEC_MSG_SET_DIGITAL_TIMER: {
> +		struct cec_op_digital_service_id digital = {};
> +		timer.src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +		timer.src.digital = digital;
> +		cec_ops_set_digital_timer(&msg, &day, &month, &start_hr, &start_min,
> +		                          &duration_hr, &duration_min, &timer.recording_seq,
> +		                          &timer.src.digital);
> +		break;
> +	}
> +	case CEC_MSG_CLEAR_EXT_TIMER:
> +	case CEC_MSG_SET_EXT_TIMER: {
> +		cec_ops_set_ext_timer(&msg, &day, &month, &start_hr, &start_min,
> +		                      &duration_hr, &duration_min, &timer.recording_seq, &ext_src_spec,
> +		                      &plug, &phys_addr);
> +		if (ext_src_spec == CEC_OP_EXT_SRC_PLUG) {
> +			timer.src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
> +			timer.src.ext_plug.plug = plug;
> +		}
> +		if (ext_src_spec == CEC_OP_EXT_SRC_PHYS_ADDR) {
> +			timer.src.type = CEC_OP_RECORD_SRC_EXT_PHYS_ADDR;
> +			timer.src.ext_phys_addr.phys_addr = phys_addr;
> +		}
> +		break;
> +	}
> +	default:
> +		break;
> +	}
> +
> +	timer.media_space_required = ((duration_hr * 60) + duration_min) * 60; /* 60 MB/min */
> +	/* Use current time in the timer when it is not available from message e.g. year */
> +	time_t current_time = time(nullptr);
> +	struct tm temp = *(localtime(&current_time));
> +	temp.tm_mday = day;
> +	temp.tm_mon = month - 1; /* CEC months are 1-12 but struct tm range is 0-11 */
> +	temp.tm_hour = start_hr;
> +	temp.tm_min = start_min;
> +	/*
> +	 * Timer precision is only to the minute. Give the timer second a fixed value
> +	 * so that differences in seconds do not affect timer comparisons.  Use the upper limit
> +	 * of the second range, rather than zero, so that when compared to the current time,
> +	 * the timer does not appear to have started in the past.
> +	 */
> +	temp.tm_sec = 60;

Set temp.tm_isdst to -1: this will make mktime use the current timezone to figure out
whether DST will be in effect at this date/time.

> +	timer.start_time = mktime(&temp);
> +
> +	/* If timer starts in past, increment the year so that timers can be set across year-end. */
> +	if (current_time > timer.start_time) {
> +		temp.tm_year++;

isdst will be overwritten, so set it to -1 again.

> +		timer.start_time = mktime(&temp); /* update timer*/

Space before */

> +	}
> +	temp.tm_hour += duration_hr;
> +	temp.tm_min += duration_min;
> +	timer.end_time = mktime(&temp);

As mentioned above, it is much better to just store the duration in seconds.

> +
> +	return timer;
> +}
> +
> +static bool timer_date_out_of_range(const struct cec_msg &msg, const struct Timer &timer)
> +{
> +	__u8 day = msg.msg[2];
> +	__u8 month = msg.msg[3];
> +	/* Hours and minutes are in BCD format */
> +	__u8 start_hr = (msg.msg[4] >> 4) * 10 + (msg.msg[4] & 0xf);
> +	__u8 start_min = (msg.msg[5] >> 4) * 10 + (msg.msg[5] & 0xf);
> +	__u8 duration_hr = (msg.msg[6] >> 4) * 10 + (msg.msg[6] & 0xf);
> +	__u8 duration_min = (msg.msg[7] >> 4) * 10 + (msg.msg[7] & 0xf);
> +
> +	if (start_min > 59 || start_hr > 23 || month > 12 || month == 0 || day > 31 || day == 0 ||
> +	    duration_min > 59 || (duration_hr == 0 && duration_min == 0))
> +		return true;
> +
> +	switch(month) {

Space after switch.

> +	case April: case June: case Sept: case Nov:
> +		if (day > 30)
> +			return true;
> +		break;
> +	case Feb: {
> +		struct tm *tp = localtime(&timer.start_time);
> +
> +		if (tp->tm_year%4 == 0) {

Spaces around %. Also use proper leap year calculation (just as in cec-compliance).

> +			if (day > 29)
> +				return true;
> +		} else {
> +			if (day > 28)
> +				return true;
> +		}
> +		break;
> +	}
> +	default:
> +		break;
> +	}
> +	return false;
> +}
> +
> +static bool timer_duplicate(const struct Timer &timer)
> +{
> +	for (auto &t : programmed_timers) {
> +		if (timer == t)
> +			return true;
> +	}

You can use programmed_timers.find(timer), if found, then it is a duplicate.

> +	return false;
> +}
> +
> +static bool timer_overlap(struct node *node, const struct Timer &new_timer)
> +{
> +	if (programmed_timers.size() == 1)
> +		return false;
> +
> +	bool overlap = false;
> +	struct Timer truncated_timer;
> +	std::list<struct Timer> timers_to_erase;
> +
> +	for (auto &t : programmed_timers) {
> +		if (new_timer == t)
> +			continue;
> +
> +		/* Keep the front-end of the existing timer. */
> +		if (t.start_time < new_timer.start_time && new_timer.start_time < t.end_time) {
> +			truncated_timer = t;
> +			truncated_timer.end_time = new_timer.start_time;
> +			truncated_timer.media_space_required = truncated_timer.end_time - truncated_timer.start_time;
> +			programmed_timers.insert(truncated_timer);
> +			timers_to_erase.push_back(t);
> +			overlap = true;
> +			continue;
> +		}
> +
> +		/* Keep the tail-end of the existing timer that does not overlap with the new timer. */
> +		if (t.start_time < new_timer.end_time && new_timer.end_time < t.end_time) {
> +			truncated_timer = t;
> +			truncated_timer.start_time = new_timer.end_time;
> +			truncated_timer.media_space_required = truncated_timer.end_time - truncated_timer.start_time;
> +			programmed_timers.insert(truncated_timer);
> +			timers_to_erase.push_back(t);
> +			overlap = true;
> +			continue;
> +		}
> +
> +		/* Remove the existing timer because it is entirely overlapped by the new timer. */
> +		if (new_timer.start_time <= t.start_time && t.end_time <= new_timer.end_time) {
> +			timers_to_erase.push_back(t);
> +			overlap = true;
> +		}
> +	}
> +
> +	for (auto &t : timers_to_erase)
> +		programmed_timers.erase(t);
> +
> +	return overlap;

I think we are making it too hard on ourselves. We just want to know if the new timer
overlaps with an existing one, but we can still just add it as-is.

When processing the timers in the processing loop you just start recording with the first
timer, and when it is finished it is deleted, and then you start on the next one.

If the 'next one' has a start time in the past, then delete it as well since it will be
an incomplete recording anyway. Basically you need to 'flush' out any timers that are
already old. This makes life a lot easier, and I think it is a perfectly acceptable solution.

I think the basic idea behind the overlap warning is that the user is supposed to go
back into the timer schedule and fix the overlap manually. If that is not done, then
something has to give, and what I suggested above seems reasonable.

> +}
> +
>  struct service_info {
>  	unsigned tsid;
>  	unsigned onid;
> @@ -738,39 +915,97 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		return;
>  
>  
> -		/*
> -		  Timer Programming
> -
> -		  This is only a basic implementation.
> -
> -		  TODO/Ideas:
> -		  - Act like an actual recording device; keep track of recording
> -		    schedule and act correctly when colliding timers are set.
> -		  - Emulate a finite storage space for recordings
> -		 */
> +		/* Timer Programming */
>  
>  	case CEC_MSG_SET_ANALOGUE_TIMER:
>  	case CEC_MSG_SET_DIGITAL_TIMER:
> -	case CEC_MSG_SET_EXT_TIMER:
> -		if (!cec_has_record(1 << me))
> +	case CEC_MSG_SET_EXT_TIMER: {
> +		if (type != CEC_LOG_ADDR_TYPE_RECORD)
>  			break;
> +
> +		__u8 prog_error = 0;
> +		__u8 prog_info = 0;
> +		__u8 timer_overlap_warning = CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP;
> +		__u8 available_space_hr = 0;
> +		__u8 available_space_min = 0;
> +		struct Timer timer = get_timer_from_message(msg);
> +
> +		if (timer_date_out_of_range(msg, timer))
> +			prog_error = CEC_OP_PROG_ERROR_DATE_OUT_OF_RANGE;
> +
> +		if (timer.recording_seq > 127)
> +			prog_error = CEC_OP_PROG_ERROR_REC_SEQ_ERROR;
> +
> +		if (timer_duplicate(timer))
> +			prog_error = CEC_OP_PROG_ERROR_DUPLICATE;
> +
> +		if (!prog_error) {
> +			programmed_timers.insert(timer);
> +
> +			if (timer_overlap(node, timer))
> +				timer_overlap_warning = CEC_OP_TIMER_OVERLAP_WARNING_OVERLAP;
> +
> +			if (node->state.media_space_available <= 0 ||
> +			    timer.media_space_required > node->state.media_space_available) {
> +				prog_info = CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE;
> +			} else {
> +				int space_that_may_be_needed = 0;
> +
> +				for (auto &t : programmed_timers) {
> +					space_that_may_be_needed += t.media_space_required;
> +					if (t == timer) /* Only count the space up to and including the new timer. */
> +						break;
> +				}
> +
> +				if ((node->state.media_space_available - space_that_may_be_needed) >= 0)
> +					prog_info = CEC_OP_PROG_INFO_ENOUGH_SPACE;
> +				else
> +					prog_info = CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE;
> +			}
> +			print_timers(node);
> +		}
> +
> +		if (prog_info == CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE ||
> +		    prog_info == CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE ||
> +		    prog_error == CEC_OP_PROG_ERROR_DUPLICATE) {
> +			available_space_hr = node->state.media_space_available/3600; /* 3600 MB/hour */
> +			available_space_min = (node->state.media_space_available%3600)/60; /* 60 MB/min */
Spaces around operators.

> +		}
>  		cec_msg_set_reply_to(&msg, &msg);
> -		cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
> -				     CEC_OP_MEDIA_INFO_NO_MEDIA,
> -				     CEC_OP_PROG_INFO_ENOUGH_SPACE, 0, 0, 0);
> +		cec_msg_timer_status(&msg, timer_overlap_warning, CEC_OP_MEDIA_INFO_UNPROT_MEDIA,
> +		                     prog_info, prog_error, available_space_hr, available_space_min);
>  		transmit(node, &msg);
>  		return;
> +	}
>  	case CEC_MSG_CLEAR_ANALOGUE_TIMER:
>  	case CEC_MSG_CLEAR_DIGITAL_TIMER:
> -	case CEC_MSG_CLEAR_EXT_TIMER:
> -		if (!cec_has_record(1 << me))
> +	case CEC_MSG_CLEAR_EXT_TIMER: {
> +		if (type != CEC_LOG_ADDR_TYPE_RECORD)
>  			break;
> +
> +		__u8 timer_cleared_status = CEC_OP_TIMER_CLR_STAT_NO_MATCHING;
> +
> +		if (node->state.one_touch_record_on) {
> +			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
> +		} else {
> +			struct Timer timer = get_timer_from_message(msg);
> +
> +			for (auto &t : programmed_timers) {
> +				if (timer == t){

Space before {

> +					timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
> +					programmed_timers.erase(timer);

No need for the for-loop, just call programmed_timers.erase(timer);.
If timer exists, then it will be erase, if not, then nothing happens.

> +					break;
> +				}
> +			}
> +		}
> +		print_timers(node);
>  		cec_msg_set_reply_to(&msg, &msg);
> -		cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
> +		cec_msg_timer_cleared_status(&msg, timer_cleared_status);
>  		transmit(node, &msg);
>  		return;
> +	}
>  	case CEC_MSG_SET_TIMER_PROGRAM_TITLE:
> -		if (!cec_has_record(1 << me))
> +		if (type != CEC_LOG_ADDR_TYPE_RECORD)
>  			break;
>  		return;
>  	case CEC_MSG_TIMER_CLEARED_STATUS:
> 

See how much you can fix today. I think the cec-compliance part can be finished
today, and all the small stuff in cec-follower. If you post that as a two-part
series, then I can likely merge the compliance patch, and the follower patch
can be updated later.

Regards,

	Hans
