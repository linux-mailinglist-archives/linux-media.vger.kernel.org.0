Return-Path: <linux-media+bounces-47499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CFFC74290
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 28F702AFA5
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8633E348;
	Thu, 20 Nov 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoqVACB6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884333A6FA;
	Thu, 20 Nov 2025 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644586; cv=none; b=C6lF8nXdY58QREeG48nnHHyvA5LOXeM2JhVWnFas3MRBqmwOIoVIiY3bs+ySHt9J69dwLmuO7GATWY1F/xm7ngE0q6rN8mK3MEn1ft83g40KPLCsY2l04pua5ZUJGSyAy1+050uI2zQxtimO4AX5Kgep/x4aCTWqBfdPIYdeGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644586; c=relaxed/simple;
	bh=9VysXCuQwwAr16ZKvChRxEUqOLGTxoqa33ub7SVB70c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBOOvvEUx0TWE9QNHFys0DR7OSPawrOUVgKRdwWVjZbO8QNs0BlKpVlUtjzOxtPdiFmZAGlggNsZsXq111IjAyiw5hVKFXxmdJpDd+59HWdsOJLTs8Ugbd58OmfJUQVY0nWhu558xSJ74Fyk6bO8sxo5padjIgN0zEHxKDW9Mws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoqVACB6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763644584; x=1795180584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9VysXCuQwwAr16ZKvChRxEUqOLGTxoqa33ub7SVB70c=;
  b=aoqVACB6EI+ktnUP6Go/nvUNq21jaYablIL8jnBqgFDubYQlCjHf4qi5
   eWQdy5TXvHWYDr7u95Rtqz8UJRklPtIjNU7skpjlTDbg8lLraL0weZ80E
   ikpG8FIJMjd1xWKc4NRS1xctrPVoHXD55XIPmLEVyjqubz3+lN9U3yzel
   ehGcpgMPaUXnnJ+vGbel/k0o0fROzMokd3fkplXnghimO+Hi2okwzPXTO
   bzXXgfPhxgt6PHqTiB+qbMh10NUjcXeXHWk62njLxtn5neQ2XikBdFoJY
   Mrm6d3fReY2gc4xDfRSEd2wnwFKZVvdk74hv5j25A4BY+rGuxjnxG8ohp
   g==;
X-CSE-ConnectionGUID: 4ct1p5giQKCXJOlF3wkR0Q==
X-CSE-MsgGUID: g+2pKbCpRZCHv/OBDgYU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76818034"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="76818034"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:16:23 -0800
X-CSE-ConnectionGUID: HQZ+gVEPRuuXejf0mVfpVw==
X-CSE-MsgGUID: DtVRadOQSNquhYhLJ1mubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191392443"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:16:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E8353121DCE;
	Thu, 20 Nov 2025 15:16:14 +0200 (EET)
Date: Thu, 20 Nov 2025 15:16:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 17/18] media: ti: j721e-csi2rx: Support runtime suspend
Message-ID: <aR8UlHdBppncdlRD@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-18-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112115459.2479225-18-r-donadkar@ti.com>

Hi Rishikesh,

On Wed, Nov 12, 2025 at 05:24:58PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> Add support for runtime power-management to enable powering off the
> shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
> the device(s) are not in use.
> 
> When powering off the IP, the PSI-L endpoint loses the paired DMA
> channels. Thus we have to release the DMA channels at runtime suspend
> and request them again at resume.
> 
> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/ti/Kconfig             |  1 +
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
>  2 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
> index 3bc4aa35887e6..a808063e24779 100644
> --- a/drivers/media/platform/ti/Kconfig
> +++ b/drivers/media/platform/ti/Kconfig
> @@ -70,6 +70,7 @@ config VIDEO_TI_J721E_CSI2RX
>  	depends on VIDEO_CADENCE_CSI2RX
>  	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
>  	depends on ARCH_K3 || COMPILE_TEST
> +	depends on PM
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
>  	help
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 528041ee78cf3..21e032c64b901 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  
>  #include <media/cadence/cdns-csi2rx.h>
> @@ -963,12 +964,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	unsigned long flags;
>  	int ret = 0;
>  
> +	ret = pm_runtime_resume_and_get(csi->dev);
> +	if (ret)
> +		return ret;
> +
>  	spin_lock_irqsave(&dma->lock, flags);
>  	if (list_empty(&dma->queue))
>  		ret = -EIO;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
>  	if (ret)
> @@ -1024,6 +1029,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  err:
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
> +	pm_runtime_put(csi->dev);
> +
>  	return ret;
>  }
>  
> @@ -1055,6 +1062,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  
>  	ti_csi2rx_stop_dma(ctx);
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
> +	pm_runtime_put(csi->dev);
>  }
>  
>  static const struct vb2_ops csi_vb2_qops = {
> @@ -1261,7 +1269,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
>  
>  static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
>  {
> -	dma_release_channel(ctx->dma.chan);
> +	if (!pm_runtime_status_suspended(ctx->csi->dev))

What's the motivation for this change? Do the DMA channel need to be
released only if the device's RPM status isn't suspended?

Is there a guarantee Runtime PM is disabled when the function is called?
Otherwise there's no guarantee state change couldn't occur.

> +		dma_release_channel(ctx->dma.chan);
> +
>  	vb2_queue_release(&ctx->vidq);
>  
>  	video_unregister_device(&ctx->vdev);
> @@ -1512,6 +1522,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>  	return ret;
>  }
>  
> +static int ti_csi2rx_runtime_suspend(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
> +	int i;
> +
> +	if (csi->enable_count != 0)
> +		return -EBUSY;
> +
> +	for (i = 0; i < csi->num_ctx; i++)
> +		dma_release_channel(csi->ctx[i].dma.chan);
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_runtime_resume(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
> +	int ret, i;
> +
> +	for (i = 0; i < csi->num_ctx; i++) {

You could declare i (as unsigned int) here.

The same for ret actually.

> +		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ti_csi2rx_pm_ops = {
> +	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
> +		       NULL)
> +};
> +
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -1579,6 +1622,10 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  		goto err_notifier;
>  	}
>  
> +	pm_runtime_set_active(csi->dev);
> +	pm_runtime_enable(csi->dev);

Note that the sub-device driver's UAPI may be already available to users
when the async sub-device is registered. Therefore you'll need enable
runtime PM before that.

> +	pm_request_idle(csi->dev);
> +
>  	return 0;
>  
>  err_notifier:
> @@ -1609,6 +1656,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);

Is there a guarantee the device is in a particular runtime PM state here,
e.g. suspended?

> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +
>  }
>  
>  static const struct of_device_id ti_csi2rx_of_match[] = {
> @@ -1623,6 +1673,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
>  	.driver = {
>  		.name = TI_CSI2RX_MODULE_NAME,
>  		.of_match_table = ti_csi2rx_of_match,
> +		.pm		= &ti_csi2rx_pm_ops,
>  	},
>  };
>  

-- 
Kind regards,

Sakari Ailus

