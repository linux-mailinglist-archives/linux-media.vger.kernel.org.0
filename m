Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B587BB7556
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 10:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387617AbfISImR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 04:42:17 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38057 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbfISImR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 04:42:17 -0400
Received: from [IPv6:2001:983:e9a7:1:c95c:52f0:f173:9443] ([IPv6:2001:983:e9a7:1:c95c:52f0:f173:9443])
        by smtp-cloud9.xs4all.net with ESMTPA
        id As10ildjLz6EAAs11ivJWR; Thu, 19 Sep 2019 10:42:15 +0200
Subject: Re: [PATCH] cec-follower: fix cec-tuner.cpp
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190919021716.259614-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <02553d22-ac1c-fbd7-17eb-afdc77c28342@xs4all.nl>
Date:   Thu, 19 Sep 2019 10:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190919021716.259614-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLHNrlTDPD3cC/Avx81Xs4AsRUxg7xzezUw/wttjLOSOQSw8Wio5bTiDLjhHbKy6Bng55z6chdWhOjDhHbVz2gOZimr0uQnqr5mtbxct73R5VSPXEPZt
 gojYuuXKmoYJfbxESxMS1VD3eW+gdfRvNaSjrBWL1dlFtyJa6GMPFjfDIFyKNWkCJZ5x4cdciojbUO9nZrvMIvhG+8IrRwl7M/QbNHlNLvb3Tcj5Kis+flvd
 t9ZbaGAzQJ1zAtlgz7404JemW/e1rUIy2dZ1si4c6jWvsqIJf/WdYU4Gjwb2gezpgSd7MKaEBmGkqs8Svh47CtDacEZTli7tlYeqEGACyWZmDM7tW84ApiMW
 jF36XWflbJ2/D9seuteW7pov6kVYog==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiunn,

On 9/19/19 4:17 AM, Jiunn Chang wrote:
> Export code from cec-processing.cpp to cec-tuner.cpp so testing logic
> does not break for PRESUMED_OK which replies on the feature abort
> message.  Also needed it a boolean for broadcast messages that should
> not be aborted.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-follower/cec-processing.cpp |  4 +--
>  utils/cec-follower/cec-tuner.cpp      | 37 +++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 15cedddf..c6ef1d09 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -608,7 +608,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  	case CEC_MSG_DECK_STATUS:
>  		return;
>  
> -	/* Tuner Centric Messages */
> +	/* Tuner/Record/Timer Messages */
>  
>  	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS:
>  	case CEC_MSG_TUNER_DEVICE_STATUS:
> @@ -630,7 +630,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  	case CEC_MSG_TIMER_CLEARED_STATUS:
>  	case CEC_MSG_TIMER_STATUS:
>  		process_tuner_record_timer_msgs(node, msg, me);
> -		break;
> +		return;
>  
>  		/* Dynamic Auto Lipsync */
>  
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 5e794d71..bb727ae7 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -7,8 +7,40 @@
>  
>  #include "cec-follower.h"
>  
> +static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)

Don't copy this! That's code duplication for no reason.

Just drop static from the function in cec-processing.cpp and add the prototype to
cec-follower.h.

> +{
> +	unsigned la = cec_msg_initiator(msg);
> +	__u8 opcode = cec_msg_opcode(msg);
> +	__u64 ts_now = get_ts();
> +
> +	if (cec_msg_is_broadcast(msg) || cec_msg_initiator(msg) == CEC_LOG_ADDR_UNREGISTERED)
> +		return;
> +	if (reason == CEC_OP_ABORT_UNRECOGNIZED_OP) {
> +		la_info[la].feature_aborted[opcode].count++;
> +		if (la_info[la].feature_aborted[opcode].count == 2) {
> +			/* If the Abort Reason was "Unrecognized opcode", the Initiator should not send
> +			   the same message to the same Follower again at that time to avoid saturating
> +			   the bus. */
> +			warn("Received message %s from LA %d (%s) shortly after\n",
> +				opcode2s(msg).c_str(), la, la2s(la));
> +			warn("replying Feature Abort [Unrecognized Opcode] to the same message.\n");
> +		}
> +	}
> +	else if (la_info[la].feature_aborted[opcode].count) {
> +		warn("Replying Feature Abort with abort reason different than [Unrecognized Opcode]\n");
> +		warn("to message that has previously been replied Feature Abort to with [Unrecognized Opcode].\n");
> +	}
> +	else
> +		la_info[la].feature_aborted[opcode].ts = ts_now;
> +
> +	cec_msg_reply_feature_abort(msg, reason);
> +	transmit(node, msg);
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
> +	bool is_bcast = cec_msg_is_broadcast(&msg);
> +
>  	switch (msg.msg[1]) {
>  
>  
> @@ -136,4 +168,9 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  	default:
>  		break;
>  	}
> +
> +	if (is_bcast)
> +		return;
> +
> +	reply_feature_abort(node, &msg);
>  }
> 

Regards,

	Hans
