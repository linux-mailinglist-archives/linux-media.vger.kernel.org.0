Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5359F3BBA4C
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 11:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhGEJlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 05:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhGEJlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 05:41:08 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7116DC061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 02:38:30 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u8so21258132wrq.8
        for <linux-media@vger.kernel.org>; Mon, 05 Jul 2021 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LDdjbER3ezDFScKXgmO5TeU2cTUwmoN1ugG4eC/4fRE=;
        b=F0z7nalwgxiHBebhvwXGMOcu19AjtIyTZ8gOtgUmAecjEzdZ0JR51TdJqdpxokNcg8
         aATi42Gc+mVeF6ctIyK+AnI++csxpuZsORaSpB1yR4YuJMrD9EUDqvUcw9rsrMPd9xb5
         beXd5+zvcw0EHShwhNKAG3hBnZ9VZE+Iy5YRDviARu+TxH05NE3iI/517025+IC20RGP
         xdLCEhkL0nnvibb8AX3UrW4JmfA0kwfKZzNJSuMrh7/P5bDFb2ZIPmR5wrNspvEuOOD0
         Ka4srlJh74bUe81TROTgUv1DaE3jtze4c6sdINivmPr/5trNWMYR5pDzCgvbcQEYIoVq
         vybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LDdjbER3ezDFScKXgmO5TeU2cTUwmoN1ugG4eC/4fRE=;
        b=L9r4ie3XYf66Jk1dlkiT4noj1agOIwIz4uVbSYZ7m0SfGn8R3n4CsveMM2Xko/tcxV
         USOZpLi1bC42yTOt8efipaaLA9UxR6rVbG3KYdtpUUOWpfob/nR574LSaJR0cvoTyeML
         rKMgmzkV+JXBVKh3JkYIvDPFMEhyd5XXPuI0YN2362UFAx8MhoYM9B4KThhc0A1AUpdg
         jBmBtpK/I/Il/gTlgQ7Kr0Iw3GJHsVxlp7WrVL3kreUWXtSjl+s62XqJuhZTNCOqSIZb
         WyQRe3QxiFIqghGsIbFrmJkWBCJTHROzuaPXzd6meOx9yfvt0FL8OFIlRqIqm/5K/T7R
         wsRw==
X-Gm-Message-State: AOAM5338XgDjMgiOfEucT6n4aJYH3rZb1OKpR22+nbsC3p4kyKSat1AQ
        R2Rc+MgNXIyd8qn6/WK751ZXAg==
X-Google-Smtp-Source: ABdhPJwEyzHzFmiT+oW5m+5FMnPGW3fRamXe3P45E/02iLv4nXIRvBryOSt3r+S90wa5tYE9V3D+zg==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr14541216wrt.138.1625477909068;
        Mon, 05 Jul 2021 02:38:29 -0700 (PDT)
Received: from [192.168.1.9] (hst-221-44.medicom.bg. [84.238.221.44])
        by smtp.googlemail.com with ESMTPSA id u2sm6553637wmc.42.2021.07.05.02.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 02:38:28 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] venus: firmware: enable no tz fw loading for
 sc7280
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
 <1625126736-16266-2-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <512298bd-f357-d2e6-9b1b-3a8b674cd3f4@linaro.org>
Date:   Mon, 5 Jul 2021 12:38:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625126736-16266-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/1/21 11:05 AM, Dikshita Agarwal wrote:
> - Enable no tz FW loading.
> - add routine to reset XTSS.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c     | 41 ++++++++++++++++++------
>  drivers/media/platform/qcom/venus/hfi_venus_io.h |  2 ++
>  2 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 227bd3b..d5a4674 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -27,7 +27,12 @@
>  static void venus_reset_cpu(struct venus_core *core)
>  {
>  	u32 fw_size = core->fw.mapped_mem_size;
> -	void __iomem *wrapper_base = core->wrapper_base;
> +	void __iomem *wrapper_base;
> +
> +	if (IS_V6(core))
> +		wrapper_base = core->wrapper_tz_base;
> +	else
> +		wrapper_base = core->wrapper_base;
>  
>  	writel(0, wrapper_base + WRAPPER_FW_START_ADDR);
>  	writel(fw_size, wrapper_base + WRAPPER_FW_END_ADDR);
> @@ -35,11 +40,18 @@ static void venus_reset_cpu(struct venus_core *core)
>  	writel(fw_size, wrapper_base + WRAPPER_CPA_END_ADDR);
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> -	writel(0x0, wrapper_base + WRAPPER_CPU_CGC_DIS);
> -	writel(0x0, wrapper_base + WRAPPER_CPU_CLOCK_CONFIG);
>  
> -	/* Bring ARM9 out of reset */
> -	writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
> +	if (IS_V6(core)) {
> +		/* Bring XTSS out of reset */
> +		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> +	}
> +	else {

} else {
	...
}

> +		writel(0x0, wrapper_base + WRAPPER_CPU_CGC_DIS);
> +		writel(0x0, wrapper_base + WRAPPER_CPU_CLOCK_CONFIG);
> +
> +		/* Bring ARM9 out of reset */
> +		writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
> +	}
>  }
>  
>  int venus_set_hw_state(struct venus_core *core, bool resume)
> @@ -56,7 +68,9 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	if (resume) {
>  		venus_reset_cpu(core);
>  	} else {
> -		if (!IS_V6(core))
> +		if (IS_V6(core))
> +			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> +		else
>  			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
>  	}
>  
> @@ -162,12 +176,19 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  	u32 reg;
>  	struct device *dev = core->fw.dev;
>  	void __iomem *wrapper_base = core->wrapper_base;
> +	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>  
> +	if (IS_V6(core)) {
> +	/* Assert the reset to XTSS */

insert one tab before comment

> +		reg = readl_relaxed(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> +		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> +		writel_relaxed(reg, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> +	} else {
>  	/* Assert the reset to ARM9 */

insert one tab before comment

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
