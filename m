Return-Path: <linux-media+bounces-36158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A5AECA3A
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 22:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0631717C4ED
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 20:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EB62874F3;
	Sat, 28 Jun 2025 20:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBqfzmyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18924888E;
	Sat, 28 Jun 2025 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751141331; cv=none; b=IYO63cN92Sr+6WeoaiEvzJF4XVxMClVbsm/Mtyv519PFPkos1SGIZDXV3l4+wWs0JYSVAWPPw2IkFJAJbKUbeePcNSdQe024HTolZwK55HSPP1tBh2ql+Fexef+2h/2NF9kYTGH67PBVt84BXqOyydHbX6++X9L5WPsOiItQB5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751141331; c=relaxed/simple;
	bh=o2niLfA1Wx/+jOCAvTdJ8eK3YRwyv5LZg5N5ogNYVk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bT0aBF8TKhtU3j4RPWpZbf2HvpfG2F30iYQmSqk1ligxvTvLaPBl1S9AkydR/yD/7XrB12l+01xz15VH+rUZF2RC1hzBtdvOC36qAXRbK5ggXzv1nfgmxm1jJklNQvGIqmXpRdbcGNS/LL9liCQbkvXAF3mSkIfOmXxVQVC3f+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBqfzmyw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751141330; x=1782677330;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o2niLfA1Wx/+jOCAvTdJ8eK3YRwyv5LZg5N5ogNYVk0=;
  b=kBqfzmywzrSJ7d1Smy3RZ8UA9i0aTpf00ixDd+30wvHNqtlDydtle0sy
   NjEVz3b0A2OMEiFaiOAF1DBxr16cTCMlZ7Jk0jgwMzPco86bPuog7Om71
   ym7Z9j/wZZ9lttfJdgqrcZg406Ic4Ce0bfmbrbiQ/Q/B2JU10+0RpaKpH
   vpE0oi1IImTJEjYR/fa6AZ9MzIAY/0Xhpx1yYPkOGpOAElVIJI4h6wY0I
   88k8Zs9QiyFHcn9+hDKUb4uvccLKZVEizQrKSz7bHwfRMSQv4+DeQ7myl
   0fNvCI7QgEXknJ/5yh81HilAZSn4y2yhiAL4zKcvLb8VizDFGpXeodQKe
   A==;
X-CSE-ConnectionGUID: aIb2mCN4RgGxXd3mfBxcqg==
X-CSE-MsgGUID: d0rfiWwPQ7K7ZTwNAqXvOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53517503"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53517503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:08:49 -0700
X-CSE-ConnectionGUID: TkSbrZAPThWij8JJ9HlGEA==
X-CSE-MsgGUID: ne/YvwYfRMeVYAoCnZK1jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153184423"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:08:44 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 659AA44390;
	Sat, 28 Jun 2025 23:08:42 +0300 (EEST)
Message-ID: <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
Date: Sat, 28 Jun 2025 23:06:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/17] media: mali-c55: Add Mali-C55 ISP driver
Content-Language: en-US
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 6/24/25 13:21, Daniel Scally wrote:

...

