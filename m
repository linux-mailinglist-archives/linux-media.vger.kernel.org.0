Return-Path: <linux-media+bounces-25087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C4A188CF
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657F9164F0B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E1AEAC6;
	Wed, 22 Jan 2025 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNJYe6Z4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82A4409
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737505075; cv=none; b=cx/uTCa84XnBnxB+UaCyZ1HnOcxXcLwAVPJQ2TfoBRt6+rNPMaJUxQ8F0t4y3WTfo9CK7JMqigJx6bcoMIWNAf7QUVozsgvt4RHv77332d6fPOZyGAmaMdNj0I/bTocqsUZ/yQVgaz5Nxi3QmS1Q9kGnNuc+fR1sW0Sq1QYLHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737505075; c=relaxed/simple;
	bh=VUpIePeb/S9D1VtlCwLFcfSbWOeLMMCd0OWwlBjaI84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJrq4e2tQCNMWmCs9FGi+JZleaYrZLq5YfRgKzYKkl/AUEC2JFymDSzZqVbhERRCpAYZBgQoQwiduD2nR9OXzH/+x75PtY6rBu71voVK3qQNx54Fgz75U4gQuxe5jWjrF5dCEDhHpqqB2tT7P3vDawz94hwpn0YcOhGsL0/KvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNJYe6Z4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-302217866b5so4886961fa.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 16:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737505070; x=1738109870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AJ2ms5IRYJajdLQ0jNImK+TGHhs25Ve/MnhVjRYS4s=;
        b=SNJYe6Z45K9IW++LeRu54fQz/eKt11qPPtzq+AfsOWBtudTbPpK9QfJdaCHZLmHMxe
         zzkNRqqVjAgld8fwyAoCdhW1Kx5mV74En+eM7uHd6PCW9xt8e+cu5i1wPxZub1kUyU1e
         BRxdoZdSfK3ARsuc2vRMtqGw0Y4SO3wltjCvKJYEgg4QUlFYDg0cgXSKoYk79ut61PQJ
         edlB+t/oMps1/HNK2vXkyUCdvXHORJSzh8CGcb0ka21GymMDMtynq5d183CIlUTCGFEN
         D3All0L3D7F5tJNLhdjpcTZKlCRmvo8YfYqoelMN8AxqaemOMej39Q+Z01ZEQq8+gYEr
         QulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737505070; x=1738109870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+AJ2ms5IRYJajdLQ0jNImK+TGHhs25Ve/MnhVjRYS4s=;
        b=CqFfWWiOTolS5dzIRsP9VsDmSYC6InGtf7uT75D5Mg+8aZK7eRmJEvJuQW7yqQVves
         cOo/jQQqDmS9kI9v5ChRfkmgjGmMIVU19MbbvZ2dlYHraswKkFcFaKEy7gq34rZv+pry
         5SZM0rKj44jkgRnmP7ZLHufKL35BJKSLthSiB4ccDamn/jN8FMLL0bE4sYZE0kaBavlR
         2zHghfIoQfxdogkiucIOLlqlTZk1Gv4RIux3CkEIxbKCAk0yHongIfunzQ4y6D3ON/5X
         IYfNoyIh5vWMnHBcC1/IqZaAvfxhiPLEPMZYNTP9iqvV7uaYb1ksobc3jMJZ/4faY5iR
         cPTA==
X-Gm-Message-State: AOJu0YwSJXzn47PCZrTqrOHEkCdtNH4QhZgxh50/NFcJA91gnH4YGHCk
	XZtwV/VfZ5zp2hNq8My7qrt9hhcuABgrpJDoG09QaadQwtJj6KhvH9ZkVc0d7us=
X-Gm-Gg: ASbGncu9FmNn/OiXbEB1niTz6nPRSaaPdpjFbKtDh48utS4RAKMTz3mFjJ+iIH+eNWt
	t8ltV9datrstQve96sHmYfM3gxB1rjzNeVbLp7xd/JzUDjURcAOijdOmHwrGOCIsMzrxxDcnHBN
	oQF+k2NGA1DOIMk2CANykaXnjVVMSLy5fmSJwMy25NkUaww19rqm+Pq5NHWYA8E7eYbRuZEleva
	nrRha3hfJ4PMyp4St2PBY464Ek4/khlZa64cCdPaJx7iTCo9fgwrlnGHOpxfwoZzCrR2Q1h+iHB
	Ly/KOf/Q61eElS8k/kyxQkzY1jaM+7T9SLDTUpGMqzi/W5lP
