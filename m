Return-Path: <linux-media+bounces-50050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E53CCCF943D
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 17:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79127305DE5A
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72CF285C8C;
	Tue,  6 Jan 2026 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LX/XBLjS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBB021D590
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715306; cv=none; b=PIKQdDMKhKTGG0v6r4MfauFh9PexlNT6zTIzL2CRr58cfyY2iVU/6evFrCsrOq4iNzI0w1D/XrjZVinH3R0OVyjjbB22Mgetr34G67fp2LMMYYLrrMSKnqfYDpOpBRpMpjMJE1q23ybIBZyispfVsRdNjSZB7GDW8Btq29lIduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715306; c=relaxed/simple;
	bh=x9ExV+mGzYo63ex+BWnlLWPrrnMlew0vGqlEm2oBCQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPdrKmZpcyjSh5Xt9J2YIikfHj2bghUwje9A/x8cY39gUp9+TB2yqfdvEJi1fVNqKfD4H2hs21LRxRYNiKRiQJqc09nCfDHayL782DPjhBlXSM6fQ86bddoxx64SCW/YwqTXofGSk8av7s1aVCvIj7qfZZ6AYjAJt4kRcney1bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LX/XBLjS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8670855A;
	Tue,  6 Jan 2026 17:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767715280;
	bh=x9ExV+mGzYo63ex+BWnlLWPrrnMlew0vGqlEm2oBCQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LX/XBLjSumabe25wFC7a+4V4MSTYix7R5atLAYAi9oNQzS6XfEK6GBNMRy47rtOZ/
	 xilaDU9USuzPv1Ltl4EwTPo8WabPZPnWDRWfu5CETNJ6lIBVQE1nwX1VypEaHNNAfx
	 y1iqGiS6voEWTFa3dFgXLj5v4jsm3pVUIFoDWxSs=
Message-ID: <3ea77c79-20b9-423d-88b6-115b1188845e@ideasonboard.com>
Date: Tue, 6 Jan 2026 18:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkisp1: request/free irqs in PM runtime ops
To: Daniel Scally <dan.scally@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260105-rkisp1-irqs-v1-1-922f6a94a2e2@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260105-rkisp1-irqs-v1-1-922f6a94a2e2@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 05/01/2026 18:19, Daniel Scally wrote:
> The rkisp1 driver tracks whether the IRQ handlers should take any
> action through the use of an "irqs_enabled" flag which is set true
> at the end of .runtime_resume() and false at the start of
> .runtime_suspend(). In .runtime_suspend(), after setting the flag,
> there's then a short window during which the hardware has not yet
> been disabled by the clock APIs but interrupts remain enabled. If an
> interrupt is triggered during that window the IRQ handlers will return
> IRQ_NONE and fail to clear the ISP's IRQ reset registers.
> 
> Instead, delay calling request_irq() from .probe() to the end of the
> .runtime_resume() callback, and call free_irq() at the start of the
> .runtime_suspend() callback. This will prevent the interrupt handlers
> being called at all for the device once .runtime_suspend() has been
> called for it.

Shouldn't we usually always properly disable the IP before suspend? I've
seen IPs that definitely did not like at all cutting the clocks
arbitrarily when it's active.

And I don't think clk disable should be considered "disabling the
hardware". The clocks may not even be disabled at that time, if they're
shared clocks or always on clocks. So if the driver assumes that after
clk disable call it won't get any interrupts... I don't think that right.

