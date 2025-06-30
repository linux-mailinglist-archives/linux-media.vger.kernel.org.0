Return-Path: <linux-media+bounces-36347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F26AEE977
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8F4163F24
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BFD242D9B;
	Mon, 30 Jun 2025 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gZO1+ekr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C094C6C;
	Mon, 30 Jun 2025 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751319175; cv=none; b=VBS44DcqMh8D+3L/kqAgAPCVMhiAgAA+ylmTA3BH5FOvdyeP9JPo5ZQHzTjmLS0AO4+jxrz9rKRJy8FrArYv44mjuLycexZ8kVqpI8rbbM2AEqiSVi+OPWIYgvAC2uLrkjKaVJMuCRmxAn1kwmylgiKsmSrO4fs/bn1FEx/lvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751319175; c=relaxed/simple;
	bh=RsyzriWC3iNDhQ8hqaEpW7rmrXey3/5UUdpJ0f8PK3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Edfvtmm6NlqP/6hFsPfXnhPC72WN41qQ3/EEyqvkOLMS5GMnjVo4aE8Cpf7Jbv6192tp0Bl2KoPw7ELP3bQ2ymYo87lLgyjvEiHfgw1b+kENKtkWkvbt3s5OO1JQ1QzZNj3odNMifr7ZvAE7vGEWAXfL94faaB3JfPE3A8GKhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gZO1+ekr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BD34C75;
	Mon, 30 Jun 2025 23:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751319147;
	bh=RsyzriWC3iNDhQ8hqaEpW7rmrXey3/5UUdpJ0f8PK3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gZO1+ekr9PXiLbByDIo4908hIu7VeqiIHTp8FrK255BttLE2GKKEDB2v77JnkWT7a
	 nm38RomaAk1KXo52ztynNoVNTkdo7hWI+GMndlvKgNCY21EPWnIHIKBjOmQXuFS7V+
	 F2/wIj+51qWSW9nvZwXDfZHu3UGqaZC8bIoMeMnA=
Message-ID: <d200372a-7edb-4469-8bb4-1080203676bb@ideasonboard.com>
Date: Mon, 30 Jun 2025 22:32:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-2-e4ecdddb0a96@ideasonboard.com>
 <tgjqjwqfmjihux545gnmdvaisdgayxh62lsrrqqv2zy2av5scr@mnkmo3ysacet>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <tgjqjwqfmjihux545gnmdvaisdgayxh62lsrrqqv2zy2av5scr@mnkmo3ysacet>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 30/06/2025 17:05, Jacopo Mondi wrote:
