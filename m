Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944F03B5B1E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 11:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbhF1JWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 05:22:45 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48445 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230256AbhF1JWo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 05:22:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xnR8l3S2r1vOAxnRBl9Zmv; Mon, 28 Jun 2021 11:20:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624872018; bh=fSSzooBh/d8xJb3KK54o/u0zuNPZF5FxUMS0U4LgdcM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Dk5NGF11/Uyiiu9gN+8PSdi+Nv/gXQz2a7ijq5IzDHLvkU0GPIlSuTMqS10QUmSpa
         AfcU3olUGy+NPE6A+iYl5ltmrROjTWP+DkYQLs1b3V2bF7t7+eMOvIvyZdB1iFSJ+n
         1n9quV0sHTTh+lvPphD4AXK16relMJXx8jtks5R8IqhvghUYU6fqcChNhbwGnP6LYq
         U6+j2zqE2OyIq/yJaDdeC9Ih0gE1aq/NECWsrbtuRmdx7u75ibNEHCoitWqQgLe/f9
         qawJI+ULyJYb8/nE5n7d/5gXAUtgK6J/vNK6Km+JdkKKe91mUO384upiI2fUdB3QS2
         /IPvVfZGzraaw==
Subject: Re: [PATCH v5 3/3] cec: add One Touch Record Standby tests
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1624578960.git.deborahbrouwer3563@gmail.com>
 <7940ca575845c46d56d25e65b46db55682c719f7.1624578960.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4d2de4f5-8bde-9ffe-b868-37d34b42548e@xs4all.nl>
Date:   Mon, 28 Jun 2021 11:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7940ca575845c46d56d25e65b46db55682c719f7.1624578960.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE+f0NuKZQ4qZlZXlYEejBHTISwawOm5qs3N2vgWX64EGHOAnnx9385d7ewg3h0U5L+AtDSibWvyh/UPZoljIx72eOSiGB4ITJ9CMJ69pycksQaXLHj3
 +DDIa0PtHzkK8uPuQ7wjfzFdS3VSLx92Dk4uGQMuxanxq+JHUvrCMpcjOkF8LYNtFSiNyMf0Bldzc7VdceSKIrpA78D3ToHwPBqTBk0/rfd2gE4qxxXDr5kK
 vR3uyd9wQXZTcb2rcogT73EpdPIm0Q2xuWlT4pjaY+c=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

Sorry for the late review, it was very busy week and it took some time before I had
the time to dig into this. But here is my review:

