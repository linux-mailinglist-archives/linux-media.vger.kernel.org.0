Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 574AF78AAB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 13:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387645AbfG2Lia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 07:38:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34942 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbfG2Lia (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 07:38:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id x25so58319883ljh.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xk5sDImFAW53ku5zPrNSNKzA4D6EyzpMXW4in0cztWM=;
        b=UnnTckmqXi6dtRJI9TtME6/cOTOcSTuagOIEvn4oN/YeXXjr5tMv5ApU90sSRCjsqx
         g5/P0yo7sMTWflAbYRhLb7bjzwJskohzcBQdkL82fHU/R1UKJrfOjyn0P1K0qqB9ECdk
         8IwoGlQyAc80cZy4Z7FZIy9MWsJNwPxOswu/lfTO4iep56sONTC0VlTL6yUAprVJL/xh
         TB5m9+Rh/larF/cef6tPOz8IzzsSuOvTkYMiBGqMWJzZQV3EGXlN3rz40NtxYVVjFNwI
         QS42vLzUOOqg1gz/qivvEXjngOePSIfS7ac9GWJ7di18Vu299bueL05K5EQu2IPkeYaO
         pAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xk5sDImFAW53ku5zPrNSNKzA4D6EyzpMXW4in0cztWM=;
        b=pMb8P43mGEZhpqalitp2eCGPWVSwmLOLIW+5h6o5SY0PqtqiHZBph9hk7n/4Gy2CL4
         bTZfdEhbzuoucWZOkix/IShn98OkTb5sDcagXvRvdmN49CkjZDWesJwn7FLNZtOTpNdX
         uwLUPs4GuF+nhoprV0+K+WLWYIDX0X1+vuU1TeBvT0+vKVGgvAALxB7OF3xw9Bji7ByC
         AzKquYfz6xQTlGXbNsDs6HQovMs/kxXfBgsLRS1l01gN9SCUSs7Soan/7gICPQ+41jwI
         GKM/WnJvdouo0h4ISDMalILa01He3PI1xULfSCw+j5jDAn1mtJE//9EnwF8Y0w4r9rvJ
         hUhw==
X-Gm-Message-State: APjAAAXhlgDDTu8V50Lo65gAWKxwfEHSaoWe+v57JPbJqAdFQl99w+NV
        HPm1DDMbwva/AdieKjQSaZS/cRu3YaVk9g==
X-Google-Smtp-Source: APXvYqxNUBeruTZFEiy3HdGgth8M3XFHuGw1Wi0lvd8yms4gJBEi00iudCF1A+C/YpnaL5sgIlzSSw==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr58208530ljk.29.1564400308785;
        Mon, 29 Jul 2019 04:38:28 -0700 (PDT)
Received: from [192.168.28.50] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id v14sm12759730ljh.51.2019.07.29.04.38.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 04:38:28 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] media: venus: Update to bitrate based clock
 scaling
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-3-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <cdfde490-8d02-c9a1-5fbd-9ae001692f55@linaro.org>
Date:   Mon, 29 Jul 2019 14:38:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563786452-22188-3-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/22/19 12:07 PM, Aniket Masule wrote:
> Introduced clock scaling using bitrate, preavious
> calculations consider only the cycles per mb.
> Also, clock scaling is now triggered before every
> buffer being queued to the device. This helps in
> deciding precise clock cycles required.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 33 +++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 2c976e4..edf403d 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -399,17 +399,26 @@ static int scale_clocks(struct venus_inst *inst)
>  	return ret;
>  }
>  
> -static unsigned long calculate_vpp_freq(struct venus_inst *inst)
> +static unsigned long calculate_inst_freq(struct venus_inst *inst,
> +					 unsigned long filled_len)
>  {
> -	unsigned long vpp_freq = 0;
> +	unsigned long vpp_freq = 0, vsp_freq = 0;
> +	u64 fps = inst->fps;
>  	u32 mbs_per_sec;
>  
>  	mbs_per_sec = load_per_instance(inst);
>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>  	/* 21 / 20 is overhead factor */
>  	vpp_freq += vpp_freq / 20;
> +	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
>  
> -	return vpp_freq;
> +	/* 10 / 7 is overhead factor */
> +	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
> +		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
> +	else
> +		vsp_freq += ((fps * filled_len * 8) * 10) / 7;

load_per_instance() already taken into account fps, thus I think fps
should be excluded from calculation.

> +
> +	return max(vpp_freq, vsp_freq);
>  }
>  


-- 
regards,
Stan
