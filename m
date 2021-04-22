Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AEC367A8F
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 09:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhDVHHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 03:07:11 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37757 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234965AbhDVHHK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 03:07:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZTPplpPKrvTEDZTPslXs69; Thu, 22 Apr 2021 09:06:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619075184; bh=wyfVODMhmgWs6F1n0aEllNAMRTBOm13cW2w3aux6E8o=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uCJuQf8r3cV3yl9rCxu6uihjPL/70opYX7aLNkFyRTS05DkD9X1VWjiAzAAC48HKd
         X2ZIxj5AIZf28BeEjYgFtAvPBVAlYun5NA97cnj3YkQCOeKVTYOVJOVNSeu7wLcUy6
         c+i2x6d43OBuzs2DHsBb2DtQjKeGN3ximxJz9fuqviLnqr3f5wk3A3n/GmXL5uCOrb
         AavwPazAP0nJy+wZU90apWqdHu82F3omjyM/P8sT6Z8CWsFnT/6zXy5KdzIFGOzgo3
         u+JI8FvWLqL2pM/yRk5031ht9SWF8svjUqh7sS0LlC8bI4ArOsKFuJB8Et1vKmVSsj
         EEMFEG87owsOA==
Subject: Re: [PATCH v4 2/3] cec: add active sensing test for Audio Rate
 Control messages
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
 <7008f3b7930a409284602b4e4868d26ea4a1d23c.1619060430.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <67569b70-a606-5d81-b731-b146a6b54dd2@xs4all.nl>
Date:   Thu, 22 Apr 2021 09:06:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7008f3b7930a409284602b4e4868d26ea4a1d23c.1619060430.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDSjDX/Q7ZNoPaDxBMLf+FHb2z0mVkA7myDlKf7yX9wq7bFqe0aqyfqq0zhtWYQA8FxRMpLbYWAbDINFTtM4zMYW7xObZ8MbDAmi+d4AAAN1Wss6GTke
 Ly9Fh2IYqXrk/KvyHJF/19fcrSaB4F2JbCVCj63wX4z8KbOvfLCZId7XL7IJwSfk0pHsClHhIc/ywEnxdtAWsUSTX7wrfGEi/OW+cqU+y16CEx2SacuioL4a
 lR3kjP3EYKiI/dOQhOwu4g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2021 05:27, Deborah Brouwer wrote:
