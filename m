Return-Path: <linux-media+bounces-50051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24127CF93F1
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 17:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60C96301518E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0311B33F8C3;
	Tue,  6 Jan 2026 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IV/Klcb5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB5333F396
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715448; cv=none; b=sPpaPM4QgURBBium4lt20g26AA9mO0gWC8D0EtrxwhRecC07iBSfmHQfXOfYgqXWHvIWJyDpN/b2pn1lDNA/3mCCWlneR/zBjL7dp80g+g8lnzejkHk/7dccySq61YtR4R9pWmfr8oQjgu1cl7UX9Q196Jj+kfzU7xJwj9LLCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715448; c=relaxed/simple;
	bh=5G/+nUhJD0Wn816WxDxaa6K8L80DgvEIRkS+FfcW+74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEeTWwWbBkUg4tsLpTO1QJsQLiPbYHcD0+6ZVwk7r0lUg6GhJXiQxDi0AKjx/PhXVf8o0lzJoMVoxFGR0L//zFn9/OI3u2RnVz/rsnR4XL1AePcS2KUEcukao8f88sEAR88U6M4L/++NQ4nI0ogNEVdtPALv2d763H+M4aEdxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IV/Klcb5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6AE8F82A;
	Tue,  6 Jan 2026 17:03:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767715423;
	bh=5G/+nUhJD0Wn816WxDxaa6K8L80DgvEIRkS+FfcW+74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV/Klcb5cF30mwZuL3Xqo2dsqL608TBQV3KhGnzWuUmpY359rjWeB061Wc1jKsGlm
	 k11UCba1V8fRCRvzqs3l4MHUijg9ir4X+hNkwrYMZl2qF59KvRpKn1B9T5lXGYaYH1
	 g2RU442RZ/w/dIWO6kdXlLzHFzBr5iWYjhfQEJOY=
Date: Tue, 6 Jan 2026 18:03:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: rkisp1: request/free irqs in PM runtime ops
Message-ID: <20260106160346.GE26157@pendragon.ideasonboard.com>
References: <20260105-rkisp1-irqs-v1-1-922f6a94a2e2@ideasonboard.com>
 <3ea77c79-20b9-423d-88b6-115b1188845e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ea77c79-20b9-423d-88b6-115b1188845e@ideasonboard.com>

On Tue, Jan 06, 2026 at 06:01:38PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 05/01/2026 18:19, Daniel Scally wrote:
> > The rkisp1 driver tracks whether the IRQ handlers should take any
> > action through the use of an "irqs_enabled" flag which is set true
> > at the end of .runtime_resume() and false at the start of
> > .runtime_suspend(). In .runtime_suspend(), after setting the flag,
> > there's then a short window during which the hardware has not yet
> > been disabled by the clock APIs but interrupts remain enabled. If an
> > interrupt is triggered during that window the IRQ handlers will return
> > IRQ_NONE and fail to clear the ISP's IRQ reset registers.
> > 
> > Instead, delay calling request_irq() from .probe() to the end of the
> > .runtime_resume() callback, and call free_irq() at the start of the
> > .runtime_suspend() callback. This will prevent the interrupt handlers
> > being called at all for the device once .runtime_suspend() has been
> > called for it.
> 
> Shouldn't we usually always properly disable the IP before suspend? I've
> seen IPs that definitely did not like at all cutting the clocks
> arbitrarily when it's active.

Yes we should. The driver should have real system suspend/resume
handlers that stop and restart streaming.

