Return-Path: <linux-media+bounces-16316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5495201F
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 18:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7988EB2E6FC
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A9C1BC07E;
	Wed, 14 Aug 2024 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VoWI5RIi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55A1B9B3C
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652626; cv=none; b=YnqfZlLxZ4bW92xvdEzohOWmpvAODG3UDOCJj9EIro+3SZ6r9ULEwT+b/x1UWILg0+10mvHxsQ4RxjglKmxQwDkaleo5vlDBwLJC1WthC1nOuShY4EDxQ/1glKv2e62BPw8HfH/fFpmDbq5nWvz5gYDOkqNGuCvBhJcpASrvd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652626; c=relaxed/simple;
	bh=oaXe0wVXtTfG5LUb+AjozQ5I4KR5ALnGYV2CbkzMjls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cA2W5WJrsyznMrPXXOMglQeGI3l5FctXhKCgtZU0M+eh9cuNWxAwpAbbXMZ3seYbYG3RQRZuaxi8n25KGdR8udcL7G1t8uwsAT5JWjJ/EdbVZoWkqsDIXSPFMyEj9dxu8lPFYOIiC92Q50PiWMk+df9I/LPJO8bAh0cp67RdIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VoWI5RIi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso52427595e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723652623; x=1724257423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqrE40BP3GnDSJet5rt+K6ncIATI9HPA4YaJCmHPTHM=;
        b=VoWI5RIi5HA3JenEri19i4/u0n8SMRibKhg2weFXE5zyC31WZOuKJaxrUglzSvZOjq
         0PMp+2Zb2AqDMAxGeRVAvmqtIkEYulHsxtTz3OITjNe+zaZ395CJeL832i9yaM9WDeiB
         yflTIiHt+hTtZz2PTZm+L++fh01NpGp1AwruASezcNblAH9O5PBlx0rWJpjoo58iDS4d
         wXAWvL5wFOJNJE8hDdPxPCCsT5no8ggzTPC/pmViYcU+oAaigUO3idDhO+SxCiyKKR7S
         5A50FuLAC1KTHAEebqRXMjmEizqIsWyqSuBsVg9836W8VCkmZe0DVG2uflAlW7U6X+z6
         Wfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723652623; x=1724257423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqrE40BP3GnDSJet5rt+K6ncIATI9HPA4YaJCmHPTHM=;
        b=gNPAZukMdE/grbHPLUiHFfAEaR41XO0m6GqxJl/3QMWBvOKepsQdt6Yi0Fs4BglQRx
         1FD0y3/iOa5imgdyWpjGIQZG73NSZrj6riAg+wzURhedGkoFkjlra+nhpk/SocIdH27O
         yBwlzTOASCA44q2mxds/0013IK6HaGpFSVnZxn6y8wLl/+qK+4Wp8WIMZmSkGjuq8Z02
         EbmQeNooQQrWcggm7/OV/ZDOykE7yHSFWy0s5kyZbE5ELxeyhikqPnAJZQjFfYd7UpH/
         os2HvT/e3oOGX6EVSmKxfKGNlU4+gHBDXESCURGDt/Ml46bGJUa8DzmIrsFbyIoStmZi
         Qo6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKe9Q8D8ucgDF5wokUn1WgmJitUnwhhMiLRqFyTDUL3zLUbilCZapFWqZlNy/BuVW5vV0yI7HrYANbA55yifQOf1wbz1Fd+GxTt/0=
X-Gm-Message-State: AOJu0YwFXT8Nq1y5Y/G+n4Jela4C4tnaUXYm5Fyy2wlhkve+vVof70ap
	v2mFM1H2kFPRze7wGAoM7VBloLnmWIjs1NdevSW3Iu0GK6MQVzdJ29PITvKzwnI=
X-Google-Smtp-Source: AGHT+IE44uztKLBkFWlFW6yVlJbysSpM2V4ugi+8KFstLRkQARMzbMAdcaYeZQ2xa+xgkUFLogiP3g==
X-Received: by 2002:a05:600c:4715:b0:428:eb6:2e73 with SMTP id 5b1f17b1804b1-429dd25d9a1mr24204475e9.29.1723652622399;
        Wed, 14 Aug 2024 09:23:42 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded71ecdsm23807105e9.37.2024.08.14.09.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 09:23:41 -0700 (PDT)