> +static irqreturn_t mali_c55_isr(int irq, void *context)
> +{
> +	struct device *dev = context;
> +	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> +	u32 interrupt_status;
> +	unsigned int i;
> +
> +	interrupt_status = mali_c55_read(mali_c55,
> +					 MALI_C55_REG_INTERRUPT_STATUS_VECTOR);
> +	if (!interrupt_status)
> +		return IRQ_NONE;
> +
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
> +		       interrupt_status);
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0);
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 1);
> +
> +	for (i = 0; i < MALI_C55_NUM_IRQ_BITS; i++) {
> +		if (!(interrupt_status & (1 << i)))

BIT(), please!

Although, use __ffs() and this becomes redundant.

...

> +static void __mali_c55_power_off(struct mali_c55 *mali_c55)
> +{
> +	reset_control_bulk_assert(ARRAY_SIZE(mali_c55->resets), mali_c55->resets);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
> +}
> +
> +static int mali_c55_runtime_suspend(struct device *dev)
> +{
> +	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> +
> +	free_irq(mali_c55->irqnum, dev);

Do you really free the IRQ on device suspend? The law probably doesn't 
forbid that though.

> +	__mali_c55_power_off(mali_c55);
> +
> +	return 0;
> +}
> +
> +static int __mali_c55_power_on(struct mali_c55 *mali_c55)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(mali_c55->clks),
> +				      mali_c55->clks);
> +	if (ret) {
> +		dev_err(mali_c55->dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(mali_c55->resets),
> +					  mali_c55->resets);
> +	if (ret) {
> +		dev_err(mali_c55->dev, "failed to deassert resets\n");
> +		return ret;
> +	}
> +
> +	/* Use "software only" context management. */
> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> +			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x01);
> +
> +	/*
> +	 * Mask the interrupts and clear any that were set, then unmask the ones
> +	 * that we actually want to handle.
> +	 */
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR,
> +		       MALI_C55_INTERRUPT_MASK_ALL);
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
> +		       MALI_C55_INTERRUPT_MASK_ALL);
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0x01);
> +	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0x00);
> +
> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR,
> +			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_ISP_START) |
> +			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_ISP_DONE) |
> +			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_FR_Y_DONE) |
> +			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_FR_UV_DONE) |
> +			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_DS_Y_DONE) |
> +			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_DS_UV_DONE),
> +			     0x00);
> +
> +	/* Set safe stop to ensure we're in a non-streaming state */
> +	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
> +		       MALI_C55_INPUT_SAFE_STOP);
> +	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
> +			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> +
> +	return 0;
> +}
> +
> +static int mali_c55_runtime_resume(struct device *dev)
> +{
> +	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = __mali_c55_power_on(mali_c55);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The driver needs to transfer large amounts of register settings to
> +	 * the ISP each frame, using either a DMA transfer or memcpy. We use a
> +	 * threaded IRQ to avoid disabling interrupts the entire time that's
> +	 * happening.
> +	 */
> +	ret = request_threaded_irq(mali_c55->irqnum, NULL, mali_c55_isr,
> +				   IRQF_ONESHOT, dev_driver_string(dev), dev);
> +	if (ret) {
> +		__mali_c55_power_off(mali_c55);
> +		dev_err(dev, "failed to request irq\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops mali_c55_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(mali_c55_runtime_suspend, mali_c55_runtime_resume,
> +			   NULL)
> +};
> +
> +static int mali_c55_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mali_c55 *mali_c55;
> +	struct resource *res;
> +	dma_cap_mask_t mask;
> +	int ret;
> +
> +	mali_c55 = devm_kzalloc(dev, sizeof(*mali_c55), GFP_KERNEL);
> +	if (!mali_c55)
> +		return -ENOMEM;
> +
> +	mali_c55->dev = dev;
> +	platform_set_drvdata(pdev, mali_c55);
> +
> +	mali_c55->base = devm_platform_get_and_ioremap_resource(pdev, 0,
> +								&res);
> +	if (IS_ERR(mali_c55->base))
> +		return dev_err_probe(dev, PTR_ERR(mali_c55->base),
> +				     "failed to map IO memory\n");
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_clk_names); i++)
> +		mali_c55->clks[i].id = mali_c55_clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to acquire clocks\n");
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_reset_names); i++)
> +		mali_c55->resets[i].id = mali_c55_reset_names[i];
> +
> +	ret = devm_reset_control_bulk_get_optional_shared(
> +		dev, ARRAY_SIZE(mali_c55_reset_names), mali_c55->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to acquire resets\n");
> +
> +	of_reserved_mem_device_init(dev);
> +	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> +
> +	dma_cap_zero(mask);
> +	dma_cap_set(DMA_MEMCPY, mask);
> +
> +	ret = __mali_c55_power_on(mali_c55);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to power on\n");
> +
> +	ret = mali_c55_check_hwcfg(mali_c55);
> +	if (ret)
> +		goto err_power_off;
> +
> +	/*
> +	 * No failure here because we will just fallback on memcpy if there is
> +	 * no usable DMA channel on the system.
> +	 */
> +	mali_c55->channel = dma_request_channel(mask, NULL, NULL);
> +		dev_dbg(mali_c55->dev,
> +			"No DMA channel for config, falling back to memcpy\n");
> +
> +	ret = mali_c55_init_context(mali_c55, res);
> +	if (ret)
> +		goto err_release_dma_channel;
> +
> +	mali_c55->media_dev.dev = dev;
> +
> +	mali_c55->inline_mode = device_property_read_bool(dev, "arm,inline_mode");
> +
> +	ret = mali_c55_media_frameworks_init(mali_c55);
> +	if (ret)
> +		goto err_free_context_registers;
> +
> +	__mali_c55_power_off(mali_c55);
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);

Note that runtime PM resume fails before this so accessing UAPI would 
fail. Please enable runtime PM before registering anything outside the 
driver.

> +
> +	mali_c55->irqnum = platform_get_irq(pdev, 0);

