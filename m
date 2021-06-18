Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8906C3AC737
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 11:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhFRJSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 05:18:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:43685 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbhFRJSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 05:18:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uAcClCBB8hqltuAcGl4T7n; Fri, 18 Jun 2021 11:16:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624007804; bh=lhxKaOYvnZeSEJY2WenH7yZ41KO9OGDOpnkv9R/3M4o=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FnKCdmTVdeXm8QOm4Fgbsrha8RT8pfIBFW03luomg4W1foXPCxSOY3QnY1L4PZen+
         jTXfKBocySrJZL8IfjrFTGv4KgRhncFfCLyzHusXlMpAWgBP+ydDIy1gbca8LYb+7m
         mPs0VJmM0CojH/eggCGY3ItoDtfSMpLYvvyzJRecr1Y5e8Xqtb1lBicfKGe/gLd9D2
         CdaZ38MTvzNXUtRcn629G5jMZqftYVyagHOoGj6yOG9OHxqHOWt/StaziithF8jvBm
         dzLV8Jo3be82+sK0k38+y43qiboFbNmLN83czKxPW7bssRcrUjlq1c0x0M05iKHWUy
         nTqUizIRs6lpA==
Subject: Re: [PATCH v2 2/2] cec: expand One Touch Record On test
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
 <b9771c1afb515ce2132d9a801174127543821755.1623972511.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c8fcbd37-91c0-a618-ccea-cef0bbee99a7@xs4all.nl>
Date:   Fri, 18 Jun 2021 11:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b9771c1afb515ce2132d9a801174127543821755.1623972511.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ9DECz2//X3ACcqY7hkztjK1qeT0oMitSuPGVy6vrRBUZVYooEWN8DHMyNohw+u2w6VhSaCTV7jpk7ZSsJK1mckPKqcYrNmiTAILOKJChXwb/wTFnnp
 LwrpometStC85X94+oCOTtK7Pi6PAIkLYmHxs32keZIyvhQt+wI0KQ1NSMCAMLfxY7SbeelE0d8NvvyCI7u78XYyDFpH5AkjiTq0G+BmrI3yZe0ekabc66/c
 su6CP2zrmCap1YV6OTyo1unM/mmhgR+z9NkeV+W9DFo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 18/06/2021 01:41, Deborah Brouwer wrote:
> Send all Record On source operands and check that the follower responds
> with a corresponding Record Status. Send invalid Record On source
> operands and make sure that the follower returns Feature Abort with
> Invalid Operand.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 107 +++++++++++++++++++++++++++---
>  utils/cec-follower/cec-tuner.cpp  |  28 +++++++-
>  2 files changed, 125 insertions(+), 10 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 0051d72a..2c64d1a0 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -48,6 +48,43 @@ static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play
>  	return OK;
>  }
>  
> +static int one_touch_rec_on_send(struct node *node, unsigned me, unsigned la, __u8 src, __u8 &rec_status)
> +{
> +	struct cec_msg msg;
> +	struct cec_op_record_src rec_src = {};
> +
> +	cec_msg_init(&msg, me, la);
> +	rec_src.type = src;

You should increase the timeout value to 10s: the spec says that "it may take
several seconds or more before a recorder is able to send an accurate
<Record Status> after receiving a <Record On> message. That 10s is kind of
random since the spec is again very vague about this, but you have to pick
something here.

> +	cec_msg_record_on(&msg, true, &rec_src);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	cec_ops_record_status(&msg, &rec_status);
> +
> +	return OK;
> +}
> +
> +static bool one_touch_rec_common(__u8 rec_status)

This is a poor function name as it does not describe what the function actually does.

