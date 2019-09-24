Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2A2BD2F7
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 21:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394292AbfIXTo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 15:44:58 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40851 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfIXTo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 15:44:58 -0400
Received: by mail-io1-f65.google.com with SMTP id h144so7423496iof.7
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=y05qtsQSd0FLKD2nAjFDjMQzmuI0OhPHfqCk79BQ3Mc=;
        b=hLzGT/3lOVup7dLwxmfyWHEfjMy2tSateo/6ftouZzEpMRTKSbH5yM/9+RZ9CQLbYY
         /EELKaeEY6BbYNPGFzIfkpSjZzWlw64Egwrw8LD8N6jmrL5wSwJF/4iZdeGL86/GG8D9
         6BpQ3LCJAasA+ndFGCHcAcoCAnH3sIdSRDyU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y05qtsQSd0FLKD2nAjFDjMQzmuI0OhPHfqCk79BQ3Mc=;
        b=io/xjLZUT3b2TV+mQu7Hg9wFUn86RdnxDIF4Y9gcxSlReXxKvqselfnZaRhZtU31ID
         jgeMHbOOqrLk0ZmbC8F78MjEA/6L7pIzxyK7r4E4/EPiOR+FVgRbFC5rGlKUvIL8vN8d
         d3LxPjfa5OjpwFvKG7tvgq4xser/Egs41HwD0OM5fCgRDg+r9duxchcQ4A05z7Zn7rF9
         euqVL9rZDDvZzIbcRZGUx1r2XcCiu+UomFIdMCarPsC3f9k3Jesd+ID1xgeW0V/UeaHI
         GGdElNu4mbx+fyLl2+TgiMpcz/SQh766z9+ztbGUEMmp/03UZHdrEfAvq9NoEwG0f+pb
         uavQ==
X-Gm-Message-State: APjAAAWHiyh7oTcHaQj6inS0BP2tFMiJDfP9J7Fu6GGYHcz4C5/nVvRW
        O+b0PrntDGV++bK7iqJmA9DxYw==
X-Google-Smtp-Source: APXvYqzPI+hkd7K6JuFMalKO3wwTY9pjHkS7h/tgDHlbMTqziXxRpjxflLDiXodQBAO+AFExLyPQ9Q==
X-Received: by 2002:a02:2b2e:: with SMTP id h46mr543533jaa.141.1569354296923;
        Tue, 24 Sep 2019 12:44:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l3sm2659058ioj.7.2019.09.24.12.44.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 12:44:56 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] cec-compliance:
 add/refactor tuner control tests
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
 <20190924192445.93575-3-c0d1n61at3@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d8e866e5-fca2-eed7-5b2f-38bfca380d81@linuxfoundation.org>
Date:   Tue, 24 Sep 2019 13:44:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924192445.93575-3-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/24/19 1:24 PM, Jiunn Chang wrote:
> Tests added/refactored for new features added to the cec-follower.
> 
> Analog tuner control tests added/refactored:
>    - give analog tuner status
>    - select tuner analog service
>    - analog tuner step decrement
>    - analog tuner step increment
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>   utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
>   1 file changed, 140 insertions(+), 41 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index aece546c..91600d39 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -722,9 +722,19 @@ static struct remote_subtest deck_ctl_subtests[] = {
>     TODO: These are very rudimentary tests which should be expanded.
>    */
>   
> -static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +			                7668, CEC_OP_BCAST_SYSTEM_PAL_BG); // 479.25 MHz analog frequency
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return NOTSUPPORTED;
> +	if (refused(&msg))
> +		return REFUSED;
>   
>   	cec_msg_init(&msg, me, la);
>   	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> @@ -737,6 +747,14 @@ static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bo
>   	if (cec_msg_status_is_abort(&msg))
>   		return PRESUMED_OK;
>   
> +	cec_ops_tuner_device_status(&msg, &info);
> +	if (info.analog.ana_bcast_type != CEC_OP_ANA_BCAST_TYPE_CABLE)
> +		return FAIL;
> +	if (info.analog.ana_freq != 7668)
> +		return FAIL;
> +	if (info.analog.bcast_system != CEC_OP_BCAST_SYSTEM_PAL_BG)
> +		return FAIL;
> +

Why not combine these conditionals in to one. Why do you need 3 separate
blocks?

