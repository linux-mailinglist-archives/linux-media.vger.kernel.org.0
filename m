Return-Path: <linux-media+bounces-36266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0DAED986
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 12:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D43727A6E6E
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D59D257431;
	Mon, 30 Jun 2025 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b/DaGtvv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C450239090;
	Mon, 30 Jun 2025 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278491; cv=none; b=UdbAw6a2zt5yYCgQ09TnIwN9eDGQaFqFNFMHw1zgPimUXM9JduqenERd48Y8Ox+kuNbGl7F/Ws+7A9Jpf6nEXrZY4fGIs9AvSHbSH1J0PgdYVRGdCeegZrVcPPIQMLk+tr+LyIq/OvtNNa/GiFqWGq30VERVETs4jPDqJHktpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278491; c=relaxed/simple;
	bh=o7c+n4NQm2i4etcbDah2CY/nvXTpW9E7Y8F96elUQvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrqPsmVDmcRAQAKr/JAkREzzSf3PcRR2A2eqwdySFTPHTfQEcQ3bF/usZ+RcIpQJc5MMv8k0aav9Oe3Suv6OeOW3e7hoVCq1MY0w78HdY66MsXTM79ppz2zTj9VoytdanB/OWUdAUnZj9gn86ke8hHqIDyu/njeUpNo2MeJGLeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b/DaGtvv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF5FD928;
	Mon, 30 Jun 2025 12:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751278465;
	bh=o7c+n4NQm2i4etcbDah2CY/nvXTpW9E7Y8F96elUQvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b/DaGtvvAReQ9k80MJ4P0Qfj5Xqb4pxpXQBPeq7fqvJHLhIhtyCzR4Z9mWpMpV++G
	 DpnxUWvoTlLmQMm6x2QYXEI5zAhOPUfG7cTPCP6SM5OwNzH9vZzRMy/+5IVBnioZRX
	 7tx16566SCu9BiIIWuBo9Nm4LtpK5SuRde1C4Q2k=
Message-ID: <e8ba53d9-0cbc-4d8d-b335-1463cf063424@ideasonboard.com>
Date: Mon, 30 Jun 2025 11:14:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/17] media: mali-c55: Add Mali-C55 ISP driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
 <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Morning Sakari

