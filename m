Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B273B083B
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 17:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhFVPJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 11:09:11 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52297 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232115AbhFVPJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 11:09:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id vhzDlkFlEhqltvhzGlLIOY; Tue, 22 Jun 2021 17:06:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624374410; bh=Elh58LQhMujcUlaXUhovFmAT82ONx3An1LzSnYifemk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jRx2sdRP4Os0mTjDj3hA/q7hTjSWqc3QsaE2OyXhwVew4UTZQdIXtef/yFrnL4fqU
         mYSkKgF1UXyR9s+OsubIQiGZbrJEbOpjrhqLJ88fuV2rlGoXk5vDVXvB6/AxATPE1h
         1sgUq3GqbAaDW8byeAOt9TwhEcpgUnNNf2+aEphy3PNwtckNO8L/O68E4vtVzoRfIy
         whhNg/aMuaIhIk4zAp3z/iDcfTh6NgTrmvy0ya+DslVDZXsgaFZRwZGl2eAqunGMV8
         1KgQeaKqrasDONl3+qPMh8m6eaylh8QxzPpnfGsnvw2DW2IW/MY7FK4jneO49p3gfo
         n6yGJUBayQN1Q==
Subject: Re: [PATCH v3 1/3] cec: expand One Touch Record TV Screen test
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
 <3f74cbad2c7ee68e7e07526428afa691a9d9a9e6.1624336366.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aa68cec6-ffce-7099-36c7-85d77d29661b@xs4all.nl>
Date:   Tue, 22 Jun 2021 17:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3f74cbad2c7ee68e7e07526428afa691a9d9a9e6.1624336366.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEYw7yDNMWZt4OahfBBLN9PTQCEoYFG0qh9avk5kF2fuIOUwN8/h3DzjK6pR0TzF3BiVbwhODO/FoDvE02BCz0JX1T6PnELD2h3K3uNDm6ECSeaEd+Ox
 CDCTmJcIBPsMJUPvIJohHPbHx0zvrbIbrArQl38jPRPw1ZBfF7YMMopcR8eVu6rTps9gu7NrMb1sg/prqxIw85HdQl1pIQyYOaIL32GzeVb2CtOySjdKZmA9
 l7cxUh6eXWg+MgKWk9F/Jwf1lcvcVIZe7wUPH0ky4qs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/06/2021 06:35, Deborah Brouwer wrote:
> Check that the follower ignores the Record TV Screen message if the
> initiator has a logical address other than Record or Backup (aka Reserved
> in CEC Version < 2.0). If the follower replies correctly, check that the
> source operand is valid.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 54 ++++++++++++++++++++++++++-----
>  utils/cec-follower/cec-tuner.cpp  |  9 ++++--
>  2 files changed, 52 insertions(+), 11 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 40d8369d..2ea1b712 100644
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
> @@ -1172,8 +1165,53 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
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
> +	if (rec_src.type < CEC_OP_RECORD_SRC_OWN || rec_src.type > CEC_OP_RECORD_SRC_EXT_PHYS_ADDR)
> +		return fail("Invalid source.\n");
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL &&
> +	    rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +

No need for this empty line.

> +		switch (rec_src.digital.dig_bcast_system) {
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
> +			return fail("Invalid digital service broadcast system operand.\n");
> +		}
> +	}
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_ANALOG) {
> +		fail_on_test(rec_src.analog.ana_bcast_type > CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL);
> +		fail_on_test(rec_src.analog.bcast_system > CEC_OP_BCAST_SYSTEM_PAL_DK &&
> +		             rec_src.analog.bcast_system != CEC_OP_BCAST_SYSTEM_OTHER);

You can also check the analog frequency here: corner cases 0x0000 and 0xffff are invalid.

> +	}

For CEC_OP_RECORD_SRC_EXT_PLUG you can check against the invalid value 0x00.

Regards,

	Hans

> +
> +	return OK;
>  }
>  
>  static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index b9c21684..fd11bd10 100644
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
> @@ -594,6 +591,12 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		if (!node->has_rec_tv)
>  			break;
>  
> +		__u8 la = cec_msg_initiator(&msg);
> +
> +		/* Ignore if initiator is not Record or Backup (aka "Reserved" in CEC Version < 2.0) */
> +		if (!cec_has_record(1 << la) && !cec_has_backup(1 << la))
> +			return;
> +
>  		struct cec_op_record_src rec_src = {};
>  
>  		rec_src.type = CEC_OP_RECORD_SRC_OWN;
> 