On 25/06/2021 02:13, Deborah Brouwer wrote:
> Check that the recording device ignores a Standby message while it is
> recording. When the recording is finished, check that the recording device
> enters standby unless the recording device is the active source.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test-power.cpp | 63 +++++++++++++++++++++++++
>  utils/cec-follower/cec-follower.cpp     |  1 +
>  utils/cec-follower/cec-follower.h       |  2 +
>  utils/cec-follower/cec-processing.cpp   |  8 +++-
>  utils/cec-follower/cec-tuner.cpp        |  9 ++++
>  5 files changed, 81 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
> index b675bfc4..c6bf7093 100644
> --- a/utils/cec-compliance/cec-test-power.cpp
> +++ b/utils/cec-compliance/cec-test-power.cpp
> @@ -677,6 +677,67 @@ static int standby_resume_wakeup_deck_play(struct node *node, unsigned me, unsig
>  	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_PLAY_MODE_PLAY_FWD);
>  }
>  
> +static int standby_record(struct node *node, unsigned me, unsigned la, bool interactive, __u8 opcode)
> +{
> +	struct cec_msg msg;
> +	__u8 rec_status;
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
> +	cec_msg_standby(&msg);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	/* Standby should not interrupt the recording. */
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +
> +	/* When the recording stops, the recorder should standby unless the recorder is the active source */
> +	cec_msg_init(&msg, me, la);
> +	if (opcode == CEC_MSG_ACTIVE_SOURCE)

You don't actually use opcode, you just use it to decide whether to make the
remove device the active source or not. Just change the argument to a bool
and give it a more descriptive name.

> +		cec_msg_active_source(&msg, node->remote[la].phys_addr);
> +	else
> +		cec_msg_active_source(&msg, node->remote[la].phys_addr + 1);

Using phys_addr + 1 is a bit dangerous: what if there actually is such a device?
Instead, use the physical address of 'me'. That's guaranteed to be both valid
and different from the remote physical address.

> +	fail_on_test(!transmit_timeout(node, &msg));

You should transmit this before you transmit the standby. Right now you might
make a device in standby the active source, which is odd.

> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_off(&msg, false);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
> +	unsigned unresponsive_time = 0;
> +
> +	if (opcode == CEC_MSG_ACTIVE_SOURCE) {
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
> +	return standby_record(node, me, la, interactive, CEC_MSG_ACTIVE_SOURCE);
> +}
> +
> +static int standby_record_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	return standby_record(node, me, la, interactive, CEC_MSG_INACTIVE_SOURCE);
> +}
> +
>  const vec_remote_subtests standby_resume_subtests{
>  	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
>  	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
> @@ -697,4 +758,6 @@ const vec_remote_subtests standby_resume_subtests{
>  	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
>  	{ "Deck Eject Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_eject },
>  	{ "Deck Play Standby Resume", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, standby_resume_wakeup_deck_play },
> +	{ "Record Standby Active Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_active_source },
> +	{ "Record Standby Inactive Source", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, standby_record_inactive_source },
>  };
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 482192e7..d6c9cdfb 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -318,6 +318,7 @@ void state_init(struct node &node)
>  	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
>  	node.state.deck_skip_start = 0;
>  	node.state.one_touch_record_on = false;
> +	node.state.one_touch_record_standby = false;
>  	tuner_dev_info_init(&node.state);
>  	node.state.last_aud_rate_rx_ts = 0;
>  }
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 3bcb2774..a5d1c3a6 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -54,6 +54,7 @@ struct state {
>  	__u8 deck_state;
>  	__u64 deck_skip_start;
>  	bool one_touch_record_on;
> +	bool one_touch_record_standby;

How about: bool one_touch_record_received_standby;

Perhaps the one_touch_ prefix can be dropped in these two variables.
It will probably depend on the timer feature as well: both deal with
recording, and so these bools might be valid for both features, in
which case the prefix makes no sense.

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
> index f985a841..43e03878 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -157,7 +157,7 @@ static bool exit_standby(struct node *node)
>  	return false;
>  }
>  
> -static bool enter_standby(struct node *node)
> +bool enter_standby(struct node *node)
>  {
>  	if (node->state.power_status == CEC_OP_POWER_STATUS_ON ||
>  	    node->state.power_status == CEC_OP_POWER_STATUS_TO_ON) {
> @@ -320,10 +320,14 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8
>  		/* Standby */
>  
>  	case CEC_MSG_STANDBY:
> +		/* Standby should not interrupt a recording in progress. */

This comment should be extended with: "but set one_touch_record_standby
to true to remember to go to standby once the recording is finished."

> +		if (node->state.one_touch_record_on) {
> +			node->state.one_touch_record_standby = true;
> +			break;
> +		}

Shouldn't exit_standby() set node->state.one_touch_record_standby to false?

>  		enter_standby(node);
>  		return;
>  
> -
>  		/* One Touch Play and Routing Control */
>  
>  	case CEC_MSG_ACTIVE_SOURCE: {
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 0f40b7d7..4d159456 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -716,6 +716,15 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
>  		transmit(node, &msg);
>  		node->state.one_touch_record_on = false;
> +		/*
> +		 * If standby was received during recording, enter standby when the recording is finished
> +		 * unless the recording device is the currently the active source.
> +		 */
> +		if (node->state.one_touch_record_standby) {
> +			if (node->phys_addr != node->state.active_source_pa)
> +				enter_standby(node);
> +			node->state.one_touch_record_standby = false;
> +		}
>  		return;
>  	case CEC_MSG_RECORD_STATUS:
>  		return;
> 

Regards,

	Hans
