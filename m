Return-Path: <linux-media+bounces-62274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMKsAB6pDWox1QUAu9opvQ
	(envelope-from <linux-media+bounces-62274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:29:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBE58DA9B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21E3D30C88BF
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA95A3DCD99;
	Wed, 20 May 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/MmzAb5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618E3D6CDE;
	Wed, 20 May 2026 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279940; cv=none; b=imFsDC4XXOoIEj8PQSzC+rGS4nNqo+St8WePdCkcoszn6eX1NAbQsdsDjajCbvZgEj0GJ1XB8lD9OG4ftJuqlELaUQ/NH33nHCbrSg3eM70wbtKLZGfaYqQHaXm3PMotC/2WQftws9HuePu0dp9SfF0DLSMJqWVh9PeTrHc8e00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279940; c=relaxed/simple;
	bh=48W8SByuCDLPcD8HHlXJaZ/ROSBZ4U6LQUjg5diX9wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fy/Ssb2stS83KZYWOgdGPqPCZy7cRdB/qpZP3OXhI65HPeNkps1s/y//8EfJJYVtu+tqPFk8nQsRe3eSjNO2PFcGhNm+jv73+/R1HdsbtIt+b7KxTigHokjqDCU/2UXZLZ3kNqESgsen+sC37vGEX4NfRMsF3LmZlTfjMnx1Vfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/MmzAb5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779279938; x=1810815938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=48W8SByuCDLPcD8HHlXJaZ/ROSBZ4U6LQUjg5diX9wE=;
  b=J/MmzAb5CxZ2jZTbu3neC5vHJTHHdl5F7FKOTWf29L9DHuQeROs8xTwX
   bcf32DyOhnrk2z2304jrepZdHJNgHLSPeE8kVFsCMzG49YDZXlteJKgR7
   6HC0zi5oMd2g0sQKhnHgMvW0zEcZsvqymaUPKE2ISilY2Xklzj35BmXFU
   UcybisGhMrVxygaFMUB+q+YC0kmKe8DQBmfP11zl64ZilZiBq9c+mOx5G
   ieCvjfLBmFar5GfDK+wJp3FZyE3awuS8mQynUrc5fN4B1v833SxR4hX39
   +3/Ihz54CPD8W+TU4/Wbh3fW1RyrkwT4hg9d0klZUIiiCrai0cw48Nk/r
   g==;
X-CSE-ConnectionGUID: gp1GwBmESVGpUrelBxwcog==
X-CSE-MsgGUID: o+JNs10MS8Ob+kuq0y7vwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102853943"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102853943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:25:37 -0700
X-CSE-ConnectionGUID: Tl6iGy1aT0KExVNjEXbRLQ==
X-CSE-MsgGUID: Shm2BKOuQGmwiUC8Ld9CQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244154387"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:25:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A035B11F851;
	Wed, 20 May 2026 15:25:28 +0300 (EEST)
Date: Wed, 20 May 2026 15:25:28 +0300
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
Subject: Re: [PATCH v13 17/17] media: ti: j721e-csi2rx: Support system
 suspend using pm_notifier
Message-ID: <ag2oOEr0m-wIfABL@kekkonen.localdomain>
References: <20260520120022.539913-1-r-donadkar@ti.com>
 <20260520120022.539913-18-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520120022.539913-18-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62274-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email,ti.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 72CBE58DA9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

On Wed, May 20, 2026 at 05:30:22PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> As this device is the "orchestrator" for the rest of the media
> pipeline, we need to stop all on-going streams before system suspend and
> enable them back when the system wakes up from sleep.
> 
> Using .suspend/.resume callbacks does not work, as the order of those
> callbacks amongst various devices in the camera pipeline like the sensor,
> FPD serdes, CSI bridge etc. is impossible to enforce, even with
> device links. For example, the Cadence CSI bridge is a child device of
> this device, thus we cannot create a device link with the CSI bridge as
> a provider and this device as consumer. This can lead to situations
> where all the dependencies for the bridge have not yet resumed when we
> request the subdev to start streaming again through the .resume callback
> defined in this device.
> 
> Instead here we register a notifier callback with the PM framework
> which is triggered when the system is fully functional. At this point we
> can cleanly stop or start the streams, because we know all other devices
> and their dependencies are functional. A downside of this approach is
> that the userspace is also alive (not frozen yet, or just thawed), so
> the suspend notifier might complete before the userspace has completed
> all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.
> 
> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index d68b8d6ffeb1..21388284cbaa 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -131,6 +131,7 @@ struct ti_csi2rx_dev {
>  	struct v4l2_subdev		*source;
>  	struct v4l2_subdev		subdev;
>  	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
> +	struct notifier_block		pm_notifier;
>  	u8				pix_per_clk;
>  	/* Buffer to drain stale data from PSI-L endpoint */
>  	struct {
> @@ -1544,6 +1545,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int ti_csi2rx_suspend(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
> +	enum ti_csi2rx_dma_state state;
> +	struct ti_csi2rx_ctx *ctx;
> +	struct ti_csi2rx_dma *dma;
> +	unsigned long flags = 0;
> +	int i, ret = 0;

i should be unsigned.

> +
> +	/* If device was not in use we can simply suspend */
> +	if (pm_runtime_status_suspended(dev))
> +		return 0;
> +
> +	/*
> +	 * If device is running, assert the pixel reset to cleanly stop any
> +	 * on-going streams before we suspend.
> +	 */
> +	writel(0, csi->shim + SHIM_CNTL);
> +
> +	for (i = 0; i < csi->num_ctx; i++) {
> +		ctx = &csi->ctx[i];
> +		dma = &ctx->dma;
> +
> +		spin_lock_irqsave(&dma->lock, flags);
> +		state = dma->state;
> +		spin_unlock_irqrestore(&dma->lock, flags);
> +
> +		if (state != TI_CSI2RX_DMA_STOPPED) {
> +			/* Disable source */
> +			ret = v4l2_subdev_disable_streams(&csi->subdev,
> +							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +							  BIT(0));
> +			if (ret)
> +				dev_err(csi->dev, "Failed to stop subdev stream\n");
> +		}
> +
> +		/* Stop any on-going streams */
> +		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> +
> +		/* Drain DMA */
> +		ti_csi2rx_drain_dma(ctx);
> +
> +		/* Terminate DMA */
> +		ret = dmaengine_terminate_sync(ctx->dma.chan);
> +		if (ret)
> +			dev_err(csi->dev, "Failed to stop DMA\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static int ti_csi2rx_resume(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
> +	struct ti_csi2rx_ctx *ctx;
> +	struct ti_csi2rx_dma *dma;
> +	struct ti_csi2rx_buffer *buf;
> +	unsigned long flags = 0;
> +	unsigned int reg;
> +	int i, ret = 0;

Ditto.

> +
> +	/* If device was not in use, we can simply wakeup */
> +	if (pm_runtime_status_suspended(dev))
> +		return 0;
> +
> +	/* If device was in use before, restore all the running streams */
> +	reg = SHIM_CNTL_PIX_RST;
> +	writel(reg, csi->shim + SHIM_CNTL);
> +
> +	for (i = 0; i < csi->num_ctx; i++) {
> +		ctx = &csi->ctx[i];
> +		dma = &ctx->dma;
> +		spin_lock_irqsave(&dma->lock, flags);
> +		if (dma->state != TI_CSI2RX_DMA_STOPPED) {
> +			/* Re-submit all previously submitted buffers to DMA */
> +			list_for_each_entry(buf, &ctx->dma.submitted, list) {
> +				ti_csi2rx_start_dma(ctx, buf);
> +			}
> +			spin_unlock_irqrestore(&dma->lock, flags);
> +
> +			/* Restore stream config */
> +			ti_csi2rx_setup_shim(ctx);
> +
> +			ret = v4l2_subdev_enable_streams(&csi->subdev,
> +							 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +							 BIT(0));
> +			if (ret)
> +				dev_err(ctx->csi->dev, "Failed to start subdev\n");
> +		} else {
> +			spin_unlock_irqrestore(&dma->lock, flags);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct ti_csi2rx_dev *csi =
> +		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
> +
> +	switch (action) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_SUSPEND_PREPARE:
> +	case PM_RESTORE_PREPARE:
> +		ti_csi2rx_suspend(csi->dev);
> +		break;
> +	case PM_POST_SUSPEND:
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_RESTORE:
> +		ti_csi2rx_resume(csi->dev);
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static const struct dev_pm_ops ti_csi2rx_pm_ops = {
>  	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
>  		       NULL)
> @@ -1617,6 +1736,20 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  		goto err_notifier;
>  	}
>  
> +	/*
> +	 * Use PM notifier instead of .suspend/.resume callbacks because the
> +	 * ordering of callbacks among camera pipeline devices (sensor, serdes,
> +	 * CSI bridge) cannot be enforced even with device links. The notifier
> +	 * is called when the system is fully functional, ensuring all
> +	 * dependencies are available when stopping/starting streams.
> +	 */
> +	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
> +	ret = register_pm_notifier(&csi->pm_notifier);
> +	if (ret) {
> +		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
> +		goto err_notifier;
> +	}
> +
>  	return 0;
>  
>  err_notifier:
> @@ -1644,6 +1777,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  
>  	ti_csi2rx_cleanup_notifier(csi);
> +	unregister_pm_notifier(&csi->pm_notifier);
> +
>  	ti_csi2rx_cleanup_v4l2(csi);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
> -- 
> 2.34.1
> 

-- 
Sakari Ailus