> +{
> +	switch (rec_status) {
> +	case CEC_OP_RECORD_STATUS_UNSUP_CA:
> +	case CEC_OP_RECORD_STATUS_NO_CA_ENTITLEMENTS:
> +	case CEC_OP_RECORD_STATUS_CANT_COPY_SRC:
> +	case CEC_OP_RECORD_STATUS_NO_MORE_COPIES:
> +	case CEC_OP_RECORD_STATUS_NO_MEDIA:
> +	case CEC_OP_RECORD_STATUS_PLAYING:
> +	case CEC_OP_RECORD_STATUS_ALREADY_RECORDING:
> +	case CEC_OP_RECORD_STATUS_MEDIA_PROT:
> +	case CEC_OP_RECORD_STATUS_NO_SIGNAL:
> +	case CEC_OP_RECORD_STATUS_MEDIA_PROBLEM:
> +	case CEC_OP_RECORD_STATUS_NO_SPACE:
> +	case CEC_OP_RECORD_STATUS_PARENTAL_LOCK:
> +	case CEC_OP_RECORD_STATUS_OTHER:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /* System Information */
>  
>  int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1215,10 +1252,6 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
>  
>  static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/*
> -	  TODO: Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
> -	  checked for.
> -	 */
>  	struct cec_msg msg;
>  	struct cec_op_record_src rec_src = {};
>  
> @@ -1227,15 +1260,68 @@ static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool in
>  	cec_msg_record_on(&msg, true, &rec_src);
>  	fail_on_test(!transmit_timeout(node, &msg));
>  	fail_on_test(timed_out(&msg));
> -	fail_on_test(cec_has_record(1 << la) && unrecognized_op(&msg));
> -	if (unrecognized_op(&msg))
> +	if (unrecognized_op(&msg)) {
> +		fail_on_test(cec_has_record(1 << la) || cec_has_backup(1 << la));

You can't test for cec_has_backup here since backup devices do not have to be
recording devices.

>  		return OK_NOT_SUPPORTED;
> +	}
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
>  
> -	return 0;
> +	__u8 rec_status;
> +
> +	cec_ops_record_status(&msg, &rec_status);
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_CUR_SRC && !one_touch_rec_common(rec_status));

Due to the very vague name 'one_touch_rec_common' I can't really tell what is being
tested here. I think one_touch_rec_common() tests for 'error' states?

Also, since you always test for !one_touch_rec_common() you should consider inverting
the return value from the function.

> +
> +	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_DIGITAL, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_DIG_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
> +	             !one_touch_rec_common(rec_status));
> +
> +	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_ANALOG, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_ANA_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_ANA_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
> +	             !one_touch_rec_common(rec_status));
> +
> +	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_EXT_PLUG, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT &&
> +	             rec_status != CEC_OP_RECORD_STATUS_INVALID_EXT_PLUG &&
> +	             !one_touch_rec_common(rec_status));
> +
> +	fail_on_test(one_touch_rec_on_send(node, me, la, CEC_OP_RECORD_SRC_EXT_PHYS_ADDR, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT &&
> +	             rec_status != CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR &&
> +	             !one_touch_rec_common(rec_status));
> +
> +	return OK;
> +}
> +
> +static int one_touch_rec_on_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	struct cec_msg msg;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on_own(&msg);
> +	msg.msg[2] = 0;  /* Invalid source operand */
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return OK_NOT_SUPPORTED;
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on_own(&msg);
> +	msg.msg[2] = 6;  /* Invalid source operand */
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return OK_NOT_SUPPORTED;
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	return OK;
>  }
>  
>  static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1260,7 +1346,12 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
>  
>  static const vec_remote_subtests one_touch_rec_subtests{
>  	{ "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
> -	{ "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
> +	{ "Record On", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, one_touch_rec_on },
> +	{
> +		"Record On Invalid Operand",
> +		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
> +		one_touch_rec_on_invalid,
> +	},
>  	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
>  };
>  
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index fd11bd10..ebceb064 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -606,10 +606,34 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		return;
>  	}
>  	case CEC_MSG_RECORD_ON:
> -		if (!cec_has_record(1 << me))
> +		if (!cec_has_record(1 << me) && !cec_has_backup(1 << me))

This won't work. cec_has_backup() doesn't mean that the device is actually a
recording device.

Instead, you need to use log_addr_type as returned by CEC_ADAP_G_LOG_ADDRS:

https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/cec/cec-ioc-adap-g-log-addrs.html

So in testProcessing:

__u8 type = laddrs.log_addr_type[0];

Then pass that info to processMsg etc. so it can be tested.

Another things that cec-follower does wrong today is that it has no support
for multiple LAs for a cec device: it just reads laddrs.log_addr[0], and does
not check if other LAs are also available. This is a bug in the follower, this
was simply never implemented. Testing this requires the vivid patch that I
posted on Wednesday.

This should be addressed in a separate patch, but finish the One Touch Record
series first.

> +			break;
> +
> +		struct cec_op_record_src rec_src;
> +		__u8 rec_status;
> +
> +		cec_ops_record_on(&msg, &rec_src);
> +
> +		switch (rec_src.type) {
> +		case CEC_OP_RECORD_SRC_OWN:
> +			rec_status = CEC_OP_RECORD_STATUS_CUR_SRC;
> +			break;
> +		case CEC_OP_RECORD_SRC_DIGITAL:
> +			rec_status = CEC_OP_RECORD_STATUS_DIG_SERVICE;
>  			break;
> +		case CEC_OP_RECORD_SRC_ANALOG:
> +			rec_status = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +			break;

For digital and analog recording the service info needs to be checked to see
if it is valid. For analog valid channels emulated by the follower are
defined in analog_freqs_khz. For digital it is defined in digital_arib_data,
digital_atsc_data and digital_dvb_data.

This is probably quite a bit of work for you to figure out how this works, so
I am OK with implementing in a later separate patch.

> +		case CEC_OP_RECORD_SRC_EXT_PLUG:

We should check the plug number. It makes sense if the follower just emulates,
say, 6 external plugs.

> +		case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
> +			rec_status = CEC_OP_RECORD_STATUS_EXT_INPUT;

I think we should disallow this for now in the follower. To do this right
it would have to emulate an additional CEC device corresponding to the
physical address. That's just getting to be too complex.

> +			break;
> +		default:
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
> +			return;
> +		}
>  		cec_msg_set_reply_to(&msg, &msg);
> -		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_CUR_SRC);
> +		cec_msg_record_status(&msg, rec_status);
>  		transmit(node, &msg);
>  		return;
>  	case CEC_MSG_RECORD_OFF:
> 

The follower does need to keep track of whether it is already recording and
return CEC_OP_RECORD_STATUS_ALREADY_RECORDING if that's the case. Also
<Standby> should be ignored when recording.

But perhaps this will be implemented in the next patch?

I do think that it makes the patch easier to understand if both Record On and
Record Off are implemented in the same patch: to keep track of the recording
status you need both, so splitting up support for these messages doesn't make
much sense.

Regards,

	Hans