On 28/06/2025 21:06, Sakari Ailus wrote:
> Hi Daniel,
>
> On 6/24/25 13:21, Daniel Scally wrote:
>
> ...
>
>> +static irqreturn_t mali_c55_isr(int irq, void *context)
>> +{
>> +    struct device *dev = context;
>> +    struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>> +    u32 interrupt_status;
>> +    unsigned int i;
>> +
>> +    interrupt_status = mali_c55_read(mali_c55,
>> +                     MALI_C55_REG_INTERRUPT_STATUS_VECTOR);
>> +    if (!interrupt_status)
>> +        return IRQ_NONE;
>> +
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
>> +               interrupt_status);
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0);
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 1);
>> +
>> +    for (i = 0; i < MALI_C55_NUM_IRQ_BITS; i++) {
>> +        if (!(interrupt_status & (1 << i)))
>
> BIT(), please!
>
> Although, use __ffs() and this becomes redundant.


Ack...or now that I've found it maybe also for_each_set_bit()

>
> ...
>
>> +static void __mali_c55_power_off(struct mali_c55 *mali_c55)
>> +{
>> +    reset_control_bulk_assert(ARRAY_SIZE(mali_c55->resets), mali_c55->resets);
>> +    clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>> +}
>> +
>> +static int mali_c55_runtime_suspend(struct device *dev)
>> +{
>> +    struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>> +
>> +    free_irq(mali_c55->irqnum, dev);
>
> Do you really free the IRQ on device suspend? The law probably doesn't forbid that though.

Jacopo queried the same operation in the rzv2h-ivc driver. My apparently mistaken understanding was 
that not holding the IRQ from .probe() time was best practice, which I think I've gotten from 
reading this page [1], which says:


"Although installing the interrupt handler from within the module’s initialization function might 
sound like a good idea, it actually isn’t. Because the number of interrupt lines is limited, you 
don’t want to waste them. You can easily end up with more devices in your computer than there are 
interrupts. If a module requests an IRQ at initialization, it prevents any other driver from using 
the interrupt, even if the device holding it is never used. Requesting the interrupt at device open, 
on the other hand, allows some sharing of resources."


[1] https://www.oreilly.com/library/view/linux-device-drivers/0596000081/ch09s03.html



>
>> +    __mali_c55_power_off(mali_c55);
>> +
>> +    return 0;
>> +}
>> +
>> +static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>> +{
>> +    int ret;
>> +    u32 val;
>> +
>> +    ret = clk_bulk_prepare_enable(ARRAY_SIZE(mali_c55->clks),
>> +                      mali_c55->clks);
>> +    if (ret) {
>> +        dev_err(mali_c55->dev, "failed to enable clocks\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = reset_control_bulk_deassert(ARRAY_SIZE(mali_c55->resets),
>> +                      mali_c55->resets);
>> +    if (ret) {
>> +        dev_err(mali_c55->dev, "failed to deassert resets\n");
>> +        return ret;
>> +    }
>> +
>> +    /* Use "software only" context management. */
>> +    mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>> +                 MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x01);
>> +
>> +    /*
>> +     * Mask the interrupts and clear any that were set, then unmask the ones
>> +     * that we actually want to handle.
>> +     */
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR,
>> +               MALI_C55_INTERRUPT_MASK_ALL);
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
>> +               MALI_C55_INTERRUPT_MASK_ALL);
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0x01);
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0x00);
>> +
>> +    mali_c55_update_bits(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR,
>> +                 MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_ISP_START) |
>> +                 MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_ISP_DONE) |
>> +                 MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_FR_Y_DONE) |
>> + MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_FR_UV_DONE) |
>> +                 MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_DS_Y_DONE) |
>> + MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_DS_UV_DONE),
>> +                 0x00);
>> +
>> +    /* Set safe stop to ensure we're in a non-streaming state */
>> +    mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
>> +               MALI_C55_INPUT_SAFE_STOP);
>> +    readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
>> +               val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
>> +
>> +    return 0;
>> +}
>> +
>> +static int mali_c55_runtime_resume(struct device *dev)
>> +{
>> +    struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = __mali_c55_power_on(mali_c55);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /*
>> +     * The driver needs to transfer large amounts of register settings to
>> +     * the ISP each frame, using either a DMA transfer or memcpy. We use a
>> +     * threaded IRQ to avoid disabling interrupts the entire time that's
>> +     * happening.
>> +     */
>> +    ret = request_threaded_irq(mali_c55->irqnum, NULL, mali_c55_isr,
>> +                   IRQF_ONESHOT, dev_driver_string(dev), dev);
>> +    if (ret) {
>> +        __mali_c55_power_off(mali_c55);
>> +        dev_err(dev, "failed to request irq\n");
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static const struct dev_pm_ops mali_c55_pm_ops = {
>> +    SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                pm_runtime_force_resume)
>> +    SET_RUNTIME_PM_OPS(mali_c55_runtime_suspend, mali_c55_runtime_resume,
>> +               NULL)
>> +};
>> +
>> +static int mali_c55_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct mali_c55 *mali_c55;
>> +    struct resource *res;
>> +    dma_cap_mask_t mask;
>> +    int ret;
>> +
>> +    mali_c55 = devm_kzalloc(dev, sizeof(*mali_c55), GFP_KERNEL);
>> +    if (!mali_c55)
>> +        return -ENOMEM;
>> +
>> +    mali_c55->dev = dev;
>> +    platform_set_drvdata(pdev, mali_c55);
>> +
>> +    mali_c55->base = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +                                &res);
>> +    if (IS_ERR(mali_c55->base))
>> +        return dev_err_probe(dev, PTR_ERR(mali_c55->base),
>> +                     "failed to map IO memory\n");
>> +
>> +    for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_clk_names); i++)
>> +        mali_c55->clks[i].id = mali_c55_clk_names[i];
>> +
>> +    ret = devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to acquire clocks\n");
>> +
>> +    for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_reset_names); i++)
>> +        mali_c55->resets[i].id = mali_c55_reset_names[i];
>> +
>> +    ret = devm_reset_control_bulk_get_optional_shared(
>> +        dev, ARRAY_SIZE(mali_c55_reset_names), mali_c55->resets);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to acquire resets\n");
>> +
>> +    of_reserved_mem_device_init(dev);
>> +    vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>> +
>> +    dma_cap_zero(mask);
>> +    dma_cap_set(DMA_MEMCPY, mask);
>> +
>> +    ret = __mali_c55_power_on(mali_c55);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to power on\n");
>> +
>> +    ret = mali_c55_check_hwcfg(mali_c55);
>> +    if (ret)
>> +        goto err_power_off;
>> +
>> +    /*
>> +     * No failure here because we will just fallback on memcpy if there is
>> +     * no usable DMA channel on the system.
>> +     */
>> +    mali_c55->channel = dma_request_channel(mask, NULL, NULL);
>> +        dev_dbg(mali_c55->dev,
>> +            "No DMA channel for config, falling back to memcpy\n");
>> +
>> +    ret = mali_c55_init_context(mali_c55, res);
>> +    if (ret)
>> +        goto err_release_dma_channel;
>> +
>> +    mali_c55->media_dev.dev = dev;
>> +
>> +    mali_c55->inline_mode = device_property_read_bool(dev, "arm,inline_mode");
>> +
>> +    ret = mali_c55_media_frameworks_init(mali_c55);
>> +    if (ret)
>> +        goto err_free_context_registers;
>> +
>> +    __mali_c55_power_off(mali_c55);
>> +
>> +    pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>> +    pm_runtime_use_autosuspend(&pdev->dev);
>> +    pm_runtime_enable(&pdev->dev);
>
> Note that runtime PM resume fails before this so accessing UAPI would fail. Please enable runtime 
> PM before registering anything outside the driver.
>
>> +
>> +    mali_c55->irqnum = platform_get_irq(pdev, 0);
>
> Wouldn't it make sense to read this earlier? For the same reason than above, actually.


