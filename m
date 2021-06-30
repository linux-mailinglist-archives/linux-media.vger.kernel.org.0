Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C8A3B7FF6
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 11:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233754AbhF3Jbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 05:31:40 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:44741 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233541AbhF3Jbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 05:31:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yWWplqgYc48ZvyWWslDTcm; Wed, 30 Jun 2021 11:29:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625045350; bh=AKAyIHr3MK3jwwj1nMpLbgfMI77qwZRJw1msxIfZPL0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=G9nZam0+evMAAGsRO+hEMMfXCA4+4XowJvRy3X3pNAUnpSY6fkcMeTWjlKD6g8DDg
         pSLB3vPwZ9tfjMmrHX/O8D4KDt28lZ3ei1+gfrt5lhWwlO3ivWvqOUMFQ7CUCfrnC1
         cZsB1gGajuk2tpRp0/PdLWw7jl1YmShvRcznxTshqcEMs19lXzwb+czPSt1exg6jxr
         7MMKemWL0pXHwlo9wFS2JvKRzX5OJnFNF9oY853luRovfh1vZA/jdOJhpl6mmUtpYh
         fHPu7scl8sBSP2HDLFZPCB49N0HtFUONrEBYgrjl+VOD2tc1GZkosc3SY3h6vZ8cY9
         0t5tjeVBbUcFA==
Subject: Re: [PATCH v6 2/2] cec: add One Touch Record Standby tests
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1624989704.git.deborahbrouwer3563@gmail.com>
 <3f78259306e92966d6e9ace3f102c4050e18c46d.1624989704.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d120a1dc-b24a-3ec3-67fc-6e3424fca811@xs4all.nl>
Date:   Wed, 30 Jun 2021 11:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3f78259306e92966d6e9ace3f102c4050e18c46d.1624989704.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIRHyiD+EQ9MzUcNHIqOSzjY9b/tJ2duCU+a910gyc3TXAgUJaECAEJepmHAfOXqq1+g06dOWKDMFDy0Qrj1wFlyEbVsPFmbbajogcFH8wGXyJwIOkxg
 +pZvDvkNRqHkI+9sL+VCpGv5N6nm6Sm+zglsO8OWmfiq73JPoERRlP6iVx747BxEPOQYI+5AYAja7hji4X6HNTENAJhX2A5woWf4M0H4/u6VPRBjj34x0k9Y
 Qmqi7GwFDb7spi8FHsKoPk1Yn3s2ZI/2V8o/xTKgfRM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2021 20:21, Deborah Brouwer wrote:
