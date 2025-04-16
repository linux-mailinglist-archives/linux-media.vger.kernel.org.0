Return-Path: <linux-media+bounces-30336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF11A8B902
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2A1188893A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88662248883;
	Wed, 16 Apr 2025 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYSjEaBs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B620123FC42
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806471; cv=none; b=WtWrtqlfoQjN42up5soQAQegC5xPbRrQJqAanAleVuYygkCqlZb6wQ/6GNnu1GPN2hRrPADEit9GUGHabGjLcleTeLwU6hxW4szjpWPGeR+feEV5DbgZ5/OeYSNX4is+HCXdkbNfmACUvTUf8mXs33HHc3RZKGhsvHuBhY8GeWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806471; c=relaxed/simple;
	bh=OZMx6bfd2ZDLBU6RVpR1Ti861dk7Yhg0G5ACQvJCnCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKHpaDldUUBufyk3kPfUdTF8HscqRXp6HA4Q69Zxi8SUy3SPwywM8xJGXA9+6OLQB91JdbxUA1hB0r26d0ktzYtc61nxYDe95n+xyS3pPMUVx0LxqfxUC9hkcRHPVV6JyrBMVRIrJd+8d1IpgkCJUB0U3JgIe3V4j+8llQR/VCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYSjEaBs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso50150145e9.3
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744806467; x=1745411267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7olKqUShSn9q9KBt/t1ADqj4alCQc1+OYSK/0oU0WCg=;
        b=FYSjEaBss8TP84Iq7b1vL/i5oBzaaz4HJfFL3JGLPpYZuVGay50V0ZYRXOb04gs5go
         438kljdRpPItqqyRKAGRyT50a+yMa2fr6RElkW55Tjb8JqyV+mSTKWN8j4R7pT8+k/BS
         ftnd8imYjGmtSWZheO8jMUJLd6v7hXxAmKI+o2vlSYxaXFACZmcFjdtRiloVPvfOzfaV
         7Wd1EzRCUqXfGcqFmwFHTdIrTkvof8Qyb3DDRZqTFgNYWdQRpkFH6R0vE41tEWgKjYyt
         CArtfeWX4q25VP5fYJ2C0+VOipkMYiv2DejG24h43NwY94y3lRhEcJF6CuX0tyPlc1tY
         D2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744806467; x=1745411267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7olKqUShSn9q9KBt/t1ADqj4alCQc1+OYSK/0oU0WCg=;
        b=SJyS9co4WDMDxwAvU50uAU7QbW+nd24L9tYDppaNM2nUkcyVEGibiwO8HFVTde2vVC
         /I8rzlGoSm716QI8OvVXgLOk4C4jfHl1CnWzgMgMVeEMN6iQu1x3i3WPiq8shR51ChQ8
         2Z4WKhIzj5zrQO9fxxUxmo/IE2tgwszavpxyffsR0r/TZrwu8Mt9d3YB1XKidwVNbMNc
         DGD5HfB4tyAXOpaF1Tlr7MExb1ko7NBFsAuksAN3YyHfmjG7DGRd8xpHlXnBD1CUFfaF
         IuNsxEM2DXYBahgOz8uMLcXlyI8dIVYPpH9yZ1x3gh6X+3CHmbYX/6wb9vsf0btD2cHg
         D+cw==
X-Forwarded-Encrypted: i=1; AJvYcCWfpKWGqaG7xzDCIDQAaA5Uh2JpIIHf6M6ClBZU+AKHjcHos1L7Ti+E6CyEPny2A699BcxN95vC2EvVwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcqLq0ipzU0/PQzq556dxVMlAJWhDBbXVJ1WYjjpBwLPTuu9lF
	3knaR6tsBKXe5SrETdwxAIUBN+m8NMtzBkl75gm6KJnPRCS+RIDyG88PScQYn6o=
X-Gm-Gg: ASbGncuY3SPsdhHE0AkiWCCET7OHvAmnim22a5ZZm2wyNo63aI1coijyhue3mXykuHh
	RLYg72/FF4cAuaDuVn0hLNr/t50HP2WUXQ+67k6ShMxSk/ObPlpauw+5PnoAAIMAqTD3sxwNuym
	L3DcVIfN7+K+SbS673CZhZQ86NgNsHW1y3BnR6guTukO/uc8BX3kKsldj8bDma2N8ZY4IbpITxZ
	tR6YjpKau9+s7IFixRe7ysh4zpmNwUjYAEp6Ul8HQ4YzeNXC670Sa8entMpdGTRynkR1EFTC56s
	RCEMxxLileqxv7VbtWAkQDlAg4C/UtyiHrIEDQGrFef4lAnMvXz69fplsFY4qKXQQ3GVGqsuhNC
	faBOY8Q==
X-Google-Smtp-Source: AGHT+IE3xdu+nx4jiKKa3mpgLosX1tZj4e3Uadm6gVyLqzr5AROw2GFjRV4QVE6nUfoA+BchQkUC/g==
X-Received: by 2002:a05:600c:a378:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-4405d5fcd39mr17192585e9.1.1744806466791;
        Wed, 16 Apr 2025 05:27:46 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2444sm19844815e9.17.2025.04.16.05.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:27:46 -0700 (PDT)