If we can't sensibly disable the IP, I think we can at least mask the
IP's interrupts in its interrupt enable register (which we probably
should do even if we can disable the IP), and wait for any possible irq
handler to stop running. After that we won't get any interrupts,
regardless of the clocks.

 Tomi

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> We noticed this problem when testing hibernation with the streams
> running. In a typical use-case the stream might be stopped before the
> runtime PM suspend callback is called, and so the problem is avoided,
> but when hibernated with active streams there are sufficient interrupts
> coming in to reliably land one in the window between the irqs_enabled
> flag being set to false and the hardware being disabled through
> clk_bulk_disable_unprepare().
> 
> I'm under the impression that requesting the IRQs when the device is
> in use in the manner of this patch and releasing the when it is not
> in use is preferred over requesting them in the .probe() function -
> possibly an impression I picked up from Linux Device Drivers. It
> doesn't seem to be a particularly common model though, so I thought
> I'd flag the method here.
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  3 -
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 -
>  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  3 -
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 82 +++++++++++++++-------
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  3 -
>  5 files changed, 57 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 6dcefd144d5abe358323e37ac6133c6134ac636e..510d1e8d8bbc86e8b8be3579571e308e5ad9f260 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -820,9 +820,6 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>  	unsigned int i;
>  	u32 status;
>  
> -	if (!rkisp1->irqs_enabled)
> -		return IRQ_NONE;
> -
>  	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
>  	if (!status)
>  		return IRQ_NONE;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 5e6a4d5f6fd12baf45a0083eff75de1095162b2d..2a5f6f69b217cdba2fa7c4d1f230ede5aff49149 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -507,7 +507,6 @@ struct rkisp1_debug {
>   * @debug:	   debug params to be exposed on debugfs
>   * @info:	   version-specific ISP information
>   * @irqs:          IRQ line numbers
> - * @irqs_enabled:  the hardware is enabled and can cause interrupts
>   */
>  struct rkisp1_device {
>  	void __iomem *base_addr;
> @@ -532,7 +531,6 @@ struct rkisp1_device {
>  	struct rkisp1_debug debug;
>  	const struct rkisp1_info *info;
>  	int irqs[RKISP1_NUM_IRQS];
> -	bool irqs_enabled;
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> index ddc6182f3e4bdacdd1962c86f6259334b16aa505..bfc33365ad9d09ccace4ccbb2b19a2fbe1b77eb2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> @@ -196,9 +196,6 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  	u32 val, status;
>  
> -	if (!rkisp1->irqs_enabled)
> -		return IRQ_NONE;
> -
>  	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
>  	if (!status)
>  		return IRQ_NONE;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 1791c02a40ae18205f5eb2fd6edca6cda6b459bf..6fa76423bacf3e92cbbb4ef1ceb55e194b88d963 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -307,28 +307,62 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>   * Power
>   */
>  
> -static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
> +static void rkisp1_free_irqs(struct rkisp1_device *rkisp1)
>  {
> -	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> +	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1->irqs); i++) {
> +		if (rkisp1->irqs[i] == -1)
> +			continue;
>  
> -	rkisp1->irqs_enabled = false;
> -	/* Make sure the IRQ handler will see the above */
> -	mb();
> +		if (irq_has_action(rkisp1->irqs[i]))
> +			free_irq(rkisp1->irqs[i], rkisp1->dev);
> +	}
> +}
>  
> -	/*
> -	 * Wait until any running IRQ handler has returned. The IRQ handler
> -	 * may get called even after this (as it's a shared interrupt line)
> -	 * but the 'irqs_enabled' flag will make the handler return immediately.
> -	 */
> -	for (unsigned int il = 0; il < ARRAY_SIZE(rkisp1->irqs); ++il) {
> -		if (rkisp1->irqs[il] == -1)
> +static int rkisp1_request_irqs(struct rkisp1_device *rkisp1)
> +{
> +	const struct rkisp1_info *info = rkisp1->info;
> +	int ret;
> +
> +	for (unsigned int irqn = 0; irqn < ARRAY_SIZE(rkisp1->irqs); irqn++) {
> +		unsigned int isrn;
> +
> +		if (rkisp1->irqs[irqn] == -1)
>  			continue;
>  
> -		/* Skip if the irq line is the same as previous */
> -		if (il == 0 || rkisp1->irqs[il - 1] != rkisp1->irqs[il])
> -			synchronize_irq(rkisp1->irqs[il]);
> +		if (irq_has_action(rkisp1->irqs[irqn]))
> +			continue;
> +
> +		for (isrn = 0; isrn < info->isr_size; isrn++)
> +			if ((info->isrs[isrn].line_mask & BIT(irqn)))
> +				break;
> +
> +		if (isrn == info->isr_size) {
> +			dev_err(rkisp1->dev, "Failed to find IRQ handler\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = request_irq(rkisp1->irqs[irqn], info->isrs[isrn].isr,
> +				  IRQF_SHARED, dev_driver_string(rkisp1->dev),
> +				  rkisp1->dev);
> +		if (ret) {
> +			dev_err(rkisp1->dev, "Failed to request IRQ\n");
> +			goto err_free_irqs;
> +		}
>  	}
>  
> +	return 0;
> +
> +err_free_irqs:
> +	rkisp1_free_irqs(rkisp1);
> +	return ret;
> +}
> +
> +static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
> +{
> +	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> +
> +	rkisp1_free_irqs(rkisp1);
> +
>  	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
>  	return pinctrl_pm_select_sleep_state(dev);
>  }
> @@ -345,11 +379,16 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	rkisp1->irqs_enabled = true;
> -	/* Make sure the IRQ handler will see the above */
> -	mb();
> +	ret = rkisp1_request_irqs(rkisp1);
> +	if (ret)
> +		goto err_clk_disable;
>  
>  	return 0;
> +
> +err_clk_disable:
> +	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
> +
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops rkisp1_pm_ops = {
> @@ -694,13 +733,6 @@ static int rkisp1_probe(struct platform_device *pdev)
>  			if (info->isrs[i].line_mask & BIT(il))
>  				rkisp1->irqs[il] = irq;
>  		}
> -
> -		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
> -				       dev_driver_string(dev), dev);
> -		if (ret) {
> -			dev_err(dev, "request irq failed: %d\n", ret);
> -			return ret;
> -		}
>  	}
>  
>  	ret = rkisp1_init_clocks(rkisp1);
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2311672cedb1b6c9dd7f1b883adcac1516a685ae..c6b1ecd2d0c260f6739726c9f32562b98ca31364 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -1106,9 +1106,6 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  	u32 status, isp_err;
>  
> -	if (!rkisp1->irqs_enabled)
> -		return IRQ_NONE;
> -
>  	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
>  	if (!status)
>  		return IRQ_NONE;
> 
> ---
> base-commit: ee5b462b97162dbb6c536e18a37b3048f6520019
> change-id: 20260105-rkisp1-irqs-8af5a1e0b887
> 
> Best regards,


