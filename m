Return-Path: <linux-media+bounces-44027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A9BC6F2B
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 01:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF69401D44
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 23:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F20F2C3769;
	Wed,  8 Oct 2025 23:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eiT2hoft"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943C204F8B
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 23:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967451; cv=none; b=FlZXp8ewYlSuloZ2uVl3lp9Q7xFNAt5xwYYMb5wYitNFOwHwSE9T2YzBt1t8shaaSYR+3IkZWNTdUM1ETKJMOhBQ+hQpji+8JERkgDeEJOWYqap5HTvchuil8sUdm1pFvCUBagXQqP0iPP2GSlCG6Gua3pOC1HdF6Bk0i2+wZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967451; c=relaxed/simple;
	bh=PepEMbQ1yjF5c5BaPwxWL9iAuc14/s0OFz6xe0oNLLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRxhPuQQv6DGpTd6q2XF7/XMCF63lf6xnmY4VV51+3mMr6GF4aLmp263XsDd0ofrFaDGOCQU+yfD/mXreMvh2cjC2tQRJN6cl7LEBhKwIMcWAEOHiFxeCzKN+IBp1M74avhofX9zeQsnrYDrkRBPbNJWO8eE75hw9597uhCic3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eiT2hoft; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso2246515e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 16:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759967448; x=1760572248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+edhMv+0BzSlGdfFXwn7RqYiQQ8tm9NoUNnWq+dQx8=;
        b=eiT2hoftdsWDJpwlLiZY29yaf5Nj4ncn2jodcOcCvNdGSyQofbHk6NP8QPANN8rPVX
         HLcryKD8SyWF+xp0PUEEU/NkX7Qa6Gj/1uw9uL08Qdxy1Bgl2tcq/Ayds8GrAyUxDJmS
         Tlkws3LAL1hTP0YTcLLjilVrew+6H37br6yBj1VOtoqoym+qA1RIwa45oDgKyOosbkT2
         sSsrtn0LujDjCEZyh2NDkOL1haxzlDsAmL5+85uI0uaPHuXSUN3xKWUuvLFNWQiCtLvd
         1OuiyMydu/2cr++4M5XFXrDX/RyJQ3u/IJ4dr/H1K5+Y9qLI2q7sTRmgbYpv8J/k4SGc
         kwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967448; x=1760572248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+edhMv+0BzSlGdfFXwn7RqYiQQ8tm9NoUNnWq+dQx8=;
        b=pIK3f00Lt7RQi3rPua+uxF49IV7goP3VIfa03HmfQ8S6Fxt0Q+hHWqO34Orcd/Rqsm
         QUr4WZ1duk0TZI3CqBOHJui0yROLNwZ6erjTwC02cYRPmuEOn3hq6w+2V7ACVLdTLgMo
         OpthAyUchqKzH//W8My4fpmo0n6aI83k9nbdS9cITdKdoHcYbDd5cg1Hdcmm+aReXipd
         QYpHta3PQU7itoeSgRkR6T0RNNxjgwp+CgZA5r/Y95lGwlMERSAodzsYkME3i6hcV4ck
         VpzD2UEvSIESKNkPPOsLR45rOsk+dkgXlxV3H8yxSpcgr/nOwjFKQJqFEeaNxo/LM7MN
         dxbA==
X-Gm-Message-State: AOJu0YxxbsPpYDW8BwWBv4RHa3JPysXP6II4pmk5IJhw9hUnz55lkjOS
	A/aXSjXG04Nzzg01AaPNViEDVUpj7MnLHDOd7wxnuDQvzgt2+dLFn8fOzYFxayhTAs8=
X-Gm-Gg: ASbGncuEJd5IlR4d97yUcCYsbhgOjvU5CfmD6YEbTl84kJ6CvmjOg44GS4LdbXpulhb
	YNqVPZX0S9jZ8rptxLQ8XVt5fJczxoqq+fL002n+qokxyb9hst/z5DVpxp0r4jflfrPtG2iAiwz
	JrnpFPQyZjHM3yxXucEaFtMAyjngG1uy1GVF6EtTJPoqke4GlD3en/sfUPut0bnDPj3I7Vd8D+Q
	Qn/GBLF6S013FW6iDbmlptwGVI+ZV48GRG2fmnBsu8ZN5HnhqfhBXrUrN2zYJr9T+uvJ4lOsiLX
	AuyDIuw4K8rnCklVb51GGXUWhOtH7YZ/MwK/upbNL6faNFsL/E4nkgvrhf9drxSBACZxpm8bpXw
	04EtIu4R5JOjXW3/HZ+FWiH2HDqQhjSLsHqSDfWE6tHeaFRNIW8GBs4h+J3rNUhqyvoZGH4a/D6
	ToDbVr74ZppkOtBZ+b
