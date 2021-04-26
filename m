Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D0D36AC4B
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 08:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhDZGiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 02:38:09 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54159 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231616AbhDZGiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 02:38:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aurvla5xWXsivauryl3V6a; Mon, 26 Apr 2021 08:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619419042; bh=+ty+f1Eg+q/gaDSpyiRCC+4TbFtW/p4aj0tQucj7I7I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rEhlN/qFxGL2KbNmHqBeycmV6iN+zFXwIGBCTuX1vvYSDFeSMbE1hf1NcC21uNRnG
         Mp/c/3hM87/zduc7mLCjenkl6oxJAaPiOCLNevDlUfZIzBGMtDd+KlSvcvP25bBHFK
         8ThXxj1qle2LIiBqv2UgzVn89qs+Jm3yJpDjU/j4nNgqDSr5iLsXvvnINND5DcgPpR
         jvuHfqbHjPKe+Ae+o7X48/MxMZFv83A1p7S10Ss6hUVEzrDb2mr2jnIczKXjNMUhA/
         6HstTZdR5ptpNHhS1mJ770A9hyR9/03pr0r8RALiapMkplzSuxHRdkm141GuSOAel/
         2natJDfgAkJoA==
Subject: Re: [PATCH v2 2/2] cec-follower: detect the cessation of Audio Rate
 Control messages
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
 <03c855c4a2072a4a174415198e2e44932af75fcd.1619389023.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4140a198-7805-d2c8-507c-6c6c0e0618ad@xs4all.nl>
Date:   Mon, 26 Apr 2021 08:37:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <03c855c4a2072a4a174415198e2e44932af75fcd.1619389023.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfK6ccfAEu8hjSduQpHvCXLV0j89eaGwALoS8lu6aVQyJit50ebWnHeP3CddmalSyKcYM5R1nXbIsMcGDjHLx2SLjlmp+q6jhuhPBBa60K/r1DKoInPvz
 9USQX8shgUmCNIk1DD3p/CZ1FhbbmVG6wz+OxbQ2NHUaAYS0gEAq6naogQXZ1yM2kaZEa5RjjvPVn12U6uKFd1MzHkUOxDGM1MVO73I48K+LO6VTBfPERpto
 uR0LVMkGahsHCy8mlKabAg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2021 00:54, Deborah Brouwer wrote:
> If the controlling device simply stops sending audio rate messages, give
> the cec-follower the ability to detect that it has not received an audio
> rate message within 2 seconds as required.  The cec-follower will quit the
> audio rate controlled mode.  Eliminate the need to measure an interval
> between two audio rate messages.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-follower/cec-processing.cpp | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 243c9d09..dd6fd05c 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -233,19 +233,22 @@ static __u8 current_power_state(struct node *node)
>  	return CEC_OP_POWER_STATUS_TO_STANDBY;
>  }
>  
> -static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
> +static void aud_rate_msg_interval_check(struct node *node, __u64 ts_new)
>  {
>  	/*
> -	 * The interval between messages is not relevant if this is the
> -	 * first audio rate control message or if the previous message
> -	 * turned off the audio rate control.
> +	 * The interval since the last audio rate message is not relevant
> +	 * unless the Source is currently in audio rate controlled mode.

I think this can be clarified if you extend the comment a bit and avoid
the double negation (not...unless):

	 * The interval since the last audio rate message is only relevant
	 * if the Source is currently in audio rate controlled mode
	 * (i.e. state.last_aud_rate_rx_ts != 0).

>  	 */
> +	__u64 ts_old = node->state.last_aud_rate_rx_ts;
> +
>  	if (ts_old) {
>  		__u64 interval = ts_new - ts_old;
>  
>  		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
> -			warn("The interval between Audio Rate Control messages was greater\n");
> +			warn("The interval since the last Audio Rate Control message was greater\n");
>  			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");

This is a bit too verbose. How about this:

			warn("The interval since the last Audio Rate Control message was > 2s.\n");

Regards,

	Hans

> +			warn("Turning off audio rate control.\n");
> +			node->state.last_aud_rate_rx_ts = 0;
>  		}
>  	}
>  }
> @@ -803,7 +806,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  
>  		switch (msg.msg[2]) {
>  		case CEC_OP_AUD_RATE_OFF:
> -			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
> +			aud_rate_msg_interval_check(node, msg.rx_ts);
>  			node->state.last_aud_rate_rx_ts = 0;
>  			return;
>  		case CEC_OP_AUD_RATE_WIDE_STD:
> @@ -812,7 +815,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		case CEC_OP_AUD_RATE_NARROW_STD:
>  		case CEC_OP_AUD_RATE_NARROW_FAST:
>  		case CEC_OP_AUD_RATE_NARROW_SLOW:
> -			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);
> +			aud_rate_msg_interval_check(node, msg.rx_ts);
>  			node->state.last_aud_rate_rx_ts = msg.rx_ts;
>  			return;
>  		default:
> @@ -1034,6 +1037,9 @@ void testProcessing(struct node *node, bool wallclock)
>  				node->state.rc_state = NOPRESS;
>  			}
>  		}
> +
> +		if (node->has_aud_rate)
> +			aud_rate_msg_interval_check(node, ts_now);
>  	}
>  	mode = CEC_MODE_INITIATOR;
>  	doioctl(node, CEC_S_MODE, &mode);
> 