> Hi Dan
>
> On Tue, Jun 24, 2025 at 01:35:59PM +0100, Daniel Scally wrote:
>> Add a driver for the Input Video Control block in an RZ/V2H SoC which
>> feeds data into the Arm Mali-C55 ISP.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v2:
>>
>> 	- Added selects and depends statements to Kconfig entry
>> 	- Fixed copyright year
>> 	- Stopped including in .c files headers already included in .h
>> 	- Fixed uninitialized variable in iterator
>> 	- Only check vvalid member in interrupt function and wait
>> 	  unconditionally elsewhere
>> 	- __maybe_unused for the PM ops
>> 	- Initialise the subdevice after setting up PM
>> 	- Fixed the remove function for the driver to actually do
>> 	  something.
>> 	- Some minor formatting changes
>> 	- Fixed the quantization member for the format
>> 	- Changes accounting for the v2 of the media jobs framework
>> 	- Change min_queued_buffers to 0
>> ---
>>   drivers/media/platform/renesas/Kconfig             |   2 +
>>   drivers/media/platform/renesas/Makefile            |   1 +
>>   drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  15 +
>>   drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 237 +++++++
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 379 ++++++++++++
>>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 678 +++++++++++++++++++++
>>   .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 133 ++++
>>   8 files changed, 1450 insertions(+)
>>
>> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
>> index 27a54fa7908384f2e8200f0f7283a82b0ae8435c..5462e524c3708be87a50dd80d4b4017a2466aa99 100644
>> --- a/drivers/media/platform/renesas/Kconfig
>> +++ b/drivers/media/platform/renesas/Kconfig
>> @@ -42,6 +42,8 @@ config VIDEO_SH_VOU
>>   source "drivers/media/platform/renesas/rcar-isp/Kconfig"
>>   source "drivers/media/platform/renesas/rcar-vin/Kconfig"
>>   source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
>> +source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
>> +
>>
>>   # Mem2mem drivers
>>
>> diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
>> index 1127259c09d6a51b70803e76c495918e06777f67..b6b4abf01db246aaf8269b8027efee9b0b32083a 100644
>> --- a/drivers/media/platform/renesas/Makefile
>> +++ b/drivers/media/platform/renesas/Makefile
>> @@ -6,6 +6,7 @@
>>   obj-y += rcar-isp/
>>   obj-y += rcar-vin/
>>   obj-y += rzg2l-cru/
>> +obj-y += rzv2h-ivc/
>>   obj-y += vsp1/
>>
>>   obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3df8ff585c36fe7c74e1eb0408b344cbc2b4d898
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_RZV2H_IVC
>> +	tristate "Renesas RZ/V2H Input Video Control block driver"
>> +	depends on V4L_PLATFORM_DRIVERS
>> +	depends on VIDEO_DEV
>> +	depends on ARCH_RENESAS || COMPILE_TEST
>> +	depends on OF
>> +	select VIDEOBUF2_DMA_CONTIG
>> +	select MEDIA_CONTROLLER
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	select RESET_CONTROLLER
>> +	help
>> +	  Support for the Video Input Block found in the RZ/V2H SoC. Enable this
>> +	  to support the block, and by extension the ISP to which it feeds data.
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Makefile b/drivers/media/platform/renesas/rzv2h-ivc/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..080ee3570f09c236d87abeaea5d8dd578fefb6d3
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +rzv2h-ivc-y := rzv2h-ivc-dev.o rzv2h-ivc-subdev.o rzv2h-ivc-video.o
>> +
>> +obj-$(CONFIG_VIDEO_RZV2H_IVC) += rzv2h-ivc.o
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d07254fab5b52ea4b06e2ac2301a5945707fcf95
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
>> @@ -0,0 +1,237 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Renesas RZ/V2H Input Video Control Block driver
>> + *
>> + * Copyright (C) 2025 Ideas on Board Oy
>> + */
>> +
>> +#include "rzv2h-ivc.h"
>> +
>> +#include <linux/device.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>> +
>> +inline void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val)
>> +{
>> +	writel(val, ivc->base + addr);
>> +}
>> +
>> +void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
>> +			   u32 mask, u32 val)
>> +{
>> +	u32 orig, new;
>> +
>> +	orig = readl(ivc->base + addr);
>> +
>> +	new = orig & ~mask;
>> +	new |= val & mask;
>> +
>> +	if (new != orig)
>> +		writel(new, ivc->base + addr);
>> +}
>> +
>> +static int rzv2h_ivc_get_hardware_resources(struct rzv2h_ivc *ivc,
>> +					    struct platform_device *pdev)
>> +{
>> +	const char * const reset_names[RZV2H_IVC_NUM_RESETS] = {
>> +		"presetn",
>> +		"vin_aresetn",
>> +		"sresetn",
>> +	};
>> +	const char * const clk_names[RZV2H_IVC_NUM_CLOCKS] = {
>> +		"pclk",
>> +		"vin_aclk",
>> +		"sclk",
>> +	};
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	ivc->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(ivc->base))
>> +		return dev_err_probe(ivc->dev, PTR_ERR(ivc->base),
>> +				     "failed to map IO memory\n");
>> +
>> +	for (unsigned int i = 0; i < ARRAY_SIZE(clk_names); i++)
>> +		ivc->clks[i].id = clk_names[i];
>> +
>> +	ret = devm_clk_bulk_get(ivc->dev, ARRAY_SIZE(clk_names), ivc->clks);
>> +	if (ret)
>> +		return dev_err_probe(ivc->dev, ret, "failed to acquire clks\n");
>> +
>> +	for (unsigned int i = 0; i < ARRAY_SIZE(reset_names); i++)
>> +		ivc->resets[i].id = reset_names[i];
>> +
>> +	ret = devm_reset_control_bulk_get_optional_shared(
>> +		ivc->dev, ARRAY_SIZE(reset_names), ivc->resets);
>> +	if (ret)
>> +		return dev_err_probe(ivc->dev, ret, "failed to acquire resets\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void rzv2h_ivc_global_config(struct rzv2h_ivc *ivc)
>> +{
>> +	/* Currently we only support single-exposure input */
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PLNUM, RZV2H_IVC_ONE_EXPOSURE);
>> +
>> +	/*
>> +	 * Datasheet says we should disable the interrupts before changing mode
>> +	 * to avoid spurious IFP interrupt.
>> +	 */
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_INT_EN, 0x0);
>> +
>> +	/*
>> +	 * RZ/V2H documentation says software controlled configuration is not
>> +	 * supported, and currently neither is multi-context mode. That being so
>> +	 * we just set single context sw-hw mode.
>> +	 */
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_CONTEXT,
>> +			RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG);
>> +
>> +	/*
>> +	 * We enable the frame end interrupt so that we know when we should send
>> +	 * follow-up frames.
>> +	 */
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_INT_EN, RZV2H_IVC_VVAL_IFPE);
>> +}
>> +
>> +static irqreturn_t rzv2h_ivc_isr(int irq, void *context)
>> +{
>> +	struct device *dev = context;
>> +	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
>> +
>> +	guard(spinlock)(&ivc->spinlock);
>> +	if (!--ivc->vvalid_ifp) {
>> +		wake_up_all(&ivc->buffers.wq);
>> +		ivc->vvalid_ifp = 2;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int __maybe_unused rzv2h_ivc_runtime_resume(struct device *dev)
>> +{
>> +	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = request_threaded_irq(ivc->irqnum, NULL, rzv2h_ivc_isr,
>> +				   IRQF_ONESHOT, dev_driver_string(dev), dev);
>> +	if (ret) {
>> +		dev_err(dev, "failed to request irq\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(ivc->clks), ivc->clks);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to enable clocks\n");
>> +		goto err_free_irqnum;
>> +	}
>> +
>> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(ivc->resets), ivc->resets);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to deassert resets\n");
>> +		goto err_disable_clks;
>> +	}
>> +
>> +	rzv2h_ivc_global_config(ivc);
>> +
>> +	return 0;
>> +
>> +err_disable_clks:
>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
>> +err_free_irqnum:
>> +	free_irq(ivc->irqnum, dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int __maybe_unused rzv2h_ivc_runtime_suspend(struct device *dev)
>> +{
>> +	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
>> +
>> +	reset_control_bulk_assert(ARRAY_SIZE(ivc->resets), ivc->resets);
>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
>> +	free_irq(ivc->irqnum, dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops rzv2h_ivc_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				pm_runtime_force_resume)
>> +	SET_RUNTIME_PM_OPS(rzv2h_ivc_runtime_suspend, rzv2h_ivc_runtime_resume,
>> +			   NULL)
>> +};
>> +
>> +static int rzv2h_ivc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rzv2h_ivc *ivc;
>> +	int ret;
>> +
>> +	ivc = devm_kzalloc(dev, sizeof(*ivc), GFP_KERNEL);
>> +	if (!ivc)
>> +		return -ENOMEM;
>> +
>> +	ivc->dev = dev;
>> +	platform_set_drvdata(pdev, ivc);
>> +	mutex_init(&ivc->lock);
>> +	spin_lock_init(&ivc->spinlock);
>> +
>> +	ret = rzv2h_ivc_get_hardware_resources(ivc, pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_set_autosuspend_delay(dev, 2000);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	spin_lock(&ivc->spinlock);
> You havent' started the HW nor requested the irq yet, there' no need
> to lock


Good point

>
>> +	ivc->vvalid_ifp = 2;
>> +	spin_unlock(&ivc->spinlock);
>> +
>> +	ivc->irqnum = platform_get_irq(pdev, 0);
>> +	if (ivc->irqnum < 0) {
>> +		dev_err(dev, "failed to get interrupt\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = rzv2h_ivc_initialise_subdevice(ivc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void rzv2h_ivc_remove(struct platform_device *pdev)
>> +{
>> +	struct rzv2h_ivc *ivc = platform_get_drvdata(pdev);
>> +	rzv2h_deinit_video_dev_and_queue(ivc);
>> +	rzv2h_ivc_deinit_subdevice(ivc);
>> +	mutex_destroy(&ivc->lock);
>> +}
>> +
>> +static const struct of_device_id rzv2h_ivc_of_match[] = {
>> +	{ .compatible = "renesas,rzv2h-ivc", },
>> +	{ /* Sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, rzv2h_ivc_of_match);
>> +
>> +static struct platform_driver rzv2h_ivc_driver = {
>> +	.driver = {
>> +		.name = "rzv2h-ivc",
>> +		.of_match_table = rzv2h_ivc_of_match,
>> +		.pm = &rzv2h_ivc_pm_ops,
>> +	},
>> +	.probe = rzv2h_ivc_probe,
>> +	.remove = rzv2h_ivc_remove,
>> +};
>> +
>> +module_platform_driver(rzv2h_ivc_driver);
>> +
>> +MODULE_AUTHOR("Daniel Scally <dan.scally@ideasonboard.com>");
>> +MODULE_DESCRIPTION("Renesas RZ/V2H Input Video Control Block driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fbc9fa281f57b832b2043ffd7a0add4635f56f9d
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
>> @@ -0,0 +1,379 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Renesas RZ/V2H Input Video Control Block driver
>> + *
>> + * Copyright (C) 2025 Ideas on Board Oy
>> + */
>> +
>> +#include "rzv2h-ivc.h"
>> +
>> +#include <linux/media.h>
>> +#include <linux/media-bus-format.h>
>> +#include <linux/v4l2-mediabus.h>
>> +
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/v4l2-event.h>
>> +
>> +#define RZV2H_IVC_N_INPUTS_PER_OUTPUT		6
>> +
>> +/*
>> + * We support 8/10/12/14/16/20 bit input in any bayer order, but the output
>> + * format is fixed at 20-bits with the same order as the input.
>> + */
>> +static const struct {
>> +	u32 inputs[RZV2H_IVC_N_INPUTS_PER_OUTPUT];
>> +	u32 output;
>> +} rzv2h_ivc_formats[] = {
>> +	{
>> +		.inputs = {
>> +			MEDIA_BUS_FMT_SBGGR8_1X8,
>> +			MEDIA_BUS_FMT_SBGGR10_1X10,
>> +			MEDIA_BUS_FMT_SBGGR12_1X12,
>> +			MEDIA_BUS_FMT_SBGGR14_1X14,
>> +			MEDIA_BUS_FMT_SBGGR16_1X16,
>> +			MEDIA_BUS_FMT_SBGGR20_1X20,
>> +		},
>> +		.output = MEDIA_BUS_FMT_SBGGR20_1X20
>> +	},
>> +	{
>> +		.inputs = {
>> +			MEDIA_BUS_FMT_SGBRG8_1X8,
>> +			MEDIA_BUS_FMT_SGBRG10_1X10,
>> +			MEDIA_BUS_FMT_SGBRG12_1X12,
>> +			MEDIA_BUS_FMT_SGBRG14_1X14,
>> +			MEDIA_BUS_FMT_SGBRG16_1X16,
>> +			MEDIA_BUS_FMT_SGBRG20_1X20,
>> +		},
>> +		.output = MEDIA_BUS_FMT_SGBRG20_1X20
>> +	},
>> +	{
>> +		.inputs = {
>> +			MEDIA_BUS_FMT_SGRBG8_1X8,
>> +			MEDIA_BUS_FMT_SGRBG10_1X10,
>> +			MEDIA_BUS_FMT_SGRBG12_1X12,
>> +			MEDIA_BUS_FMT_SGRBG14_1X14,
>> +			MEDIA_BUS_FMT_SGRBG16_1X16,
>> +			MEDIA_BUS_FMT_SGRBG20_1X20,
>> +		},
>> +		.output = MEDIA_BUS_FMT_SGRBG20_1X20
>> +	},
>> +	{
>> +		.inputs = {
>> +			MEDIA_BUS_FMT_SRGGB8_1X8,
>> +			MEDIA_BUS_FMT_SRGGB10_1X10,
>> +			MEDIA_BUS_FMT_SRGGB12_1X12,
>> +			MEDIA_BUS_FMT_SRGGB14_1X14,
>> +			MEDIA_BUS_FMT_SRGGB16_1X16,
>> +			MEDIA_BUS_FMT_SRGGB20_1X20,
>> +		},
>> +		.output = MEDIA_BUS_FMT_SRGGB20_1X20
>> +	},
>> +};
>> +
>> +static u32 rzv2h_ivc_get_mbus_output_from_input(u32 mbus_code)
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++) {
>> +		for (j = 0; j < RZV2H_IVC_N_INPUTS_PER_OUTPUT; j++) {
>> +			if (rzv2h_ivc_formats[i].inputs[j] == mbus_code)
>> +				return rzv2h_ivc_formats[i].output;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_enum_mbus_code(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	const struct v4l2_mbus_framefmt *fmt;
>> +	unsigned int order_index;
>> +	unsigned int index;
>> +
>> +	/*
>> +	 * On the source pad, only the 20-bit format corresponding to the sink
>> +	 * pad format's bayer order is supported.
>> +	 */
>> +	if (code->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD) {
>> +		if (code->index)
>> +			return -EINVAL;
>> +
>> +		fmt = v4l2_subdev_state_get_format(state,
>> +						   RZV2H_IVC_SUBDEV_SINK_PAD);
>> +		code->code = fmt->code;
> Is this correct ? Are you reporting the 20-bit version or just the
> sink format ?


Err yeah that doesn't look right does it - thanks!

>
>> +
>> +		return 0;
>> +	}
>> +
>> +	if (code->index >= ARRAY_SIZE(rzv2h_ivc_formats) *
>> +				RZV2H_IVC_N_INPUTS_PER_OUTPUT)
> nit: you could align RZV2H_IVC_N_INPUTS_PER_OUTPUT to ARRAY_SIZE()
>
>> +		return -EINVAL;
>> +
>> +	order_index = code->index / RZV2H_IVC_N_INPUTS_PER_OUTPUT;
>> +	index = code->index % RZV2H_IVC_N_INPUTS_PER_OUTPUT;
>> +
>> +	code->code = rzv2h_ivc_formats[order_index].inputs[index];
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_enum_frame_size(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state,
>> +				     struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	const struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (fse->index > 0)
>> +		return -EINVAL;
>> +
>> +	if (fse->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD) {
>> +		fmt = v4l2_subdev_state_get_format(state,
>> +						   RZV2H_IVC_SUBDEV_SINK_PAD);
>> +
>> +		if (fse->code != fmt->code)
>> +			return -EINVAL;
>> +
>> +		fse->min_width = fmt->width;
>> +		fse->max_width = fmt->width;
>> +		fse->min_height = fmt->height;
>> +		fse->max_height = fmt->height;
>> +
>> +		return 0;
>> +	}
>> +
>> +	if (!rzv2h_ivc_get_mbus_output_from_input(fse->code))
>> +		return -EINVAL;
>> +
>> +	fse->min_width = RZV2H_IVC_MIN_WIDTH;
>> +	fse->max_width = RZV2H_IVC_MAX_WIDTH;
>> +	fse->min_height = RZV2H_IVC_MIN_HEIGHT;
>> +	fse->max_height = RZV2H_IVC_MAX_HEIGHT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_set_fmt(struct v4l2_subdev *sd,
>> +			     struct v4l2_subdev_state *state,
>> +			     struct v4l2_subdev_format *format)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>> +	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
>> +
>> +	if (format->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD)
>> +		return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +	sink_fmt = v4l2_subdev_state_get_format(state,
>> +						RZV2H_IVC_SUBDEV_SINK_PAD);
>> +
>> +	sink_fmt->code = rzv2h_ivc_get_mbus_output_from_input(fmt->code) ?
>> +			 fmt->code : rzv2h_ivc_formats[0].inputs[0];
>> +
>> +	sink_fmt->width = clamp(fmt->width, RZV2H_IVC_MIN_WIDTH,
>> +				RZV2H_IVC_MAX_WIDTH);
>> +	sink_fmt->height = clamp(fmt->height, RZV2H_IVC_MIN_HEIGHT,
>> +				 RZV2H_IVC_MAX_HEIGHT);
>> +
>> +	*fmt = *sink_fmt;
>> +
>> +	src_fmt = v4l2_subdev_state_get_format(state,
>> +					       RZV2H_IVC_SUBDEV_SOURCE_PAD);
>> +
>> +	src_fmt->code = rzv2h_ivc_get_mbus_output_from_input(sink_fmt->code);
>> +	src_fmt->width = sink_fmt->width;
>> +	src_fmt->height = sink_fmt->height;
> if the only thing that changes between sink and source is the mbus
> code I would rather
>
> 	src_fmt = v4l2_subdev_state_get_format(state,
> 					       RZV2H_IVC_SUBDEV_SOURCE_PAD);
>          *src_fmt = *sink_fmt;
> 	src_fmt->code = rzv2h_ivc_get_mbus_output_from_input(sink_fmt->code);
>
> To make it explicit. Just a nit though
Sure, fine by me
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_enable_streams(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state, u32 pad,
>> +				    u64 streams_mask)
>> +{
>> +	/*
>> +	 * We have a single source pad, which has a single stream. V4L2 core has
>> +	 * already validated those things. The actual power-on and programming
>> +	 * of registers will be done through the video device's .vidioc_streamon
>> +	 * so there's nothing to actually do here...
>> +	 */
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_disable_streams(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state, u32 pad,
>> +				     u64 streams_mask)
>> +{
>> +	return 0;
>> +}
> Do you get any warning from the framework if you don't provide these
> two stubs ?
I think if it's missing the framework falls back on s_stream(), doesn't find it and so returns 
-ENOIOCTLCMD.
>
>> +
>> +static const struct v4l2_subdev_pad_ops rzv2h_ivc_pad_ops = {
>> +	.enum_mbus_code		= rzv2h_ivc_enum_mbus_code,
>> +	.enum_frame_size	= rzv2h_ivc_enum_frame_size,
>> +	.get_fmt		= v4l2_subdev_get_fmt,
>> +	.set_fmt		= rzv2h_ivc_set_fmt,
>> +	.enable_streams		= rzv2h_ivc_enable_streams,
>> +	.disable_streams	= rzv2h_ivc_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_core_ops rzv2h_ivc_core_ops = {
>> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>> +};
>> +
>> +static const struct v4l2_subdev_ops rzv2h_ivc_subdev_ops = {
>> +	.core	= &rzv2h_ivc_core_ops,
>> +	.pad	= &rzv2h_ivc_pad_ops,
>> +};
>> +
>> +static int rzv2h_ivc_init_state(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>> +
>> +	sink_fmt = v4l2_subdev_state_get_format(state,
>> +						RZV2H_IVC_SUBDEV_SINK_PAD);
>> +	sink_fmt->width = RZV2H_IVC_DEFAULT_WIDTH;
>> +	sink_fmt->height = RZV2H_IVC_DEFAULT_HEIGHT;
>> +	sink_fmt->field = V4L2_FIELD_NONE;
>> +	sink_fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
>> +	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>> +	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>> +	sink_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
>> +							  sink_fmt->colorspace,
>> +							  sink_fmt->ycbcr_enc);
> You could have used the explicit values for COLORSPACE_RAW here since
> they're known
>
> V4L2_XFER_FUNC_NONE
> V4L2_YCBCR_ENC_601
> V4L2_QUANTIZATION_FULL_RANGE
>
> Not a big deal if that's what you get by using DEFAULT
>
>> +
>> +	src_fmt = v4l2_subdev_state_get_format(state,
>> +					       RZV2H_IVC_SUBDEV_SOURCE_PAD);
>> +
>> +	*src_fmt = *sink_fmt;
>> +	src_fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_registered(struct v4l2_subdev *sd)
>> +{
>> +	struct rzv2h_ivc *ivc = container_of(sd, struct rzv2h_ivc, subdev.sd);
>> +
>> +	return rzv2h_initialise_video_dev_and_queue(ivc, sd->v4l2_dev);
> Quite a long name :)
Yeah...I really am bad at naming things. Maybe just rzv2h_ivc_init_vdev()?
>
>> +}
>> +
>> +static const struct v4l2_subdev_internal_ops rzv2h_ivc_subdev_internal_ops = {
>> +	.init_state = rzv2h_ivc_init_state,
>> +	.registered = rzv2h_ivc_registered,
>> +};
>> +
>> +static int rzv2h_ivc_link_validate(struct media_link *link)
>> +{
>> +	struct video_device *vdev =
>> +		media_entity_to_video_device(link->source->entity);
>> +	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
>> +	struct v4l2_subdev *sd =
>> +		media_entity_to_v4l2_subdev(link->sink->entity);
>> +	const struct rzv2h_ivc_format *fmt;
>> +	const struct v4l2_pix_format *pix;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *mf;
>> +	unsigned int i;
>> +	int ret = 0;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	mf = v4l2_subdev_state_get_format(state, link->sink->index);
>> +
>> +	pix = &ivc->format.pix;
>> +	fmt = ivc->format.fmt;
>> +
>> +	if (mf->width != pix->width || mf->height != pix->height) {
>> +		dev_dbg(ivc->dev,
>> +			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
>> +			link->source->entity->name, link->source->index,
>> +			link->sink->entity->name, link->sink->index,
>> +			mf->width, mf->height,
>> +			pix->width, pix->height);
>> +		ret = -EPIPE;
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(fmt->mbus_codes); i++)
>> +		if (mf->code == fmt->mbus_codes[i])
>> +			break;
>> +
>> +	if (i == ARRAY_SIZE(fmt->mbus_codes)) {
>> +		dev_dbg(ivc->dev,
>> +			"link '%s':%u -> '%s':%u not valid: pixel format %p4cc cannot produce mbus_code 0x%04x\n",
>> +			link->source->entity->name, link->source->index,
>> +			link->sink->entity->name, link->sink->index,
>> +			&pix->pixelformat, mf->code);
>> +		ret = -EPIPE;
>> +	}
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>> +}
> Alternatively you could have set this to v4l2_subdev_link_validate and
> implement validation on the video device. In this case I don't think
> it makes any difference though. just pointing it out in case it might
> instead help for cases I don't see at the moment
>
>> +
>> +static const struct media_entity_operations rzv2h_ivc_media_ops = {
>> +	.link_validate = rzv2h_ivc_link_validate,
>> +};
>> +
>> +int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc)
>> +{
>> +	struct v4l2_subdev *sd;
>> +	int ret;
>> +
>> +	/* Initialise subdevice */
>> +	sd = &ivc->subdev.sd;
>> +	sd->dev = ivc->dev;
>> +	v4l2_subdev_init(sd, &rzv2h_ivc_subdev_ops);
>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>> +	sd->entity.function = MEDIA_ENT_F_IO_V4L;
> This is a subdev, is this correct ?
> VSP1 entities that interface to memory have
> MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER, in example


I think either could fit fine...is there any hard rule on what to use? Changing it shouldn't be a 
problem, I'd just need to check the implications elsewhere as we check for this entity's function in 
some places.

>
>> +	sd->internal_ops = &rzv2h_ivc_subdev_internal_ops;
>> +	sd->entity.ops = &rzv2h_ivc_media_ops;
>> +
>> +	ivc->subdev.pads[RZV2H_IVC_SUBDEV_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
>> +	ivc->subdev.pads[RZV2H_IVC_SUBDEV_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
>> +
>> +	snprintf(sd->name, sizeof(sd->name), "rzv2h ivc block");
>> +
>> +	ret = media_entity_pads_init(&sd->entity, RZV2H_IVC_NUM_SUBDEV_PADS,
>> +				     ivc->subdev.pads);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to initialise media entity\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = v4l2_async_register_subdev(sd);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to register subdevice\n");
>> +		goto err_cleanup_subdev_entity;
>> +	}
> Isn't it better to call subdev_init_finalize() before registering the
> async subdev ? If you get a match and somthing pokes at the state
> before init_finalize() has been called, you're in troubles


That's true; I'll switch them around

>
>> +
>> +	ret = v4l2_subdev_init_finalize(sd);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to finalize subdev init\n");
>> +		goto err_unregister_subdev;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_unregister_subdev:
>> +	v4l2_async_unregister_subdev(sd);
> Switching the call order will probably also simplify the error path
>
>> +err_cleanup_subdev_entity:
>> +	media_entity_cleanup(&sd->entity);
>> +
>> +	return ret;
>> +}
>> +
>> +void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc)
>> +{
>> +	struct v4l2_subdev *sd = &ivc->subdev.sd;
>> +
>> +	v4l2_subdev_cleanup(sd);
>> +	media_entity_remove_links(&sd->entity);
>> +	v4l2_async_unregister_subdev(sd);
>> +	media_entity_cleanup(&sd->entity);
>> +}
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..0c82f9a744818d9f0e6db81b487612cf2d84136e
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
>> @@ -0,0 +1,678 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Renesas RZ/V2H Input Video Control Block driver
>> + *
>> + * Copyright (C) 2025 Ideas on Board Oy
>> + */
>> +
>> +#include "rzv2h-ivc.h"
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/media-bus-format.h>
>> +#include <linux/minmax.h>
>> +#include <linux/mutex.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <media/media-jobs.h>
>> +#include <media/mipi-csi2.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#define RZV2H_IVC_FIXED_HBLANK			0x20
>> +#define RZV2H_IVC_MIN_VBLANK			0x1b
>> +
>> +struct rzv2h_ivc_buf {
>> +	struct vb2_v4l2_buffer vb;
>> +	struct list_head queue;
>> +	dma_addr_t addr;
>> +};
>> +
>> +#define to_rzv2h_ivc_buf(vbuf) \
>> +	container_of(vbuf, struct rzv2h_ivc_buf, vb)
>> +
>> +static const struct rzv2h_ivc_format rzv2h_ivc_formats[] = {
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SBGGR8,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SBGGR8_1X8,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW8,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SGBRG8,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SGBRG8_1X8,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW8,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SGRBG8,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SGRBG8_1X8,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW8,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SRGGB8,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SRGGB8_1X8,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW8,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_CRU_RAW10,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SBGGR10_1X10,
>> +			MEDIA_BUS_FMT_SGBRG10_1X10,
>> +			MEDIA_BUS_FMT_SGRBG10_1X10,
>> +			MEDIA_BUS_FMT_SRGGB10_1X10
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW10,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_CRU_RAW12,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SBGGR12_1X12,
>> +			MEDIA_BUS_FMT_SGBRG12_1X12,
>> +			MEDIA_BUS_FMT_SGRBG12_1X12,
>> +			MEDIA_BUS_FMT_SRGGB12_1X12
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW12,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_CRU_RAW14,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SBGGR14_1X14,
>> +			MEDIA_BUS_FMT_SGBRG14_1X14,
>> +			MEDIA_BUS_FMT_SGRBG14_1X14,
>> +			MEDIA_BUS_FMT_SRGGB14_1X14
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW14,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SBGGR16,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SBGGR16_1X16,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW16,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SGBRG16,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SGBRG16_1X16,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW16,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SGRBG16,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SGRBG16_1X16,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW16,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_SRGGB16,
>> +		.mbus_codes = {
>> +			MEDIA_BUS_FMT_SRGGB16_1X16,
>> +		},
>> +		.dtype = MIPI_CSI2_DT_RAW16,
>> +	},
>> +};
>> +
>> +static void rzv2h_ivc_set_next_buffer(void *data)
>> +{
>> +	struct rzv2h_ivc *ivc = data;
>> +	struct rzv2h_ivc_buf *buf;
>> +
>> +	guard(spinlock)(&ivc->buffers.lock);
>> +
>> +	if (ivc->buffers.curr) {
>> +		ivc->buffers.curr->vb.sequence = ivc->buffers.sequence++;
>> +		vb2_buffer_done(&ivc->buffers.curr->vb.vb2_buf,
>> +				VB2_BUF_STATE_DONE);
>> +		ivc->buffers.curr = NULL;
>> +	}
>> +
>> +	buf = list_first_entry_or_null(&ivc->buffers.queue,
>> +				       struct rzv2h_ivc_buf, queue);
>> +	if (buf)
>> +		list_del(&buf->queue);
>> +	else
>> +		return;
> What happens if you don't have buffers in the queue ? Will the
> driver write data to the address that was previously programmed ?
Hmm it would try to read from the previously programmed address; good spot. I think we can guard 
that by checking for ivc->buffers.curr to make sure it's not null in rzv2h_ivc_transfer_buffer()
>
>> +
>> +	ivc->buffers.curr = buf;
>> +	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
>> +}
>> +
>> +static void rzv2h_ivc_transfer_buffer(void *data)
>> +{
>> +	struct rzv2h_ivc *ivc = data;
>> +
>> +	wait_event_interruptible_timeout(ivc->buffers.wq, true,
>> +					 msecs_to_jiffies(20));
>> +
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_FRCON, 0x1);
>> +}
>> +
>> +static int rzv2h_ivc_pipeline_started(struct media_entity *entity)
>> +{
>> +	struct video_device *vdev = media_entity_to_video_device(entity);
>> +	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
>> +
>> +	/*
>> +	 * With min_queued_buffers set to 1, we know that we must have at least
>> +	 * a single buffer to start feeding, so we can fetch that now and fire
>> +	 * it off to the ISP.
> Well, not anymore :)
Woops!
>> +	 */
>> +	ivc->buffers.sequence = 0;
>> +	rzv2h_ivc_transfer_buffer(ivc);
>> +
>> +	return 0;
>> +}
>> +
>> +static void rzv2h_ivc_pipeline_stopped(struct media_entity *entity)
>> +{
>> +	struct video_device *vdev = media_entity_to_video_device(entity);
>> +	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
>> +	u32 val = 0;
>> +
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, 0x1);
>> +	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
>> +			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
>> +}
>> +
>> +static const struct media_entity_operations rzv2h_ivc_media_ops = {
>> +	.pipeline_started = rzv2h_ivc_pipeline_started,
>> +	.pipeline_stopped = rzv2h_ivc_pipeline_stopped,
>> +};
>> +
>> +static int rzv2h_ivc_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>> +				 unsigned int *num_planes, unsigned int sizes[],
>> +				 struct device *alloc_devs[])
>> +{
>> +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>> +
>> +	if (*num_planes && *num_planes > 1)
>> +		return -EINVAL;
>> +
>> +	if (sizes[0] && sizes[0] < ivc->format.pix.sizeimage)
>> +		return -EINVAL;
>> +
>> +	*num_planes = 1;
>> +
>> +	if (!sizes[0])
>> +		sizes[0] = ivc->format.pix.sizeimage;
>> +
>> +	return 0;
>> +}
>> +
>> +static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct rzv2h_ivc_buf *buf = to_rzv2h_ivc_buf(vbuf);
>> +
>> +	scoped_guard(spinlock, &ivc->buffers.lock) {
>> +		list_add_tail(&buf->queue, &ivc->buffers.pending);
>> +	}
>> +
>> +	media_jobs_try_queue_job(ivc->sched, MEDIA_JOB_TYPE_PIPELINE_PULSE);
>> +}
>> +
>> +static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
>> +{
>> +	const struct rzv2h_ivc_format *fmt = ivc->format.fmt;
>> +	struct v4l2_pix_format *pix = &ivc->format.pix;
>> +	unsigned int min_vblank;
>> +	unsigned int vblank;
>> +	unsigned int hts;
>> +
>> +	/* Currently only CRU packed pixel formats are supported */
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
>> +			RZV2H_IVC_INPUT_FMT_CRU_PACKED);
>> +
>> +	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
>> +			      RZV2H_IVC_PXFMT_DTYPE, fmt->dtype);
>> +
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_HSIZE, pix->width);
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_VSIZE, pix->height);
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_STRD, pix->bytesperline);
>> +
>> +	/*
>> +	 * The ISP has minimum vertical blanking requirements that must be
>> +	 * adhered to by the IVC. The minimum is a function of the Iridix blocks
>> +	 * clocking requirements and the width of the image and horizontal
>> +	 * blanking, but if we assume the worst case then it boils down to the
>> +	 * below (plus one to the numerator to ensure the answer is rounded up)
>> +	 */
>> +
>> +	hts = pix->width + RZV2H_IVC_FIXED_HBLANK;
>> +	min_vblank = 15 + (120501 / hts);
> Could you provide a macro for this value with a little descriptive
> name ?
Sure thing
>
>> +	vblank = max(min_vblank, RZV2H_IVC_MIN_VBLANK);
>> +
>> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
>> +			RZV2H_IVC_VBLANK(vblank));
>> +}
>> +
>> +static void rzv2h_ivc_return_buffers(struct rzv2h_ivc *ivc,
>> +				     enum vb2_buffer_state state)
>> +{
>> +	struct rzv2h_ivc_buf *buf, *tmp;
>> +
>> +	guard(spinlock)(&ivc->buffers.lock);
>> +
>> +	if (ivc->buffers.curr) {
>> +		vb2_buffer_done(&ivc->buffers.curr->vb.vb2_buf, state);
>> +		ivc->buffers.curr = NULL;
>> +	}
>> +
>> +	list_for_each_entry_safe(buf, tmp, &ivc->buffers.pending, queue) {
>> +		list_del(&buf->queue);
>> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
>> +	}
>> +
>> +	list_for_each_entry_safe(buf, tmp, &ivc->buffers.queue, queue) {
>> +		list_del(&buf->queue);
>> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
>> +	}
>> +}
>> +
>> +static bool rzv2h_ivc_pipeline_ready(struct media_pipeline *pipe)
>> +{
>> +	struct media_pipeline_entity_iter iter;
>> +	unsigned int n_video_devices = 0;
>> +	struct media_entity *entity;
>> +	int ret;
>> +
>> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
>> +	if (ret)
>> +		return ret;
>> +
>> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
>> +		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
>> +			n_video_devices++;
>> +	}
> This counts the ISP video devices as well, right ?