> The controlling device should send an Audio Rate Control message at least
> once every 2 seconds for active sensing. Add a test in cec-compliance to
> delay the message by more than 2 seconds. Check the interval between
> messages in cec-follower and warn if the delay is greater than 2 seconds.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 34 +++++++++++++++---
>  utils/cec-follower/cec-follower.cpp     |  1 +
>  utils/cec-follower/cec-follower.h       |  1 +
>  utils/cec-follower/cec-processing.cpp   | 46 ++++++++++++++++++++-----
>  4 files changed, 69 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 4674295b..e1386dbb 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -851,10 +851,6 @@ const vec_remote_subtests sac_subtests{
>  
>  /* Audio Rate Control */
>  
> -/*
> -  TODO: These are very rudimentary tests which should be expanded.
> - */
> -
>  static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> @@ -875,6 +871,30 @@ static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigne
>  	return OK_PRESUMED;
>  }
>  
> +static int audio_rate_ctl_active_sensing(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	/*
> +	 * The source shall go back to Rate Control Off if no Set Audio Rate message is
> +	 * received for more than 2 seconds.
> +	 */
> +	if (!node->remote[la].has_aud_rate)
> +		return NOTAPPLICABLE;
> +
> +	struct cec_msg msg = {};
> +
> +	cec_msg_init(&msg, me, la);
> +
> +	/*
> +	 * Since this subtest runs immediately after Set Audio Rate, delaying the interval
> +	 * between the two tests is sufficient to test that the Source turns off rate control.
> +	 */
> +	sleep(3);
> +	cec_msg_set_audio_rate(&msg, CEC_OP_AUD_RATE_OFF);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test_v2(node->remote[la].cec_version, unrecognized_op(&msg));
> +	return OK_PRESUMED;
> +}
> +
>  const vec_remote_subtests audio_rate_ctl_subtests{
>  	{
>  		"Set Audio Rate",
> @@ -882,4 +902,10 @@ const vec_remote_subtests audio_rate_ctl_subtests{
>  		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>  		audio_rate_ctl_set_audio_rate,
>  	},
> +	{
> +		"Audio Rate Active Sensing",
> +		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD |
> +		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		audio_rate_ctl_active_sensing,
> +	},
>  };
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index bb63f90d..184cf16a 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -314,6 +314,7 @@ void state_init(struct node &node)
>  	node.state.volume = 50;
>  	node.state.mute = false;
>  	tuner_dev_info_init(&node.state);
> +	node.state.last_aud_rate_rx_ts = 0;
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 7806a4b6..391b9ab4 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -51,6 +51,7 @@ struct state {
>  	bool tuner_report_changes;
>  	bool deck_report_changes;
>  	unsigned toggle_power_status;
> +	__u64 last_aud_rate_rx_ts;
>  };
>  
>  struct node {
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 02440747..fc0d5df0 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -29,6 +29,9 @@
>  /* Time between each polling message sent to a device */
>  #define POLL_PERIOD 15000
>  
> +/* The maximum interval in seconds between audio rate messages as defined in the spec */
> +#define MAX_AUD_RATE_MSG_INTERVAL 2
> +
>  struct cec_enum_values {
>  	const char *type_name;
>  	__u8 value;
> @@ -230,6 +233,22 @@ static __u8 current_power_state(struct node *node)
>  	return CEC_OP_POWER_STATUS_TO_STANDBY;
>  }
>  
> +static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
> +{
> +	/*
> +	 * The interval between messages is not relevant if this is the
> +	 * first audio rate control message or if the previous message
> +	 * turned off the audio rate control.
> +	 */
> +	if (ts_old) {
> +		unsigned interval = (ts_new - ts_old) / 1000000000;
> +		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
> +			warn("The interval between Audio Rate Control messages was greater\n");
> +			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
> +		}
> +	}
> +}
> +
>  static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	__u8 to = cec_msg_destination(&msg);
> @@ -775,18 +794,27 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		return;
>  
>  
> -		/*
> -		  Audio Rate Control
> -
> -		  This is only a basic implementation.
> -
> -		  TODO: Set Audio Rate shall be sent at least every 2 seconds by
> -		  the controlling device. This should be checked and kept track of.
> -		*/
> +		/* Audio Rate Control */
>  
>  	case CEC_MSG_SET_AUDIO_RATE:
> -		if (node->has_aud_rate)
> +		if (!node->has_aud_rate)
> +			break;
> +
> +		switch (msg.msg[2]) {
> +		case CEC_OP_AUD_RATE_OFF:
> +			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
> +			node->state.last_aud_rate_rx_ts = 0;
> +			return;
> +		case CEC_OP_AUD_RATE_WIDE_STD:
> +		case CEC_OP_AUD_RATE_WIDE_FAST:
> +		case CEC_OP_AUD_RATE_WIDE_SLOW:
> +		case CEC_OP_AUD_RATE_NARROW_STD:
> +		case CEC_OP_AUD_RATE_NARROW_FAST:
> +		case CEC_OP_AUD_RATE_NARROW_SLOW:
> +			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
> +			node->state.last_aud_rate_rx_ts = msg.rx_ts;

Note that this only checks the interval if the initiator transmits two
CEC_MSG_SET_AUDIO_RATE messages with more than 2 seconds between them.

This doesn't address the case where the initiator just stops sending them
altogether.

So you need to add another check in testProcessing where you verify this
as well (at the end of the 'while (true)' loop).

Regards,

	Hans

>  			return;
> +		}
>  		break;
>  
>  
> 