X-Google-Smtp-Source: AGHT+IGFxoi7i+NV5trKtt6G9SmJSTrYA4deWLkcd0VxYDZp9jD5kwoQC1GUBMis9Tv8P12sIq9pbQ==
X-Received: by 2002:a05:6512:1083:b0:542:19ef:9878 with SMTP id 2adb3069b0e04-5439c2815a7mr2046543e87.8.1737505069924;
        Tue, 21 Jan 2025 16:17:49 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78f43sm2021910e87.244.2025.01.21.16.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:17:48 -0800 (PST)
Message-ID: <9056111d-c69d-48d7-a462-484642766166@linaro.org>
Date: Wed, 22 Jan 2025 02:17:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: qcom: camss: Add VFE680 support
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-4-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-4-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> Add silicon enabling support for VFE680 as found on sm8450, x1e and
> derivatives thereof.
> 
> References previous work from Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/Makefile        |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe-680.c | 243 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.h     |   1 +
>   3 files changed, 245 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 71797745f2f71..d26a9c24a430a 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -18,6 +18,7 @@ qcom-camss-objs += \
>   		camss-vfe-4-8.o \
>   		camss-vfe-17x.o \
>   		camss-vfe-480.o \
> +		camss-vfe-680.o \
>   		camss-vfe-780.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
> new file mode 100644
> index 0000000000000..1b2aa2c98887a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-680.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v680
> + *
> + * Copyright (C) 2024 Linaro Ltd.

Please add 2025 also, and may be some earlier years to add here.

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
> +#define VFE_TOP_IRQn_STATUS(vfe, n)		((vfe_is_lite(vfe) ? 0x1c : 0x44) + (n) * 4)
> +#define VFE_TOP_IRQn_MASK(vfe, n)		((vfe_is_lite(vfe) ? 0x24 : 0x34) + (n) * 4)
> +#define VFE_TOP_IRQn_CLEAR(vfe, n)		((vfe_is_lite(vfe) ? 0x2c : 0x3c) + (n) * 4)
> +#define		VFE_IRQ1_SOF(vfe, rdi)		((vfe_is_lite(vfe) ? BIT(2) : BIT(8)) << ((rdi) * 2))
> +#define		VFE_IRQ1_EOF(vfe, rdi)		((vfe_is_lite(vfe) ? BIT(3) : BIT(9)) << ((rdi) * 2))
> +#define VFE_TOP_IRQ_CMD(vfe)			(vfe_is_lite(vfe) ? 0x38 : 0x30)
> +#define		VFE_TOP_IRQ_CMD_GLOBAL_CLEAR	BIT(0)
> +#define VFE_TOP_DIAG_CONFIG			(vfe_is_lite(vfe) ? 0x40 : 0x50)
> +
> +#define VFE_TOP_DEBUG_11(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xcc)
> +#define VFE_TOP_DEBUG_12(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xd0)
> +#define VFE_TOP_DEBUG_13(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xd4)

Those registers are unused, and it's unclear how to use them properly.

I would suggest to remove definitions of at least the VFE_TOP_DEBUG_*
registers.

