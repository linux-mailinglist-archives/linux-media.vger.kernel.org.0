Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A166A3AB530
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhFQNwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 09:52:46 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46591 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231299AbhFQNwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 09:52:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id tsPhlpNp6hg8ZtsPklU40Z; Thu, 17 Jun 2021 15:50:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623937837; bh=q/A2heqTi3JscwwjL1fkzroUJCD29lgmjY7z756RGMM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=u2zYkiX+NqQkNQz7AcQ0OpiUxQ2lmRih7A+K7JvTgzV2WbKTOxWahZCf4nA7MmDeC
         dxMW0s3uPWXFHQ4CnC1ZrBY/Jk0DRCh62RTsmCGXJ0tOijGGU1UfJos8BY0PsO50ua
         LVJApQux+R7dEQPdcJ0B5/b8MsFNFbgqmO7buYFc4EXoNBSh5PjuJxvQSN+q9ik2WW
         A97S4nZBINsH9/F5qd+qDPje/9+ICSb8cbhqnEuJsu3vg/P1eWZeSqZ1Xc3wqVid+8
         xYi2d5xF98PU5HZ7m/wousdDakKmx2wMf9zAUKxvc8HSkTLI5dutG1pSk7pQFMadSm
         3n8NTbMjO2e4w==
Subject: Re: [PATCH] cec: expand One Touch Record TV Screen test
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <20210617132152.5247-1-deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a3d2924b-f8a7-9191-93d3-ada8abced276@xs4all.nl>
Date:   Thu, 17 Jun 2021 15:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617132152.5247-1-deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPI818al+GWbicrBVsEQXvaN9S9CVCBozm9wOTUgQYAe5fJ0DAYuCbT6AObDWb0KuzISX/4EaLCFJLo4R4+jA/lB8viD/4vId7qTJnB7/yo8KGQ6VCvD
 mhqYDaQztcBQjX5RNkrB4iUyQ/KTmr6yEtlvl1b9W55IZ2PHXfDNtqMJqvG905EDByvtFWyayhnQcvyibn6yPcAd6yhBud0xY4cH7kQHGSbdEARwxEA6GTm2
 F4gf6ouv+1h4Y0xTiqu2F+ynjFwo+G0vCeNuG3JNZe4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some small comments below:

On 17/06/2021 15:21, Deborah Brouwer wrote:
> Check that the follower ignores the Record TV Screen message if the
> initiator has a logical address other than Record or Backup (aka Reserved
> in CEC Version < 2.0). If the follower replies correctly, check that the
> source operand is valid.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 48 +++++++++++++++++++++++++------
>  utils/cec-follower/cec-tuner.cpp  |  8 ++++--
>  2 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 40d8369d..9512f319 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -1150,13 +1150,6 @@ static const vec_remote_subtests tuner_ctl_subtests{
>  
>  static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/*
> -	  TODO:
> -	  - Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
> -	    checked for.
> -	  - The TV should ignore this message when received from other LA than Recording or
> -	    Reserved.
> -	 */
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> @@ -1172,8 +1165,47 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	/*
> +	 * Follower should ignore this message if initiator has a logical
> +	 * address other than Record or Backup (aka "Reserved" in CEC Version < 2.0).
> +	 */
> +	if (!cec_has_record(1 << me) && !cec_has_backup(1 << me)) {
> +		fail_on_test(!timed_out(&msg));
> +		return OK;
> +	}
> +	fail_on_test(timed_out(&msg));
>  
> -	return 0;
> +	struct cec_op_record_src rec_src = {};
> +
> +	cec_ops_record_on(&msg, &rec_src);
> +
> +	if (rec_src.type < 1 || rec_src.type > 5)
> +		fail("Invalid source.\n");
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL &&
> +	    rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +
> +		switch(rec_src.digital.dig_bcast_system) {

Add space after 'switch'.

> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
> +			break;
> +		default:
> +			fail("Invalid digital service broadcast system operand.\n");

Add break. It is good practice to always add a break, even if it is the last
case of a switch. Someone just might add another case after this in the future,
and suddenly the case above (default:) would fall-through unexpectedly.

> +		}
> +	}
> +
> +	return OK;
>  }
>  
>  static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index b9c21684..edf5016b 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -583,9 +583,6 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		  This is only a basic implementation.
>  
>  		  TODO:
> -		  - If we are a TV, we should only send Record On if the
> -		    remote end is a Recording device or Reserved. Otherwise ignore.
> -
>  		  - Device state should reflect whether we are recording, etc. In
>  		    recording mode we should ignore Standby messages.
>  		*/
> @@ -594,6 +591,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		if (!node->has_rec_tv)
>  			break;
>  
> +		__u8 la = cec_msg_initiator(&msg);
> +
> +		if (!cec_has_record(1 << la) && !cec_has_backup(1 << la))
> +			return;

Add a comment before the if explaining why we check this. Basically copy the
TODO bit that you removed and add it as a comment :-)

Regards,

	Hans

> +
>  		struct cec_op_record_src rec_src = {};
>  
>  		rec_src.type = CEC_OP_RECORD_SRC_OWN;
> 