Message-ID: <08592c93-c866-4515-8ddf-5e1eeb75c9a2@linaro.org>
Date: Wed, 16 Apr 2025 13:27:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 13:09, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../media/platform/qcom/camss/camss-vfe-340.c | 281 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>   3 files changed, 283 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430..719898f5d32b 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -17,6 +17,7 @@ qcom-camss-objs += \
>   		camss-vfe-4-7.o \
>   		camss-vfe-4-8.o \
>   		camss-vfe-17x.o \
> +		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
>   		camss-vfe-780.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> new file mode 100644
> index 000000000000..fc454d66e1d2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 340 (TFE)
> + *
> + * Copyright (c) 2025 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define TFE_GLOBAL_RESET_CMD				(0x014)
> +#define		TFE_GLOBAL_RESET_CMD_CORE	BIT(0)
> +
> +#define TFE_REG_UPDATE_CMD				(0x02C)
> +
> +#define TFE_IRQ_CMD					(0x030)
> +#define		TFE_IRQ_CMD_CLEAR		BIT(0)
> +#define TFE_IRQ_MASK_0					(0x034)
> +#define		TFE_IRQ_MASK_0_RST_DONE		BIT(0)
> +#define		TFE_IRQ_MASK_0_BUS_WR		BIT(1)
> +#define TFE_IRQ_MASK_1					(0x038)
> +#define TFE_IRQ_MASK_2					(0x03c)
> +#define TFE_IRQ_CLEAR_0					(0x040)
> +
> +#define TFE_IRQ_STATUS_0				(0x04c)
> +
> +#define BUS_REG(a)	(0xa00 + (a))
> +
> +#define TFE_BUS_IRQ_MASK_0				BUS_REG(0x18)
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE_ALL	0x000f
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE(src)	BIT(src)
> +#define		TFE_BUS_IRQ_MASK_BUF_DONE_ALL	0xff00
> +#define		TFE_BUS_IRQ_MASK_BUF_DONE(sg)	BIT((sg) + 8)
> +#define		TFE_BUS_IRQ_MASK_0_CONS_VIOL	BIT(28)
> +#define		TFE_BUS_IRQ_MASK_0_VIOL		BIT(30)
> +#define		TFE_BUS_IRQ_MASK_0_IMG_VIOL	BIT(31)
> +
> +#define TFE_BUS_IRQ_MASK_1				BUS_REG(0x1C)
> +#define TFE_BUS_IRQ_CLEAR_0				BUS_REG(0x20)
> +#define TFE_BUS_IRQ_STATUS_0				BUS_REG(0x28)
> +#define TFE_BUS_IRQ_CMD					BUS_REG(0x30)
> +#define		TFE_BUS_IRQ_CMD_CLEAR		BIT(0)
> +
> +#define TFE_BUS_STATUS_CLEAR				BUS_REG(0x60)
> +#define TFE_BUS_VIOLATION_STATUS			BUS_REG(0x64)
> +#define TFE_BUS_OVERFLOW_STATUS				BUS_REG(0x68)
> +#define TFE_BUS_IMAGE_SZ_VIOLATION_STATUS		BUS_REG(0x70)
> +
> +#define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
> +#define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
> +#define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
> +#define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
> +#define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
> +#define TFE_BUS_IMAGE_CFG_0(c)				BUS_REG(0x20C + (c) * 0x100)
> +#define		TFE_BUS_IMAGE_CFG_0_DEFAULT	0xffff
> +#define TFE_BUS_IMAGE_CFG_1(c)				BUS_REG(0x210 + (c) * 0x100)
> +#define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
> +#define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
> +#define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
> +#define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
> +#define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
> +#define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
> +#define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
> +#define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
> +
> +#define RDI_CLIENT(n)		(7 + (n))

Should be RDI_WM for consistency.

Please add a comment listing what those clients are

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/727970e9725c35366f501a890584e466ae34224a#c0063099c8260d8c4b3dc9ea650b6d0a4db47518_0_59

