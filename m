Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F0BBD2AB
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 21:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410124AbfIXTbD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 15:31:03 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44422 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410069AbfIXTbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 15:31:03 -0400
Received: by mail-io1-f65.google.com with SMTP id j4so7289172iog.11
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=HL7o0lDPhIHZpmiJHep0DgKHyoxRowhT+vDjYRSXreU=;
        b=NYhdlFfG3UOzC34U+3KVC0ETtdQaqf312ex03AyBhsmyH5lWzspsiR61EN1foLP5lF
         r+TMsnN4/jhR5qHAiqDCcqfyNVvFtbiifKSfFylTmOS4Q6fOnkYH+7FQM8YUU5SUHypB
         zpUNyjiZk9dExPC1JETUgkWeXEWpmR83lusQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HL7o0lDPhIHZpmiJHep0DgKHyoxRowhT+vDjYRSXreU=;
        b=dI6yZQ+Cc1qQDPVDBZNr65A0OLo6dKryluSJpnhgUQFtqUY6j2x2GE3tdOgG1iuUbF
         L15zw1oTnxOX8K+enAIKgO1mCIgP+6zptE/LMnSI7m8FBHNVgqfCbBAeoxZG0tPd+TBs
         /dOdJmmBDO8OSngJdEVvSs0HyGksapEuxLzbdRxzATUUgzpzmaeGdHAJ7AFHgB2Ysk47
         6HjhF/n2O5gFx3r50275tTlITQ1OuOximYvZlOl2QrfVG+a3CZYcLgWz0XqFswJyvN06
         brUIQSGVi00HsbM18PvKJMT+w3UNS/UdJFR5jpPDWvBtgt519m5BwQ4/3rwe7zlv0VgY
         ELDQ==
X-Gm-Message-State: APjAAAVUOpUJiBqXnfQuwa6pa0LN11y1U8dF9/gImJFDxe3Ey0ePGbkF
        I9a1VyMn69KGa9Yj7IhnYDA1Ug==
X-Google-Smtp-Source: APXvYqywTKRNmhOBzf3gmU97ih5noQDeItBag4FnA5fI9MTrN9n3kR9VL+RBH3/qK6tegCJKVUz+hw==
X-Received: by 2002:a02:7b1e:: with SMTP id q30mr503181jac.144.1569353462316;
        Tue, 24 Sep 2019 12:31:02 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c11sm2595096ioi.67.2019.09.24.12.31.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 12:31:01 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/2] cec-follower: add tuner
 step increment/decrement
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
 <20190924192445.93575-2-c0d1n61at3@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b4f306f6-3d9b-85bf-3842-a23da59299f4@linuxfoundation.org>
Date:   Tue, 24 Sep 2019 13:31:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924192445.93575-2-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/24/19 1:24 PM, Jiunn Chang wrote:
> Tuner step increment/decrement will select the next highest or next
> lowest service frequency.  There are a total of three possible
> frequencies from analog_freqs_khz given a broadcast type and system.
> 
> Opcodes implemented:
>    - <Tuner Step Increment>
>    - <Tuner Step Decrement>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>   utils/cec-follower/cec-tuner.cpp | 47 ++++++++++++++++++++++++++++++--
>   1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index acc3fd00..1a9b9d90 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -135,6 +135,22 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>   	return false;
>   }
>   
> +static int analog_find_freq_index(struct cec_op_tuner_device_info *info)
> +{
> +	if (info->analog.ana_freq == 0)
> +		return -1;
> +
> +	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
> +
> +	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
> +		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
> +
> +		if (ana_freq_khz == freq)
> +			return i;
> +	}
> +	return -1;
> +}
> +
>   void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>   {
>   	bool is_bcast = cec_msg_is_broadcast(&msg);
> @@ -178,12 +194,37 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>   		return;
>   
>   	case CEC_MSG_SELECT_DIGITAL_SERVICE:
> -	case CEC_MSG_TUNER_STEP_DECREMENT:
> -	case CEC_MSG_TUNER_STEP_INCREMENT:
> -		if (!cec_has_tuner(1 << me))
> +	case CEC_MSG_TUNER_STEP_DECREMENT: {
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>   			break;
> +
> +		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +		int freq_idx = analog_find_freq_index(info);
> +		int idx = (freq_idx == 0) ? NUM_ANALOG_FREQS : freq_idx;
> +
> +		if (info->is_analog) {
> +			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][--idx];
> +

Do you need this extra line.

> +			info->analog.ana_freq = (freq * 10) / 625;
> +		}
>   		return;
> +	}
> +
> +	case CEC_MSG_TUNER_STEP_INCREMENT: {
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
>   
> +		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +		int freq_idx = analog_find_freq_index(info);
> +		int idx = (freq_idx == NUM_ANALOG_FREQS - 1) ? -1 : freq_idx;
> +
> +		if (info->is_analog) {
> +			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][++idx];
> +
Do you need this extra line.

> +			info->analog.ana_freq = (freq * 10) / 625;
> +		}
> +		return;
> +	}
>   
>   		/*
>   		  One Touch Record
> 

thanks,
-- Shuah
