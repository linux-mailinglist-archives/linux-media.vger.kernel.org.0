Return-Path: <linux-media+bounces-47820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A256CC8DB74
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F336D4E656B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C613327C0C;
	Thu, 27 Nov 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeZg9183"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1122541B
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238573; cv=none; b=fUySkzJx1qFgLXlD+90q6AyNpBtsG+9dC41y6A1sFWF6ZyoVaPK2VZPNdKyJ5wGYQBvQsIWboppLXR1jJ4/Rtwn9Q5TYRr5MesqQJypXcHs/e1Ewzv2JcZTScqa83tuaVf8wNe1IillDOBFP/fJrrgygXqvikOVoBsQy0qw94QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238573; c=relaxed/simple;
	bh=5y6CmgAS1V5MWpepkpSqAGDTqHuus6SEi+aEwCqH3FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMZ5BYMBDLHdcATPpAAbOuJK8ZfF+8IsHcg/n8zSgjtHcc7G9O+uIDMgRHiUEsei3jLjG8ih4A9q4p1hJkuZWrGoManMVq227YTkcM343hOUkZZbyrabhGuneU0FbM/sx3MU0L9F4+ole1zJJOO06H7BnffLaEMDDfkq7xlyno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeZg9183; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso6319935e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764238569; x=1764843369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EV7QqHdqC/+9cLWqbuFdfIc83eswgx9YJgp4pbUoGrg=;
        b=OeZg9183bEWq735bh/HOFYN5Y0INKVHK9fHIm6wqHLufsNOx9tYoEsWGYEYoAwVM+N
         YYSki1UN6M/ZdDdC+cF0IENGdSfQxAH6RpaZX5vx7e/qThIHDigHaoFvGEjAJmLrNc1C
         Cf4LTfEt5tvd3GmckJy/3WRJsnTENJmqUnuuTzuWH/1xeHh6KG/vmDbBUOFJlAUDpFuW
         wO00Z6Uw18p0Gmh8WkP9W0NXKYlpOIfJNropXFF+Toif2PWh8uH8GvO4yWjLO2lrXzAp
         ezDLcarBpGHmoZEd5+hnfMlv/YDd5UYtVKc+m9BoN0BktksJ9ZddFKpIXLedO7RY9T2M
         PJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238569; x=1764843369;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EV7QqHdqC/+9cLWqbuFdfIc83eswgx9YJgp4pbUoGrg=;
        b=BNuRgeNDx371SUK8s4YPi0kDlgEBAwm/EmrFBn8mmD9OhU9Qx//eJi1JFyzJMAMrbJ
         0zUTu2zXziLfaWOGkc72qJjMSgiEaccz4b/dnyYIrkfeP5PNQgHt5cHQSkNZh/7GNWPd
         NYZ4cWrcc8IZe9kRR0kciqYfQ0rXFKADdUdtZbCA7eBl/N5kgt1ATtnm8C1pyQCjiMTc
         rpg94kwzD6vgll5oHK0pi7KZVZlmRArd8Y24Ach7H9goa4NdGqBzOpAGq1oa0HIB7a/T
         OqG5COx8NV7CUhRJKlPlNXEG47Fp3O/rEV71orFnIcIEqX/GjSAOEODKUMIctXT2Qt51
         6UwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgyYNjBOr1+eQ6rDsyo8BTvuXJr6a2XJdTW1vTMi/l42KlwhSmhSUbz40Wheu22Es+PxfsVH3P1AwbRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCiAh92EacmBi7joLykbYm17U7BfpV2QEeds42JjZ4D0HBQF3x
	t6Q/qQr/Kfp6nvEvmWS1UpOxXH+9kLL108i3Jyn5Z2Lfoq/Zxpi6T+lyAqXU4b53g+Q=
X-Gm-Gg: ASbGnctkPyv4jeQOZe72P7A9K5126VkAnrZ+0uFo4mKIz4Mg5xd5AtQe5CxhvWuyT6b
	IH+xTYUcskJsLLnATihHqle7AT669doogAcRtKTshWGy8G9Gcj2ujKd6GNJRyDunkJJ0RNTpTjv
	1DxhFw/oJuhBin1PfnSN7AaMDJ7siRdgN4uil/+DngVpYXNYHtrBkzYySHytOZ2rD/lqqW48H57
	Gp+H4cUgPNVtDEvAIMAt1kq1AX2GFT0YCkxGk85ROAdzPmw31DQ1TB8bOBtefxx+O9Xvsemg54E
	1bqXOAhmEWkIjf9lt6s8++y+Z8udFiRNk/gK2jgLrSZ4Mn22o53m1g6nNcEIkfmRRcj6PLALcHA
	dVtAIebEq8nBmFwBeKzjCQXXG/N2IqnAtfrNsYdFN6d9frX/THp4bH+2sGSa/95cq9QTTXPW1hY
	hCmjhkaPy3KMc/8AoVg1Nzfx237Vt2oklQqpwbAtL0NY+hexF2LCFOyf+MFYeybOg=
