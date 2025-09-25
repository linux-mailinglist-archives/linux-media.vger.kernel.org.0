Return-Path: <linux-media+bounces-43227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E676BA1E60
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 00:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D3774E246D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 22:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E67A2EC0B2;
	Thu, 25 Sep 2025 22:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XfUsdbFd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165252EC084
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 22:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758841165; cv=none; b=aBstgWZddnOuw75EFKiQ+A4/eJmFC6KeTk9lb1aCYfaZntUWGN9hmNR10VuMgdEMysZmtYDdzjkfWCTBPwvZzRWR6MqFi9fVjEi3yRn9Rf9+F8XEYv8BaNvW2+5eqqtVa73LGhHwIea4l0tDQazkY6WksvOPNQwB7wncQ01R5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758841165; c=relaxed/simple;
	bh=asi7yKAzDY6ff4Uv+LdakjEb8LaywDZ3LnaOM0bWb/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqUkuD8tF/X68wGhJI2GkyMHJhl+5/KWOd/YQwc0qc9/4a/TD9B9GcHmdKkYyCQy/BiWs7WZDYk8FvaOpANVB2mxynH/KQG1lXkqsftqynFGvY7cHAP9pG+k3NIWsBTZCs1AhyEzcxLtz7IR91+ReX/KaX6so9nQfukaqBm+5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XfUsdbFd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso8383985e9.2
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758841161; x=1759445961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3aVnp4v9l300Sl3SJvhuDDJcKqZmlgdynJIN/iiCQdc=;
        b=XfUsdbFdWH9RChoVAMC1QfKdfNgYOr13NJY45L943cBSVMgs0DlG6w2/NMSD5Jd0ZW
         bJstkbTHfVvFXnukqqGbeSAYQbjN6g585KbOxyl3VTtx/mGJoEvjtVqkOre6qHYXhOLg
         D55x93dqyntb2hp/pj+0bEf8exFiH42mzjSDMpsSFeBd0dywhidNAP8zZ54xC9IS6Vuu
         hYTNH7XWTtJYLTr2uJQtlslGzmMgai2JYw5zrJg4+o1ZVA4b5pE0vUKr4xM812oSJO+i
         6AZ1GqJw1z1KfYlEASA6bcmtdGcWFCzhp2ETz1iDFrXjn4MzQe+wpBXeQfd7hL8FtVcU
         glzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758841161; x=1759445961;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aVnp4v9l300Sl3SJvhuDDJcKqZmlgdynJIN/iiCQdc=;
        b=laShfGVsTgWM1AM9y1h+M/n+qhuSpgx88Dbn0nxIWhuylo8M9XtJ4G7ecSWXvs07k/
         p9SnCR/E0SQCmjoH2NtTFnQEtaaewMcoccoxZWD84agW7mlbCmtLw4RP9DF8LZnx4UNd
         I9KmiInA+xUWVHPt/NnSCN3p0t4FrktMiB9/9mL0u09TIhEjTrCIziQP7lqajHpGn8Rg
         Hsg1PllNU7JPVFYQmqf7zmHeN2Osr6D33GUyJefe+M0PguJrWqVNbp2Oi1ItGq+bWzTK
         iB5cIJEIJvnrmEOo/Ts1uqNDi4RgoDI/yGO/WM90Obb8JCQovFWZTp9wqyr6NzFFU9cl
         jGxA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ff+mQkHpIihuquNuUwYyQnjfsE/xUXbEt6oDN5i5QL/8I7ipipiP2CG/t8pkrAlvdqCPcB+d5NMK6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEjSRIODRaNpmEg3B8X6bRQv+sPF+QPZfKEi8iiEFXZSoeNHX
	rzygUnB7WPpMUqw5WRZrJqft0lmqhnTJD5OGdcqGbLk51iZJWA3GEKr6aJXPziLwOLQ=
X-Gm-Gg: ASbGncszeuqGP2ayrCVrDjbBceoz/ikf4IqY5v36m3LGiirHHLFp3dKOheCxPvKhJlr
	wABRPoYzwPlSV8XYQawmavXYf4OP0+kFwqTC06gCWBdcYeAObPRLrg2khybr09MwaA4AvK/JqzL
	gJoTG0pGHhwBjg/53qGgd9+2kGm/Kom2B+ksS72bH+ohkOz41BAGEgnwxsuGTk0ULdN5+0cE+hO
	crfoetfZZVted4gdbyfxgIX/bmb/h26BzLz2gXhdoK9ubV7lJg9QlekMNRTOb4Gu2SbjWfXZq6Y
	i8f1FSfDiu3DsogSWboSM9rV/E53+jO8XqsJRAljJvmXRvxo9p8JwQe5wQwt/d8VGEm85f/CFP/
	0jFYNZffQt5IisDq4XiUAOo/+h1H3fQbV5YDRGQYU+iGaGJmdtmjfssTRPuMzSJf0aRQnR6KfRD
	QwBZiPICPo1qFZCUh/FIBi
