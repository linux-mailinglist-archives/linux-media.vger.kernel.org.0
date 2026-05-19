Return-Path: <linux-media+bounces-62136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHsTNNZZDGodfwUAu9opvQ
	(envelope-from <linux-media+bounces-62136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:38:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3870157ED4D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4681B302DF59
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BBB4D2EEF;
	Tue, 19 May 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b28d/LFB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4681C84A2;
	Tue, 19 May 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193932; cv=none; b=YGAfZhHVX1WmeG3gD+rxX9kQ3QGFbuILdI46rnhDViBON2FftdYGQQq/JqNydYxeZad8/EHncDcDOP0Ry6NHU+l17iX8LjmTcaztF4m5HSCfg4cxpLSKeCpKY69EhHKXoylRYI66+zehknnArp8YSpyLIXThM+gwFTUIY9I3QuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193932; c=relaxed/simple;
	bh=WwXVI6JTFWUtylnkJLQNm4kYpNHWrg1WezSc3lEGbiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQMLkvAz6lz2RG9bt23Au/KyERA12GxPzBhOTdY5eVOgM+nD7uZfX2oQIGeU9/HDX/2xMraMPYSAnXPByflovg6zb8TMFdektVyu3KTZB4joeO0vkToyFgy8QJF1H55EvGSZG5QEl3A55G3Pm0Hr8kakRGgf5h0Lt5/u7ItNpec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b28d/LFB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193931; x=1810729931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WwXVI6JTFWUtylnkJLQNm4kYpNHWrg1WezSc3lEGbiw=;
  b=b28d/LFBAzFr0IgqG+apmi1wXTVyW2zPmteb+xI8885cfqFMNMOOIdtZ
   IIwjdeYZpRuYyWC2MytRxRRXV/tEau9zcPIjAXEhLWVqNps2epSEnmVjf
   a8i0cue+yj48A1x6e4UGQja3XKGIPSodog7r+Mqr/0orKLud8jd+ISPQC
   31HbbYW5Mzd+vK07J4vMViUXeZ3t4mRHe+rpeKJ5NY4XeRNBNlQ/N6+5B
   L+SxMLTlwkga7GoVuHq8dBp6ooQjSUid3chzo98uDVfxFuDW0JEmYXn3l
   Al0m8ayJ5HpEs4FcuOTPKtYnX2MS2FPVap8gvoJ5g/DetIlBImNYXCNEc
   A==;
X-CSE-ConnectionGUID: 8+3Z86ZJQ0ya7u0Y1VDHwQ==
X-CSE-MsgGUID: 6i+cXvzuSh2gra2G5HXzWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97637163"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97637163"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:32:06 -0700
X-CSE-ConnectionGUID: COpbBXyVQL60BiEhUQa9Gg==
X-CSE-MsgGUID: bJ4CRFipRFqIkn46HPqW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235317591"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.204])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:32:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D2A66120E58;
	Tue, 19 May 2026 15:31:56 +0300 (EEST)
Date: Tue, 19 May 2026 15:31:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 16/17] media: ti: j721e-csi2rx: Support runtime
 suspend
Message-ID: <agxYPM3mLwR302Za@kekkonen.localdomain>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-17-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313090701.646534-17-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62136-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,ti.com:email]
X-Rspamd-Queue-Id: 3870157ED4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

On Fri, Mar 13, 2026 at 02:37:00PM +0530, Rishikesh Donadkar wrote:
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
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/ti/Kconfig             |  1 +
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
>  2 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
> index da33facf44678..d0cb05481bd85 100644
> --- a/drivers/media/platform/ti/Kconfig
> +++ b/drivers/media/platform/ti/Kconfig
> @@ -83,6 +83,7 @@ config VIDEO_TI_J721E_CSI2RX
>  	depends on VIDEO_CADENCE_CSI2RX
>  	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
>  	depends on ARCH_K3 || COMPILE_TEST
> +	depends on PM
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
>  	help
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index dda8a66babeca..52c93a11ce8b7 100644
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
> @@ -966,12 +967,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	unsigned long flags;
>  	int ret = 0;

Redundant initialisation.

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
> @@ -993,6 +998,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  err:
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
> +	pm_runtime_put(csi->dev);
> +
>  	return ret;
>  }
>  
> @@ -1012,6 +1019,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  
>  	ti_csi2rx_stop_dma(ctx);
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
> +	pm_runtime_put(csi->dev);
>  }
>  
>  static const struct vb2_ops csi_vb2_qops = {
> @@ -1257,7 +1265,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
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
> @@ -1507,6 +1517,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
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

You could declare i here, and I'd use unsigned int.

> +		dma_release_channel(csi->ctx[i].dma.chan);
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_runtime_resume(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
> +	unsigned int ret, i;

Ret should be signed and could be declared below (up to you).

> +
> +	for (i = 0; i < csi->num_ctx; i++) {

i could be declared here.

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
> @@ -1562,6 +1605,9 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  			goto err_ctx;
>  	}
>  
> +	pm_runtime_set_active(csi->dev);
> +	pm_runtime_enable(csi->dev);
> +
>  	ret = ti_csi2rx_notifier_register(csi);
>  	if (ret)
>  		goto err_ctx;
> @@ -1592,6 +1638,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
>  	unsigned int i;
>  
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		pm_runtime_set_suspended(&pdev->dev);
> +
>  	for (i = 0; i < csi->num_ctx; i++)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  
> @@ -1599,6 +1648,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	ti_csi2rx_cleanup_v4l2(csi);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
> +	pm_runtime_disable(&pdev->dev);
>  }
>  
>  static const struct of_device_id ti_csi2rx_of_match[] = {
> @@ -1613,6 +1663,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
>  	.driver = {
>  		.name = TI_CSI2RX_MODULE_NAME,
>  		.of_match_table = ti_csi2rx_of_match,
> +		.pm		= &ti_csi2rx_pm_ops,
>  	},
>  };
>  

-- 
Regards,

Sakari Ailus

