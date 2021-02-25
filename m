Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969F9324B42
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 08:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhBYHan (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 02:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbhBYHag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 02:30:36 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E3DC06174A
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 23:29:55 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id n4so4206232wrx.1
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 23:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qrxjqx6QwxdiXpoZqofbvviJ6L0ltdVQ20iRAin6ViU=;
        b=FuEtSzSm2Yboa0DHaH5WOS0fGtOtpzEeMc8aSNmroaRgwsYaw3AHg58hMj1p1zxYgV
         Q/hbLmaHwK3fPjEcqeEO9OUkb7yrdhY4v8thWxxAcX51vd1y6eb+T2lw5i5fgdnt6ffW
         q8s0EuhCdhQ0p/8pm228xoCNEeyTmofpVhLdy0fXcFbEe1ocbNTS9n2Dcu5F2ZQFY84d
         SQBLTTnSEu6SnLKWXCpw6L504+mNVKeXkyGVbwij2lvw5IRRnigTCRbRsUcoF72GdipP
         MPAnep2NEcChnq82bG3+9Jm+fie0TCu9UjvIJR7no48018N5IbudUOinZLirO4XZivT7
         we+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qrxjqx6QwxdiXpoZqofbvviJ6L0ltdVQ20iRAin6ViU=;
        b=IovlEhPARS+WkDFyigMYGU6KPYcNd1sLZXZgoi/KMD9cVWoSO4jTwVVB48nBEzSpI3
         PHp3UqtkZAKmQHdKSdYKbYzWpRCMf2uaf8Sen5B4Akyz2yBMYKlXrI3KovqfSF7S3kz+
         tuJBNXzCa2QrYXY2z69U8NsCDbjN1pQAngjanpGfXItdxRrtpcWus7xGmlu+5SYC8y7e
         dOKbm9mEWSWuilYExwR7IqXGW96i/llk9z4tAPfo7+mrRZQAPjePiwX3ZIdoU986SRnD
         EGGNKc4T+7yrlGny+MWF+225I1x9INjcKh/6KPLZsMTpUvdfSr4Y7pdgJAHugKuKeDbe
         6cRw==
X-Gm-Message-State: AOAM531qZATQxxMAV1KZd6Pqtd7CqaEnGUqR84fAK5tV6t5xgGJQ4J13
        087Tq3Jdb0XW/RFK5h1UWP4poA==
X-Google-Smtp-Source: ABdhPJxOebH73cxp10bgi9hRmEqtQR9a8Pqpf+XvDnT7Re9pnUPauMX9MAUAAgxwgq2mqD17l0IB4w==
X-Received: by 2002:a5d:4441:: with SMTP id x1mr1999570wrr.56.1614238194680;
        Wed, 24 Feb 2021 23:29:54 -0800 (PST)
Received: from [192.168.0.4] (hst-221-18.medicom.bg. [84.238.221.18])
        by smtp.googlemail.com with ESMTPSA id l4sm7133552wrt.42.2021.02.24.23.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 23:29:54 -0800 (PST)
Subject: Re: [PATCH 18/25] media: venus: hfi: Add 6xx AXI halt logic
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-19-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <5b4c2717-c640-2a03-feee-d6849ca3dfb6@linaro.org>
Date:   Thu, 25 Feb 2021 09:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-19-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> This patch takes the downstream AXI halt routine and applies it when
> IS_V6() is true.
> 
> bod: Converted to readl_poll_timeout()
>      Converted LPI update timeout to dev_dbg. In practice this register
>      never appears to update with the value 0x07. Discussing with contacts
>      in qcom video team, this toggle only pertains to low-power mode.
>      Keeping the write for the sake of fidelity with downstream.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 24cf20f76e7f..01c100db07d3 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -541,10 +541,55 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
>  {
>  	void __iomem *wrapper_base = hdev->core->wrapper_base;
>  	void __iomem *vbif_base = hdev->core->vbif_base;
> +	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> +	void __iomem *aon_base = hdev->core->aon_base;
>  	struct device *dev = hdev->core->dev;
>  	u32 val;
> +	u32 mask_val;
>  	int ret;
>  
> +	if (IS_V6(hdev->core)) {
> +		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
> +
> +		writel(0x1, aon_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		ret = readl_poll_timeout(aon_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +					 val,
> +					 val & BIT(0),
> +					 POLL_INTERVAL_US,
> +					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
> +		if (ret) {
> +			dev_err(dev, "NOC not in qaccept status %x\n", val);

Could you drop this error msg. I don't see any valuable information in it.

> +			return -ETIMEDOUT;
> +		}
> +
> +		/* HPG 6.1.2 Step 3, debug bridge to low power */

This comment does not add any information, please drop it.

> +		mask_val = (BIT(2) | BIT(1) | BIT(0));
> +		writel(mask_val, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
> +
> +		ret = readl_poll_timeout(wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS_V6,
> +					 val,
> +					 (val & mask_val) == mask_val,
> +					 POLL_INTERVAL_US,
> +					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
> +
> +		if (ret)
> +			dev_dbg(dev, "DBLP Set: status %x\n", val);

Do we need this as well? From what I can see this always timeouts and
increase the time of module loading.

> +
> +		/* HPG 6.1.2 Step 4, debug bridge to lpi release */

ditto

> +		writel(0x00, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
> +		ret = readl_poll_timeout(wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS_V6,
> +					 val,
> +					 val == 0,
> +					 POLL_INTERVAL_US,
> +					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
> +
> +		if (ret) {
> +			dev_err(dev, "DBLP Release: lpi_status %x\n", val);
> +			return -ETIMEDOUT;
> +		}
> +		return 0;
> +	}
> +
>  	if (IS_V4(hdev->core)) {
>  		val = readl(wrapper_base + WRAPPER_CPU_AXI_HALT);
>  		val |= WRAPPER_CPU_AXI_HALT_HALT;
> 

-- 
regards,
Stan