Wouldn't it make sense to read this earlier? For the same reason than 
above, actually.

> +	if (mali_c55->irqnum < 0) {
> +		dev_err(dev, "failed to get interrupt\n");
> +		goto err_pm_runtime_disable;
> +	}
> +
> +	return 0;
> +
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	mali_c55_media_frameworks_deinit(mali_c55);
> +err_free_context_registers:
> +	kfree(mali_c55->context.registers);
> +err_release_dma_channel:
> +	if (mali_c55->channel)
> +		dma_release_channel(mali_c55->channel);
> +err_power_off:
> +	__mali_c55_power_off(mali_c55);
> +
> +	return ret;
> +}
> +

...

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..20d4d16c75fbf0d5519ecadb5ed1d080bdae05de
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -0,0 +1,656 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ARM Mali-C55 ISP Driver - Image signal processor
> + *
> + * Copyright (C) 2024 Ideas on Board Oy

It's 2025 already.

> + */
> +
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/property.h>
> +#include <linux/string.h>
> +
> +#include <linux/media/arm/mali-c55-config.h>

If this is a UAPI header, please include uapi in the path, too.

Earlier such headers have been under include/uapi/linux, I don't object 
putting new ones elsewhere in principle though. Just check with Hans and 
Laurent, too... I don't have an opinion yet really.