Message-ID: <b78f23ca-eb6e-45cf-9e42-86c906ff901f@linaro.org>
Date: Wed, 14 Aug 2024 17:23:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> Add support for VFE found on SM8550 (Titan 780). This implementation is
> based on the titan 480 implementation. It supports the normal and lite
> VFE.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../media/platform/qcom/camss/camss-vfe-780.c | 148 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c |  33 ++--
>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>   drivers/media/platform/qcom/camss/camss.c     | 132 ++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   2 +
>   6 files changed, 304 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index c336e4c1a399..a83b7a8dcef7 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -17,6 +17,7 @@ qcom-camss-objs += \
>   		camss-vfe-4-8.o \
>   		camss-vfe-17x.o \
>   		camss-vfe-480.o \
> +		camss-vfe-780.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
>   		camss-video.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> new file mode 100644
> index 000000000000..e1c4d25cdc40
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-780.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
> +#define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
> +
> +#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
> +#define		WM_CFG_EN			BIT(0)
> +#define		WM_VIR_FRM_EN			BIT(1)
> +#define		WM_CFG_MODE			BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_1(n)	(BUS_REG_BASE + 0x210 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_ADDR(n)	(BUS_REG_BASE + 0x220 + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_INCR(n)	(BUS_REG_BASE + 0x224 + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_CFG(n)	(BUS_REG_BASE + 0x228 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
> +#define VFE_BUS_WM_SYSTEM_CACHE_CFG(n)		(BUS_REG_BASE + 0x268 + (n) * 0x100)
> +
> +/* for titan 780, each bus client is hardcoded to a specific path */
> +#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +
> +	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
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
> +	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> +	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +			  struct vfe_line *line)
> +{
> +	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> +	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	dev_dbg(vfe->camss->dev, "%s wm:%d, image buf addr:0x%x\n",
> +		__func__, wm, addr);
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP clear.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_780 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_780;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_780 = {
> +	.enable_irq = NULL,
> +	.global_reset = NULL,
> +	.hw_version = vfe_hw_version,
> +	.isr = NULL,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = NULL,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 71bd55e854bb..507fc7785ac8 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -343,6 +343,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8550:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -674,15 +675,17 @@ int vfe_reset(struct vfe_device *vfe)
>   {
>   	unsigned long time;
>   
> -	reinit_completion(&vfe->reset_complete);
> +	if (vfe->res->hw_ops->global_reset) {
> +		reinit_completion(&vfe->reset_complete);
>   
> -	vfe->res->hw_ops->global_reset(vfe);
> +		vfe->res->hw_ops->global_reset(vfe);
>   
> -	time = wait_for_completion_timeout(&vfe->reset_complete,
> -		msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
> -	if (!time) {
> -		dev_err(vfe->camss->dev, "VFE reset timeout\n");
> -		return -EIO;
> +		time = wait_for_completion_timeout(&vfe->reset_complete,
> +			msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
> +		if (!time) {
> +			dev_err(vfe->camss->dev, "VFE reset timeout\n");
> +			return -EIO;
> +		}

Per my comment on the CSID - this feels like a fix you are introducing 
here in the guise of a silicon add.

Please break it up.

If you have a number of fixes to core functionality they need to be

1. Granular and individual
2. Indivdually scrutable with their own patch and descritption
3. git cherry-pickable
4. Have a Fixes tag
5. And be cc'd to stable@vger.kernel.org

Can't accept either the fixes or the silicon add if the two live mixed 
up in one patch.

>   	}
>   
>   	return 0;
> @@ -1120,7 +1123,8 @@ void vfe_put(struct vfe_device *vfe)
>   	} else if (vfe->power_count == 1) {
>   		if (vfe->was_streaming) {
>   			vfe->was_streaming = 0;
> -			vfe->res->hw_ops->vfe_halt(vfe);
> +			if (vfe->res->hw_ops->vfe_halt)
> +				vfe->res->hw_ops->vfe_halt(vfe);

Similar comment.

>   		}
>   		camss_disable_clocks(vfe->nclocks, vfe->clock);
>   		pm_runtime_put_sync(vfe->camss->dev);
> @@ -1807,11 +1811,13 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   	vfe->irq = ret;
>   	snprintf(vfe->irq_name, sizeof(vfe->irq_name), "%s_%s%d",
>   		 dev_name(dev), MSM_VFE_NAME, id);
> -	ret = devm_request_irq(dev, vfe->irq, vfe->res->hw_ops->isr,
> -			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
> -	if (ret < 0) {
> -		dev_err(dev, "request_irq failed: %d\n", ret);
> -		return ret;
> +	if (vfe->res->hw_ops->isr) {

And again.

> +		ret = devm_request_irq(dev, vfe->irq, vfe->res->hw_ops->isr,
> +				       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
> +		if (ret < 0) {
> +			dev_err(dev, "request_irq failed: %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	/* Clocks */
> @@ -1963,6 +1969,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8550:
>   		ret = 16;
>   		break;
>   	default:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index fcbf4f609129..9dec5bc0d1b1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>   extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_480;
> +extern const struct vfe_hw_ops vfe_ops_780;
>   
>   int vfe_get(struct vfe_device *vfe);
>   void vfe_put(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 7ee102948dc4..92a0fa02e415 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1666,6 +1666,125 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources vfe_res_8550[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe0_fast_ahb",
> +			   "vfe0", "cpas_vfe0", "camnoc_axi" },

Should the camnoc AXI clock go here or in the CSID ?


> +		.clock_rate = { { 0, 0, 0, 0, 0 },
> +				{ 0, 0, 0, 0, 80000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 466000000, 594000000, 675000000, 785000000, 785000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_780,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe1_fast_ahb",
> +			   "vfe1", "cpas_vfe1", "camnoc_axi" },
> +		.clock_rate = {	{ 0, 0, 0, 0, 0 },
> +				{ 0, 0, 0, 0, 80000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 466000000, 594000000, 675000000, 785000000, 785000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_780,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe2_fast_ahb",
> +			   "vfe2", "cpas_vfe2", "camnoc_axi" },
> +		.clock_rate = {	{ 0, 0, 0, 0, 0 },
> +				{ 0, 0, 0, 0, 80000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 466000000, 594000000, 675000000, 785000000, 785000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 } },
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife2",
> +			.hw_ops = &vfe_ops_780,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 lite */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
> +			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
> +		.clock_rate = {	{ 0, 0, 0, 0, 0 },
> +				{ 0, 0, 0, 0, 80000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 } },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_780,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 lite */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
> +			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
> +		.clock_rate = {	{ 0, 0, 0, 0, 0 },
> +				{ 0, 0, 0, 0, 80000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },

I realise you're specifying all of the operating points here but the 
clock only needs to appear once i.e.

1 x 300 MHz
1 x 400 MHz
1 x 480 MHz

etc.

> +				{ 400000000, 480000000, 480000000, 480000000, 480000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 },
> +				{ 300000000, 300000000, 400000000, 400000000, 400000000 } },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_780,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sm8550[] = {
>   	{
>   		.name = "ahb",
> @@ -1846,6 +1965,17 @@ void camss_pm_domain_off(struct camss *camss, int id)
>   	}
>   }
>   
> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
> +{
> +	struct csid_device *csid;
> +
> +	if (hw_id < camss->res->csid_num) {

Does this cause do anything ? Is it just defensive programming ? Can the 
hw_id index exceed the number of CSIDs defined and if so why ?

Smells wrong.

> +		csid = &(camss->csid[hw_id]);
> +
> +		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +	}
> +}
> +
>   void camss_buf_done(struct camss *camss, int hw_id, int port_id)
>   {
>   	struct vfe_device *vfe;
> @@ -2668,10 +2798,12 @@ static const struct camss_resources sm8550_resources = {
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8550,
>   	.csid_res = csid_res_8550,
> +	.vfe_res = vfe_res_8550,
>   	.icc_res = icc_res_sm8550,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
>   	.csid_num = ARRAY_SIZE(csid_res_8550),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8550),
>   	.link_entities = camss_link_entities
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index d6b6558a82b9..697846e70e78 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -157,5 +157,7 @@ int camss_vfe_get(struct camss *camss, int id);
>   void camss_vfe_put(struct camss *camss, int id);
>   void camss_delete(struct camss *camss);
>   void camss_buf_done(struct camss *camss, int hw_id, int port_id);
> +void camss_reg_update(struct camss *camss, int hw_id,
> +		      int port_id, bool is_clear);
>   
>   #endif /* QC_MSM_CAMSS_H */

All in all good work, looks like good progress and thanks for sticking 
with your submissions.

Please follow up on the points raised.

---
bod