> +#define TFE_SOURCES_NUM		4
> +#define TFE_SUBGROUPS_NUM	8
> +#define TFE_CLIENTS_NUM		10
> +
> +static inline unsigned int __regupdate_iface(enum vfe_line_id line_id)
> +{
> +	switch (line_id) {
> +	case VFE_LINE_RDI0:
> +		return 1;
> +	case VFE_LINE_RDI1:
> +		return 2;
> +	case VFE_LINE_RDI2:
> +		return 3;
> +	case VFE_LINE_PIX:
> +	default:
> +		return 0;
> +	}

An enum or a define instead of hard-coded values on the return please.

> +}
> +
> +static inline unsigned int __regupdate_line(unsigned int iface)
> +{
> +	if (!iface)
> +		return VFE_LINE_PIX;
> +	if (iface < 4)
> +		return VFE_LINE_RDI0 + (iface - 1);
> +
> +	return VFE_LINE_NONE;
> +}
> +
> +static inline unsigned int __subgroup_line(unsigned int subgroup)
> +{
> +	switch (subgroup) {
> +	case 5:
> +		return VFE_LINE_RDI0;
> +	case 6:
> +		return VFE_LINE_RDI1;
> +	case 7:
> +		return VFE_LINE_RDI2;
> +	default:
> +		return VFE_LINE_PIX;
> +	}
> +
> +	return VFE_LINE_NONE;
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +	writel_relaxed(TFE_IRQ_MASK_0_RST_DONE, vfe->base + TFE_IRQ_MASK_0);
> +	writel(TFE_GLOBAL_RESET_CMD_CORE, vfe->base + TFE_GLOBAL_RESET_CMD);

Why is one relaxed and one not ?

> +}
> +
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +	struct vfe_device *vfe = dev;
> +	u32 status;
> +	int i;
> +
> +	status = readl_relaxed(vfe->base + TFE_IRQ_STATUS_0);
> +	writel_relaxed(status, vfe->base + TFE_IRQ_CLEAR_0);
> +	writel_relaxed(TFE_IRQ_CMD_CLEAR, vfe->base + TFE_IRQ_CMD);
> +
> +
> +	if (status & TFE_IRQ_MASK_0_RST_DONE) {
> +		dev_dbg(vfe->camss->dev, "VFE%u: Reset done!", vfe->id);
> +		vfe_isr_reset_ack(vfe);
> +	}
> +
> +	if (status & TFE_IRQ_MASK_0_BUS_WR) {
> +		u32 bus_status = readl_relaxed(vfe->base + TFE_BUS_IRQ_STATUS_0);
> +
> +		writel_relaxed(bus_status, vfe->base + TFE_BUS_IRQ_CLEAR_0);
> +		writel_relaxed(TFE_BUS_IRQ_CMD_CLEAR, vfe->base + TFE_BUS_IRQ_CMD);
> +
> +		for (i = 0; i < TFE_SOURCES_NUM; i++) {
> +			if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
> +				vfe->res->hw_ops->reg_update_clear(vfe, __regupdate_line(i));
> +		}
> +
> +		for (i = 0; i < TFE_SUBGROUPS_NUM; i++) {
> +			if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
> +				vfe_buf_done(vfe, __subgroup_line(i));
> +		}
> +
> +		if (bus_status & TFE_BUS_IRQ_MASK_0_CONS_VIOL)
> +			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Bad config violation",
> +					    vfe->id);
> +
> +		if (bus_status & TFE_BUS_IRQ_MASK_0_VIOL)
> +			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Input data violation",
> +					    vfe->id);
> +
> +		if (bus_status & TFE_BUS_IRQ_MASK_0_IMG_VIOL)
> +			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Image size violation",
> +					    vfe->id);
> +	}
> +
> +	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
> +	if (status) {
> +		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
> +		for (i = 0; i < TFE_CLIENTS_NUM; i++) {
> +			if (status & BIT(i))
> +				dev_err_ratelimited(vfe->camss->dev,
> +						    "VFE%u: bus overflow for client %u\n",
> +						    vfe->id, i);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}

looks ok

> +
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +static void vfe_enable_irq(struct vfe_device *vfe)
> +{
> +	writel_relaxed(TFE_IRQ_MASK_0_RST_DONE | TFE_IRQ_MASK_0_BUS_WR,
> +		       vfe->base + TFE_IRQ_MASK_0);
> +	writel_relaxed(TFE_BUS_IRQ_MASK_RUP_DONE_ALL | TFE_BUS_IRQ_MASK_BUF_DONE_ALL |
> +		       TFE_BUS_IRQ_MASK_0_CONS_VIOL | TFE_BUS_IRQ_MASK_0_VIOL |
> +		       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> +			  struct vfe_line *line)
> +{
> +	u8 client = RDI_CLIENT(rdi);
> +
> +	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
> +}
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +	u32 stride = pix->plane_fmt[0].bytesperline;
> +	u8 client = RDI_CLIENT(rdi);
> +
> +	/* Configuration for plain RDI frames */
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
> +
> +	/* No dropped frames, one irq per frame */
> +	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> +	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
> +	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
> +	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
> +
> +	vfe_enable_irq(vfe);
> +
> +	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> +	       vfe->base + TFE_BUS_CLIENT_CFG(client));
> +
> +	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
> +		vfe->id, rdi, pix->width, pix->height, stride);
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> +{
> +	u8 client = RDI_CLIENT(rdi);
> +
> +	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
> +
> +	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_520 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_520;
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	vfe->reg_update |= BIT(__regupdate_iface(line_id));
> +	writel_relaxed(vfe->reg_update, vfe->base + TFE_REG_UPDATE_CMD);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	vfe->reg_update &= ~BIT(__regupdate_iface(line_id));
> +}
> +
> +const struct vfe_hw_ops vfe_ops_340 = {
> +	.global_reset = vfe_global_reset,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be753..9b138849caca 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -242,6 +242,7 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
>   extern const struct vfe_hw_ops vfe_ops_4_7;
>   extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
> +extern const struct vfe_hw_ops vfe_ops_340;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
>   extern const struct vfe_hw_ops vfe_ops_780;


