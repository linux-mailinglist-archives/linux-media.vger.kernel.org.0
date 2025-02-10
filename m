Return-Path: <linux-media+bounces-25955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF678A2FACB
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6EC161EF2
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 20:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCEB264622;
	Mon, 10 Feb 2025 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rm2uRo7V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E920264620
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219903; cv=none; b=LjQE5oGrOPF+xhsUBocELFIihqePDQwpdas0gbm8zvDXXZucLjPWeA1E9DF919ECfK5hBg6dTk/YKODEpvP2misr4iJsPQL1At/yfMslsiXQylodtfIlsAWH4iL2udMRIT5jMxHyQiXqrBDcJOYTbiP3u4J2ZSRPxdsX2z3n49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219903; c=relaxed/simple;
	bh=PSVGvr9r7eFct8bNwiYPCToFoXZCpc/M2wn+1bNwwn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3v8/9YBJ/nXQsez/OhDh5NklKAv7y+JYrfDzSfSG2rKv54HUfAd4ooVB3SPhED0vVGZbCDGoyfzAlMLL+uo6tBmwAxdWpgU3DK1l9rndtSaxgrXibZdD9KSPyIw23j1L4j8qPjjKkcpieiAWJbkwyomdjE84AZI4ruYI84qq+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rm2uRo7V; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc660b56cso3714285f8f.0
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 12:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739219899; x=1739824699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFVxtidowERMRc2GRZGGyno22q2Ajq4Bb5bd90iWpIY=;
        b=Rm2uRo7VFovAeJSk3cc0iIH19dUA+czHHs2iinYyDG7qjeipk7RyNrNSyD1JovJqb5
         Gac92MwBxVLgzvz3SGmiTSpYt7AavQcDsXT+65x/CjefYV8gL1IKUT35Wcy7S5W9o9Gk
         x34SNlAwgjssdW08VBqP7su7opYVVlAzoCCy7yC9wA53lucwrHZ+oJhBEWSHJbWspL8L
         46Ey+mKvNS1p+pMCG9vUpQVUBL2Hr//qqvjQ1P33f5WkbGNqEzfz2oAB1tYvzo7WbSMI
         js/npqeaPI6dXcbLohyGgC7ebE1QM2c69PWwq7PJWtO1G8IGihZY7K3OY422+n/LgfuR
         u2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219899; x=1739824699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFVxtidowERMRc2GRZGGyno22q2Ajq4Bb5bd90iWpIY=;
        b=JHeULotRdJgt3lrHcuFYP78Fk/Pmb1XghqtbnF+o4YTM32rVgys3mEJZxmTgEJEM7T
         sQ/t22ygojin2zprAb9LBzr9dqiDUmTZokuXDnXZfQgjqtmgs2ZWP2xYs+Ls1XQr0dc3
         P07E1iAd8krmcptDFs6ZNpTwKeMPKSYClbSlXp5/NDjad59o/+A15cIYS3vSoWf7adKs
         ybB9SYzd8eLydh5P7JS/OgXbXXv1bcI1ndUrVckTK9ovUZD94O9Cy0F6zbiLdwdVRo0I
         npE6sb3AadSiALBjgw6/CHiY5s0Q7s2adiaehcfylOS90TPU7gTUo54Sce24ucvzbKBo
         HC+w==
X-Gm-Message-State: AOJu0YzUHdLdsiXrPT0Cm1NzeDFODhOFjzksKVg5qchuXKn2sK+FGoeH
	p+cDinzWixXoamxjqXtBOF/R7kEBCmKMvQf1dTDnNIcl0nLQZNQOJq4PVu1mUGg=