> Check that the recording device ignores a Standby message while it is
> recording. When the recording is finished, check that the recording device
> enters standby unless the recording device is the active source.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test-power.cpp | 62 +++++++++++++++++++++++++
>  utils/cec-follower/cec-follower.cpp     |  1 +
>  utils/cec-follower/cec-follower.h       |  2 +
>  utils/cec-follower/cec-processing.cpp   | 14 +++++-
>  utils/cec-follower/cec-tuner.cpp        |  9 ++++
>  5 files changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
> index b675bfc4..f23d0414 100644
> --- a/utils/cec-compliance/cec-test-power.cpp
> +++ b/utils/cec-compliance/cec-test-power.cpp
> @@ -677,6 +677,66 @@ static int standby_resume_wakeup_deck_play(struct node *node, unsigned me, unsig
>  	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_PLAY_MODE_PLAY_FWD);
>  }
>  
> +static int standby_record(struct node *node, unsigned me, unsigned la, bool interactive, bool active_source)
> +{
> +	struct cec_msg msg;
> +	__u8 rec_status;
> +	unsigned unresponsive_time = 0;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on_own(&msg);
> +	msg.reply = CEC_MSG_RECORD_STATUS;
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	if (timed_out_or_abort(&msg))
> +		return OK_NOT_SUPPORTED;
> +	cec_ops_record_status(&msg, &rec_status);
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_CUR_SRC &&
> +	             rec_status != CEC_OP_RECORD_STATUS_ALREADY_RECORDING);
> +
> +	cec_msg_init(&msg, me, la);
> +	if (active_source)
> +		cec_msg_active_source(&msg, node->remote[la].phys_addr);
> +	else
> +		cec_msg_active_source(&msg, me);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_standby(&msg);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	/* Standby should not interrupt the recording. */
> +	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_off(&msg, false);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
> +	/* When the recording stops, recorder should standby unless it is the active source. */
> +	if (active_source) {
> +		fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
> +	} else {
> +		fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_STANDBY, unresponsive_time));
> +		fail_on_test(interactive && !question("Is the device in standby?"));
> +		node->remote[la].in_standby = true;
> +
> +		int ret = standby_resume_wakeup(node, me, la, interactive);
> +		if (ret)
> +			return ret;
> +		node->remote[la].in_standby = false;
> +	}
> +
> +	return OK;
> +}
> +
> +static int standby_record_active_source(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	return standby_record(node, me, la, interactive, true);
> +}
> +
> +static int standby_record_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	return standby_record(node, me, la, interactive, false);
> +}
> +
>  const vec_remote_subtests standby_resume_subtests{
>  	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
>  	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
> @@ -697,4 +757,6 @@ const vec_remote_subtests standby_resume_subtests{
>  	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
>  	{ "Deck Eject Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_eject },
>  	{ "Deck Play Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_play },
> +	{ "Record Standby Active Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_active_source },
> +	{ "Record Standby Inactive Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_inactive_source },
>  };
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 482192e7..2816fb85 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -318,6 +318,7 @@ void state_init(struct node &node)
>  	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
>  	node.state.deck_skip_start = 0;
>  	node.state.one_touch_record_on = false;
> +	node.state.record_received_standby = false;
>  	tuner_dev_info_init(&node.state);
>  	node.state.last_aud_rate_rx_ts = 0;
>  }
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 8dfbd39f..833dec5e 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -54,6 +54,7 @@ struct state {
>  	__u8 deck_state;
>  	__u64 deck_skip_start;
>  	bool one_touch_record_on;
> +	bool record_received_standby;
>  	time_t toggle_power_status;
>  	__u64 last_aud_rate_rx_ts;
>  };
> @@ -230,5 +231,6 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  void reply_feature_abort(struct node *node, struct cec_msg *msg,
>  			 __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP);
>  void testProcessing(struct node *node, bool wallclock);
> +bool enter_standby(struct node *node);
>  
>  #endif
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index e1a71d6c..32375966 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -146,6 +146,9 @@ void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
>  
>  static bool exit_standby(struct node *node)
>  {
> +	/* Cancel any standby request that was pending. */
> +	node->state.record_received_standby = false;
> +
>  	if (node->state.power_status == CEC_OP_POWER_STATUS_STANDBY ||
>  	    node->state.power_status == CEC_OP_POWER_STATUS_TO_STANDBY) {
>  		node->state.old_power_status = node->state.power_status;
> @@ -157,14 +160,23 @@ static bool exit_standby(struct node *node)
>  	return false;
>  }
>  
> -static bool enter_standby(struct node *node)
> +bool enter_standby(struct node *node)
>  {
>  	if (node->state.power_status == CEC_OP_POWER_STATUS_ON ||
>  	    node->state.power_status == CEC_OP_POWER_STATUS_TO_ON) {
> +		/*
> +		 * Standby should not interrupt a recording in progress, but
> +		 * remember to go to standby once the recording is finished.
> +		 */
> +		if (node->state.one_touch_record_on) {
> +			node->state.record_received_standby = true;
> +			return false;
> +		}
>  		node->state.old_power_status = node->state.power_status;
>  		node->state.power_status = CEC_OP_POWER_STATUS_STANDBY;
>  		node->state.power_status_changed_time = time(nullptr);
>  		node->state.deck_skip_start = 0;
> +		node->state.record_received_standby = false;
>  		dev_info("Changing state to standby\n");
>  		return true;
>  	}
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 13cf6d20..e1d8b8fc 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -724,6 +724,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
>  		transmit(node, &msg);
>  		node->state.one_touch_record_on = false;
> +		/*
> +		 * If standby was received during recording, enter standby when the
> +		 * recording is finished unless recording device is the active source.
> +		 */
> +		if (node->state.record_received_standby) {
> +			if (node->phys_addr != node->state.active_source_pa)
> +				enter_standby(node);
> +			node->state.record_received_standby = false;
> +		}
>  		return;
>  	case CEC_MSG_RECORD_STATUS:
>  		return;
> 

Looks good! I'll wait for v7 before merging as I expect that to be the final version.

Regards,

	Hans