X-Google-Smtp-Source: AGHT+IEpfshDCqBAHwNTTUCD0shn/QO6Rxgp954tKBhVfZ8/aMJ0AhoH55Q9PWrHm6CVn9Z286wuwA==
X-Received: by 2002:a05:600c:a41c:b0:46f:aac5:daf with SMTP id 5b1f17b1804b1-46faac50ea8mr23797905e9.35.1759967447736;
        Wed, 08 Oct 2025 16:50:47 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf7f80sm56797095e9.1.2025.10.08.16.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:50:46 -0700 (PDT)
Message-ID: <536e8aed-a25b-4beb-830d-9b073d02905e@linaro.org>
Date: Thu, 9 Oct 2025 00:50:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <Upsv0z22Lrbf1B-YW_axrnAADZ6xN-nr46DpXCCNMZN5AHjEkowuebjDlRs7tpqRCSwQLaiKUk-_zMIdsd0YGg==@protonmail.internalid>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> Simplify adding new platforms by moving common registers definitions
> from VPU 3.x and "common" file to the header with other register
> defines.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 35 --------------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 -----------------
>   .../platform/qcom/iris/iris_vpu_register_defines.h | 56 ++++++++++++++++++++++
>   3 files changed, 56 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 339776a0b4672e246848c3a6a260eb83c7da6a60..78aede9ac497abafc0545647c34a53c63c595f72 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -11,48 +11,13 @@
>   #include "iris_vpu_common.h"
>   #include "iris_vpu_register_defines.h"
> 
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
>   #define AON_MVP_NOC_RESET			0x0001F000
> 
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> -#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> -#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> -#define CORE_CLK_RUN				0x0
> -/* VPU v3.5 */
> -#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> -
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> -#define CORE_BRIDGE_SW_RESET			BIT(0)
> -#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> -
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
>   #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>   #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> 
>   #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> 
> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>   #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>   #define SW_RESET				BIT(0)
>   #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..2d6548e47d47967c1c110489cb8088130fb625fd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -11,13 +11,6 @@
>   #include "iris_vpu_common.h"
>   #include "iris_vpu_register_defines.h"
> 
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -
> -#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
> -
> -#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> -#define CLEAR_XTENSA2HOST_INTR			BIT(0)
> 
>   #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
>   #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
> @@ -35,42 +28,6 @@
>   #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
>   #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
> 
> -#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
> -#define HOST2XTENSA_INTR_ENABLE			BIT(0)
> -
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
> -#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
> -#define CPU_IC_SOFTINT_H2A_SHFT			0x0
> -
> -#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> -#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> -#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
> -
> -#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
> -#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
> -#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
> -
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -
> -#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>   static void iris_vpu_interrupt_init(struct iris_core *core)
>   {
>   	u32 mask_val;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..9955367a9f8179d2e364c41dcfe8ad445a0a13f4 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -9,9 +9,65 @@
>   #define VCODEC_BASE_OFFS			0x00000000
>   #define CPU_BASE_OFFS				0x000A0000
>   #define WRAPPER_BASE_OFFS			0x000B0000
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_BASE_OFFS				0x000E0000
> +
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> 
>   #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
> 
> +#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> +#define CLEAR_XTENSA2HOST_INTR			BIT(0)
> +
> +#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
> +#define HOST2XTENSA_INTR_ENABLE			BIT(0)
> +
> +#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
> +#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
> +#define CPU_IC_SOFTINT_H2A_SHFT			0x0
> +
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +
> +#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> +#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
> +
> +#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
> +#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
> +#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
> +
>   #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> +
> +#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> +
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +#define CORE_CLK_RUN				0x0
> +
> +#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> +
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> +#define RESET_HIGH				BIT(0)
> +
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> 
>   #endif
> 
> --
> 2.47.3
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