> +/* NOT const because the default needs to be filled in at runtime */
> +static struct v4l2_ctrl_config mali_c55_isp_v4l2_custom_ctrls[] = {
> +	{
> +		.ops = &mali_c55_isp_ctrl_ops,
> +		.id = V4L2_CID_MALI_C55_CAPABILITIES,
> +		.name = "Mali-C55 ISP Capabilities",
> +		.type = V4L2_CTRL_TYPE_BITMASK,
> +		.min = 0,
> +		.max = MALI_C55_GPS_PONG_FITTED |
> +		       MALI_C55_GPS_WDR_FITTED |
> +		       MALI_C55_GPS_COMPRESSION_FITTED |
> +		       MALI_C55_GPS_TEMPER_FITTED |
> +		       MALI_C55_GPS_SINTER_LITE_FITTED |
> +		       MALI_C55_GPS_SINTER_FITTED |
> +		       MALI_C55_GPS_IRIDIX_LTM_FITTED |
> +		       MALI_C55_GPS_IRIDIX_GTM_FITTED |
> +		       MALI_C55_GPS_CNR_FITTED |
> +		       MALI_C55_GPS_FRSCALER_FITTED |
> +		       MALI_C55_GPS_DS_PIPE_FITTED,
> +		.def = 0,
> +	},
> +};
> +
> +static int mali_c55_isp_init_controls(struct mali_c55 *mali_c55)
> +{
> +	struct v4l2_ctrl_handler *handler = &mali_c55->isp.handler;
> +	struct v4l2_ctrl *capabilities;
> +	int ret;
> +
> +	ret = v4l2_ctrl_handler_init(handler, 1);
> +	if (ret)
> +		return ret;
> +
> +	mali_c55_isp_v4l2_custom_ctrls[0].def = mali_c55->capabilities;

The capabilities here are still specific to a device, not global, in 
principle at least. Can you move it here, as a local variable?

> +
> +	capabilities = v4l2_ctrl_new_custom(handler,
> +					    &mali_c55_isp_v4l2_custom_ctrls[0],
> +					    NULL);
> +	if (capabilities)
> +		capabilities->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	if (handler->error) {
> +		dev_err(mali_c55->dev, "failed to register capabilities control\n");
> +		v4l2_ctrl_handler_free(handler);
> +		return handler->error;

v4l2_ctrl_handler_free() will return the error soon, presumably sooner 
than the above code makes it to upstream. Before that, this pattern 
won't work as v4l2_ctrl_handler_free() also resets the handler's error 
field. :-)

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..36a81be0191a15da91809dd2da5d279716f6d725
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> @@ -0,0 +1,318 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ARM Mali-C55 ISP Driver - Register definitions
> + *
> + * Copyright (C) 2024 Ideas on Board Oy
> + */
> +
> +#ifndef _MALI_C55_REGISTERS_H
> +#define _MALI_C55_REGISTERS_H
> +
> +#include <linux/bits.h>
> +
> +/* ISP Common 0x00000 - 0x000ff */
> +
> +#define MALI_C55_REG_API				0x00000
> +#define MALI_C55_REG_PRODUCT				0x00004
> +#define MALI_C55_REG_VERSION				0x00008
> +#define MALI_C55_REG_REVISION				0x0000c
> +#define MALI_C55_REG_PULSE_MODE				0x0003c
> +#define MALI_C55_REG_INPUT_MODE_REQUEST			0x0009c
> +#define MALI_C55_INPUT_SAFE_STOP			0x00
> +#define MALI_C55_INPUT_SAFE_START			0x01
> +#define MALI_C55_REG_MODE_STATUS			0x000a0
> +#define MALI_C55_REG_INTERRUPT_MASK_VECTOR		0x00030
> +#define MALI_C55_INTERRUPT_MASK_ALL			GENMASK(31, 0)
> +
> +#define MALI_C55_REG_GLOBAL_MONITOR			0x00050
> +
> +#define MALI_C55_REG_GEN_VIDEO				0x00080
> +#define MALI_C55_REG_GEN_VIDEO_ON_MASK			BIT(0)
> +#define MALI_C55_REG_GEN_VIDEO_MULTI_MASK		BIT(1)
> +#define MALI_C55_REG_GEN_PREFETCH_MASK			GENMASK(31, 16)
> +
> +#define MALI_C55_REG_MCU_CONFIG				0x00020
> +#define MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK		BIT(0)
> +#define MALI_C55_REG_MCU_CONFIG_WRITE_MASK		BIT(1)
> +#define MALI_C55_MCU_CONFIG_WRITE(x)			((x) << 1)

Is x unsigned?

> +#define MALI_C55_REG_MCU_CONFIG_WRITE_PING		BIT(1)
> +#define MALI_C55_REG_MCU_CONFIG_WRITE_PONG		0x00
> +#define MALI_C55_REG_MULTI_CONTEXT_MODE_MASK		BIT(8)
> +#define MALI_C55_REG_PING_PONG_READ			0x00024
> +#define MALI_C55_REG_PING_PONG_READ_MASK		BIT(2)
> +#define MALI_C55_INTERRUPT_BIT(x)			BIT(x)
> +
> +#define MALI_C55_REG_GLOBAL_PARAMETER_STATUS		0x00068
> +#define MALI_C55_GPS_PONG_FITTED			BIT(0)
> +#define MALI_C55_GPS_WDR_FITTED				BIT(1)
> +#define MALI_C55_GPS_COMPRESSION_FITTED			BIT(2)
> +#define MALI_C55_GPS_TEMPER_FITTED			BIT(3)
> +#define MALI_C55_GPS_SINTER_LITE_FITTED			BIT(4)
> +#define MALI_C55_GPS_SINTER_FITTED			BIT(5)
> +#define MALI_C55_GPS_IRIDIX_LTM_FITTED			BIT(6)
> +#define MALI_C55_GPS_IRIDIX_GTM_FITTED			BIT(7)
> +#define MALI_C55_GPS_CNR_FITTED				BIT(8)
> +#define MALI_C55_GPS_FRSCALER_FITTED			BIT(9)
> +#define MALI_C55_GPS_DS_PIPE_FITTED			BIT(10)
> +
> +#define MALI_C55_REG_BLANKING				0x00084
> +#define MALI_C55_REG_HBLANK_MASK			GENMASK(15, 0)
> +#define MALI_C55_REG_VBLANK_MASK			GENMASK(31, 16)
> +#define MALI_C55_VBLANK(x)				((x) << 16)

Same question for the bit shifts left elsewhere in the header.

> +
> +#define MALI_C55_REG_HC_START				0x00088
> +#define MALI_C55_HC_START(h)				(((h) & 0xffff) << 16)
> +#define MALI_C55_REG_HC_SIZE				0x0008c
> +#define MALI_C55_HC_SIZE(h)				((h) & 0xffff)
> +#define MALI_C55_REG_VC_START_SIZE			0x00094
> +#define MALI_C55_VC_START(v)				((v) & 0xffff)
> +#define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
> +
> +/* Ping/Pong Configuration Space */
> +#define MALI_C55_REG_BASE_ADDR				0x18e88
> +#define MALI_C55_REG_BYPASS_0				0x18eac
> +#define MALI_C55_REG_BYPASS_0_VIDEO_TEST		BIT(0)
> +#define MALI_C55_REG_BYPASS_0_INPUT_FMT			BIT(1)
> +#define MALI_C55_REG_BYPASS_0_DECOMPANDER		BIT(2)
> +#define MALI_C55_REG_BYPASS_0_SENSOR_OFFSET_WDR		BIT(3)
> +#define MALI_C55_REG_BYPASS_0_GAIN_WDR			BIT(4)
> +#define MALI_C55_REG_BYPASS_0_FRAME_STITCH		BIT(5)
> +#define MALI_C55_REG_BYPASS_1				0x18eb0
> +#define MALI_C55_REG_BYPASS_1_DIGI_GAIN			BIT(0)
> +#define MALI_C55_REG_BYPASS_1_FE_SENSOR_OFFS		BIT(1)
> +#define MALI_C55_REG_BYPASS_1_FE_SQRT			BIT(2)
> +#define MALI_C55_REG_BYPASS_1_RAW_FE			BIT(3)
> +#define MALI_C55_REG_BYPASS_2				0x18eb8
> +#define MALI_C55_REG_BYPASS_2_SINTER			BIT(0)
> +#define MALI_C55_REG_BYPASS_2_TEMPER			BIT(1)
> +#define MALI_C55_REG_BYPASS_3				0x18ebc
> +#define MALI_C55_REG_BYPASS_3_SQUARE_BE			BIT(0)
> +#define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
> +#define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
> +#define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
> +#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
> +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
> +#define MALI_C55_REG_BYPASS_4				0x18ec0
> +#define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
> +#define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
> +#define MALI_C55_REG_BYPASS_4_CCM			BIT(4)
> +#define MALI_C55_REG_BYPASS_4_CNR			BIT(5)
> +#define MALI_C55_REG_FR_BYPASS				0x18ec4
> +#define MALI_C55_REG_DS_BYPASS				0x18ec8
> +#define MALI_C55_BYPASS_CROP				BIT(0)
> +#define MALI_C55_BYPASS_SCALER				BIT(1)
> +#define MALI_C55_BYPASS_GAMMA_RGB			BIT(2)
> +#define MALI_C55_BYPASS_SHARPEN				BIT(3)
> +#define MALI_C55_BYPASS_CS_CONV				BIT(4)
> +#define MALI_C55_REG_ISP_RAW_BYPASS			0x18ecc
> +#define MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK		BIT(0)
> +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
> +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		(2 << 8)
> +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		(1 << 8)

BIT() or make these unsigned.

...

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f0b079a2322125ad6313d6cf9651afaf2180b96c
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c

...

> +static unsigned int mali_c55_rsz_calculate_bank(struct mali_c55 *mali_c55,
> +						unsigned int rsz_in,
> +						unsigned int rsz_out)
> +{
> +	unsigned int rsz_ratio = (rsz_out * 1000U) / rsz_in;

Can this overflow?

> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mali_c55_rsz_coef_banks_range_start); i++)
> +		if (rsz_ratio >= mali_c55_rsz_coef_banks_range_start[i])
> +			break;
> +
> +	return i;
> +}

