Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0465322B71
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 14:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhBWN0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 08:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbhBWN0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 08:26:22 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA183C06174A
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:25:41 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id g5so34582487ejt.2
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dLDDdaFUOIptH+6Lpen6xQpVT2uM6tpsj0UXn9eLf4E=;
        b=fl6csboR+d/Iv0PLeu+6C/qQhyBqZvSE6k/Huw2oS4kyeVRjaw9VZ4/+tbsR1qC9f9
         cSfpKusMbofBJmtrKuRxhS6xec3PVKd7ptoiLz/sv1kRD+9vKiq/vVW50rktSdGXPycj
         296noOtWjw8lDRZkO7bSV5AAAdPDQAMclgmu867fZwcH0OdcvRT7RpD5PQ5F4eIInkzN
         deY7PSqF5C7MpP6HV65r0X3acqmmd2QOxy6q3QkMJNAS/zNdv0XzKr+D1lRIMtGXyyad
         eJnECk5I3msq2HxyU1FJgkQpSpLwftGCl1cThHTu2BrA6099fci8HIvwSU34dre0ZjnO
         IBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dLDDdaFUOIptH+6Lpen6xQpVT2uM6tpsj0UXn9eLf4E=;
        b=HTogl4cC48aqyitJjvqx1cfLVaw8Pkuv13li2fBZ+iqlbq57fz2Khe4kyI9Q1b1OQ9
         i5KpBxcO6ykDUH7v5j7Zp5cCDEcGfWtpKSGd9oIWQd4u2G4tgNPepEZmlmtWEKtCkwuT
         UP+QqFBUS8fJdZM5XTn1vGzKWeUG8njdBQ6mOGLL3ABXqFlhTQvyJpngomZULkqOILJv
         vhyQhl9nrtw6RyucidydunUjaFY3vUuhJMQXSlpbGjt6kdZtkznWgSVHkzqU+FO0X+Vm
         FCSLuDPQISTc546v/ltwk8tT9VTb70ocF67l9xEWILNQm/iOOE0evesZWPpzcsT+tL/w
         p/hA==
X-Gm-Message-State: AOAM530TFSplwAv9YlStHVawO58JmCy/3qDeOKmvqXDRHKzWheHiUWtV
        5q5Ky6IKv6EDZERhm2khdv5mHkXOy9tOLxlk
X-Google-Smtp-Source: ABdhPJwyUNTLrR217in/E6JtomiP7RvH1R8P8VCYX4Q1Gc1W8M6LWZgs50mO0QbO3nZDLdQiCCMSJg==
X-Received: by 2002:a17:906:718a:: with SMTP id h10mr23939529ejk.237.1614086740595;
        Tue, 23 Feb 2021 05:25:40 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id gg16sm2894884ejb.58.2021.02.23.05.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:25:40 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
Date:   Tue, 23 Feb 2021 15:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Vote for min clk frequency for core clks during prepare and enable clocks
> at boot sequence. Without this the controller clock runs at very low value
> (9.6MHz) which is not sufficient to boot venus.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 4f5d42662963..767cb00d4b46 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
>  static int core_clks_enable(struct venus_core *core)
>  {
>  	const struct venus_resources *res = core->res;
> +	const struct freq_tbl *freq_tbl = NULL;
> +	unsigned int freq_tbl_size = 0;
> +	unsigned long freq = 0;

no need to initialize to zero.

>  	unsigned int i;
>  	int ret;
>  
> +	freq_tbl = core->res->freq_tbl;
> +	freq_tbl_size = core->res->freq_tbl_size;

could you initialize those at the variables declaration?

> +	if (!freq_tbl)
> +		return -EINVAL;
> +
> +	freq = freq_tbl[freq_tbl_size - 1].freq;
> +
>  	for (i = 0; i < res->clks_num; i++) {
> +		ret = clk_set_rate(core->clks[i], freq);

I'm not sure that we have to set the rate for all core->clks[i] ?

> +		if (ret)
> +			goto err;
> +
>  		ret = clk_prepare_enable(core->clks[i]);
>  		if (ret)
>  			goto err;
> 

-- 
regards,
Stan