X-Gm-Gg: ASbGncvtro4yvLCm1+KEvO8IB5pf9cHV4GGlausNmEzK0KtZ210AWvaCEQ/MijsiaOx
	sm6kM7r0QC/A3PmGJkELQeAr7SgMaunskZlPriL36ykUgd7GjjMu+S9LMiE0Rhw7lnwlNZBiAIw
	P3QOe1iNlJDif766aZWCWLkAwjSdBbEzxrY11zGZnVRu1GGVYU1+44qFRnNgfpSsrcNFtgTpXRm
	0EqYuaBFppmBBZNAd/UQ5IEC8g+0USO7Yp73ERxQJLB8DudfRREnYmS4CsyxrefHkw2ZFaUQyo/
	pguyp5z+BzRoYpMp8IxmN2NUHsfAKMBlrlPShO1rnWxPtVTKlK5Tn+SBrg==
X-Google-Smtp-Source: AGHT+IEpzChVf01tMLaok2Mtr3axF6m/BwgR3Eh4IM2FXnH6HagBFGXNIicmufP6s/oLVeGxbxQbig==
X-Received: by 2002:a05:6000:1865:b0:38c:5e03:5bb with SMTP id ffacd0b85a97d-38dc9138e84mr13870763f8f.41.1739219898538;
        Mon, 10 Feb 2025 12:38:18 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcdb54668sm9922250f8f.35.2025.02.10.12.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:38:17 -0800 (PST)
Message-ID: <f35f3b57-4cc5-432d-8a4d-8d0cfdbee7a5@linaro.org>
Date: Mon, 10 Feb 2025 20:38:16 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] media: qcom: camss: Add support for VFE 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210162843.609337-1-quic_vikramsa@quicinc.com>
 <20250210162843.609337-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250210162843.609337-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2025 16:28, Vikram Sharma wrote:
> Add support for VFE found on SA8775P (Titan 690). This VFE is
> different from vfe 780 w.r.t few register offsets.
> It supports two full and five lite VFE.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../media/platform/qcom/camss/camss-vfe-690.c | 163 +++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>   drivers/media/platform/qcom/camss/camss.c     | 192 ++++++++++++++++++
>   5 files changed, 361 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-690.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index f1d0e9a00220..284f1775f62f 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -18,6 +18,7 @@ qcom-camss-objs += \
>   		camss-vfe-4-8.o \
>   		camss-vfe-17x.o \
>   		camss-vfe-480.o \
> +		camss-vfe-690.o \
>   		camss-vfe-780.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
> new file mode 100644
> index 000000000000..92c92065f65b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v690 (SA8755P)
> + *
> + * Copyright (c) 2025 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define VFE_TOP_CORE_CFG		(0x24)
> +#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x480 : 0x400)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
> +#define	WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xFC)
> +
> +#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
> +#define		WM_CFG_EN			BIT(0)
> +#define		WM_VIR_FRM_EN			BIT(1)
> +#define		WM_CFG_MODE			BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
> +
> +/*
> + * Bus client mapping:
> + *
> + * VFE:
> + * 16 = RDI0, 17 = RDI1, 18 = RDI2
> + *
> + * VFE LITE:
> + * 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
> + */
> +#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +
> +	wm = RDI_WM(wm);
> +
> +	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +	/* no clock gating at bus input */
> +	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
> +	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	writel(WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF,
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +
> +	writel(0x0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +	/* TOP CORE CFG */
> +	writel(0x600000, vfe->base + VFE_TOP_CORE_CFG);
> +
> +	/* no dropped frames, one irq per frame */
> +	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
> +
> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> +{
> +	wm = RDI_WM(wm);
> +	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +			  struct vfe_line *line)
> +{
> +	wm = RDI_WM(wm);
> +	writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
> +		wm, addr);
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_690 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_690;
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +	vfe_isr_reset_ack(vfe);
> +}
> +
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +	/* nop */
> +	return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_690 = {
> +	.global_reset = vfe_global_reset,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9ffa6bc72cf1..71857c68bbed 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -908,7 +909,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>   
>   	return (!strcmp(clock->name, vfe_name) ||
>   		!strcmp(clock->name, vfe_lite_name) ||
> -		!strcmp(clock->name, "vfe_lite"));
> +		!strcmp(clock->name, "vfe_lite") ||
> +		!strcmp(clock->name, "camnoc_axi"));
>   }
>   
>   /*
> @@ -1972,6 +1974,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   		ret = 16;
>   		break;
>   	default:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 9dec5bc0d1b1..a9322f4440ae 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>   extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_480;
> +extern const struct vfe_hw_ops vfe_ops_690;
>   extern const struct vfe_hw_ops vfe_ops_780;
>   
>   int vfe_get(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9458cba1b50f..4df31c89c20c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2478,6 +2478,196 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources vfe_res_8775p[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
> +			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
> +			   "icp_ahb"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 0 },
> +			{ 0, 80000000 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
> +			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
> +			   "icp_ahb"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 0 },
> +			{ 0, 80000000 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +
> +	/* VFE2 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe-lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe-lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite2" },
> +		.interrupt = { "vfe-lite2" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE5 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite3" },
> +		.interrupt = { "vfe-lite3" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE6 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite4" },
> +		.interrupt = { "vfe-lite4" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_690,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
> @@ -3469,9 +3659,11 @@ static const struct camss_resources sa8775p_resources = {
>   	.csiphy_res = csiphy_res_8775p,
>   	.csid_res = csid_res_8775p,
>   	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
> +	.vfe_res = vfe_res_8775p,
>   	.icc_res = icc_res_sa8775p,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
>   	.csid_num = ARRAY_SIZE(csid_res_8775p),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   	.link_entities = camss_link_entities
>   };

There's a pretty superficial difference between 780 and 990

git diff drivers/media/platform/qcom/camss/camss-vfe-690.c 
drivers/media/platform/qcom/camss/camss-vfe-780.c
  
                                           linux-media-qcom-camss/master?
3c3
<  * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v690 
(SA8755P)
---
 >  * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 
(SM8550)
5c5
<  * Copyright (c) 2025 Qualcomm Technologies, Inc.
---
 >  * Copyright (c) 2024 Qualcomm Technologies, Inc.
15,16c15
< #define VFE_TOP_CORE_CFG		(0x24)
< #define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x480 : 0x400)
---
 > #define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)

19c18
< #define	WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
---
 > #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
21c20
< #define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xFC)
---
 > #define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
46,47c45,46
<  * VFE:
<  * 16 = RDI0, 17 = RDI1, 18 = RDI2
---
 >  * Full VFE:
 >  * 23 = RDI0, 24 = RDI1, 25 = RDI2
50c49
<  * 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
---
 >  * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
52c51
< #define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
---	
 > #define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
61d59
< 	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
62a61,62
 > 	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
 >
65c65
< 	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
---
 > 	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
67c67
< 	writel(WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF,
---
 > 	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
71,75c71
<
< 	writel(0x0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
<
< 	/* TOP CORE CFG */
< 	writel(0x600000, vfe->base + VFE_TOP_CORE_CFG);

What's this for ?

---
 > 	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
99c95
< 	writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
---
 > 	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
120c116
< static const struct camss_video_ops vfe_video_ops_690 = {
---
 > static const struct camss_video_ops vfe_video_ops_780 = {
127c123
< 	vfe->video_ops = vfe_video_ops_690;
---
 > 	vfe->video_ops = vfe_video_ops_780;
147c143
< const struct vfe_hw_ops vfe_ops_690 = {
---
 > const struct vfe_hw_ops vfe_ops_780 = {

I don't really see much logical difference here to justify all of the 
copy/paste code.

Could you comment on some set of offsets passed in the VFE resources 
structure ?

If not an offset then perhaps a camss-vfe-gen3.c file which contains the 
shared code and wrappering that shared code in camss-vfe-690 and vfe-780 
respectively ?

Actually, I think that's the way to go, for his level of similarity it 
should be possible to move the share code 1:1 in many cases to a shared 
file.

---
bod