...

> +static int mali_c55_rsz_set_sink_fmt(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt = &format->format;
> +	struct v4l2_mbus_framefmt *sink_fmt;
> +	unsigned int active_sink;
> +	struct v4l2_rect *rect;
> +
> +	sink_fmt = v4l2_subdev_state_get_format(state, format->pad, 0);
> +
> +	/*
> +	 * Clamp to min/max and then reset crop and compose rectangles to the
> +	 * newly applied size.
> +	 */
> +	sink_fmt->width = clamp_t(unsigned int, fmt->width,
> +				  MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
> +	sink_fmt->height = clamp_t(unsigned int, fmt->height,
> +				   MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
> +
> +	/*
> +	 * Make sure the media bus code for the bypass pad is one of the
> +	 * supported ISP input media bus codes. Default it to SRGGB otherwise.
> +	 */
> +	if (format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
> +		sink_fmt->code = mali_c55_isp_get_mbus_config_by_code(fmt->code) ?
> +				 fmt->code : MEDIA_BUS_FMT_SRGGB20_1X20;
> +
> +	*fmt = *sink_fmt;
> +
> +	if (format->pad == MALI_C55_RSZ_SINK_PAD) {
> +		rect = v4l2_subdev_state_get_crop(state, format->pad);
> +		rect->left = 0;
> +		rect->top = 0;
> +		rect->width = fmt->width;
> +		rect->height = fmt->height;
> +
> +		rect = v4l2_subdev_state_get_compose(state, format->pad);
> +		rect->left = 0;
> +		rect->top = 0;
> +		rect->width = fmt->width;
> +		rect->height = fmt->height;

If both of the rects are the same, you can simply assign the former to 
the latter.

Overall, this seems like a nicely written driver. It's a very big one, 
too...

-- 
Kind regards,

Sakari Ailus