>   	return 0;
>   }
>   
> @@ -745,23 +763,24 @@ static int tuner_ctl_sel_analog_service(struct node *node, unsigned me, unsigned
>   	struct cec_msg msg = {};
>   
>   	node->remote[la].bcast_sys = ~0;
> -	for (unsigned sys = 0; sys <= 8; sys++) {
> -		cec_msg_init(&msg, me, la);
> -		cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
> -						7668, sys); // 479.25 MHz analog frequency
> -		fail_on_test(!transmit_timeout(node, &msg));
> -		if (unrecognized_op(&msg))
> -			return NOTSUPPORTED;
> -		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
> -			info("Tuner supports %s, but cannot select that service.\n",
> -			     bcast_system2s(sys));
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 7668, sys); // 479.25 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));

Adding line here will help readability.

> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Same here.

> +			if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
> +				info("Tuner supports %s, but cannot select that service.\n",
> +				bcast_system2s(sys));
> +				node->remote[la].bcast_sys = sys;
> +				continue;
> +			}
same here.

> +			if (cec_msg_status_is_abort(&msg))
> +				continue;
> +			info("Tuner supports %s\n", bcast_system2s(sys));
>   			node->remote[la].bcast_sys = sys;
> -			continue;
>   		}
> -		if (cec_msg_status_is_abort(&msg))
> -			continue;
> -		info("Tuner supports %s\n", bcast_system2s(sys));
> -		node->remote[la].bcast_sys = sys;
>   	}
>   
>   	if (node->remote[la].bcast_sys == (__u8)~0)
> @@ -854,43 +873,123 @@ static int tuner_ctl_tuner_dev_status(struct node *node, unsigned me, unsigned l
>   	return 0;
>   }
>   
> -static int tuner_ctl_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 freq = 0;
> +
> +	info.is_analog = true;
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 16000, sys); // 1000 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Add a goto NOTSUPPORTED; Makes it easier.
You can simplify this logic a lot.

> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			freq = info.analog.ana_freq;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_tuner_step_decrement(&msg);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			if (cec_msg_status_is_abort(&msg))
> +				return PRESUMED_OK;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			if (!(info.analog.ana_freq < freq))
> +				return FAIL;
> +		}
> +	}
>   
> -	cec_msg_init(&msg, me, la);
> -	cec_msg_tuner_step_decrement(&msg);
> -	fail_on_test(!transmit_timeout(node, &msg));
> -	if (unrecognized_op(&msg))
> -		return NOTSUPPORTED;
> -	if (refused(&msg))
> -		return REFUSED;
> -
> -	return PRESUMED_OK;
> +	return 0;
>   }
>   
> -static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 freq = 0;
> +
> +	info.is_analog = true;
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 0, sys); // 0 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Adding blank lines will improve readability.

> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			freq = info.analog.ana_freq;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_tuner_step_increment(&msg);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;

Same here.

> +			if (refused(&msg))
> +				return REFUSED;
> +			if (cec_msg_status_is_abort(&msg))
> +				return PRESUMED_OK;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			if (!(info.analog.ana_freq > freq))
> +				return FAIL;
> +		}
> +	}
>  
> -	cec_msg_init(&msg, me, la);
> -	cec_msg_tuner_step_increment(&msg);
> -	fail_on_test(!transmit_timeout(node, &msg));
> -	if (unrecognized_op(&msg))
> -		return NOTSUPPORTED;
> -	if (refused(&msg))
> -		return REFUSED;
> -
> -	return PRESUMED_OK;
> +	return 0;
>   }

tuner_ctl_analog_step_inc() and tuner_ctl_analog_step_dec() has lots of
common code. The only real difference is calls to 
cec_msg_tuner_step_increment() vs. cec_msg_tuner_step_decrement()

Also the error logic is very hard to read.

>   
>   static struct remote_subtest tuner_ctl_subtests[] = {
> -	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
> -	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
> -	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
> +	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_give_status },
> +	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_analog_service },
> +	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_digital_service },
>   	{ "Tuner Device Status", CEC_LOG_ADDR_MASK_ALL, tuner_ctl_tuner_dev_status },
> -	{ "Tuner Step Decrement", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_dec },
> -	{ "Tuner Step Increment", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_inc },
> +	{ "Tuner Analog Step Decrement", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_dec },
> +	{ "Tuner Analog Step Increment", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_inc },
>   };
>   
>   
> 

thanks,
-- Shuah