Yes to both

>
>> +    if (mali_c55->irqnum < 0) {
>> +        dev_err(dev, "failed to get interrupt\n");
>> +        goto err_pm_runtime_disable;
>> +    }
>> +
>> +    return 0;
>> +
>> +err_pm_runtime_disable:
>> +    pm_runtime_disable(&pdev->dev);
>> +    mali_c55_media_frameworks_deinit(mali_c55);
>> +err_free_context_registers:
>> +    kfree(mali_c55->context.registers);
>> +err_release_dma_channel:
>> +    if (mali_c55->channel)
>> +        dma_release_channel(mali_c55->channel);
>> +err_power_off:
>> +    __mali_c55_power_off(mali_c55);
>> +
>> +    return ret;
>> +}
>> +
>
> ...
>
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c 
>> b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..20d4d16c75fbf0d5519ecadb5ed1d080bdae05de
>> --- /dev/null
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>> @@ -0,0 +1,656 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ARM Mali-C55 ISP Driver - Image signal processor
>> + *
>> + * Copyright (C) 2024 Ideas on Board Oy
>
> It's 2025 already.
>
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/property.h>
>> +#include <linux/string.h>
>> +
>> +#include <linux/media/arm/mali-c55-config.h>
>
> If this is a UAPI header, please include uapi in the path, too.
Ack
>
> Earlier such headers have been under include/uapi/linux, I don't object putting new ones elsewhere 
> in principle though. Just check with Hans and Laurent, too... I don't have an opinion yet really.
>
>> +/* NOT const because the default needs to be filled in at runtime */
>> +static struct v4l2_ctrl_config mali_c55_isp_v4l2_custom_ctrls[] = {
>> +    {
>> +        .ops = &mali_c55_isp_ctrl_ops,
>> +        .id = V4L2_CID_MALI_C55_CAPABILITIES,
>> +        .name = "Mali-C55 ISP Capabilities",
>> +        .type = V4L2_CTRL_TYPE_BITMASK,
>> +        .min = 0,
>> +        .max = MALI_C55_GPS_PONG_FITTED |
>> +               MALI_C55_GPS_WDR_FITTED |
>> +               MALI_C55_GPS_COMPRESSION_FITTED |
>> +               MALI_C55_GPS_TEMPER_FITTED |
>> +               MALI_C55_GPS_SINTER_LITE_FITTED |
>> +               MALI_C55_GPS_SINTER_FITTED |
>> +               MALI_C55_GPS_IRIDIX_LTM_FITTED |
>> +               MALI_C55_GPS_IRIDIX_GTM_FITTED |
>> +               MALI_C55_GPS_CNR_FITTED |
>> +               MALI_C55_GPS_FRSCALER_FITTED |
>> +               MALI_C55_GPS_DS_PIPE_FITTED,
>> +        .def = 0,
>> +    },
>> +};
>> +
>> +static int mali_c55_isp_init_controls(struct mali_c55 *mali_c55)
>> +{
>> +    struct v4l2_ctrl_handler *handler = &mali_c55->isp.handler;
>> +    struct v4l2_ctrl *capabilities;
>> +    int ret;
>> +
>> +    ret = v4l2_ctrl_handler_init(handler, 1);
>> +    if (ret)
>> +        return ret;
>> +
>> +    mali_c55_isp_v4l2_custom_ctrls[0].def = mali_c55->capabilities;
>
> The capabilities here are still specific to a device, not global, in principle at least. Can you 
> move it here, as a local variable?


The capabilities member of struct mali_c55 you mean?  It's used in a couple of other places 
throughout the driver, so I'm not sure that makes sense - or am I misunderstanding you?

>
>> +
>> +    capabilities = v4l2_ctrl_new_custom(handler,
>> +                        &mali_c55_isp_v4l2_custom_ctrls[0],
>> +                        NULL);
>> +    if (capabilities)
>> +        capabilities->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +    if (handler->error) {
>> +        dev_err(mali_c55->dev, "failed to register capabilities control\n");
>> +        v4l2_ctrl_handler_free(handler);
>> +        return handler->error;
>
> v4l2_ctrl_handler_free() will return the error soon, presumably sooner than the above code makes 
> it to upstream. Before that, this pattern won't work as v4l2_ctrl_handler_free() also resets the 
> handler's error field. :-)


Ah, ok. Thanks

>
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h 
>> b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..36a81be0191a15da91809dd2da5d279716f6d725
>> --- /dev/null
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>> @@ -0,0 +1,318 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * ARM Mali-C55 ISP Driver - Register definitions
>> + *
>> + * Copyright (C) 2024 Ideas on Board Oy
>> + */
>> +
>> +#ifndef _MALI_C55_REGISTERS_H
>> +#define _MALI_C55_REGISTERS_H
>> +
>> +#include <linux/bits.h>
>> +
>> +/* ISP Common 0x00000 - 0x000ff */
>> +
>> +#define MALI_C55_REG_API                0x00000
>> +#define MALI_C55_REG_PRODUCT                0x00004
>> +#define MALI_C55_REG_VERSION                0x00008
>> +#define MALI_C55_REG_REVISION                0x0000c
>> +#define MALI_C55_REG_PULSE_MODE                0x0003c
>> +#define MALI_C55_REG_INPUT_MODE_REQUEST            0x0009c
>> +#define MALI_C55_INPUT_SAFE_STOP            0x00
>> +#define MALI_C55_INPUT_SAFE_START            0x01
>> +#define MALI_C55_REG_MODE_STATUS            0x000a0
>> +#define MALI_C55_REG_INTERRUPT_MASK_VECTOR        0x00030
>> +#define MALI_C55_INTERRUPT_MASK_ALL            GENMASK(31, 0)
>> +
>> +#define MALI_C55_REG_GLOBAL_MONITOR            0x00050
>> +
>> +#define MALI_C55_REG_GEN_VIDEO                0x00080
>> +#define MALI_C55_REG_GEN_VIDEO_ON_MASK            BIT(0)
>> +#define MALI_C55_REG_GEN_VIDEO_MULTI_MASK        BIT(1)
>> +#define MALI_C55_REG_GEN_PREFETCH_MASK            GENMASK(31, 16)
>> +
>> +#define MALI_C55_REG_MCU_CONFIG                0x00020
>> +#define MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK        BIT(0)
>> +#define MALI_C55_REG_MCU_CONFIG_WRITE_MASK        BIT(1)
>> +#define MALI_C55_MCU_CONFIG_WRITE(x)            ((x) << 1)
>
> Is x unsigned?
>
>> +#define MALI_C55_REG_MCU_CONFIG_WRITE_PING        BIT(1)
>> +#define MALI_C55_REG_MCU_CONFIG_WRITE_PONG        0x00
>> +#define MALI_C55_REG_MULTI_CONTEXT_MODE_MASK        BIT(8)
>> +#define MALI_C55_REG_PING_PONG_READ            0x00024
>> +#define MALI_C55_REG_PING_PONG_READ_MASK        BIT(2)
>> +#define MALI_C55_INTERRUPT_BIT(x)            BIT(x)
>> +
>> +#define MALI_C55_REG_GLOBAL_PARAMETER_STATUS        0x00068
>> +#define MALI_C55_GPS_PONG_FITTED            BIT(0)
>> +#define MALI_C55_GPS_WDR_FITTED                BIT(1)
>> +#define MALI_C55_GPS_COMPRESSION_FITTED            BIT(2)
>> +#define MALI_C55_GPS_TEMPER_FITTED            BIT(3)
>> +#define MALI_C55_GPS_SINTER_LITE_FITTED            BIT(4)
>> +#define MALI_C55_GPS_SINTER_FITTED            BIT(5)
>> +#define MALI_C55_GPS_IRIDIX_LTM_FITTED            BIT(6)
>> +#define MALI_C55_GPS_IRIDIX_GTM_FITTED            BIT(7)
>> +#define MALI_C55_GPS_CNR_FITTED                BIT(8)
>> +#define MALI_C55_GPS_FRSCALER_FITTED            BIT(9)
>> +#define MALI_C55_GPS_DS_PIPE_FITTED            BIT(10)
>> +
>> +#define MALI_C55_REG_BLANKING                0x00084
>> +#define MALI_C55_REG_HBLANK_MASK            GENMASK(15, 0)
>> +#define MALI_C55_REG_VBLANK_MASK            GENMASK(31, 16)
>> +#define MALI_C55_VBLANK(x)                ((x) << 16)
>
> Same question for the bit shifts left elsewhere in the header.
>
>> +
>> +#define MALI_C55_REG_HC_START                0x00088
>> +#define MALI_C55_HC_START(h)                (((h) & 0xffff) << 16)
>> +#define MALI_C55_REG_HC_SIZE                0x0008c
>> +#define MALI_C55_HC_SIZE(h)                ((h) & 0xffff)
>> +#define MALI_C55_REG_VC_START_SIZE            0x00094
>> +#define MALI_C55_VC_START(v)                ((v) & 0xffff)
>> +#define MALI_C55_VC_SIZE(v)                (((v) & 0xffff) << 16)
>> +
>> +/* Ping/Pong Configuration Space */
>> +#define MALI_C55_REG_BASE_ADDR                0x18e88
>> +#define MALI_C55_REG_BYPASS_0                0x18eac
>> +#define MALI_C55_REG_BYPASS_0_VIDEO_TEST        BIT(0)
>> +#define MALI_C55_REG_BYPASS_0_INPUT_FMT            BIT(1)
>> +#define MALI_C55_REG_BYPASS_0_DECOMPANDER        BIT(2)
>> +#define MALI_C55_REG_BYPASS_0_SENSOR_OFFSET_WDR        BIT(3)
>> +#define MALI_C55_REG_BYPASS_0_GAIN_WDR            BIT(4)
>> +#define MALI_C55_REG_BYPASS_0_FRAME_STITCH        BIT(5)
>> +#define MALI_C55_REG_BYPASS_1                0x18eb0
>> +#define MALI_C55_REG_BYPASS_1_DIGI_GAIN            BIT(0)
>> +#define MALI_C55_REG_BYPASS_1_FE_SENSOR_OFFS        BIT(1)
>> +#define MALI_C55_REG_BYPASS_1_FE_SQRT            BIT(2)
>> +#define MALI_C55_REG_BYPASS_1_RAW_FE            BIT(3)
>> +#define MALI_C55_REG_BYPASS_2                0x18eb8
>> +#define MALI_C55_REG_BYPASS_2_SINTER            BIT(0)
>> +#define MALI_C55_REG_BYPASS_2_TEMPER            BIT(1)
>> +#define MALI_C55_REG_BYPASS_3                0x18ebc
>> +#define MALI_C55_REG_BYPASS_3_SQUARE_BE            BIT(0)
>> +#define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH    BIT(1)
>> +#define MALI_C55_REG_BYPASS_3_MESH_SHADING        BIT(3)
>> +#define MALI_C55_REG_BYPASS_3_WHITE_BALANCE        BIT(4)
>> +#define MALI_C55_REG_BYPASS_3_IRIDIX            BIT(5)
>> +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN        BIT(6)
>> +#define MALI_C55_REG_BYPASS_4                0x18ec0
>> +#define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB        BIT(1)
>> +#define MALI_C55_REG_BYPASS_4_PF_CORRECTION        BIT(3)
>> +#define MALI_C55_REG_BYPASS_4_CCM            BIT(4)
>> +#define MALI_C55_REG_BYPASS_4_CNR            BIT(5)
>> +#define MALI_C55_REG_FR_BYPASS                0x18ec4
>> +#define MALI_C55_REG_DS_BYPASS                0x18ec8
>> +#define MALI_C55_BYPASS_CROP                BIT(0)
>> +#define MALI_C55_BYPASS_SCALER                BIT(1)
>> +#define MALI_C55_BYPASS_GAMMA_RGB            BIT(2)
>> +#define MALI_C55_BYPASS_SHARPEN                BIT(3)
>> +#define MALI_C55_BYPASS_CS_CONV                BIT(4)
>> +#define MALI_C55_REG_ISP_RAW_BYPASS            0x18ecc
>> +#define MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK        BIT(0)
>> +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK GENMASK(9, 8)
>> +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS        (2 << 8)
>> +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS        (1 << 8)
>
> BIT() or make these unsigned.
>
> ...
>
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c 
>> b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f0b079a2322125ad6313d6cf9651afaf2180b96c
>> --- /dev/null
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>
> ...
>
>> +static unsigned int mali_c55_rsz_calculate_bank(struct mali_c55 *mali_c55,
>> +                        unsigned int rsz_in,
>> +                        unsigned int rsz_out)
>> +{
>> +    unsigned int rsz_ratio = (rsz_out * 1000U) / rsz_in;
>
> Can this overflow?


I don't think so; maximum value that should be calculated is 1,000

>
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(mali_c55_rsz_coef_banks_range_start); i++)
>> +        if (rsz_ratio >= mali_c55_rsz_coef_banks_range_start[i])
>> +            break;
>> +
>> +    return i;
>> +}
>
> ...
>
>> +static int mali_c55_rsz_set_sink_fmt(struct v4l2_subdev *sd,
>> +                     struct v4l2_subdev_state *state,
>> +                     struct v4l2_subdev_format *format)
>> +{
>> +    struct v4l2_mbus_framefmt *fmt = &format->format;
>> +    struct v4l2_mbus_framefmt *sink_fmt;
>> +    unsigned int active_sink;
>> +    struct v4l2_rect *rect;
>> +
>> +    sink_fmt = v4l2_subdev_state_get_format(state, format->pad, 0);
>> +
>> +    /*
>> +     * Clamp to min/max and then reset crop and compose rectangles to the
>> +     * newly applied size.
>> +     */
>> +    sink_fmt->width = clamp_t(unsigned int, fmt->width,
>> +                  MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
>> +    sink_fmt->height = clamp_t(unsigned int, fmt->height,
>> +                   MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
>> +
>> +    /*
>> +     * Make sure the media bus code for the bypass pad is one of the
>> +     * supported ISP input media bus codes. Default it to SRGGB otherwise.
>> +     */
>> +    if (format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
>> +        sink_fmt->code = mali_c55_isp_get_mbus_config_by_code(fmt->code) ?
>> +                 fmt->code : MEDIA_BUS_FMT_SRGGB20_1X20;
>> +
>> +    *fmt = *sink_fmt;
>> +
>> +    if (format->pad == MALI_C55_RSZ_SINK_PAD) {
>> +        rect = v4l2_subdev_state_get_crop(state, format->pad);
>> +        rect->left = 0;
>> +        rect->top = 0;
>> +        rect->width = fmt->width;
>> +        rect->height = fmt->height;
>> +
>> +        rect = v4l2_subdev_state_get_compose(state, format->pad);
>> +        rect->left = 0;
>> +        rect->top = 0;
>> +        rect->width = fmt->width;
>> +        rect->height = fmt->height;
>
> If both of the rects are the same, you can simply assign the former to the latter.
Ack
>
> Overall, this seems like a nicely written driver. It's a very big one, too...
>
Thanks! It will grow a bit too I expect...

