Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA3436A63D
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 11:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhDYJnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 05:43:32 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54257 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230102AbhDYJnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 05:43:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id abHllVFfAXsivabHol2IXr; Sun, 25 Apr 2021 11:42:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619343764; bh=NQMGt9hKyWrg3o3MlxeApAEld3xzZKfphZ4q7dXCVYE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JD2KRsZj8yJ4Qf7+qvoJAydraD2WZpGpqo9d6kPdwfFNM/jUQ7Q1oeISGmcWdeNOH
         TZdv+hZKV3cIausiDZ01ulho28cX4LcrD8zSWF9nS0qR1l5gEQcYP5K6IN+UR2tBY6
         EGHdYKErbexK6ZZDugFhZ8aeTjyyjPSi+ln8ZgYlOhZbDkiQTJzR3m6ccRA9M/3DHm
         Hd7cQAPzpAS17a6rWlse1Bc4bJeuqeAEn9/HBm0+S/oapKivx+LBiVrXGnTKgs8dkm
         MYdeRFaW6LRfH8u6OawP4bRa1Re4pnOpu8AWwlXMxsyDzrW41WoCxlKxegD5BHZ3ss
         hKDGOlAGVMtOA==
Subject: Re: [PATCH] cec-follower: detect the cessation of Audio Rate Control
 messages
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <20210425054614.27822-1-deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0e8852e6-2ea4-8292-429a-415a59e1bdf5@xs4all.nl>
Date:   Sun, 25 Apr 2021 11:42:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210425054614.27822-1-deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIAYRn+8hbTMZedF0rQCbHRo+urP5j0SlasDYCmaKl9alPHT1JWVNWNcebo8egdaSf7aujWKk/Q0ZPPYqLHBGjaGwrG25cKqw8LRP0llLxz7/yhHppvW
 NR5dpBG1yPBZQJDW1WqhXWFDue1y1kmT8bIEYhrdqP+b70Sh9+5sWlGRik/XpXQnXcA9MvkTmtfuBrtKqNQUB6BOBKwxrXF54FZbLT96WFp/cDZcaabp03UI
 mrY+fcwJDQYgEuktN3Cysw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

Some comment below:

On 25/04/2021 07:46, Deborah Brouwer wrote:
> If the controlling device simply stops sending audio rate messages, give
> the cec-follower the ability to detect that it has not received an audio
> rate message within 2 seconds as required.  The cec-follower will quit the
> audio rate controlled mode.  Eliminate the need to measure an interval
> between two audio rate messages.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-follower/cec-processing.cpp | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 93db4059..111b3604 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -233,18 +233,20 @@ static __u8 current_power_state(struct node *node)
>  	return CEC_OP_POWER_STATUS_TO_STANDBY;
>  }
>  
> -static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
> +static void aud_rate_msg_interval_check(__u64 ts_new, struct node *node)

Swap the arguments: node is typically the first argument.

>  {
>  	/*
> -	 * The interval between messages is not relevant if this is the
> -	 * first audio rate control message or if the previous message
> -	 * turned off the audio rate control.
> +	 * The interval since the last audio rate message is not relevant
> +	 * unless the Source is currently in audio rate controlled mode.
>  	 */
> +	__u64 ts_old = node->state.last_aud_rate_rx_ts;

Add a newline here.

>  	if (ts_old) {
>  		unsigned interval = (ts_new - ts_old) / 1000000000;

Ditto.

Also, I just realized that the test below is actually wrong: by dividing the
interval above by 1000000000 you reduce the precision to one second intervals.

>  		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {

Instead multiple MAX_AUD_RATE_MSG_INTERVAL by 1000000000, that way the
check is much more precise.

> -			warn("The interval between Audio Rate Control messages was greater\n");
> +			warn("The interval since the last Audio Rate Control message was greater\n");
>  			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
> +			warn("Turning off audio rate control.\n");
> +			node->state.last_aud_rate_rx_ts = 0;
>  		}
>  	}
>  }
> @@ -802,7 +804,6 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  
>  		switch (msg.msg[2]) {
>  		case CEC_OP_AUD_RATE_OFF:
> -			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);

You want to keep this check...

>  			node->state.last_aud_rate_rx_ts = 0;
>  			return;
>  		case CEC_OP_AUD_RATE_WIDE_STD:
> @@ -811,7 +812,6 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		case CEC_OP_AUD_RATE_NARROW_STD:
>  		case CEC_OP_AUD_RATE_NARROW_FAST:
>  		case CEC_OP_AUD_RATE_NARROW_SLOW:
> -			aud_rate_msg_interval_check(msg.rx_ts, node->state.last_aud_rate_rx_ts);

...and this check, because...

>  			node->state.last_aud_rate_rx_ts = msg.rx_ts;
>  			return;
>  		default:
> @@ -1033,6 +1033,9 @@ void testProcessing(struct node *node, bool wallclock)
>  				node->state.rc_state = NOPRESS;
>  			}
>  		}
> +
> +		if (node->has_aud_rate)
> +			aud_rate_msg_interval_check(ts_now, node);

...this periodic check only happens once a second, so is less precise. I.e., it might not
catch the case where the audio rate message arrived 2.1 seconds too late if this check was
performed e.g. 2.2 seconds later.

Regards,

	Hans

>  	}
>  	mode = CEC_MODE_INITIATOR;
>  	doioctl(node, CEC_S_MODE, &mode);
> 

