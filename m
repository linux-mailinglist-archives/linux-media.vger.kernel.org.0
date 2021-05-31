Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5473957BE
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 11:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhEaJC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 05:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhEaJCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 05:02:48 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7905C061760
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 02:01:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j14so10107221wrq.5
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=upaCZv3Tpjgwox/z9nQr2rgDiaU87oH++b6b3h+UG8s=;
        b=IJkIi4OPezh+sg5mah6li4r4TXDpqcnsHZu1Gp/dACzW7ND6vIHxFnv+oM8+1d+AjQ
         7MOTlEpAX5JbZcA16mEHDVISwyriBX9GhbcfbxeaEgeltM0aoNLfYjC2iykUou+MmTo3
         i0ViDeAgE1hUBwdqW+DAwQXkLRMGdFhYKs76lzu0QNarTJhhXBupMHmy8ThvG4A5KfHm
         9vyrkFYo11EtI4WrtYXl1TNQiQmHErOAZi40BP21uWnA3ypsCxatYuBIH0YB7crAz1wB
         ACcBv5wj0CfIxvWPlZK1veASzSGKWGYmAECFyDaOP9v8G7QhLC7V6/0NjuRnjKjf2QPH
         XnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=upaCZv3Tpjgwox/z9nQr2rgDiaU87oH++b6b3h+UG8s=;
        b=EjrzM+vZ/dbT/xVyUME3aWBFt5YLTU6JZ+vxWus1LZGAcMMtoJ+8hfTZXkYrfeTnU/
         6zvq/eAFjIXSrRzIqsoCbapJ7UZpjP4SmJxYhCbxQlyvFSNxL5yOjKNyZgCCK8U/1ZVV
         yTtrJlbWGnjNtW9TR7et2tCxrh3LzOwGivV6IZC8Uq/LwP8njWFsuM0X3LHX+X6afZLM
         YrFv7JmmnLHjy9xCf5ry+sF9Nr5u5cmCy2LE/j3p62A8xU5QOcAU6tifFdr/+NnrK40y
         oLAg2XO0vvmp2KLMljrxfW3zoeMKosWwXYR3bftBfnqRw1sQ1fdlwfHERzYc0+r7vAiB
         hI8g==
X-Gm-Message-State: AOAM532PCeePCFx3G/cCLunM4SDmB8EhdijIdFa36c8BvOG9lPMFlJIH
        MiygdPy61Yg9gI6JkJadczVvZg==
X-Google-Smtp-Source: ABdhPJxaabXMbDEpkNMna9vR7iDgC/aOGjrgq5mOwHusvjCadqPJuxhWcqYr0atixHuaN5GJhEiuTA==
X-Received: by 2002:adf:8b91:: with SMTP id o17mr5188820wra.385.1622451667388;
        Mon, 31 May 2021 02:01:07 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-12.medicom.bg. [84.238.221.12])
        by smtp.googlemail.com with ESMTPSA id l8sm16066268wrw.71.2021.05.31.02.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 02:01:06 -0700 (PDT)
Subject: Re: [PATCH 1/7] venus: firmware: enable no tz fw loading for sc7280
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
 <1621417008-6117-2-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <73299cba-3ea4-5cb9-45ee-228ef698a48d@linaro.org>
Date:   Mon, 31 May 2021 12:01:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621417008-6117-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/21 12:36 PM, Dikshita Agarwal wrote:
> - Enable no tz FW loading.
> - add routine to reset XTSS.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c     | 42 ++++++++++++++++++++----
>  drivers/media/platform/qcom/venus/hfi_venus_io.h |  2 ++
>  2 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 227bd3b..e05e01a 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -42,6 +42,22 @@ static void venus_reset_cpu(struct venus_core *core)
>  	writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
>  }
>  
> +static void venus_reset_cpu_V6(struct venus_core *core)
> +{
> +	u32 fw_size = core->fw.mapped_mem_size;
> +	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
> +
> +	writel(0, wrapper_tz_base + WRAPPER_FW_START_ADDR);
> +	writel(fw_size, wrapper_tz_base + WRAPPER_FW_END_ADDR);
> +	writel(0, wrapper_tz_base + WRAPPER_CPA_START_ADDR);
> +	writel(fw_size, wrapper_tz_base + WRAPPER_CPA_END_ADDR);
> +	writel(fw_size, wrapper_tz_base + WRAPPER_NONPIX_START_ADDR);
> +	writel(fw_size, wrapper_tz_base + WRAPPER_NONPIX_END_ADDR);
> +
> +	/* Bring XTSS out of reset */
> +	writel(0, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> +}

Could you squash this v6 cpu reset into venus_reset_cpu() and add
IS_V6() checks there ...

> +
>  int venus_set_hw_state(struct venus_core *core, bool resume)
>  {
>  	int ret;
> @@ -54,10 +70,15 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	}
>  
>  	if (resume) {
> -		venus_reset_cpu(core);
> +		if (IS_V6(core))
> +			venus_reset_cpu_V6(core);
> +		else
> +			venus_reset_cpu(core);

... then this IS_V6() is not needed.

>  	} else {
>  		if (!IS_V6(core))
>  			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
> +		else
> +			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);

Could you invert the logic here:

if (IS_V6(core)
	writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
else
	writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);

>  	}
>  
>  	return 0;
> @@ -149,7 +170,10 @@ static int venus_boot_no_tz(struct venus_core *core, phys_addr_t mem_phys,
>  		return ret;
>  	}
>  
> -	venus_reset_cpu(core);
> +	if (IS_V6(core))
> +		venus_reset_cpu_V6(core);
> +	else
> +		venus_reset_cpu(core);
>  
>  	return 0;
>  }
> @@ -162,12 +186,18 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  	u32 reg;
>  	struct device *dev = core->fw.dev;
>  	void __iomem *wrapper_base = core->wrapper_base;
> +	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>  
> +	if (IS_V6(core)) {
> +		reg = readl_relaxed(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> +		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> +		writel_relaxed(reg, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> +	} else {
>  	/* Assert the reset to ARM9 */

This comment should be moved above.

> -	reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
> -	reg |= WRAPPER_A9SS_SW_RESET_BIT;
> -	writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
> -
> +		reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
> +		reg |= WRAPPER_A9SS_SW_RESET_BIT;
> +		writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
> +	}
>  	/* Make sure reset is asserted before the mapping is removed */
>  	mb();
>  
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
> index 300c6e47..9735a24 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
> +++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
> @@ -149,6 +149,8 @@
>  /* Wrapper TZ 6xx */
>  #define WRAPPER_TZ_BASE_V6			0x000c0000
>  #define WRAPPER_TZ_CPU_STATUS_V6		0x10
> +#define WRAPPER_TZ_XTSS_SW_RESET		0x1000
> +#define WRAPPER_XTSS_SW_RESET_BIT		BIT(0)
>  
>  /* Venus AON */
>  #define AON_BASE_V6				0x000e0000
> 

-- 
regards,
Stan
