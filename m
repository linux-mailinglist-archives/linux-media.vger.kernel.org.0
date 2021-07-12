Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539723C4B8A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 12:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241594AbhGLG6B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 02:58:01 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49425 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240759AbhGLG4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 02:56:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2ppLmJbR2hqx92ppMmWNnA; Mon, 12 Jul 2021 08:54:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626072844; bh=ACsTZgOFseIJ1bAWf2ELoGuOdDfGK1id+b4G4DxEWBA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LFA2qUdctLDqppsT/myt3djx18ZVyj4tveYsGO6fWYpuOZ0P7xZJ2mPyUByeESY/n
         LEY6fkww2UfIZ0oLs8S40dT+Vk/DpsbNEUmCJkOSCz5EuykF5cOdvlSFq/m7EYYjdH
         YX40xgziCv+RDnT1KENTLqI6bgSO1lVsoIXMDB/8tpYwTC3VdqLjzIhfHWlQZziH4H
         ku+0ry40qIWaPw3jhh+eyVgjOfjow/2CxwRZf5SM1uIX4kNMwRlgjXHSkRM7hWTxsw
         TJelUhBhgRl3CU5u1Xf56zjKd1LzDQ0ivge+1uZIq4PUjANUdgWTc2fWzDxoF/nOof
         EPjxK1YDXFZlA==
Subject: Re: [PATCH v3 1/2] cec: expand Timer Programming tests
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1625962440.git.deborahbrouwer3563@gmail.com>
 <aa1eae0a3389f29f1b5d965c48be75976c1cf5bf.1625962440.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <296170f4-c912-b3f8-463a-29f021c96e5c@xs4all.nl>
Date:   Mon, 12 Jul 2021 08:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aa1eae0a3389f29f1b5d965c48be75976c1cf5bf.1625962440.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMVKZwFvQt4TLdc/QsHgGXjjU+BPqUP+Skb/r9+81DQVbaNIlgLuDq3qRmI/B6TyK9QiSUF9mKZWjl4cc+PrMmkR72KcaK9wjFVzXFNdA0AoDiwMQcbs
 G6Xus0B9fdcUAcOo86wT5Sko17S+sRW3ihS+CpfD5VDiEg9txz9mOR04jTmhAuH9uNkQATL6MYTI0xMqWK32L99z9WCEHMy7JRAv+Sti8sYMx6q4OiTgGTiY
 lUvsIsUVpTOeZZl80J9PHFs9KarRP3sdeXG68hE9QZ7wf3CpVN7soVrl4wy9euvlyUz+a8klgSYgHf3ejsOaCTG58HEFdPkBqXV6p+TSMUZh0sDu++RcJRrb
 S9gM5uSf
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

I have a last set of much smaller comments. It's looking quite nice, but it
can be improved a bit more. It shouldn't take much time to make a v4, I think.

