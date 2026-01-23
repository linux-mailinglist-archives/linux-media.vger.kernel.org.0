Return-Path: <linux-media+bounces-51410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHyMJrhBc2mWtwAAu9opvQ
	(envelope-from <linux-media+bounces-51410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:39:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8473803
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD4E7306DFC8
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513DE372B58;
	Fri, 23 Jan 2026 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WF/g4zYc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46AD36BCDA;
	Fri, 23 Jan 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160850; cv=none; b=VVbZt1QdTpy1TlxiAcCIi60eAIJgLYVGqCoS8IqF1AhTk1J0iaaLJ8+wWVpzbR4ThdgwVBx7pLDgAikvwDJjqBc1i7Z23tkJI3OvVtRRiLJIA3AOPRIiDxMkk8N8t2UnQ/7xHR8d649awpB9dIn0boYGQ0A1ke5x6O0KBfdlUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160850; c=relaxed/simple;
	bh=w4CLZ939NBe2IUeqrOuN7fUe4joQqwDwTGXWZt5WXIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8NKcibKdEe86sA57g8RK8jJx5KWqNq7wDOB08psgr65azRFMI5y/C5kCCNj8O16wSAmgKiurWwkF6BEojH9CUoJKZdmjohe5mawOHhd5I/PLxdsNHrRmzCQl6WqQ/aiglMNDaw+roFOJKTVAwk7nlXYtsStMVNXZPdnvhgG93Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WF/g4zYc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F3AA8FA;
	Fri, 23 Jan 2026 10:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769160804;
	bh=w4CLZ939NBe2IUeqrOuN7fUe4joQqwDwTGXWZt5WXIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WF/g4zYcg3IyBku4ZfG8Yr4b3c0B3jz6Trn/w9n2etFiZnA4W7Hj6fC0LgjJF058v
	 4hce3AACL/47mAgNwZYnbMs/LNSJcWR2QjzwNXESEnogHn8ioRzd08/jobgJdCLA8P
	 vkJNFXnV0dgVeXyjvJzUpDdQ7p1fg8zWEMXYPWhc=
Message-ID: <7bf8031e-e8f3-4157-b972-901f0ae9e778@ideasonboard.com>
Date: Fri, 23 Jan 2026 11:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/18] media: ti: j721e-csi2rx: Support system suspend
 using pm_notifier
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
References: <20260121135424.1185710-1-r-donadkar@ti.com>
 <20260121135424.1185710-19-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260121135424.1185710-19-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51410-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 96D8473803
X-Rspamd-Action: no action

Hi,

On 21/01/2026 15:54, Rishikesh Donadkar wrote:
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
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index c01905680e108..335aa89bcd959 100644
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
> @@ -1535,6 +1536,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
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
> @@ -1607,6 +1726,20 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
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
> @@ -1634,6 +1767,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  
>  	ti_csi2rx_cleanup_notifier(csi);
> +	unregister_pm_notifier(&csi->pm_notifier);
> +
>  	ti_csi2rx_cleanup_v4l2(csi);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);


