Return-Path: <linux-media+bounces-47260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B85C68AB3
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FDC24E2478
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51453328274;
	Tue, 18 Nov 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdUOlAef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4DB30E83D
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459918; cv=none; b=SBpSAxAQ7RlXyWAFhlWfk+GI5tcMR34a+ssfh8zqk5mjUp2D1SRyksa6eWaqo7LywFtdqFSmiN1mhcIE1w7oFEF109eup88GTsIY4IsMGq/yyIfSAUwU1A9xGav1ojdxTL2nr06JFuZqdl618SbpJ7AKERx/IyALLohng7/7Tqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459918; c=relaxed/simple;
	bh=B1N+pK+1/zl1iKTa5pki4c1qcP8g2LXoHtYOK0M2ljE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCJUnDPyDivZ963XCMMUFTxl/66t07PLKJ5rOcOMGAR15Ndy7koH8BEHuq+Y+1O1V+0sSMOwF0rnwg2Usif/E7DGMKkm0wh99lI2pbqOqqLt9q8ENoN197tvI35kPZvxM4RtiWRClrPZa3QCeC/Ypk+P3a88NICjVvg+KUfoSP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdUOlAef; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so22826855e9.2
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 01:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763459915; x=1764064715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXWPh7cqdEaM++SI1DeBswoU+DUwzrAlFay//amOY+E=;
        b=YdUOlAef4Mu7/god+uEYv9oAzQrcR0b1BFx5vdmlU4CQ1L6sIY5nyk2mVP9PX+gLrY
         0VskvYifJZKnrmbhJHxPAVyviyjuK/D/ggEdRfjZOSfhsNiUfG0rRm9NxqThIVJ3gP+t
         Yf2+39Zk7aPdxnheiampDDoN0IFohUaHFkImA0vutenSf0lND4GtbbM5XbS2XzH9WM+w
         8auPCErh7py1U276ipfhQJFbh3Ds7ajVhTA2yyWPu+qoFfema2GxDrfhInQ7NgrrsA53
         sAnSL/KipodZErZVPq3yFz9dZ3vnoOSXvHGX0xcR4b8F73qTFB4wASvMt9/fzkgvRjVi
         J/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459915; x=1764064715;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXWPh7cqdEaM++SI1DeBswoU+DUwzrAlFay//amOY+E=;
        b=SAkqgGPROVMoB4zzJDPe0YGAWbwYyP7xrlc2P20GDTvf5WPadUqsXgfkyxZryjFiKp
         maH4MNYyKJmSxh6KKKJFq28MVLFlAtcADZ4uftCKnIzSDIW3s9L2abYTy5ArUkvmLcTN
         g9R/C+0s4gwl/aT1F6ORYLYrZthlBM6lPAYQTAr6xKqvfvG+kqNHqo+eX1Z0eSyuUkUR
         RX7B+I1hpqc25NC96Adg3u4u/g+ly1bunJ+oIhTg7oK7EONQ/eTRfCkcelOKXfur0bvk
         AKHLnuppBaDI8oDncPc/BC6owmoizoxLcE0DweOGfI0UWP9lI3wuuDnUxC3ubG+ugTc7
         upVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvHgmAwEZ7mLSiX+XNBV/nIbkO696spbbxcvvD8KaNAo8m6bNHdkvQY4zaBQ3iXWKxN7HgY8DxCPcdSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6sldb1WT4st9WdFiRiyi/91NghLAYG7pa7PvprlySTK6/ZUC
	bQUwn+3B6Af8kyq6ntZcKUzYKh2fiRp1WFdVbLfl+8B95EjN9x0sAM8Gcxi/2SWM7KI=
X-Gm-Gg: ASbGncvYc9du/rz5wypl5/omQomecp4hxxPmid+F4VomDiAVFlEk/3C9nHwGFxsqAoM
	pzBZvJH2wPNP2pSL9EZ8vGhamueG0cyKcJzBWiRQjr7nbADfB5gwedKMH8AzOCbkcUfq3/uP55l
	1TD6cmDBgdp65Rn1JizMVinVC68d9vfSOp4foFW2sVfoqgCqO41i8kXvbi3V29Q/IsqFWrWXUqb
	bCuu6ZmFxBYH8Bl4w3pzagajEMilewc9aU9W46do2HfBMc08meq/YCVRezajPvqF+5OMjrIneAt
	pEjeQtR4fBNuXAsnPnp5ElTh4cSkIg/pI2izZ1/B8RkbKxHXGJO7mM0I46OLIBGwwT/MskZv6yd
	yL2FOpzN9/oXm8y3nGK3CPelyTypSnY7F2Ly+tx7hQbS7rTgWxy+nZpde69Tv4kQcRkmiKYYsal
	si8Bi5XYqE/TYvUB6pNSgWjYw9Eu5UrLb85ZPRsVnBlDqlnLj5yNGK9K0rg63flDc=