On 11/07/2021 02:37, Deborah Brouwer wrote:
> Check that Timer Status and Time Cleared Status replies have a valid
> operand. Send timers with out-of-range dates and check follower's
> response. Send an out-of-range recording sequence and check that the timer
> is not set. Send a duplicate timer and check that the timer is not set.
> Set overlapping timers and check that the timer overlap warning is set.
> In the follower, keep track of timers that have been received and warn
> if there may be insufficient space for a programmed recording.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp |   1 +
>  utils/cec-compliance/cec-compliance.h   |   1 +
>  utils/cec-compliance/cec-test.cpp       | 512 ++++++++++++++++++++----
>  utils/cec-follower/cec-follower.cpp     |  54 +++
>  utils/cec-follower/cec-follower.h       |  43 ++
>  utils/cec-follower/cec-tuner.cpp        | 229 ++++++++++-
>  6 files changed, 746 insertions(+), 94 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
> index 25931259..72199762 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -1236,6 +1236,7 @@ int main(int argc, char **argv)
>  	node.num_log_addrs = laddrs.num_log_addrs;
>  	memcpy(node.log_addr, laddrs.log_addr, laddrs.num_log_addrs);
>  	node.adap_la_mask = laddrs.log_addr_mask;
> +	node.current_time = time(nullptr);
>  
>  	printf("Find remote devices:\n");
>  	printf("\tPolling: %s\n", ok(poll_remote_devs(&node)));
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index 41e2d63d..efc828ce 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -167,6 +167,7 @@ struct node {
>  	__u16 phys_addr;
>  	bool in_standby;
>  	__u8 prim_devtype;
> +	time_t current_time;
>  };
>  
>  struct remote_subtest {
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 6c421eed..ff51c9ed 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -13,6 +13,8 @@
>  
>  #include "cec-compliance.h"
>  
> +enum Months { Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec };
> +
>  struct remote_test {
>  	const char *name;
>  	const unsigned tags;
> @@ -112,6 +114,72 @@ static bool rec_status_is_a_valid_error_status(__u8 rec_status)
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

This should return a bool.

And actually you test for 'timer_has_error', which is a better name IMHO.

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

bool

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
> +	return !timer_overlap_warning;

And here you would drop the !, and the callers of this function have to be updated as well.

> +}
> +
>  /* System Information */
>  
>  int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1499,26 +1567,20 @@ static const vec_remote_subtests one_touch_rec_subtests{
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
> +	/* Set timer to start tomorrow, at current time, for 2 hr, 30 min. */
> +	time_t tomorrow = node->current_time + (24 * 60 * 60);
> +	struct tm t = *(localtime(&tomorrow));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, t.tm_hour, t.tm_min, 2, 30,
> +	                           0x7f, CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
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
> @@ -1526,13 +1588,13 @@ static int timer_prog_set_analog_timer(struct node *node, unsigned me, unsigned
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
> @@ -1541,77 +1603,76 @@ static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned
>  	digital_service_id.channel.minor = 1;
>  	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_set_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				    &digital_service_id);
> +	/* Set timer to start 2 days from now, at current time, for 4 hr, 30 min. */
> +	time_t two_days_ahead = node->current_time + (2 * 24 * 60 * 60);
> +	struct tm t = *(localtime(&two_days_ahead));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +	cec_msg_set_digital_timer(&msg, true, t.tm_mday, t.tm_mon, t.tm_hour,
> +	                          t.tm_min, 4, 30, CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);

I would write this slightly differently:

	/* Set timer to start 2 days from current_time for 4 hr, 30 min. */
	time_t two_days_ahead = node->current_time + (2 * 24 * 60 * 60);
	struct tm *t = localtime(&two_days_ahead);
	cec_msg_set_digital_timer(&msg, true, t->tm_mday, t->tm_mon + 1, t->tm_hour, t->tm_min,
				  4, 30, CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);

It's a bit more concise, and having the explicit 't->tm_mon + 1' makes it IMHO clear enough
that CEC starts counting at 1, not 0, for the months, so no need for the additional comment.

The same can be done elsewhere.

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
> +	/* Set timer to start 3 days from now, at current time, for 6 hr, 30 min. */
> +	time_t three_days_ahead = node->current_time + (3 * 24 * 60 * 60);
> +	struct tm t = *(localtime(&three_days_ahead));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +	cec_msg_set_ext_timer(&msg, true, t.tm_mday, t.tm_mon, t.tm_hour, t.tm_min, 6, 30,
> +	                      CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
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
> +	/* Clear timer set to start tomorrow, at current time, for 2 hr, 30 min. */
> +	time_t tomorrow = node->current_time + (24 * 60 * 60);
> +	struct tm t = *(localtime(&tomorrow));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, t.tm_hour, t.tm_min, 2, 30,
> +	                             0x7f, CEC_OP_ANA_BCAST_TYPE_CABLE,7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
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
> @@ -1620,43 +1681,45 @@ static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsign
>  	digital_service_id.channel.minor = 1;
>  	digital_service_id.dig_bcast_system = node->remote[la].dig_bcast_sys;
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_clear_digital_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> -				    &digital_service_id);
> +	/* Clear timer set to start 2 days from now, at current time, for 4 hr, 30 min. */
> +	time_t two_days_ahead = node->current_time + (2 * 24 * 60 * 60);
> +	struct tm t = *(localtime(&two_days_ahead));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +	cec_msg_clear_digital_timer(&msg, true, t.tm_mday, t.tm_mon, t.tm_hour, t.tm_min, 4, 30,
> +	                            CEC_OP_REC_SEQ_ONCE_ONLY, &digital_service_id);
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
> +	/* Clear timer set to start 3 days from now, at current time, for 6 hr, 30 min. */
> +	time_t three_days_ahead = node->current_time + (3 * 24 * 60 * 60);
> +	struct tm t = *(localtime(&three_days_ahead));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +	cec_msg_clear_ext_timer(&msg, true, t.tm_mday, t.tm_mon, t.tm_hour, t.tm_min, 6, 30,
> +	                        CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_EXT_SRC_PHYS_ADDR, 0, node->phys_addr);
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
> @@ -1676,37 +1739,338 @@ static int timer_prog_set_prog_title(struct node *node, unsigned me, unsigned la
>  	return OK_PRESUMED;
>  }
>  
> -static int timer_prog_timer_status(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int timer_errors(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg;
>  
> +	/* Day error: November 31, at 6:00 am, for 1 hr. */
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
> -			     CEC_OP_MEDIA_INFO_NO_MEDIA,
> -			     CEC_OP_PROG_INFO_ENOUGH_SPACE,
> -			     0, 0, 0);
> -	fail_on_test(!transmit_timeout(node, &msg));
> +	cec_msg_set_analogue_timer(&msg, true, 31, Nov, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
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

These tests are all very similar, except for different date/time etc. values.

Perhaps it is a good idea to make a helper function for this?

>  
> -	return OK_PRESUMED;
> +	/* Day error: December 32, at 6:00 am, for 1 hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 32, Dec, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Day error: 0, in January, at 6:00 am, for 1 hr. Day range begins at 1. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 0, Jan, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Month error: 0, on day 5, at 6:00 am, for 1 hr. CEC month range is 1-12. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 5, 0, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Month error: 13, on day 5, at 6:00 am, for 1 hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 5, 13, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Start hour error: 24 hr, on August 5, for 1 hr. Start hour range is 0-23. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 5, Aug, 24, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Start min error: 60 min, on August 5, for 1 hr. Start min range is 0-59. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 5, Aug, 0, 60, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Recording duration error: 0 hr, 0 min on August 5, at 6:00am. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 5, Aug, 6, 0, 0, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Duplicate timer error: January 24, at 6:00 am, for 1 hr. */

That should be January 25, right? Since below it says 25, not 24.

> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 25, Jan, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);

For this test I would use a date/time in the future (i.e. an offset from current_time).

You are actually creating a timer, so what if someone runs this at Jan 25, 5:59 am?

Better safe than sorry and just schedule this in 2 hours from now.

All the other tests with erroroneous values should fail without adding a new timer,
so hardcoding them is fine, but this duplicate timer test is an exception.

> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg)); /* The first timer should be set. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 25, Jan, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Clear the timer that was set to test duplicate timers. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, 25, Jan, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +	                             CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	/* Recording sequence error: 0xff, on August 5, at 6:00 am, for 1 hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, 5, Aug, 6, 0, 1, 0, 0xff, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out(&msg));
> +	if (cec_msg_status_is_abort(&msg))
> +		fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +	else
> +		fail_on_test(!timer_is_set(msg));
> +
> +	/* Error in last day of February, at 6:00 am, for 1 hr. */
> +	cec_msg_init(&msg, me, la);
> +	time_t now = node->current_time;
> +	struct tm t = *(localtime(&now));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12. */
> +	if (t.tm_mon > Feb)
> +		t.tm_year++; /* The timer will be for next year. */
> +
> +	if (!(t.tm_year % 4) && ((t.tm_year % 100) || !(t.tm_year % 400))) {
> +		cec_msg_set_analogue_timer(&msg, true, 30, Feb, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +		                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
> +		                           node->remote[la].bcast_sys);
> +	} else {
> +		cec_msg_set_analogue_timer(&msg, true, 29, Feb, 6, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
> +		                           CEC_OP_ANA_BCAST_TYPE_CABLE, 7668, // 479.25 MHz
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
> +	time_t tomorrow = node->current_time + (24 * 60 * 60);
> +	struct tm t = *(localtime(&tomorrow));
> +	t.tm_mon++; /* Month range in struct tm is 0-11, but month range in CEC is 1-12 */
> +
> +	/* No overlap: set timer for tomorrow at 8:00 am for 2 hr. */
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
> -	fail_on_test(!transmit_timeout(node, &msg));
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 8, 0, 2, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
> -	if (refused(&msg))
> -		return OK_REFUSED;
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(!timer_overlap_warning_is_set(msg));
>  
> -	return OK_PRESUMED;
> +	/* No overlap, just adjacent: set timer for tomorrow at 10:00 am for 15 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 10, 0, 0, 15,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(!timer_overlap_warning_is_set(msg));

These are also all very similar. Helper function?

> +
> +	/* No overlap, just adjacent: set timer for tomorrow at 7:45 am for 15 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 7, 45, 0, 15,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(!timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap tail end: set timer for tomorrow at 9:00 am for 2 hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 9, 0, 2, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap front end: set timer for tomorrow at 7:00 am for 1 hr, 30 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 7, 0, 1, 30,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap same start time: set timer for tomorrow at 8:00 am for 30 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 8, 0, 0, 30,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap same end time: set timer for tomorrow at 9:30 am for 30 min. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 9, 30, 0, 30,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Overlap all timers: set timer for tomorrow at 6:00 am for 6 hr. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_set_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 6, 0, 6, 0,
> +	                           CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                           7668, // 479.25 MHz
> +	                           node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	fail_on_test(timer_is_set(msg));
> +	fail_on_test(timer_overlap_warning_is_set(msg));
> +
> +	/* Clear all the timers. */
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 8, 0, 2, 0,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 10, 0, 0, 15,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 7, 45, 0, 15,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 9, 0, 2, 0,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));

All very similar, helper function?

> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 7, 0, 1, 30,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 8, 0, 0, 30,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 9, 30, 0, 30,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_clear_analogue_timer(&msg, true, t.tm_mday, t.tm_mon, 6, 0, 6, 0,
> +	                             CEC_OP_REC_SEQ_ONCE_ONLY, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +	                             7668, // 479.25 MHz
> +	                             node->remote[la].bcast_sys);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +
> +	return OK;
>  }
>  
>  static const vec_remote_subtests timer_prog_subtests{
> @@ -1717,8 +2081,8 @@ static const vec_remote_subtests timer_prog_subtests{
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
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 2816fb85..b273b988 100644
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
> @@ -296,6 +297,58 @@ int cec_named_ioctl(int fd, const char *name,
>  	return retval == -1 ? e : (retval ? -1 : 0);
>  }
>  
> +void print_timers(struct node *node)
> +{
> +	if (show_info) {
> +		printf("Timers Set:\n");
> +		for (auto &t : programmed_timers) {
> +			std::string start = ctime(&t.start_time);
> +			time_t end_time = t.start_time + t.duration;
> +			std::string end = ctime(&end_time);
> +			/* Remove the seconds because timer is precise only to the minute. */
> +			start.erase(16, 3);
> +			end.erase(16, 3);
> +			/* Remove the new line characters. */
> +			start.erase(start.end() - 1);
> +			end.erase(end.end() - 1);
> +			/* Remove the start year if it is the same as the end year. */
> +			if ((start.compare(start.size() - 4, 5, end, end.size() - 4, 5) == 0))
> +				start.erase(start.size() - 5, 5);
> +			printf("\t%s - %s, ", start.c_str(), end.c_str());
> +			/* Find and print the source. */
> +			std::string source;
> +			switch (t.src.type) {
> +			case CEC_OP_RECORD_SRC_OWN:
> +				source = "own";
> +				break;
> +			case CEC_OP_RECORD_SRC_DIGITAL:
> +				source = "digital";
> +				break;
> +			case CEC_OP_RECORD_SRC_ANALOG:
> +				source = "analog";
> +				break;
> +			case CEC_OP_RECORD_SRC_EXT_PLUG:
> +				source = "ext plug";
> +				break;
> +			case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
> +				source = "ext phy addr";
> +				break;
> +			default:
> +				break;
> +			}
> +			printf("source: %s, ", source.c_str());
> +			if (t.recording_seq)
> +				printf("rec-seq: 0x%x, ", t.recording_seq);
> +			printf("needs: %ld %s\n", t.duration, "MB."); /* 1MB per second. */
> +		}
> +		printf("Total media space available for recording: ");
> +		if (node->state.media_space_available >= 0)
> +			printf("%d MB.\n\n", node->state.media_space_available);
> +		else
> +			printf("0 MB.\n\n");
> +	}
> +}
> +
>  void state_init(struct node &node)
>  {
>  	if (options[OptStandby])
> @@ -319,6 +372,7 @@ void state_init(struct node &node)
>  	node.state.deck_skip_start = 0;
>  	node.state.one_touch_record_on = false;
>  	node.state.record_received_standby = false;
> +	node.state.media_space_available = 36000; /* In MB; space for 10 hours @ 1MB/sec */
>  	tuner_dev_info_init(&node.state);
>  	node.state.last_aud_rate_rx_ts = 0;
>  }
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 833dec5e..69c96aa7 100644
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
> +	time_t duration; /* In seconds. */
> +	__u8 recording_seq;
> +	struct cec_op_record_src src;
> +
> +	Timer()
> +	{
> +		start_time = 0;
> +		duration = 0;
> +		recording_seq = 0;
> +		src = {};
> +	}
> +
> +	Timer(const Timer& timer)
> +	{
> +		start_time = timer.start_time;
> +		duration = timer.duration;
> +		recording_seq = timer.recording_seq;
> +		src = timer.src;
> +	}
> +
> +	bool operator<(const Timer &r) const
> +	{
> +		return start_time < r.start_time ||
> +		       (start_time == r.start_time && duration < r.duration) ||
> +		       (start_time == r.start_time && duration == r.duration && src.type < r.src.type) ||
> +		       (start_time == r.start_time && duration == r.duration && src.type == r.src.type &&
> +		       recording_seq < r.recording_seq);
> +	}
> +
> +	bool operator==(const Timer &right) const
> +	{
> +		return start_time == right.start_time && duration == right.duration &&
> +		       src.type == right.src.type && recording_seq == right.recording_seq;
> +	}
> +};
> +
>  struct la_info {
>  	__u64 ts;
>  	struct {
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index e1d8b8fc..544cb662 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <array>
> -#include <ctime>
>  #include <string>
>  
>  #include <sys/ioctl.h>
> @@ -17,6 +16,147 @@
>  #define TOT_ANALOG_FREQS analog_freqs_khz[0][0].size()
>  #define TOT_DIGITAL_CHANS digital_arib_data[0].size() + digital_atsc_data[0].size() + digital_dvb_data[0].size()
>  
> +enum Months { Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec };
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
> +	timer.duration = ((duration_hr * 60) + duration_min) * 60; /* In seconds. */
> +
> +	/* Use current time in the timer when it is not available from message e.g. year. */
> +	time_t current_time = time(nullptr);
> +	struct tm temp = *(localtime(&current_time));
> +	temp.tm_mday = day;
> +	temp.tm_mon = month - 1; /* CEC months are 1-12 but struct tm range is 0-11. */
> +	temp.tm_hour = start_hr;
> +	temp.tm_min = start_min;
> +	/*
> +	 * Timer precision is only to the minute. Set sec to 0 so that differences in seconds
> +	 * do not affect timer comparisons.
> +	 */
> +	temp.tm_sec = 0;
> +	temp.tm_isdst = -1;
> +	timer.start_time = mktime(&temp);
> +
> +	/* If timer starts in past, increment the year so that timers can be set across year-end. */
> +	if (current_time > timer.start_time) {
> +		temp.tm_year++;
> +		temp.tm_isdst = -1;
> +		timer.start_time = mktime(&temp);
> +	}
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
> +	switch (month) {
> +	case Apr: case Jun: case Sep: case Nov:
> +		if (day > 30)
> +			return true;
> +		break;
> +	case Feb: {
> +		struct tm *tp = localtime(&timer.start_time);
> +
> +		if (!(tp->tm_year % 4) && ((tp->tm_year % 100) || !(tp->tm_year % 400))) {
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
> +static bool timer_overlap(const struct Timer &new_timer)
> +{
> +	if (programmed_timers.size() == 1)
> +		return false;
> +
> +	time_t new_timer_end = new_timer.start_time + new_timer.duration;
> +	for (auto &t : programmed_timers) {
> +
> +		if (new_timer == t)
> +			continue; /* Timer doesn't overlap itself. */
> +
> +		time_t existing_timer_end = t.start_time + t.duration;
> +
> +		if ((t.start_time < new_timer.start_time && new_timer.start_time < existing_timer_end) ||
> +		    (t.start_time < new_timer_end && new_timer_end < existing_timer_end) ||
> +		    (t.start_time == new_timer.start_time || existing_timer_end == new_timer_end) ||
> +		    (new_timer.start_time < t.start_time && existing_timer_end < new_timer_end))
> +		    return true;
> +	}
> +
> +	return false;
> +}
> +
>  struct service_info {
>  	unsigned tsid;
>  	unsigned onid;
> @@ -738,39 +878,88 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
> +		if (timer.recording_seq > 0x7f)
> +			prog_error = CEC_OP_PROG_ERROR_REC_SEQ_ERROR;
> +
> +		if (programmed_timers.find(timer) != programmed_timers.end())
> +			prog_error = CEC_OP_PROG_ERROR_DUPLICATE;
> +
> +		if (!prog_error) {
> +			programmed_timers.insert(timer);
> +
> +			if (timer_overlap(timer))
> +				timer_overlap_warning = CEC_OP_TIMER_OVERLAP_WARNING_OVERLAP;
> +
> +			if (node->state.media_space_available <= 0 ||
> +			    timer.duration > node->state.media_space_available) {
> +				prog_info = CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE;
> +			} else {
> +				unsigned space_that_may_be_needed = 0;
> +				for (auto &t : programmed_timers) {
> +					space_that_may_be_needed += t.duration;
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
> +			available_space_hr = node->state.media_space_available / 3600; /* 3600 MB/hour */
> +			available_space_min = (node->state.media_space_available % 3600) / 60; /* 60 MB/min */
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
> +		struct Timer timer = get_timer_from_message(msg);
> +
> +		if (programmed_timers.find(timer) != programmed_timers.end()) {
> +			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
> +			programmed_timers.erase(timer);
> +			print_timers(node);
> +		}
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

Regards,

	Hans
