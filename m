Return-Path: <linux-media+bounces-50440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D534CD12124
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9020530563FD
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED3A34EF02;
	Mon, 12 Jan 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLXx+aT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00134E777
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215234; cv=none; b=J/JMUPa+7ty1ilRYzjIpeOOUZfg8SvHaPuDOHW24r9omm3xP/Ue0eXyXMRFUeFYFI9GTvxyWSmmqaVX9Lh2cyGoQByRJXwbtuXkN9yA15zBYBS1jbbGJrHEpEbiUrUSwZ7midRRtQDUSL7bX9+Fu4+bauyFfflWcWtZiNI0CrYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215234; c=relaxed/simple;
	bh=sAHFH1frPEbW4Tsm+MC0aaCUfB+E4Z13yEHNemnd7vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIOSSMH3AuDLl212JeVy3CY369i1V3ChSD22IeiGgUomY5Kg2nGnoealNGkQAfyfhVjPBALrjCv+8Gad54IeVRHmUc+QRjdEHQQ8ekWWvlNjAKjlaXEfZx+3ERa7CEKc6eLYpx0HYiBgOfucUpdxD9XSDKQ2oSF1u51AsdLREW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLXx+aT1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3126742f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768215229; x=1768820029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKHpGelNrHeyewNQEr1a50NI52JXiox3dXfR2mRoZpk=;
        b=lLXx+aT1LM/X8hXwoLCuY6SnvehUbAGcWJieLz6cbWsN0h+X97mvonel6fGfmZE4go
         Q0VN+t00l6TEfXhOgJR3SAiDqf4kBVGxUNhlWbi70LmK3uJNCVqJr9Y3K5Fop/TUnfgC
         S50x9SZmDrPFclt6Uk4AzodHkvyP3sPwZblDpTdG1/NNxvno3jbYhher97+xGLXDufsr
         rgS33h4yNJdvBSHZHb+SnzMEIqepV4M9syRFc3R4HHCEHBbE1qMlI/nSt/kNRjoNwQXL
         TwGF+Oo0D0qCSYxKz1QXhrSSshTUB8C7psHmaRoMqSqtousAoZk02zmeddbvkIMdaSqC
         eaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215229; x=1768820029;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKHpGelNrHeyewNQEr1a50NI52JXiox3dXfR2mRoZpk=;
        b=S+GSvwHmj25oqJDnL10pGBqV9W8AHSOWUXfudGT3ZLufAe1FxXDYXdLAaB4862NYX2
         EEwVJMcGG6E2p2B7G683gmQuyyS7oxv9QcLTWxNn0hoK4j1QNzqpNjkf7Gri7e7NKtaU
         gK73zsCyj/houNPLNH4VcVua/l8RdNh3jGpToTfPboRC+InDXrQoQAYNNXKuk6v/EIbM
         6mL0JORKpSWDsYAfGgJw0FBg0wn6obA/bgnn0h8iQHcANmOIdfnHD9JjPAP3UzX6LUT5
         P/GJdPg+9jeYkQpPxmT259DY823MQ+rFI/gqa+A3RqqJUtgvBrBk29QZ/HViYB7ElLW6
         PCOw==
X-Gm-Message-State: AOJu0Yx/pg/T/qBgvH4SiICb4YIMRuuiBWi+z/8BaF6IOUCaYO1Ew7Sj
	L422ZJCsEW1/KEV27zVfJZf+4tqEZ08YxwHOmnXLMttumGQ+a9GAiJK0nIgfgdXFc/o=
X-Gm-Gg: AY/fxX4Jw8qWJwxy+VybXk2HXrp3/o2FI8yPoGJs0xmSMbH8/dOXgEVjkU4+rmBEy+S
	TsI5Nsvjvg9zEd3v1IMpD1piYwul7NE011GQw3iW5be2UJIUwuBHuDvKENLA5nt85HJ4T+IypFG
	/p0sR/7+hTG26W65Z4YPzxyBITt8WSQs1UqUaGSuIYXFZC9YGKpCpy4XBlVivDdVOyUbadVKd+4
	1AXCODNCruJfyneIfYVLMfSO8UgX/cdJ/Po/P3lbC2xAi3nz5wAdnMhT26krYXqbVb3w/l79KcU
	lxTiC35EQ5WlkiqXjbdm6ZBkOtiCzUitDqZ7Er2Zm/8Jd1xwz6mHsLJ20dkhwvXvZOazVD5F0IE
	8EVn0PFQFQYbSl9Qa68zKz8MkuVY2CxVB+b8/zUtuAJ8qDoE3YBv0z1WHdOJV/A9fPL4Qjdw7Ec
	hqBXJekzm3NoAlflsaFdJ98uH5MHmOPwnH2YMnI4W3/REl8vR0VPYh
X-Google-Smtp-Source: AGHT+IFGRdazPlXnjk1IjCltW0erFj1I3/O/pzsQ0N3ouxwIEI8Uga6lJP1zjpKUInJyP4eIL/HEFg==
X-Received: by 2002:a05:6000:1a8b:b0:432:84f9:95f4 with SMTP id ffacd0b85a97d-432c374f4a7mr21083778f8f.31.1768215229185;
        Mon, 12 Jan 2026 02:53:49 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432dfa6dc4esm16185568f8f.23.2026.01.12.02.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:53:48 -0800 (PST)
Message-ID: <0236bf83-228d-4d6e-8740-b9589d096f6a@linaro.org>
Date: Mon, 12 Jan 2026 10:53:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 08:11, Hangxiang Ma wrote:
> The current value of '0xb0' that represents the offset to the status
> registers within the common registers of the CSIPHY has been changed on
> the newer SOCs and it requires generalizing the macro using a new
> variable 'common_status_offset'. This variable is initialized in the
> csiphy_init() function.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> This change introduces common_status_offset to replace the hardcoded
> offset in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn.
> ---
> Changes in v2:
> - Rebase this series due to conflict - bod
> - Link to v1: https://lore.kernel.org/r/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++++++------
>   drivers/media/platform/qcom/camss/camss-csiphy.h      |  1 +
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 619abbf60781..d70d4f611798 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -46,7 +46,8 @@
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
> +	((offset) + (common_status_offset) + 0x4 * (n))
>   
>   #define CSIPHY_DEFAULT_PARAMS		0
>   #define CSIPHY_LANE_ENABLE		1
> @@ -810,13 +811,17 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>   	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>   
>   	hw_version = readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
> +						  regs->common_status_offset, 12));
>   	hw_version |= readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
> +						  regs->common_status_offset, 13)) << 8;
>   	hw_version |= readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
> +						  regs->common_status_offset, 14)) << 16;
>   	hw_version |= readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
> +						  regs->common_status_offset, 15)) << 24;
>   
>   	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
>   }
> @@ -845,7 +850,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>   	for (i = 0; i < 11; i++) {
>   		int c = i + 22;
>   		u8 val = readl_relaxed(csiphy->base +
> -				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
> +			CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
> +							  regs->common_status_offset, i));
>   
>   		writel_relaxed(val, csiphy->base +
>   			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
> @@ -1086,6 +1092,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   
>   	csiphy->regs = regs;
>   	regs->offset = 0x800;
> +	regs->common_status_offset = 0xb0;
>   
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c44..2d5054819df7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -90,6 +90,7 @@ struct csiphy_device_regs {
>   	const struct csiphy_lane_regs *lane_regs;
>   	int lane_array_size;
>   	u32 offset;
> +	u32 common_status_offset;
>   };
>   
>   struct csiphy_device {
> 
> ---
> base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
> change-id: 20260111-camss-extended-csiphy-macro-486b9f3b950f
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

