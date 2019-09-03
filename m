Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CD5A6AFD
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 16:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbfICOPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 10:15:05 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45320 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbfICOPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 10:15:05 -0400
Received: by mail-io1-f68.google.com with SMTP id f12so18734322iog.12
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=WRmI+51FDFrxXWrOkxDwycBzKA/gfUMnJYhxNAs8Ycs=;
        b=D2UzLQuGCcdqSovCjLsJkwshTqKAyDwEiwM0vw2ANL4umoQxooEvoEdbBFWwUZybAY
         yVT1mcky7A7OoxScuDoops40mEq0eA//Owexu3E5dBN69kOkyt3iNCkY3rh53TR46Jp+
         3m3ehdO3nq/xgJMTPm53q89TJacwe3ukzcnlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WRmI+51FDFrxXWrOkxDwycBzKA/gfUMnJYhxNAs8Ycs=;
        b=Ur13CZy+qor2+bzWSSZIPgrtl9twlP8d8B5X9l0cBwse8qWC/HjDWqgUjzbNRHfbEO
         AJrPVrrLtA037OlQAUfxWXVutRTg+Qdsu77nAT3ZQ6LHkl7pHTS63uuIQBvKZchH4yht
         KPb88rYqi6nJ1ZfV0S/yvNkfD43ENXvYSZ/Qe6cU6CJSuq8weCdFKtQOz68vPI8Q+GLP
         2W5ZgBFaY5b1kYygR2dADSKJAKsqr744BxdHxv20cASmA619WEK6H0cim+xs77gC0hbF
         JqN7CM4/jnusHeXxP6k6xEJ579M9dkHQ0GZ8ruV6SS69NHboUouABrXsBNL3rmt7s1Kk
         bycw==
X-Gm-Message-State: APjAAAWsFiEuGUhf71EIlggVtikN8PgiJGkgybotJ09MAUNKXRd88Dtf
        ou0jwPwzbSKoNY21BHIHTyvWfg==
X-Google-Smtp-Source: APXvYqyo/cRzaUvUBsfM0hyCtDRSzBkXbQzz5FnhU15n8sxICqejZighc3YLlEO1nWAyJatfM4wLcA==
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr123677iof.5.1567520104173;
        Tue, 03 Sep 2019 07:15:04 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q17sm4850922ioh.75.2019.09.03.07.15.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 07:15:03 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH v2] cec-compliance: system audio
 control tests
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190902093346.20041-1-c0d1n61at3@gmail.com>
 <20190902165920.17812-1-c0d1n61at3@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <becde334-cc07-7ecd-3cc3-729b1af56af8@linuxfoundation.org>
Date:   Tue, 3 Sep 2019 08:15:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902165920.17812-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/2/19 10:59 AM, Jiunn Chang wrote:
> Add user control press operands:
>   - Mute Function
>   - Restore Volume Function
> 

Please add more details to the commit message. It would be helpful
to know more about the features that are getting added.

> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
> 
> Changes made since v2:

I assume you meant since v1?

>   - change node->state.mute to boolean
> 
>> 8---------------------------------------------------------------------------8<
> 
>   utils/cec-compliance/cec-test-audio.cpp | 32 +++++++++++++++++++++++++
>   utils/cec-follower/cec-processing.cpp   |  6 +++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 8611350e..872bb9ad 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -673,6 +673,32 @@ static int sac_user_control_press_mute(struct node *node, unsigned me, unsigned
>   	return 0;
>   }
>   
> +static int sac_user_control_press_mute_function(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	__u8 ret;
> +
> +	if ((ret = sac_util_send_user_control_press(node, me, la, 0x65)))

Would it help to add a define for 0x65 - same comment on other uses
such as 0x66

> +		return ret;
> +	fail_on_test_v2(node->remote[la].cec_version,
> +			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
> +			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_ON);
> +
> +	return 0;
> +}
> +
> +static int sac_user_control_press_restore_volume_function(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	__u8 ret;
> +
> +	if ((ret = sac_util_send_user_control_press(node, me, la, 0x66)))

Same here?

> +		return ret;
> +	fail_on_test_v2(node->remote[la].cec_version,
> +			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
> +			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_OFF);
> +
> +	return 0;
> +}
> +
>   static int sac_user_control_release(struct node *node, unsigned me, unsigned la, bool interactive)
>   {
>   	struct cec_msg msg = {};
> @@ -763,6 +789,12 @@ struct remote_subtest sac_subtests[] = {
>   	{ "User Control Pressed (Mute)",
>   	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>   	  sac_user_control_press_mute },
> +	{ "User Control Pressed (Restore Volume Function)",
> +	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +	  sac_user_control_press_restore_volume_function },
> +	{ "User Control Pressed (Mute Function)",
> +	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +	  sac_user_control_press_mute_function },
>   	{ "User Control Released",
>   	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>   	  sac_user_control_release },
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 27172560..a38f664b 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -516,6 +516,12 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>   		case 0x43:
>   			node->state.mute = !node->state.mute;
>   			break;

Looks like this is existing usage. Still it would make sense to add
a define for these as self documenting.

> +		case 0x65:
> +			node->state.mute = true;
> +			break;
> +		case 0x66:
> +			node->state.mute = false;
> +			break;
>   		case 0x6B:
>   			if (!enter_standby(node))
>   				exit_standby(node);
> 

thanks,
-- Shuah
