Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E67324BA0
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 09:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBYH5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 02:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhBYH5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 02:57:50 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC03C06174A
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 23:57:10 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id n4so2538620wmq.3
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 23:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l+5iV5n0qHwjkMtgJqVQPPvPdtwWHOlD3QMo3oFzzWQ=;
        b=zYuXNEYUSXufkFZf5h8jBfqPNEgpvAQAyPno43ytP/QEU+k7f6HdgTgXOoUCg6wiq0
         vJg3Vsm8xyY31CqmzHQZZQ00Kt5Hs1jRP6Xu5EIrsqBCn2+wDA2rmopT+zP/AQNVOq2o
         IvCGLWJJSOCzlTHAb5wvLxayWfYFM68LALpTnLC8hp59wz7G2qNlPxnwQZ56JwHYXz6s
         LhbynJqQfrJrtH18xl5gzSL55KGyJUXgDIls386KKuf4N4PcKsKnlpt9/ubkokhT+Pc4
         2cHA5bEj0mkvSJ+ht6aZgSBRainznNp+b0I6akYJ+vWtDPWsMYyB++pn8K62fzlKV4yF
         cA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l+5iV5n0qHwjkMtgJqVQPPvPdtwWHOlD3QMo3oFzzWQ=;
        b=PE5mMnxIQ3uyrNg1dR4nojbpXWmjVXE063+sSqmIdw5/d8Cf+zj6JeqmI7heS/1Gdr
         vmZA3HxXrMMTBP+efRYIOKtucthLlCTghYiIgFJxTpaiR28TPS53rUuCJxuvWpw9wc9d
         o2M6ixkJBOcEBM4zTg8WQKnITIyBAeqF4WeQvNyZlVfGUjulWK0B0J+gP1zCKu2oU0Wh
         tOl9WXsOjb48rqaxs6CY8eL0J87Bod405K9Po7elbgrxPXsCsUIHsC5aFejNDGkjjnN0
         1Ckd33FsODilucgN+RxlUsMoZnyErYJQ3+oNyghRXr/Cj2WrhsfkWa/yZs7UDMlvYYzy
         3yFg==
X-Gm-Message-State: AOAM531n3a+3+mDE4NyxqZlzVVA0pfGD39hpfwK4R0nn3Bbu/oJySHFd
        Ih6IIShQIc6tT3ssxoEZCeaBGA==
X-Google-Smtp-Source: ABdhPJyVgTf+jGac9xNd9sLePhqDjQa/zV2y+TNey6wHydE8at9QTVIvwr4K+pzG3pkwG6zGxggdIw==
X-Received: by 2002:a05:600c:2cc5:: with SMTP id l5mr1871648wmc.108.1614239828765;
        Wed, 24 Feb 2021 23:57:08 -0800 (PST)
Received: from [192.168.0.4] (hst-221-11.medicom.bg. [84.238.221.11])
        by smtp.googlemail.com with ESMTPSA id a131sm6689498wmc.48.2021.02.24.23.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 23:57:08 -0800 (PST)
Subject: Re: [PATCH 21/25] media: venus: helpers: Add internal buffer list for
 v6
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-22-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0f756d2c-ea7b-2d46-0cc9-d3d6bc66d6f5@linaro.org>
Date:   Thu, 25 Feb 2021 09:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-22-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> - Internal buffers required by v6 are different than v4,
>   add new list of internal buffers for v6.
> - Differentiate encoder/decoder buffers for 6xx
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c   | 23 ++++++++++++++++++-
>  .../media/platform/qcom/venus/hfi_helper.h    |  9 +++++---
>  2 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 2515a2225614..f0413236a56f 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -279,13 +279,34 @@ static const unsigned int intbuf_types_4xx[] = {
>  	HFI_BUFFER_INTERNAL_PERSIST_1,
>  };
>  
> +static const unsigned int intbuf_types_6xx_enc[] = {
> +	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_SCRATCH_2(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_PERSIST,
> +};
> +
> +static const unsigned int intbuf_types_6xx_dec[] = {
> +	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_PERSIST_1,
> +};
> +

This division of decoder and encoder internal buffers smells like a
problem in hfi_plat_bufs_v6.c. I think we can modify the extracting of
buffer requirements in hfi_plat_bufs_v6.c so that they return
buffer_size as zero for internal buffer types which are not applicable
to the current session type. After this this intbuf_type_6xx will
combine both session types and will look like v1 and v4.

>  int venus_helper_intbufs_alloc(struct venus_inst *inst)
>  {
>  	const unsigned int *intbuf;
>  	size_t arr_sz, i;
>  	int ret;
>  
> -	if (IS_V4(inst->core)) {
> +	if (IS_V6(inst->core)) {
> +		if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
> +			arr_sz = ARRAY_SIZE(intbuf_types_6xx_dec);
> +			intbuf = intbuf_types_6xx_dec;
> +		} else {
> +			arr_sz = ARRAY_SIZE(intbuf_types_6xx_enc);
> +			intbuf = intbuf_types_6xx_enc;
> +		}
> +	} else if (IS_V4(inst->core)) {
>  		arr_sz = ARRAY_SIZE(intbuf_types_4xx);
>  		intbuf = intbuf_types_4xx;
>  	} else {
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 6b524c7cde5f..f367f43c9fb7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -395,11 +395,14 @@
>  #define HFI_BUFFER_INTERNAL_PERSIST		0x4
>  #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
>  #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
> -	(((ver) == HFI_VERSION_4XX) ? 0x6 : 0x1000001)
> +	(((ver) == HFI_VERSION_4XX ||		\
> +	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
>  #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
> -	(((ver) == HFI_VERSION_4XX) ? 0x7 : 0x1000005)
> +	(((ver) == HFI_VERSION_4XX ||		\
> +	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
>  #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
> -	(((ver) == HFI_VERSION_4XX) ? 0x8 : 0x1000006)
> +	(((ver) == HFI_VERSION_4XX ||		\
> +	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
>  #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
>  	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
>  #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
> 

-- 
regards,
Stan