X-Google-Smtp-Source: AGHT+IFiH890F0j3gCD/y9gTghvnzjIjYV6NZ/QNcoH5EeC7tXXi0haOdqzwI2v+GKwrn4cn6Dq02g==
X-Received: by 2002:a05:600c:4503:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4778fea8b8dmr140659515e9.22.1763459914550;
        Tue, 18 Nov 2025 01:58:34 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm147735255e9.6.2025.11.18.01.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:58:33 -0800 (PST)
Message-ID: <e1868739-2721-4d61-8e0c-eafd9369eabe@linaro.org>
Date: Tue, 18 Nov 2025 09:58:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] media: qcom: camss: vfe: Add support for VFE 1080
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
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-5-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-5-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
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
>   drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 143 +++++++++++++++
>   5 files changed, 351 insertions(+), 2 deletions(-)
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
> index 000000000000..03938759c57b
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
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50c + (n) * 0x100)
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
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53c + (n) * 0x100)
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
> +	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));

What is the & 0xFFFFFFFF for ?

u32 addr = 0x80008000;

addr = addr >> 8;

addr == 0x8000080;

addr &= 0xFFFFFFFF;

addr == 0x8000080;

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
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2753c2bb6c04..0084a1a1e71d 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -349,6 +349,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -521,7 +522,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   
> -	ops->reg_update_clear(vfe, line->id);
> +	if (ops->reg_update_clear)
> +		ops->reg_update_clear(vfe, line->id);
>   
>   	if (output->state > VFE_OUTPUT_RESERVED) {
>   		dev_err(vfe->camss->dev,
> @@ -548,7 +550,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		/* Deferring the reg update until after CSID config */
> +		if (!vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
> +			ops->reg_update(vfe, line->id);

if (vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
	continue;

Instead of calling this "is_deferred" it should name the thing that is 
deferred reg_update_is_deferred

Is it really deferred or is it done elsewhere ? Deferred implies 
something happens later and then you'd expect this flag to be cleared.

But it's not cleared, this is a permenant logical change, not a deferral.

Please come up with a better more precise name for this and make your 
change the corner case not the default, logically.

>   	}
>   
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> @@ -1998,6 +2003,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 0300efdb1c46..47851362edd4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -133,6 +133,7 @@ struct vfe_isr_ops {
>   
>   struct vfe_subdev_resources {
>   	bool is_lite;
> +	bool is_deferred;
>   	u8 line_num;
>   	bool has_pd;
>   	char *pd_name;
> @@ -245,6 +246,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_340;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
> +extern const struct vfe_hw_ops vfe_ops_1080;
>   extern const struct vfe_hw_ops vfe_ops_gen3;
>   
>   int vfe_get(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 30e58aeea310..9b5350b9ff4e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -217,6 +217,147 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
>   	}
>   };
>   
> +/* In Kaanapali, CAMNOC requires all CAMNOC_RT_TFEX clocks
> + * to operate on any TFE Full.
> + */
> +static const struct camss_subdev_resources vfe_res_kaanapali[] = {
> +	/* VFE0 - TFE Full */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe0_fast_ahb", "vfe0",
> +			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.is_deferred = true,
> +			.has_pd = true,
> +			.pd_name = "vfe0",
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 - TFE Full */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe1_fast_ahb", "vfe1",
> +			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.is_deferred = true,
> +			.has_pd = true,
> +			.pd_name = "vfe1",
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 - TFE Full */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe2_fast_ahb", "vfe2",
> +			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.is_deferred = true,
> +			.has_pd = true,
> +			.pd_name = "vfe2",
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 - IFE Lite */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
> +			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.is_deferred = true,
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 - IFE Lite */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
> +			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.is_deferred = true,
> +			.hw_ops = &vfe_ops_1080,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_kaanapali[] = {
>   	{
>   		.name = "ahb",
> @@ -4493,10 +4634,12 @@ static const struct camss_resources kaanapali_resources = {
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_kaanapali,
>   	.csid_res = csid_res_kaanapali,
> +	.vfe_res = vfe_res_kaanapali,
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>   	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
> +	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
>   };
>   
>   static const struct camss_resources msm8916_resources = {
> 