That's right

>
>> +
>> +	media_pipeline_entity_iter_cleanup(&iter);
>> +
>> +	return n_video_devices == pipe->start_count;
> So this checks that all other video devices have started when this one
> is started as well. What if we start the IVC first and the ISP later?
Doesn't matter which order; nothing happens until they're all started and then the 
.pipeline_started() callbacks for the entities run.
>
>> +}
>> +
>> +static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>> +	struct media_pipeline *pipe;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(ivc->dev);
>> +	if (ret)
>> +		goto err_return_buffers;
>> +
>> +	ret = video_device_pipeline_alloc_start(&ivc->vdev.dev);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to start media pipeline\n");
>> +		goto err_pm_runtime_put;
>> +	}
>> +
>> +	rzv2h_ivc_format_configure(ivc);
>> +
>> +	ivc->buffers.sequence = 0;
>> +
>> +	spin_lock(&ivc->spinlock);
>> +	ivc->vvalid_ifp = 0;
>> +	spin_unlock(&ivc->spinlock);
> scoped_guard() maybe, and I wonder if you need this if you initialize
> the variable before resume_and_get
It was just to guarantee that it's in a known state, but I can probably drop it
>
>> +
>> +	pipe = video_device_pipeline(&ivc->vdev.dev);
>> +	if (rzv2h_ivc_pipeline_ready(pipe)) {
>> +		ret = media_pipeline_started(pipe);
>> +		if (ret)
>> +			goto err_stop_pipeline;
>> +
>> +		media_jobs_run_jobs(ivc->sched);
>> +	}
>> +
>> +	return 0;
>> +
>> +err_stop_pipeline:
>> +	video_device_pipeline_stop(&ivc->vdev.dev);
>> +err_pm_runtime_put:
>> +	pm_runtime_put(ivc->dev);
>> +err_return_buffers:
>> +	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_QUEUED);
>> +
>> +	return ret;
>> +}
>> +
>> +static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>> +	struct media_pipeline *pipe;
>> +
>> +	pipe = video_device_pipeline(&ivc->vdev.dev);
>> +	if (rzv2h_ivc_pipeline_ready(pipe)) {
>> +		media_pipeline_stopped(pipe);
>> +		media_jobs_cancel_jobs(ivc->sched);
>> +	}
> I suspect I already asked about this, but this returns true only if
> all video devices have started right ?
Right
>   So what if ISP is stopped first
> then IVC ?
It doesn't matter which gets stopped first, it's just to make sure we run media_pipeline_stopped() 
and media_jobs_cancel_jobs() whenever the _first_ video device is stopped
>> +
>> +	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
>> +	video_device_pipeline_stop(&ivc->vdev.dev);
>> +	pm_runtime_mark_last_busy(ivc->dev);
>> +	pm_runtime_put_autosuspend(ivc->dev);
>> +}
>> +
>> +static const struct vb2_ops rzv2h_ivc_vb2_ops = {
>> +	.queue_setup		= &rzv2h_ivc_queue_setup,
>> +	.buf_queue		= &rzv2h_ivc_buf_queue,
>> +	.wait_prepare		= vb2_ops_wait_prepare,
>> +	.wait_finish		= vb2_ops_wait_finish,
>> +	.start_streaming	= &rzv2h_ivc_start_streaming,
>> +	.stop_streaming		= &rzv2h_ivc_stop_streaming,
>> +};
>> +
>> +static const struct rzv2h_ivc_format *
>> +rzv2h_ivc_format_from_pixelformat(u32 fourcc)
>> +{
>> +	unsigned int i;
> nit: Could live inside the for loop
Ack
>
>> +
>> +	for (i = 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++)
>> +		if (fourcc == rzv2h_ivc_formats[i].fourcc)
>> +			return &rzv2h_ivc_formats[i];
>> +
>> +	return &rzv2h_ivc_formats[0];
>> +}
>> +
>> +static int rzv2h_ivc_enum_fmt_vid_out(struct file *file, void *fh,
>> +				      struct v4l2_fmtdesc *f)
>> +{
>> +	if (f->index >= ARRAY_SIZE(rzv2h_ivc_formats))
>> +		return -EINVAL;
>> +
>> +	f->pixelformat = rzv2h_ivc_formats[f->index].fourcc;
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_g_fmt_vid_out(struct file *file, void *fh,
>> +				   struct v4l2_format *f)
>> +{
>> +	struct rzv2h_ivc *ivc = video_drvdata(file);
>> +
>> +	f->fmt.pix = ivc->format.pix;
>> +
>> +	return 0;
>> +}
>> +
>> +static void rzv2h_ivc_try_fmt(struct v4l2_pix_format *pix,
>> +			      const struct rzv2h_ivc_format *fmt)
>> +{
>> +	pix->pixelformat = fmt->fourcc;
>> +
>> +	pix->width = clamp(pix->width, RZV2H_IVC_MIN_WIDTH,
>> +			   RZV2H_IVC_MAX_WIDTH);
>> +	pix->height = clamp(pix->height, RZV2H_IVC_MIN_HEIGHT,
>> +			    RZV2H_IVC_MAX_HEIGHT);
>> +
>> +	pix->field = V4L2_FIELD_NONE;
>> +	pix->colorspace = V4L2_COLORSPACE_RAW;
>> +	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
> Same as per the subdevice use explicit values, or at least the
> DEFAULT() macros
>
>> +
>> +	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
>> +}
>> +
>> +static void rzv2h_ivc_set_format(struct rzv2h_ivc *ivc,
>> +				 struct v4l2_pix_format *pix)
>> +{
>> +	const struct rzv2h_ivc_format *fmt;
>> +
>> +	fmt = rzv2h_ivc_format_from_pixelformat(pix->pixelformat);
>> +
>> +	rzv2h_ivc_try_fmt(pix, fmt);
>> +	ivc->format.pix = *pix;
>> +	ivc->format.fmt = fmt;
>> +}
>> +
>> +static int rzv2h_ivc_s_fmt_vid_out(struct file *file, void *fh,
>> +				   struct v4l2_format *f)
>> +{
>> +	struct rzv2h_ivc *ivc = video_drvdata(file);
>> +	struct v4l2_pix_format *pix = &f->fmt.pix;
>> +
>> +	if (vb2_is_busy(&ivc->vdev.vb2q))
>> +		return -EBUSY;
>> +
>> +	rzv2h_ivc_set_format(ivc, pix);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_try_fmt_vid_out(struct file *file, void *fh,
>> +				     struct v4l2_format *f)
>> +{
>> +	const struct rzv2h_ivc_format *fmt;
>> +
>> +	fmt = rzv2h_ivc_format_from_pixelformat(f->fmt.pix.pixelformat);
>> +
>> +	rzv2h_ivc_try_fmt(&f->fmt.pix, fmt);
> nit: maybe remove the previous empty line and add one before return ?
>
>> +	return 0;
>> +}
>> +
>> +static int rzv2h_ivc_querycap(struct file *file, void *fh,
>> +			      struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, "rzv2h-ivc", sizeof(cap->driver));
>> +	strscpy(cap->card, "Renesas Input Video Control", sizeof(cap->card));
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops rzv2h_ivc_v4l2_ioctl_ops = {
>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>> +	.vidioc_streamon = vb2_ioctl_streamon,
>> +	.vidioc_streamoff = vb2_ioctl_streamoff,
>> +	.vidioc_enum_fmt_vid_out = rzv2h_ivc_enum_fmt_vid_out,
>> +	.vidioc_g_fmt_vid_out = rzv2h_ivc_g_fmt_vid_out,
>> +	.vidioc_s_fmt_vid_out = rzv2h_ivc_s_fmt_vid_out,
>> +	.vidioc_try_fmt_vid_out = rzv2h_ivc_try_fmt_vid_out,
>> +	.vidioc_querycap = rzv2h_ivc_querycap,
>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +};
>> +
>> +static const struct v4l2_file_operations rzv2h_ivc_v4l2_fops = {
>> +	.owner = THIS_MODULE,
>> +	.unlocked_ioctl = video_ioctl2,
>> +	.open = v4l2_fh_open,
>> +	.release = vb2_fop_release,
>> +	.poll = vb2_fop_poll,
>> +	.mmap = vb2_fop_mmap,
>> +};
>> +
>> +static bool rzv2h_ivc_job_ready(void *data)
>> +{
>> +	struct rzv2h_ivc *ivc = data;
>> +
>> +	guard(spinlock)(&ivc->buffers.lock);
>> +
>> +	if (list_empty(&ivc->buffers.pending))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +static void rzv2h_ivc_job_queue(void *data)
>> +{
>> +	struct rzv2h_ivc *ivc = data;
>> +	struct rzv2h_ivc_buf *buf;
>> +
>> +	/*
>> +	 * We need to move an entry from the pending queue to the input queue
>> +	 * here. We know that there is one, or .check_dep() would not have
>> +	 * allowed us to get this far. The entry needs to be removed or the same
>> +	 * check would allow a new job to be queued for the exact same buffer.
>> +	 */
>> +	guard(spinlock)(&ivc->buffers.lock);
>> +	buf = list_first_entry(&ivc->buffers.pending,
>> +			       struct rzv2h_ivc_buf, queue);
>> +	list_move_tail(&buf->queue, &ivc->buffers.queue);
>> +}
>> +
>> +static void rzv2h_ivc_job_abort(void *data)
>> +{
>> +	struct rzv2h_ivc *ivc = data;
>> +	struct rzv2h_ivc_buf *buf;
>> +
>> +	guard(spinlock)(&ivc->buffers.lock);
>> +	buf = list_first_entry(&ivc->buffers.queue,
>> +			       struct rzv2h_ivc_buf, queue);
>> +
>> +	if (buf)
>> +		list_move(&buf->queue, &ivc->buffers.pending);
>> +}
>> +
>> +static int rzv2h_ivc_job_add_steps(struct media_job *job, void *data)
>> +{
>> +	struct rzv2h_ivc *ivc = data;
>> +	int ret;
>> +
>> +	ret = media_jobs_add_job_step(job, rzv2h_ivc_set_next_buffer, ivc,
>> +				      MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * This stage will be the second to last one to run - the ISP driver may
>> +	 * have some post-frame processing to do.
>> +	 */
>> +	return media_jobs_add_job_step(job, rzv2h_ivc_transfer_buffer, ivc,
>> +				       MEDIA_JOBS_FL_STEP_FROM_BACK, 1);
>> +}
>> +
>> +static struct media_job_contributor_ops rzv2h_ivc_media_job_ops = {
>> +	.add_steps	= rzv2h_ivc_job_add_steps,
>> +	.ready		= rzv2h_ivc_job_ready,
>> +	.queue		= rzv2h_ivc_job_queue,
>> +	.abort		= rzv2h_ivc_job_abort
>> +};
>> +
>> +int rzv2h_initialise_video_dev_and_queue(struct rzv2h_ivc *ivc,
>> +					 struct v4l2_device *v4l2_dev)
>> +{
>> +	struct v4l2_pix_format pix = { };
>> +	struct video_device *vdev;
>> +	struct vb2_queue *vb2q;
>> +	int ret;
>> +
>> +	spin_lock_init(&ivc->buffers.lock);
>> +	INIT_LIST_HEAD(&ivc->buffers.queue);
>> +	INIT_LIST_HEAD(&ivc->buffers.pending);
>> +	init_waitqueue_head(&ivc->buffers.wq);
>> +
>> +	/* Initialise vb2 queue */
>> +	vb2q = &ivc->vdev.vb2q;
>> +	vb2q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> it's my understandin that MPLANE API is usually preferred also for devices
> that only support single planar formats
Oh ok - thanks, I'll make the switch
>
>> +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	vb2q->drv_priv = ivc;
>> +	vb2q->mem_ops = &vb2_dma_contig_memops;
>> +	vb2q->ops = &rzv2h_ivc_vb2_ops;
>> +	vb2q->buf_struct_size = sizeof(struct rzv2h_ivc_buf);
>> +	vb2q->min_queued_buffers = 0;
> You can spare this, or keep it if you want it explicit
I'll probably keep it
>
>> +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	vb2q->lock = &ivc->lock;
>> +	vb2q->dev = ivc->dev;
>> +
>> +	ret = vb2_queue_init(vb2q);
>> +	if (ret)
>> +		return dev_err_probe(ivc->dev, ret, "vb2 queue init failed\n");
>> +
>> +	/* Initialise Video Device */
>> +	vdev = &ivc->vdev.dev;
>> +	strscpy(vdev->name, "rzv2h-ivc", sizeof(vdev->name));
>> +	vdev->release = video_device_release_empty;
>> +	vdev->fops = &rzv2h_ivc_v4l2_fops;
>> +	vdev->ioctl_ops = &rzv2h_ivc_v4l2_ioctl_ops;
>> +	vdev->lock = &ivc->lock;
>> +	vdev->v4l2_dev = v4l2_dev;
>> +	vdev->queue = vb2q;
>> +	vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>> +	vdev->vfl_dir = VFL_DIR_TX;
>> +	video_set_drvdata(vdev, ivc);
>> +
>> +	pix.pixelformat = V4L2_PIX_FMT_SRGGB16;
>> +	pix.width = RZV2H_IVC_DEFAULT_WIDTH;
>> +	pix.height = RZV2H_IVC_DEFAULT_HEIGHT;
>> +	rzv2h_ivc_set_format(ivc, &pix);
>> +
>> +	ivc->vdev.pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ivc->vdev.dev.entity.ops = &rzv2h_ivc_media_ops;
>> +	ret = media_entity_pads_init(&ivc->vdev.dev.entity, 1, &ivc->vdev.pad);
>> +	if (ret)
>> +		goto err_release_vb2q;
>> +
>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to register IVC video device\n");
>> +		goto err_cleanup_vdev_entity;
>> +	}
> What is the path that registers the subdevice devnode to userspace ?
> IOW I was expecting to see v4l2_device_register_subdev_nodes()
> somewhere


That's in the ISP driver - the IVC's subdevice connects through the V4L2 asynchronous API to the 
ISP's notifier, and the notifier's .complete() callback runs v4l2_device_register_subdev_nodes()

>
>> +
>> +	ret = media_create_pad_link(&vdev->entity, 0, &ivc->subdev.sd.entity,
>> +				    RZV2H_IVC_SUBDEV_SINK_PAD,
>> +				    MEDIA_LNK_FL_ENABLED |
>> +				    MEDIA_LNK_FL_IMMUTABLE);
>> +	if (ret) {
>> +		dev_err(ivc->dev, "failed to create media link\n");
>> +		goto err_unregister_vdev;
>> +	}
>> +
>> +	ivc->sched = media_jobs_get_scheduler(vdev->entity.graph_obj.mdev);
>> +	if (IS_ERR(ivc->sched)) {
>> +		ret = PTR_ERR(ivc->sched);
>> +		goto err_remove_link;
>> +	}
>> +
>> +	ret = media_jobs_register_job_contributor(ivc->sched,
>> +						  &rzv2h_ivc_media_job_ops, ivc,
>> +						  MEDIA_JOB_TYPE_PIPELINE_PULSE);
>> +	if (ret)
>> +		goto err_put_media_job_scheduler;
>> +
>> +	return 0;
>> +
>> +err_put_media_job_scheduler:
>> +	media_jobs_put_scheduler(ivc->sched);
>> +err_remove_link:
>> +	media_entity_remove_links(&vdev->entity);
>> +err_unregister_vdev:
>> +	video_unregister_device(vdev);
>> +err_cleanup_vdev_entity:
>> +	media_entity_cleanup(&vdev->entity);
>> +err_release_vb2q:
>> +	vb2_queue_release(vb2q);
>> +
>> +	return ret;
>> +}
>> +
>> +void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc)
>> +{
>> +	struct video_device *vdev = &ivc->vdev.dev;
>> +	struct vb2_queue *vb2q = &ivc->vdev.vb2q;
>> +
>> +	if (!ivc->sched)
>> +		return;
>> +
>> +	media_jobs_put_scheduler(ivc->sched);
>> +	vb2_video_unregister_device(vdev);
>> +	media_entity_cleanup(&vdev->entity);
>> +	vb2_queue_release(vb2q);
> Shouldn't you get here also in case of !ivc->sched ?
This driver (at least in this version) should always have a sched pointer, so this was just a 
convenient way to check if initialisation finished before trying to deinit anything...it'll probably 
change though.
>
>> +}
>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d2e310ce868125772d97259619b9369ccbcefe3d
>> --- /dev/null
>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>> @@ -0,0 +1,133 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Renesas RZ/V2H Input Video Control Block driver
>> + *
>> + * Copyright (C) 2025 Ideas on Board Oy
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/reset.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/types.h>
>> +#include <linux/videodev2.h>
>> +#include <linux/wait.h>
>> +
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-subdev.h>
>> +#include <media/videobuf2-core.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#define RZV2H_IVC_REG_AXIRX_PLNUM			0x0000
>> +#define RZV2H_IVC_ONE_EXPOSURE				0x00
>> +#define RZV2H_IVC_TWO_EXPOSURE				0x01
>> +#define RZV2H_IVC_REG_AXIRX_PXFMT			0x0004
>> +#define RZV2H_IVC_INPUT_FMT_MIPI			(0 << 16)
>> +#define RZV2H_IVC_INPUT_FMT_CRU_PACKED			(1 << 16)
>> +#define RZV2H_IVC_PXFMT_DTYPE				GENMASK(7, 0)
>> +#define RZV2H_IVC_REG_AXIRX_SADDL_P0			0x0010
>> +#define RZV2H_IVC_REG_AXIRX_SADDH_P0			0x0014
>> +#define RZV2H_IVC_REG_AXIRX_SADDL_P1			0x0018
>> +#define RZV2H_IVC_REG_AXIRX_SADDH_P1			0x001c
>> +#define RZV2H_IVC_REG_AXIRX_HSIZE			0x0020
>> +#define RZV2H_IVC_REG_AXIRX_VSIZE			0x0024
>> +#define RZV2H_IVC_REG_AXIRX_BLANK			0x0028
>> +#define RZV2H_IVC_VBLANK(x)				((x) << 16)
>> +#define RZV2H_IVC_REG_AXIRX_STRD			0x0030
>> +#define RZV2H_IVC_REG_AXIRX_ISSU			0x0040
>> +#define RZV2H_IVC_REG_AXIRX_ERACT			0x0048
>> +#define RZV2H_IVC_REG_FM_CONTEXT			0x0100
>> +#define RZV2H_IVC_SOFTWARE_CFG				0x00
>> +#define RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG		BIT(0)
>> +#define RZV2H_IVC_MULTI_CONTEXT_SW_HW_CFG		BIT(1)
>> +#define RZV2H_IVC_REG_FM_MCON				0x0104
>> +#define RZV2H_IVC_REG_FM_FRCON				0x0108
>> +#define RZV2H_IVC_REG_FM_STOP				0x010c
>> +#define RZV2H_IVC_REG_FM_INT_EN				0x0120
>> +#define RZV2H_IVC_VVAL_IFPE				BIT(0)
>> +#define RZV2H_IVC_REG_FM_INT_STA			0x0124
>> +#define RZV2H_IVC_REG_AXIRX_FIFOCAP0			0x0208
>> +#define RZV2H_IVC_REG_CORE_CAPCON			0x020c
>> +#define RZV2H_IVC_REG_CORE_FIFOCAP0			0x0228
>> +#define RZV2H_IVC_REG_CORE_FIFOCAP1			0x022c
>> +
>> +#define RZV2H_IVC_MIN_WIDTH				640
>> +#define RZV2H_IVC_MAX_WIDTH				4096
>> +#define RZV2H_IVC_MIN_HEIGHT				480
>> +#define RZV2H_IVC_MAX_HEIGHT				4096
>> +#define RZV2H_IVC_DEFAULT_WIDTH				1920
>> +#define RZV2H_IVC_DEFAULT_HEIGHT			1080
>> +
>> +#define RZV2H_IVC_NUM_CLOCKS				3
>> +#define RZV2H_IVC_NUM_RESETS				3
>> +
>> +struct device;
>> +
>> +enum rzv2h_ivc_subdev_pads {
>> +	RZV2H_IVC_SUBDEV_SINK_PAD,
>> +	RZV2H_IVC_SUBDEV_SOURCE_PAD,
>> +	RZV2H_IVC_NUM_SUBDEV_PADS
>> +};
>> +
>> +struct rzv2h_ivc_format {
>> +	u32 fourcc;
>> +	/*
>> +	 * The CRU packed pixel formats are bayer-order agnostic, so each could
>> +	 * support any one of the 4 possible media bus formats.
>> +	 */
>> +	u32 mbus_codes[4];
>> +	u8 dtype;
>> +};
>> +
>> +struct rzv2h_ivc {
>> +	struct device *dev;
>> +	void __iomem *base;
>> +	struct clk_bulk_data clks[RZV2H_IVC_NUM_CLOCKS];
>> +	struct reset_control_bulk_data resets[RZV2H_IVC_NUM_RESETS];
>> +	int irqnum;
>> +	u8 vvalid_ifp;
>> +
>> +	struct {
>> +		struct video_device dev;
>> +		struct vb2_queue vb2q;
>> +		struct media_pad pad;
>> +	} vdev;
>> +
>> +	struct {
>> +		struct v4l2_subdev sd;
>> +		struct media_pad pads[RZV2H_IVC_NUM_SUBDEV_PADS];
>> +	} subdev;
>> +
>> +	struct {
>> +		/* Spinlock to guard buffer queue */
>> +		spinlock_t lock;
>> +		wait_queue_head_t wq;
>> +		struct list_head queue;
>> +		struct list_head pending;
>> +		struct rzv2h_ivc_buf *curr;
>> +		unsigned int sequence;
>> +	} buffers;
>> +
>> +	struct media_job_scheduler *sched;
>> +
>> +	struct {
>> +		struct v4l2_pix_format pix;
>> +		const struct rzv2h_ivc_format *fmt;
>> +	} format;
>> +
>> +	/* Mutex to provide to vb2 */
>> +	struct mutex lock;
>> +	/* Lock to protect the interrupt counter */
>> +	spinlock_t spinlock;
>> +};
>> +
>> +int rzv2h_initialise_video_dev_and_queue(struct rzv2h_ivc *ivc,
>> +					 struct v4l2_device *v4l2_dev);
>> +void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc);
>> +int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc);
>> +void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc);
>> +void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val);
>> +void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
>> +			   u32 mask, u32 val);
>>
> As agreed, I didn't review the job scheduler part but only the IVC
> specific bits. A few nits here and there and next version should be
> good to go!
>
> Thanks
>    j
>
>> --
>> 2.34.1
>>
>>

