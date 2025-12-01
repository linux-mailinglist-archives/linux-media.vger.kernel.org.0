Return-Path: <linux-media+bounces-47957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD679C97924
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BF574E1303
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 13:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A902031328E;
	Mon,  1 Dec 2025 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q8gP6OMK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD530E0D8;
	Mon,  1 Dec 2025 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764595366; cv=none; b=gkh0xo9uC1sWtPoKI0fH3ry6fpyav12tMtq16cBk/vZMRJDwe99N0F7WAbkPEI5gpgsruW06rSORdbOsgk/dg+kfz27op5K9xZRd7OTjblka/bsUXGpX7UtcWnvlrljLA5R+Metf4nhiB8ZcTJj/R0RyOgKxxVl0CcaKM3vZuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764595366; c=relaxed/simple;
	bh=n5faNjLlToEyQN5R1HxfBd4hxXELofaKmnNwdPdzeUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8YpqunCErCqTGPFHOaOL9M98Z+tpqz2foAAIxiqPSQ4TRoO2PFKI84LH5ZwjphSBRipn1L4UEZvoZ5EXObSPc+3PBniuoTEoEtp8vs6Iylmd06j8roCvTbwVtLisxpPv9SwK7zKepO465dkihqC4MWXVbGZoYViYXDyHxp3U08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q8gP6OMK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F555111D;
	Mon,  1 Dec 2025 14:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764595227;
	bh=n5faNjLlToEyQN5R1HxfBd4hxXELofaKmnNwdPdzeUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8gP6OMK6W94fv+SJH5itvhPQWzQqqHmDZvOLnB1cfG8cVF1CcCY7bTKZxWzkKGx3
	 AgdqLRACMb79EAg2EXLclQlpIrew8rusUe8ZiWz9uenZCBvWMWNB0KeQ1ezpbmSbh0
	 wslPYSAHAjX7OgGT7TDAFnhGq/PQpLHfs3Y+/Cfs=
Message-ID: <032b441e-eefc-4574-bf7a-5c4d09599925@ideasonboard.com>
Date: Mon, 1 Dec 2025 15:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/18] media: ti: j721e-csi2rx: Support runtime suspend
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-18-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251112115459.2479225-18-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> Add support for runtime power-management to enable powering off the
> shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
> the device(s) are not in use.
> 
> When powering off the IP, the PSI-L endpoint loses the paired DMA
> channels. Thus we have to release the DMA channels at runtime suspend
> and request them again at resume.

I'm not an expert on the dmaengine, but to me this sounds like a bug in
the dma driver. It just sounds very wrong...

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
> +		ret = ti_csi2rx_init_dma(&csi->ctx[i]);

If runtime_resume always requests the dma channels, is the call to
ti_csi2rx_init_dma() in ti_csi2rx_init_ctx() needed? If not, you could
inline the code from ti_csi2rx_init_dma() to here and also drop the
dma_release_channel() call from ti_csi2rx_cleanup_ctx(), making the flow
more understandable.

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
> +	pm_request_idle(csi->dev);

I always forget what exactly the runtime_pm funcs do. What's the idea
here? If you do something else than the plain standard
pm_runtime_enable(), I think it's good to mention what/why in a comment.

>  	return 0;
>  
>  err_notifier:
> @@ -1609,6 +1656,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
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