X-Google-Smtp-Source: AGHT+IEcfHL7a+VIAxKJLwI4AYY7pQlZ380DaSoOPqadhI1oc2vGeQ1NqBd7gxGA9iuaf8EecmKdDQ==
X-Received: by 2002:a05:600c:1c24:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-46e3709dcd4mr41331335e9.33.1758841161084;
        Thu, 25 Sep 2025 15:59:21 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e354e07f2sm20654605e9.9.2025.09.25.15.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 15:59:20 -0700 (PDT)
Message-ID: <d0a0ecbb-7bd6-4dfa-8fd2-dce3db317862@linaro.org>
Date: Thu, 25 Sep 2025 23:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: qcom: camss: vfe: Add support for VFE 1080
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <i-fHBAndz36bG6iGCIcendT_guG_FLPagipModQ-UVJ1XzRD-p8_9mMEuFMSFTziZ4zepZdXLtMTglOEqyEdew==@protonmail.internalid>
 <20250924-knp-cam-v1-6-b72d6deea054@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-cam-v1-6-b72d6deea054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 01:02, Jingyi Wang wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add more detailed resource information for VFE and VFE Lite devices
> along with a driver for the 1080 version of those that is responsible
> for bus write master configuration and buffer address update.

"Add Video Front End (VFE) version 1080 as found on the Kaanapali SoC"

> The FULL front end modules in Kaanapali camera subsystem are called TFEs
> (Thin Front End), however, retaining the name VFE at places to maintain
> consistency and avoid unnecessary code changes.

Good

> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe-1080.c | 156 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |  15 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
>   drivers/media/platform/qcom/camss/camss.c          | 138 ++++++++++++++++++
>   5 files changed, 307 insertions(+), 4 deletions(-)
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
> index 000000000000..f1852a3bf97f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,156 @@
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
> + * Bus client mapping:
> + *
> + * Full VFE:
> + * 23 = RDI0, 24 = RDI1, 25 = RDI2, 26 = RDI3, 27 = RDI4
> + *
> + * VFE LITE:
> + * 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3
> + */

Give the full bus client mapping, no the partial.

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
> index ee08dbbddf88..90e7fbd2428b 100644
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

What's going on here, why don't you have to clear the reg_update for 
your hardware ?

> 
>   	if (output->state > VFE_OUTPUT_RESERVED) {
>   		dev_err(vfe->camss->dev,
> @@ -541,14 +543,17 @@ int vfe_enable_output_v2(struct vfe_line *line)
> 
>   	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
> 
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {

This I like but it's not specific to VFE 1080.

It can/should be introduced as its own patch to remove this hard-coded 
value.

>   		output->buf[i] = vfe_buf_get_pending(output);
>   		if (!output->buf[i])
>   			break;
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		/* Deferring the reg update until after CSID config */
> +		if (vfe->camss->res->version != CAMSS_KAANAPALI)
> +			ops->reg_update(vfe, line->id);

Needs more justification - here in the email thread will do.

OK you don't have to do reg_update but, your logic is not consistent for 
this.

In one case you check for ops->reg_update_clear() in this case you check 
for !KANNAPALI

Definitely don't want to have SoC specific logic in the core files 
unless absolutely necessary, which in this case it is not.

>   	}
> 
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> @@ -914,7 +919,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>   	return (!strcmp(clock->name, vfe_name) ||
>   		!strcmp(clock->name, vfe_lite_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
> -		!strcmp(clock->name, "camnoc_axi"));
> +		!strcmp(clock->name, "camnoc_axi") ||
> +		!strcmp(clock->name, "camnoc_rt_axi"));

I'd prefer to see a small patch adding camnoc_rt_axi and explaining what 
it is inside of CAMSS and why we should clock it.

>   }
> 
>   /*
> @@ -1997,6 +2003,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 0300efdb1c46..444924ddf724 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -245,6 +245,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_340;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
> +extern const struct vfe_hw_ops vfe_ops_1080;
>   extern const struct vfe_hw_ops vfe_ops_gen3;
> 
>   int vfe_get(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 74a8ad3cb728..2239abfef26e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -217,6 +217,142 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
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

XO debug ?

Really ? Why ?

Whats that clock for and why is it needed for the runtime TFE to function ?

---
bod