> And I don't think clk disable should be considered "disabling the
> hardware". The clocks may not even be disabled at that time, if they're
> shared clocks or always on clocks. So if the driver assumes that after
> clk disable call it won't get any interrupts... I don't think that right.
> 
> If we can't sensibly disable the IP, I think we can at least mask the
> IP's interrupts in its interrupt enable register (which we probably
> should do even if we can disable the IP), and wait for any possible irq
> handler to stop running. After that we won't get any interrupts,
> regardless of the clocks.
> 
>  Tomi
> 
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > We noticed this problem when testing hibernation with the streams
> > running. In a typical use-case the stream might be stopped before the
> > runtime PM suspend callback is called, and so the problem is avoided,
> > but when hibernated with active streams there are sufficient interrupts
> > coming in to reliably land one in the window between the irqs_enabled
> > flag being set to false and the hardware being disabled through
> > clk_bulk_disable_unprepare().
> > 
> > I'm under the impression that requesting the IRQs when the device is
> > in use in the manner of this patch and releasing the when it is not
> > in use is preferred over requesting them in the .probe() function -
> > possibly an impression I picked up from Linux Device Drivers. It
> > doesn't seem to be a particularly common model though, so I thought
> > I'd flag the method here.
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  3 -
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 -
> >  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  3 -
> >  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 82 +++++++++++++++-------
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  3 -
> >  5 files changed, 57 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 6dcefd144d5abe358323e37ac6133c6134ac636e..510d1e8d8bbc86e8b8be3579571e308e5ad9f260 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -820,9 +820,6 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
> >  	unsigned int i;
> >  	u32 status;
> >  
> > -	if (!rkisp1->irqs_enabled)
> > -		return IRQ_NONE;
> > -
> >  	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
> >  	if (!status)
> >  		return IRQ_NONE;
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 5e6a4d5f6fd12baf45a0083eff75de1095162b2d..2a5f6f69b217cdba2fa7c4d1f230ede5aff49149 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -507,7 +507,6 @@ struct rkisp1_debug {
> >   * @debug:	   debug params to be exposed on debugfs
> >   * @info:	   version-specific ISP information
> >   * @irqs:          IRQ line numbers
> > - * @irqs_enabled:  the hardware is enabled and can cause interrupts
> >   */
> >  struct rkisp1_device {
> >  	void __iomem *base_addr;
> > @@ -532,7 +531,6 @@ struct rkisp1_device {
> >  	struct rkisp1_debug debug;
> >  	const struct rkisp1_info *info;
> >  	int irqs[RKISP1_NUM_IRQS];
> > -	bool irqs_enabled;
> >  };
> >  
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > index ddc6182f3e4bdacdd1962c86f6259334b16aa505..bfc33365ad9d09ccace4ccbb2b19a2fbe1b77eb2 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > @@ -196,9 +196,6 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
> >  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> >  	u32 val, status;
> >  
> > -	if (!rkisp1->irqs_enabled)
> > -		return IRQ_NONE;
> > -
> >  	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
> >  	if (!status)
> >  		return IRQ_NONE;
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 1791c02a40ae18205f5eb2fd6edca6cda6b459bf..6fa76423bacf3e92cbbb4ef1ceb55e194b88d963 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -307,28 +307,62 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >   * Power
> >   */
> >  
> > -static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
> > +static void rkisp1_free_irqs(struct rkisp1_device *rkisp1)
> >  {
> > -	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> > +	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1->irqs); i++) {
> > +		if (rkisp1->irqs[i] == -1)
> > +			continue;
> >  
> > -	rkisp1->irqs_enabled = false;
> > -	/* Make sure the IRQ handler will see the above */
> > -	mb();
> > +		if (irq_has_action(rkisp1->irqs[i]))
> > +			free_irq(rkisp1->irqs[i], rkisp1->dev);
> > +	}
> > +}
> >  
> > -	/*
> > -	 * Wait until any running IRQ handler has returned. The IRQ handler
> > -	 * may get called even after this (as it's a shared interrupt line)
> > -	 * but the 'irqs_enabled' flag will make the handler return immediately.
> > -	 */
> > -	for (unsigned int il = 0; il < ARRAY_SIZE(rkisp1->irqs); ++il) {
> > -		if (rkisp1->irqs[il] == -1)
> > +static int rkisp1_request_irqs(struct rkisp1_device *rkisp1)
> > +{
> > +	const struct rkisp1_info *info = rkisp1->info;
> > +	int ret;
> > +
> > +	for (unsigned int irqn = 0; irqn < ARRAY_SIZE(rkisp1->irqs); irqn++) {
> > +		unsigned int isrn;
> > +
> > +		if (rkisp1->irqs[irqn] == -1)
> >  			continue;
> >  
> > -		/* Skip if the irq line is the same as previous */
> > -		if (il == 0 || rkisp1->irqs[il - 1] != rkisp1->irqs[il])
> > -			synchronize_irq(rkisp1->irqs[il]);
> > +		if (irq_has_action(rkisp1->irqs[irqn]))
> > +			continue;
> > +
> > +		for (isrn = 0; isrn < info->isr_size; isrn++)
> > +			if ((info->isrs[isrn].line_mask & BIT(irqn)))
> > +				break;
> > +
> > +		if (isrn == info->isr_size) {
> > +			dev_err(rkisp1->dev, "Failed to find IRQ handler\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		ret = request_irq(rkisp1->irqs[irqn], info->isrs[isrn].isr,
> > +				  IRQF_SHARED, dev_driver_string(rkisp1->dev),
> > +				  rkisp1->dev);
> > +		if (ret) {
> > +			dev_err(rkisp1->dev, "Failed to request IRQ\n");
> > +			goto err_free_irqs;
> > +		}
> >  	}
> >  
> > +	return 0;
> > +
> > +err_free_irqs:
> > +	rkisp1_free_irqs(rkisp1);
> > +	return ret;
> > +}
> > +
> > +static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
> > +{
> > +	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> > +
> > +	rkisp1_free_irqs(rkisp1);
> > +
> >  	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
> >  	return pinctrl_pm_select_sleep_state(dev);
> >  }
> > @@ -345,11 +379,16 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	rkisp1->irqs_enabled = true;
> > -	/* Make sure the IRQ handler will see the above */
> > -	mb();
> > +	ret = rkisp1_request_irqs(rkisp1);
> > +	if (ret)
> > +		goto err_clk_disable;
> >  
> >  	return 0;
> > +
> > +err_clk_disable:
> > +	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct dev_pm_ops rkisp1_pm_ops = {
> > @@ -694,13 +733,6 @@ static int rkisp1_probe(struct platform_device *pdev)
> >  			if (info->isrs[i].line_mask & BIT(il))
> >  				rkisp1->irqs[il] = irq;
> >  		}
> > -
> > -		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
> > -				       dev_driver_string(dev), dev);
> > -		if (ret) {
> > -			dev_err(dev, "request irq failed: %d\n", ret);
> > -			return ret;
> > -		}
> >  	}
> >  
> >  	ret = rkisp1_init_clocks(rkisp1);
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 2311672cedb1b6c9dd7f1b883adcac1516a685ae..c6b1ecd2d0c260f6739726c9f32562b98ca31364 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -1106,9 +1106,6 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> >  	u32 status, isp_err;
> >  
> > -	if (!rkisp1->irqs_enabled)
> > -		return IRQ_NONE;
> > -
> >  	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
> >  	if (!status)
> >  		return IRQ_NONE;
> > 
> > ---
> > base-commit: ee5b462b97162dbb6c536e18a37b3048f6520019
> > change-id: 20260105-rkisp1-irqs-8af5a1e0b887

-- 
Regards,

Laurent Pinchart

