Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4D4CFD84
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 17:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfJHPX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 11:23:57 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37871 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfJHPX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 11:23:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so18015321lje.4
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9PhGRTHKUAzIaL/vNNaww6tGN/3A8IsOHazogyKsOBc=;
        b=kEM8Ya+xMnJ7C1AdxxVrv+OQaABB93fiaJhHKmu0rO4RNufRC/oJsXPLAmkJowQcRi
         5TX0uN2WLlyB52lYARhk4xVw0eet36ZSE2I1e0fbr9epQ4FQaUl2uMRJUTkt1Bus3OId
         gPOSwIbPQjnN6rZi0aOLEVl0juMLditYR/hEGpQoMQxS1Q/5T3/hqlhWa97tJPr4oTDz
         VLKy2i2ZXHFkxSytlnz6iTv+LtF2MC7v+LLiCJGHQ9ZEW+u2CyL353toGSnrf5qK6+Aj
         u9ZufPZbNw5E6JK8gBqzJcG5lS+zrUM65xifSqPLqt/0ZVTc3G0cs474P9iFXO5PAR4g
         6y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9PhGRTHKUAzIaL/vNNaww6tGN/3A8IsOHazogyKsOBc=;
        b=LLaOlDrqRnIbxBrzR5qj+ClIBpLwWdZP5YLIkvW5rw9udMWzcMDFowiTvD+Q5+2W+V
         OW3n8kY5WQO27bUGnzrYrYINi822bHQ4+yj3I5UfSDwIucnE1715wes3dFrAc8twkuCy
         9IS5dFW6bvyOV2mqczr+3zu3rPV+XvqxUNAAf0guZBACZFZA+kL+WjvUGgJZSuE7W8YD
         5jVfG02KP2WwwIzZ7IRMfbZB2bvZs78twHA3StMJEYgpHzbFbT7jLsUuy3CHd2g5hCdp
         Dx7E/vSK7EUATmXQao6Xg6uvi+e+T4w7UsxCg/9z4fNX/1ZuNxxUW9DLyXCAh0nYT3xX
         7cVg==
X-Gm-Message-State: APjAAAU8GZa6bLHhJlW/ugLpcqYIR3UVgxqvbZ9BhhZ8X44W8SL4EnWY
        /rX0ka0NUZl9n+SC3aVyhpmWZg==
X-Google-Smtp-Source: APXvYqz3ggKqPyiA2FGjNYHksx8OpItrPrz80i0XifuVHL7u10A7plcbGnYL8FdI9bNCikl95sixAA==
X-Received: by 2002:a2e:3808:: with SMTP id f8mr22496807lja.7.1570548235734;
        Tue, 08 Oct 2019 08:23:55 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id b21sm3883262lff.96.2019.10.08.08.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:23:54 -0700 (PDT)
Subject: Re: [PATCH v2] media: venus: fix build on 32bit environments
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
References: <fe713104c8e1c218149013576e8e99f8563796bd.1570531619.git.mchehab+samsung@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3b7f9e98-8840-e43c-6a72-180ac10f7806@linaro.org>
Date:   Tue, 8 Oct 2019 18:23:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe713104c8e1c218149013576e8e99f8563796bd.1570531619.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro, thanks for the fix!

On 10/8/19 1:47 PM, Mauro Carvalho Chehab wrote:
> As reported by jenkins@linuxtv.org, the build with i386 fails
> with:
> 
> 	ld: drivers/media/platform/qcom/venus/helpers.o: in function `venus_helper_load_scale_clocks':
> 	(.text+0x1d77): undefined reference to `__udivdi3'
> 	ld: (.text+0x1dce): undefined reference to `__udivdi3'
> 	make: *** [Makefile:1094: vmlinux] Error 1
> 
> That's because it divides an u32 bit integer by a u64 one.
> 
> Fix it by explicitly callind do_div.

Please drop this line, it is not valid for v2.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5ea5d90f8e5f..a172f1ac0b35 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -520,10 +520,11 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>  					 unsigned long filled_len)
>  {
>  	unsigned long vpp_freq = 0, vsp_freq = 0;
> -	u64 fps = inst->fps;
> +	u32 fps = (u32)inst->fps;
>  	u32 mbs_per_sec;
>  
> -	mbs_per_sec = load_per_instance(inst) / inst->fps;
> +	mbs_per_sec = load_per_instance(inst) / fps;
> +
>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>  	/* 21 / 20 is overhead factor */
>  	vpp_freq += vpp_freq / 20;
> 

-- 
regards,
Stan