> +
> +#define VFE_BUS_IRQn_MASK(vfe, n)		((vfe_is_lite(vfe) ? 0x218 : 0xc18) + (n) * 4)
> +#define VFE_BUS_IRQn_CLEAR(vfe, n)		((vfe_is_lite(vfe) ? 0x220 : 0xc20) + (n) * 4)
> +#define VFE_BUS_IRQn_STATUS(vfe, n)		((vfe_is_lite(vfe) ? 0x228 : 0xc28) + (n) * 4)
> +#define VFE_BUS_IRQ_GLOBAL_CLEAR(vfe)		(vfe_is_lite(vfe) ? 0x230 : 0xc30)
> +#define VFE_BUS_WR_VIOLATION_STATUS(vfe)	(vfe_is_lite(vfe) ? 0x264 : 0xc64)
> +#define VFE_BUS_WR_OVERFLOW_STATUS(vfe)		(vfe_is_lite(vfe) ? 0x268 : 0xc68)
> +#define VFE_BUS_WR_IMAGE_VIOLATION_STATUS(vfe)	(vfe_is_lite(vfe) ? 0x270 : 0xc70)
> +
> +#define VFE_BUS_CFG(vfe, c)			((vfe_is_lite(vfe) ? 0x400 : 0xe00) + (c) * 0x100)
> +#define VFE_BUS_IMAGE_ADDR(vfe, c)		((vfe_is_lite(vfe) ? 0x404 : 0xe04) + (c) * 0x100)
> +#define VFE_BUS_FRAME_INCR(vfe, c)		((vfe_is_lite(vfe) ? 0x408 : 0xe08) + (c) * 0x100)
> +#define VFE_BUS_IMAGE_CFG0(vfe, c)		((vfe_is_lite(vfe) ? 0x40c : 0xe0c) + (c) * 0x100)
> +#define		VFE_BUS_IMAGE_CFG0_DATA(h, s)	(((h) << 16) | ((s) >> 4))
> +#define WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
> +
> +#define VFE_BUS_IMAGE_CFG1(vfe, c)		((vfe_is_lite(vfe) ? 0x410 : 0xe10) + (c) * 0x100)
> +#define VFE_BUS_IMAGE_CFG2(vfe, c)		((vfe_is_lite(vfe) ? 0x414 : 0xe14) + (c) * 0x100)
> +#define VFE_BUS_PACKER_CFG(vfe, c)		((vfe_is_lite(vfe) ? 0x418 : 0xe18) + (c) * 0x100)
> +#define VFE_BUS_IRQ_SUBSAMPLE_PERIOD(vfe, c)	((vfe_is_lite(vfe) ? 0x430 : 0xe30) + (c) * 0x100)
> +#define VFE_BUS_IRQ_SUBSAMPLE_PATTERN(vfe, c)	((vfe_is_lite(vfe) ? 0x434 : 0xe34) + (c) * 0x100)
> +#define VFE_BUS_FRAMEDROP_PERIOD(vfe, c)	((vfe_is_lite(vfe) ? 0x438 : 0xe38) + (c) * 0x100)
> +#define VFE_BUS_FRAMEDROP_PATTERN(vfe, c)	((vfe_is_lite(vfe) ? 0x43c : 0xe3c) + (c) * 0x100)
> +#define VFE_BUS_MMU_PREFETCH_CFG(vfe, c)	((vfe_is_lite(vfe) ? 0x460 : 0xe60) + (c) * 0x100)
> +#define		VFE_BUS_MMU_PREFETCH_CFG_EN	BIT(0)
> +#define VFE_BUS_MMU_PREFETCH_MAX_OFFSET(vfe, c)	((vfe_is_lite(vfe) ? 0x464 : 0xe64) + (c) * 0x100)
> +#define VFE_BUS_ADDR_STATUS0(vfe, c)		((vfe_is_lite(vfe) ? 0x470 : 0xe70) + (c) * 0x100)
> +
> +/*
> + * TODO: differentiate the port id based on requested type of RDI, BHIST etc
> + *
> + * IFE write master IDs
> + *
> + * VIDEO_FULL_Y		0
> + * VIDEO_FULL_C		1
> + * VIDEO_DS_4:1		2
> + * VIDEO_DS_16:1	3
> + * DISPLAY_FULL_Y	4
> + * DISPLAY_FULL_C	5
> + * DISPLAY_DS_4:1	6
> + * DISPLAY_DS_16:1	7
> + * FD_Y			8
> + * FD_C			9
> + * PIXEL_RAW		10
> + * STATS_BE0		11
> + * STATS_BHIST0		12
> + * STATS_TINTLESS_BG	13
> + * STATS_AWB_BG		14
> + * STATS_AWB_BFW	15
> + * STATS_BAF		16
> + * STATS_BHIST		17
> + * STATS_RS		18
> + * STATS_IHIST		19
> + * SPARSE_PD		20
> + * PDAF_V2.0_PD_DATA	21
> + * PDAF_V2.0_SAD	22
> + * LCR			23
> + * RDI0			24
> + * RDI1			25
> + * RDI2			26
> + * LTM_STATS		27
> + *
> + * IFE Lite write master IDs
> + *
> + * RDI0			0
> + * RDI1			1
> + * RDI2			2
> + * RDI3			3
> + * GAMMA		4
> + * BE			5
> + */
> +
> +/* TODO: assign an ENUM in resources and use the provided master
> + *       id directly for RDI, STATS, AWB_BG, BHIST.
> + *       This macro only works because RDI is all we support right now.
> + */
> +#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0 : 24) + (n))
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +	/* VFE680 has no global reset, simply report a completion */
> +	complete(&vfe->reset_complete);
> +}
> +
> +/*
> + * vfe_isr - VFE module interrupt handler
> + * @irq: Interrupt line
> + * @dev: VFE device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * vfe_halt - Trigger halt on VFE module and wait to complete
> + * @vfe: VFE device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +static void vfe_disable_irq(struct vfe_device *vfe)
> +{
> +	writel(0u, vfe->base + VFE_TOP_IRQn_MASK(vfe, 0));
> +	writel(0u, vfe->base + VFE_TOP_IRQn_MASK(vfe, 1));
> +	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 0));
> +	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 1));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> +			  struct vfe_line *line)
> +{
> +	u8 wm = RDI_WM(rdi);
> +
> +	writel(addr, vfe->base + VFE_BUS_IMAGE_ADDR(vfe, wm));
> +}
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +	u32 stride = pix->plane_fmt[0].bytesperline;
> +	u32 cfg;
> +	u8 wm;
> +
> +	cfg = VFE_BUS_IMAGE_CFG0_DATA(pix->height, stride);
> +	wm = RDI_WM(rdi);
> +
> +	writel(cfg, vfe->base + VFE_BUS_IMAGE_CFG0(vfe, wm));
> +	writel(0, vfe->base + VFE_BUS_IMAGE_CFG1(vfe, wm));
> +	writel(stride, vfe->base + VFE_BUS_IMAGE_CFG2(vfe, wm));
> +	writel(0, vfe->base + VFE_BUS_PACKER_CFG(vfe, wm));
> +
> +	/* Set total frame increment value */
> +	writel(pix->plane_fmt[0].bytesperline * pix->height,
> +	       vfe->base + VFE_BUS_FRAME_INCR(vfe, wm));
> +
> +	/* MMU */
> +	writel(VFE_BUS_MMU_PREFETCH_CFG_EN, vfe->base + VFE_BUS_MMU_PREFETCH_CFG(vfe, wm));
> +	writel(~0u, vfe->base + VFE_BUS_MMU_PREFETCH_MAX_OFFSET(vfe, wm));
> +
> +	/* no dropped frames, one irq per frame */
> +	writel(1, vfe->base + VFE_BUS_FRAMEDROP_PATTERN(vfe, wm));
> +	writel(0, vfe->base + VFE_BUS_FRAMEDROP_PERIOD(vfe, wm));
> +	writel(1, vfe->base + VFE_BUS_IRQ_SUBSAMPLE_PATTERN(vfe, wm));
> +	writel(0, vfe->base + VFE_BUS_IRQ_SUBSAMPLE_PERIOD(vfe, wm));
> +
> +	/* We don't process IRQs for VFE in RDI mode at the moment */
> +	vfe_disable_irq(vfe);
> +
> +	/* Enable WM */
> +	writel(BIT(0), vfe->base + VFE_BUS_CFG(vfe, wm));

Please add a macro for this BIT(0).

> +
> +	dev_dbg(vfe->camss->dev, "RDI%d WM:%d width %d height %d\n",
> +		rdi, wm, pix->width, pix->height);
> +	dev_dbg(vfe->camss->dev, "WM:%d stride %d\n", wm, stride);
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> +{
> +	u8 wm = RDI_WM(rdi);
> +
> +	writel(0, vfe->base + VFE_BUS_CFG(vfe, wm));
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_680 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_680;
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
> +const struct vfe_hw_ops vfe_ops_680 = {
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
> index 9dec5bc0d1b14..a23f666be7531 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>   extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_480;
> +extern const struct vfe_hw_ops vfe_ops_680;
>   extern const struct vfe_hw_ops vfe_ops_780;
>   
>   int vfe_get(struct vfe_device *vfe);
> 

--
Best wishes,
Vladimir

