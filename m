Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BFF3AC52A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 09:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhFRHqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 03:46:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40209 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229522AbhFRHqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 03:46:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id u9ArltW7lhg8Zu9AulVdFQ; Fri, 18 Jun 2021 09:44:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624002264; bh=WGmyb3y39hTvXUNYzhPB7bDqry0zzCAchvGJBEYKH+Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c6Yx78MiWWd4Fjv08H7lv7KFxZ53cHht5F79hYy2yRvZlYqbqLJPoTCvB7yob8fGU
         8zjf5hJxqtrWwlQAzgGnBeYJ89H38gmOj1HGpBRtm1rLl4i9irJZoQTO7t5hBCiyn0
         Tba25DfOwvisOWOJAtp+7aACBSsA5AiokWXbbxkbvGfk+ob0KPjJNGZkumICnyCXjb
         Sz/0NMI3yVv8DhSDIsqDj/aM8xov7obyndlr4rIcd7btJvrmorJAyzn7HKnWQMqz5Z
         bkfc0jCSXr2siXtEuPuGeKP9w0k9Z6jGxwth8l4cT1509PblSGzMeIA4BLis+ibN4V
         b58m3XHm1f3nw==
Subject: Re: [PATCH v2 1/2] cec: expand One Touch Record TV Screen test
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
 <33ad72ef20383b4a86526c511696ed0838afa10b.1623972511.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <43c185e4-e3ae-13f3-6a31-ef7098fe8b70@xs4all.nl>
Date:   Fri, 18 Jun 2021 09:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <33ad72ef20383b4a86526c511696ed0838afa10b.1623972511.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHxwPvgL1JsDBpplfSdddBiEFEKjIRr4eF78oiDwKzfYfLw8CsLYmMAKI9uPJehqN9IAwXsfDpb9cTX+Fp7odrJqi2FK5lJy8LC1A70Ue9HoVgzlG3BI
 N42IBCkBUjp9XWOyzuuuMkX9AIpVLILSeJqwqlKJ8HXyniQpCaFEyX/hlXaQYcpz461iMg1ZQKzs07eQT6zNyVkUvgRgwilFi5QO+h3lLGXCo7CinwNoiktl
 jygy453mQz5pXJnAEiPwU+HoAkmRvVhp2NeV+sV/5m4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/06/2021 01:41, Deborah Brouwer wrote:
> Check that the follower ignores the Record TV Screen message if the
> initiator has a logical address other than Record or Backup (aka Reserved
> in CEC Version < 2.0). If the follower replies correctly, check that the
> source operand is valid.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 53 ++++++++++++++++++++++++++-----
>  utils/cec-follower/cec-tuner.cpp  |  9 ++++--
>  2 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 40d8369d..0051d72a 100644
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
> @@ -1172,8 +1165,52 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
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

Don't use the numbers, use the corresponding defines (CEC_OP_RECORD_SRC_OWN and
CEC_OP_RECORD_SRC_EXT_PHYS_ADDR).

> +		return fail("Invalid source.\n");
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL &&
> +	    rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +
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
> +		fail_on_test(rec_src.analog.ana_bcast_type > 2);

Ditto here...

> +		fail_on_test(rec_src.analog.bcast_system > 8 && rec_src.analog.bcast_system != 0x1f);

...and here.

Regards,

	Hans

> +	}
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