X-Google-Smtp-Source: AGHT+IG7Qb1umIooFSf3GatBLMLLBDSIXpTxSYw9SyfVXMDKifm1pT7bxobkp49EjOXRmMsbQhHTmg==
X-Received: by 2002:a05:600c:6296:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-477c10d7013mr232732285e9.11.1764238568281;
        Thu, 27 Nov 2025 02:16:08 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111561c2sm28158805e9.4.2025.11.27.02.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:16:07 -0800 (PST)
Message-ID: <47e40d25-59c8-4dc8-aa55-4a1da6adf85f@linaro.org>
Date: Thu, 27 Nov 2025 10:16:05 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] media: qcom: camss: vfe: Add support for VFE 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-5-de27f9a67ce6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-5-de27f9a67ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 04:43, Hangxiang Ma wrote:
> Add Video Front End (VFE) version 1080 as found on the Kaanapali SoC.
> 
> The FULL front end modules in Kaanapali camera subsystem are called TFEs
> (Thin Front End), however, retaining the name VFE at places to maintain
> consistency and avoid unnecessary code changes.
> 
> This change limits the VFE output lines to 3 for now as constrained by
> the CAMSS driver framework.
> 
> Kaanapali architecture requires for the REG_UPDATE and AUP_UPDATE to be
> issued after all of the CSID configuration has been done. Additionally,
> the number of AUP_UPDATEs should match the number of buffers enqueued to
> the write master while it's being enabled.
> 
> Although the real time data from TFE goes through the RT_CAMNOC, we are
> required to enable both the camnoc_rt_axi and camnoc_nrt_axi clocks for
> the PDX_NOC, that follows both the RT and NRT NOCs in this architecture,
> to ensure that both of the latter are idle after reset.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 143 +++++++++++++++
>   5 files changed, 350 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 3a7ed4f5a004..dc41b0d6dc21 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -22,6 +22,7 @@ qcom-camss-objs += \
>   		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> +		camss-vfe-1080.o \
>   		camss-vfe-gen3.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 000000000000..9ad3dee2e80b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +/* VFE-1080 Bus Register Base Addresses */
> +#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
> +#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
> +
> +#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
> +#define		WM_CFG_EN				BIT(0)
> +#define		WM_VIR_FRM_EN				BIT(1)
> +#define		WM_CFG_MODE				BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
> +
> +/* VFE lite has no such registers */
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
> +
> +/*
> + * IFE write master client IDs
> + *
> + * VIDEO_FULL			0
> + * VIDEO_DC4_Y			1
> + * VIDEO_DC4_C			2
> + * VIDEO_DC16_Y			3
> + * VIDEO_DC16_C			4
> + * DISPLAY_DS2_Y		5
> + * DISPLAY_DS2_C		6
> + * FD_Y				7
> + * FD_C				8
> + * PIXEL_RAW			9
> + * STATS_AEC_BG			10
> + * STATS_AEC_BHIST		11
> + * STATS_TINTLESS_BG		12
> + * STATS_AWB_BG			13
> + * STATS_AWB_BFW		14
> + * STATS_AF_BHIST		15
> + * STATS_ALSC_BG		16
> + * STATS_FLICKER_BAYERRS	17
> + * STATS_TMC_BHIST		18
> + * PDAF_0			19
> + * PDAF_1			20
> + * PDAF_2			21
> + * PDAF_3			22
> + * RDI0				23
> + * RDI1				24
> + * RDI2				25
> + * RDI3				26
> + * RDI4				27
> + *
> + * IFE Lite write master client IDs
> + *
> + * RDI0			0
> + * RDI1			1
> + * RDI2			2
> + * RDI3			3
> + * GAMMA		4
> + * STATES_BE		5
> + */
> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +
> +	wm = RDI_WM(wm);
> +
> +	/* no clock gating at bus input */
> +	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +
> +	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> +	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +	/* no dropped frames, one irq per frame */
> +	if (!vfe_is_lite(vfe)) {
> +		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +	}
> +
> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
> +
> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
> +{
> +	wm = RDI_WM(wm);
> +	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
> +			       struct vfe_line *line)
> +{
> +	wm = RDI_WM(wm);
> +	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
> +}
> +
> +static void vfe_reg_update_1080(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear_1080(struct vfe_device *vfe,
> +					     enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_1080 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init_1080(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_1080;
> +}
> +
> +static void vfe_global_reset_1080(struct vfe_device *vfe)
> +{
> +	vfe_isr_reset_ack(vfe);
> +}
> +
> +static irqreturn_t vfe_isr_1080(int irq, void *dev)
> +{
> +	/* nop */
> +	return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt_1080(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_1080 = {
> +	.global_reset = vfe_global_reset_1080,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr_1080,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.reg_update = vfe_reg_update_1080,
> +	.reg_update_clear = vfe_reg_update_clear_1080,
> +	.subdev_init = vfe_subdev_init_1080,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt_1080,
> +	.vfe_wm_start = vfe_wm_start_1080,
> +	.vfe_wm_stop = vfe_wm_stop_1080,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update_1080,
> +};
Since this patch isn't applied, you should repost this file with the 
right name.

---
bod

