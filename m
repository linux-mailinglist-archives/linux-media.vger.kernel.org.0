Return-Path: <linux-media+bounces-57866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KPLAd0FzWkjZgYAu9opvQ
	(envelope-from <linux-media+bounces-57866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:47:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 04123379BC9
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85D9A3159F90
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD2C405AB6;
	Wed,  1 Apr 2026 11:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wt3KrhSL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1063F9F35
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042785; cv=none; b=bPqyGI+KooOgmoKrq+znx7oSv66l24CVdJc/xSGI8gT+Seybbr/Ohx85sbzYD+7CtE79HtHqZxVjPL9j3v5pF7ie0mnP9sLLvwpWyPO2CgFJlvKpouolEx+mubwFORKJQceF0qc3Kxy42lBVseCiifY4UY+y9j+SHwKw2E84Mdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042785; c=relaxed/simple;
	bh=vhLuBrMnrF40MKNkHIQzolWiHY4dVmzK6aOSRid7MS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJBowwnL4NERiKuHTQCa3pvq/6x3UickN+jBTrPbh3YWsV1nKIT/GIWxv1xaRf3CCjCEGccyBxn0sjjEqbVEVn4EdeGEV1vY5igqLYM/QltebBECZ5Rtw7/c4KJJMryBuPU2nKr2GkcJQF/KppsRRj3wcm1AFoL+Fp+esk2N6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wt3KrhSL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso3017456f8f.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775042782; x=1775647582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6O4f7mQin+EJczN3uHPfMRBqqdkD+tZyPecD+mtO9Lc=;
        b=Wt3KrhSLWvDJMkrPcHaU08iOArhlGWZxjqZOdy09iblUPLZntLgGGDq6ql9IP5M71o
         s77OgMtCtrUW9PH0co736pI9L3b5JXp+Fn+NqRalN7jlwGC2xUIryYJ+vYfN1WYOEiIL
         FV3h4CXyp7U/L99BzO8x3xiKkkE9+Sk7zZtazaC7BkxtKwJRKvpSsosyrqHXA+sYroXK
         N87UFrC8+cWfPCETdtIeeb3S+bcWi13iYiFzBTmktSPHJRmaOnLG7RqXmNNFhNrXEEJ2
         Dq3ZI3EmnlEhNhgp8G3TSw3jalEnZTOvfYSAM3RNVAYHV3E+H+N5klSM19V5GOj29nzj
         EMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042782; x=1775647582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O4f7mQin+EJczN3uHPfMRBqqdkD+tZyPecD+mtO9Lc=;
        b=UK7VovT36rhWAcQeSkiuzkwgyuBeNTC+Y1UTXip4K2JbdJuNz1gHym1vqOVQPd0zGq
         IA2RL6ovtOqvzkFvgNtp3LIqxbtA3mNA9d/t+urCzNSCfb4aiKAqnX3ciKBNecmu5ren
         j3TbRQIiwhc/yucSFJREU5Cr74yN2UcszUCC7hqaUTJdio7hpoDSmwLp1Q1nijHR7PJA
         qnJxc7SlWF4lCGQxfBnOUaxYSRo9y+8hDAJee5hDNtQwPH0alknvBDUZIkj81e9c4ojl
         Z0Q4AMcCkkdjT8WhGn3yy5hZH096Y9l+W4aBL+fNQLncFhnwzJoEqpL5QlfN5zPxkhM9
         Hs6g==
X-Forwarded-Encrypted: i=1; AJvYcCX7VbrDB5PnQxYuPLlijVDQ9XrNi+AyKZnxh0JIrc7MjSjjOkCRdx63rl0SfiecJjKchO2wPsI4u4gHbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBIql0j2eNbkyR7IATO1hT03dZUnP68/27GEtkCdFtqcmjBXI
	imwGm+A6rl2sYUXidfh6csHGlG7AMchgZGfGDUG7oEt+hPniCDr3zl6HdRgm9NC0G0E=
X-Gm-Gg: ATEYQzyvo/90gc+K2dGgzsLQZ/1xNjCCzTRJKxCAdnf3vWklSxNk20ZvZWE40+MgM9Y
	mZWETG2qEhnze8ph5I8d0zLs8hVTVg5uweGsXY1lZnZbybKp95uNlZ+EkVSe6xTfrGrUmdYk22x
	G2eREoSoR4J3PsJUKUS1mH5fCs9z69+Hc/ybjfpsfO8W2VODAkd7SCS0zhI8WGEFYHRikquD1SR
	6ZEZbl6maMEDGVCX7+qXgJMQNwSvxBozzqrXN8TH+7LtcmmAJLXyH3U7zEPito6KG9H/j//1Mce
	rsK/8HOlGiK3HEV0207ig+TUJd6ssRKX3zhOka0g+xwlZi6K7mhKkWJT2JJeCqrG4l5wPiiRhQU
	7j0mTtlzr4NgppBboqHA8H8lEeOv/9uNuKbhrJgObQj6U8pWTW1nvmufGwuB99nA0WxiiO16oDW
	6sb3pB4mrG3MmC0WTKl+H6UG0FeVkmWKbFmoWmKHv4RikNoA==
X-Received: by 2002:a05:6000:2007:b0:43c:ff58:35d3 with SMTP id ffacd0b85a97d-43d150565f4mr5973314f8f.17.1775042781759;
        Wed, 01 Apr 2026 04:26:21 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm32772618f8f.17.2026.04.01.04.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:26:21 -0700 (PDT)
Message-ID: <45b99cc4-5382-4af4-9098-3fc36999eda1@linaro.org>
Date: Wed, 1 Apr 2026 12:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
 <20260317-camss_tpg-v10-3-b4cfa85c2e1b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260317-camss_tpg-v10-3-b4cfa85c2e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-57866-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 04123379BC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 10:05, Wenmeng Liu wrote:
> Add support for TPG found on LeMans, Monaco, Hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +-
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c          | 117 ++++++++++-
>   5 files changed, 371 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d747aa7db3c12ad27d986e0b2b85a44870f89ad3..27898b3cc7d3c8f275567f81f0952e2a0e18f189 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -16,6 +16,7 @@ qcom-camss-objs += \
>   		camss-format.o \
>   		camss-ispif.o \
>   		camss-tpg.o \
> +		camss-tpg-gen1.o \
>   		camss-vfe.o \
>   		camss-vfe-4-1.o \
>   		camss-vfe-4-7.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> index 3ad3a174bcfb8c0d319930d0010df92308cb5ae4..2e4547455d229227ba7cc339a13271fb28e103a5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -103,6 +103,8 @@
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL			20
>   #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
>   #define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
> +#define		CSI2_RX_CFG0_TPG_MUX_EN				BIT(27)
> +#define		CSI2_RX_CFG0_TPG_MUX_SEL			GENMASK(29, 28)
>   
>   #define CSID_CSI2_RX_CFG1					0x204
>   #define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		BIT(0)
> @@ -185,10 +187,20 @@ static void __csid_configure_rx(struct csid_device *csid,
>   				struct csid_phy_config *phy, int vc)
>   {
>   	u32 val;
> +	struct camss *camss;
>   
> +	camss = csid->camss;
>   	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> -	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	if (camss->tpg && csid->tpg_linked &&
> +	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
> +		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |= CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +			<< CSI2_RX_CFG0_PHY_NUM_SEL;
> +	}
>   
>   	writel(val, csid->base + CSID_CSI2_RX_CFG0);
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..40d79d94068d1ee1c2dfe1c6a01f3c692144e473 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -66,6 +66,8 @@
>   #define		CSI2_RX_CFG0_VC_MODE		3
>   #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
> +#define		CSI2_RX_CFG0_TPG_MUX_EN		BIT(27)
> +#define		CSI2_RX_CFG0_TPG_MUX_SEL	GENMASK(29, 28)
>   
>   #define CSID_CSI2_RX_CFG1		0x204
>   #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
> @@ -109,10 +111,20 @@ static void __csid_configure_rx(struct csid_device *csid,
>   				struct csid_phy_config *phy, int vc)
>   {
>   	int val;
> +	struct camss *camss;
>   
> +	camss = csid->camss;
>   	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> -	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	if (camss->tpg && csid->tpg_linked &&
> +	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
> +		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |= CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +			<< CSI2_RX_CFG0_PHY_NUM_SEL;
> +	}
>   
>   	writel(val, csid->base + CSID_CSI2_RX_CFG0);
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d29de5f93c18ee3c1778dc0626e8c198f354eb1f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + * Qualcomm MSM Camera Subsystem - TPG (Test Pattern Generator) Module
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +
> +#include "camss-tpg.h"
> +#include "camss.h"
> +
> +/* TPG global registers */
> +#define TPG_HW_VERSION		0x0
> +# define HW_VERSION_STEPPING		GENMASK(15, 0)
> +# define HW_VERSION_REVISION		GENMASK(27, 16)
> +# define HW_VERSION_GENERATION		GENMASK(31, 28)
> +
> +#define TPG_HW_VER(gen, rev, step) \
> +	(((u32)(gen) << 28) | ((u32)(rev) << 16) | (u32)(step))
> +
> +#define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
> +#define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
> +
> +#define TPG_HW_STATUS		0x4
> +
> +#define TPG_CTRL		0x64
> +# define TPG_CTRL_TEST_EN		BIT(0)
> +# define TPG_CTRL_PHY_SEL		BIT(3)
> +# define TPG_CTRL_NUM_ACTIVE_LANES	GENMASK(5, 4)
> +# define TPG_CTRL_VC_DT_PATTERN_ID	GENMASK(8, 6)
> +# define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
> +# define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
> +
> +#define TPG_CLEAR		0x1F4
> +
> +/* TPG VC-based registers */
> +#define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
> +
> +#define TPG_VC_n_CFG0(n)	(0x68 + (n) * 0x60)
> +# define TPG_VC_n_CFG0_VC_NUM			GENMASK(4, 0)
> +# define TPG_VC_n_CFG0_NUM_ACTIVE_DT		GENMASK(9, 8)
> +# define TPG_VC_n_CFG0_NUM_BATCH		GENMASK(15, 12)
> +# define TPG_VC_n_CFG0_NUM_FRAMES		GENMASK(31, 16)
> +
> +#define TPG_VC_n_LSFR_SEED(n)	(0x6C + (n) * 0x60)
> +#define TPG_VC_n_HBI_CFG(n)	(0x70 + (n) * 0x60)
> +#define TPG_VC_n_VBI_CFG(n)	(0x74 + (n) * 0x60)
> +
> +#define TPG_VC_n_COLOR_BARS_CFG(n)		(0x78 + (n) * 0x60)
> +# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN		GENMASK(2, 0)
> +# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN		BIT(3)
> +# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN		BIT(4)
> +# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN		BIT(5)
> +# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD		GENMASK(13, 8)
> +# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN		BIT(16)
> +# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X			GENMASK(26, 24)
> +# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y			GENMASK(30, 28)
> +
> +/* TPG DT-based registers */
> +#define TPG_VC_m_DT_n_CFG_0(m, n)		(0x7C + (m) * 0x60 + (n) * 0xC)
> +# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT	GENMASK(15, 0)
> +# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH	GENMASK(31, 16)
> +
> +#define TPG_VC_m_DT_n_CFG_1(m, n)		(0x80 + (m) * 0x60 + (n) * 0xC)
> +# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE		GENMASK(5, 0)
> +# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK	GENMASK(13, 8)
> +# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK	GENMASK(31, 16)
> +
> +#define TPG_VC_m_DT_n_CFG_2(m, n)		(0x84 + (m) * 0x60 + (n) * 0xC)
> +# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE		GENMASK(3, 0)
> +/* v2.0.0: USER[19:4], ENC[23:20] */
> +# define TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD		GENMASK(19, 4)
> +# define TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT			GENMASK(23, 20)
> +/* v2.1.0: USER[27:4], ENC[31:28] */
> +# define TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	GENMASK(27, 4)
> +# define TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT			GENMASK(31, 28)
> +
> +#define TPG_HBI_PCT_DEFAULT			545	/* 545% */
> +#define TPG_VBI_PCT_DEFAULT			10	/* 10% */
> +#define PERCENT_BASE				100
> +
> +/* Default user-specified payload for TPG test generator.
> + * Keep consistent with CSID TPG default: 0xBE.
> + */
> +#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
> +#define TPG_LFSR_SEED_DEFAULT			0x12345678
> +#define TPG_COLOR_BARS_CFG_STANDARD \
> +	FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
> +
> +static const char * const testgen_payload_modes[] = {
> +	[TPG_PAYLOAD_MODE_DISABLED]		= "Disabled",
> +	[TPG_PAYLOAD_MODE_INCREMENTING]		= "Incrementing",
> +	[TPG_PAYLOAD_MODE_ALTERNATING_55_AA]	= "Alternating 0x55/0xAA",
> +	[TPG_PAYLOAD_MODE_RANDOM]		= "Pseudo-random Data",
> +	[TPG_PAYLOAD_MODE_USER_SPECIFIED]	= "User Specified",
> +	[TPG_PAYLOAD_MODE_COLOR_BARS]		= "Color bars",
> +};
> +
> +static int tpg_stream_on(struct tpg_device *tpg)
> +{
> +	struct tpg_testgen_config *tg = &tpg->testgen;
> +	struct v4l2_mbus_framefmt *input_format;
> +	const struct tpg_format_info *format;
> +	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
> +			   tg->mode - 1 : 0;
> +	u8 lane_cnt = tpg->res->lane_cnt;
> +	u8 vc, dt, last_vc = 0;
> +	u32 val;
> +
> +	for (vc = 0; vc <= MSM_TPG_ACTIVE_VC; vc++) {
> +		last_vc = vc;
> +
> +		input_format = &tpg->fmt;
> +		format = tpg_get_fmt_entry(tpg->res->formats->formats,
> +					   tpg->res->formats->nformats,
> +					   input_format->code);
> +		if (IS_ERR(format))
> +			return -EINVAL;
> +
> +		/* VC configuration */
> +		val = FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, MSM_TPG_ACTIVE_DT) |
> +		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
> +		writel(val, tpg->base + TPG_VC_n_CFG0(vc));
> +
> +		writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(vc));
> +
> +		val = DIV_ROUND_UP(input_format->width * format->bpp * TPG_HBI_PCT_DEFAULT,
> +				   BITS_PER_BYTE * lane_cnt * PERCENT_BASE);
> +		writel(val, tpg->base + TPG_VC_n_HBI_CFG(vc));
> +
> +		val = input_format->height * TPG_VBI_PCT_DEFAULT / PERCENT_BASE;
> +		writel(val, tpg->base + TPG_VC_n_VBI_CFG(vc));
> +
> +		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(vc));
> +
> +		/* DT configuration */
> +		for (dt = 0; dt <= MSM_TPG_ACTIVE_DT; dt++) {
> +			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
> +					 input_format->height & 0xffff) |
> +			      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
> +					 input_format->width & 0xffff);
> +			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, dt));
> +
> +			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
> +			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, dt));
> +
> +			if (tpg->hw_version == TPG_HW_VER_2_0_0) {
> +				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
> +				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
> +						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
> +				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
> +						 format->encode_format);
> +			} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
> +				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
> +				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
> +						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
> +				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
> +						 format->encode_format);
> +			}
> +			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, dt));
> +		}
> +	}
> +
> +	/* Global TPG control */
> +	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
> +	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
> +	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
> +	writel(val, tpg->base + TPG_CTRL);
> +
> +	return 0;
> +}
> +
> +static int tpg_reset(struct tpg_device *tpg)
> +{
> +	writel(0, tpg->base + TPG_CTRL);
> +	writel(1, tpg->base + TPG_CLEAR);
> +
> +	return 0;
> +}
> +
> +static void tpg_stream_off(struct tpg_device *tpg)
> +{
> +	tpg_reset(tpg);
> +}
> +
> +static int tpg_configure_stream(struct tpg_device *tpg, u8 enable)
> +{
> +	if (enable)
> +		return tpg_stream_on(tpg);
> +
> +	tpg_stream_off(tpg);
> +
> +	return 0;
> +}
> +
> +static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
> +{
> +	if (val >= 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
> +		tpg->testgen.mode = val;
> +
> +	return 0;
> +}
> +
> +static u32 tpg_hw_version(struct tpg_device *tpg)
> +{
> +	u32 hw_version = readl(tpg->base + TPG_HW_VERSION);
> +
> +	tpg->hw_version = hw_version;
> +	dev_dbg(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
> +		(u32)FIELD_GET(HW_VERSION_GENERATION, hw_version),
> +		(u32)FIELD_GET(HW_VERSION_REVISION, hw_version),
> +		(u32)FIELD_GET(HW_VERSION_STEPPING, hw_version));
> +
> +	return hw_version;
> +}
> +
> +static void tpg_subdev_init(struct tpg_device *tpg)
> +{
> +	tpg->testgen.modes = testgen_payload_modes;
> +	tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
> +}
> +
> +const struct tpg_hw_ops tpg_ops_gen1 = {
> +	.configure_stream = tpg_configure_stream,
> +	.configure_testgen_pattern = tpg_configure_testgen_pattern,
> +	.hw_version = tpg_hw_version,
> +	.reset = tpg_reset,
> +	.subdev_init = tpg_subdev_init,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1de35bcd8e5fc6eaa9dab537960520b2c07dd830..bb4efeae55ceea2a6e0109b64decd3be11dd26d5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3559,6 +3559,54 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources tpg_res_8775p[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "tpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "tpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "tpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID0 */
>   	{
> @@ -3963,6 +4011,54 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources tpg_res_x1e80100[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csid_csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csid_csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csid_csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csid_res_x1e80100[] = {
>   	/* CSID0 */
>   	{
> @@ -4076,7 +4172,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
>   		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
>   			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
>   			  "vfe0" },
> -		.clock_rate = { { 0 },
> +		.clock_rate = { { 400000000 },
>   				{ 0 },
>   				{ 0 },
>   				{ 0 },
> @@ -4100,7 +4196,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
>   		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
>   			   "cpas_fast_ahb", "cpas_vfe1", "vfe1_fast_ahb",
>   			   "vfe1"  },
> -		.clock_rate = { { 0 },
> +		.clock_rate = { { 400000000 },
>   				{ 0 },
>   				{ 0 },
>   				{ 0 },
> @@ -4124,7 +4220,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
>   		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
>   			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
>   			   "vfe_lite_csid" },
> -		.clock_rate = { { 0 },
> +		.clock_rate = { { 400000000 },
>   				{ 0 },
>   				{ 0 },
>   				{ 0 },
> @@ -4147,7 +4243,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
>   		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
>   			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
>   			   "vfe_lite_csid" },
> -		.clock_rate = { { 0 },
> +		.clock_rate = { { 400000000 },
>   				{ 0 },
>   				{ 0 },
>   				{ 0 },
> @@ -5030,6 +5126,13 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss->csiphy)
>   		return -ENOMEM;
>   
> +	if (camss->res->tpg_num > 0) {
> +		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
> +					  sizeof(*camss->tpg), GFP_KERNEL);
> +		if (!camss->tpg)
> +			return -ENOMEM;
> +	}
> +
>   	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
>   				   GFP_KERNEL);
>   	if (!camss->csid)
> @@ -5219,11 +5322,13 @@ static const struct camss_resources qcs8300_resources = {
>   	.version = CAMSS_8300,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8300,
> +	.tpg_res = tpg_res_8775p,
>   	.csid_res = csid_res_8775p,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_8775p,
>   	.icc_res = icc_res_qcs8300,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
> +	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
>   	.csid_num = ARRAY_SIZE(csid_res_8775p),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
> @@ -5233,11 +5338,13 @@ static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8775p,
> +	.tpg_res = tpg_res_8775p,
>   	.csid_res = csid_res_8775p,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_8775p,
>   	.icc_res = icc_res_sa8775p,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
> +	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
>   	.csid_num = ARRAY_SIZE(csid_res_8775p),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
> @@ -5360,12 +5467,14 @@ static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_x1e80100,
> +	.tpg_res = tpg_res_x1e80100,
>   	.csid_res = csid_res_x1e80100,
>   	.vfe_res = vfe_res_x1e80100,
>   	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
>   	.icc_res = icc_res_x1e80100,
>   	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>   	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
>   	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inpsiron14p

