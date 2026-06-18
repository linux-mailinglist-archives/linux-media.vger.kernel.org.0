Return-Path: <linux-media+bounces-65161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDu+Lx29M2qeFgYAu9opvQ
	(envelope-from <linux-media+bounces-65161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:40:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354769EF2C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:40:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ahBwpylr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65161-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65161-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15B333013B71
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1263E1696;
	Thu, 18 Jun 2026 09:40:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A03DC4D9;
	Thu, 18 Jun 2026 09:40:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775637; cv=none; b=eH3CQMPUZpADdRlssM0LB0YsuoVc/jGorhywbByBn8v0pbbvrG80Mq2RILed+bxsFbXqoK7we7AaPHRBvq5cf/nJR2lMUMvOKPDZxtISp5EEvoGKujGz6rAA31CAVorBr/GeQl4C5kuy23NjDe7rMkxdBBFLhOLMtYR3YRvB2SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775637; c=relaxed/simple;
	bh=JG8R3S5e1QwIudxrT6fGQGg3ItczRuN1weOLoZlDnis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gR/Iii9HBJWgDgEp2St8F24126Rx5/QVx7DZTyP+p5N/9hVHt4xCEe66OsoSiJfgcVNb3gPX5pX4/oyxnA8s2CpI1wwxWuCjEqslOC44ozPIfeOd9PGMN7/E1H87Z2hBSQ8sEXiMB9TGeNSAgrl0N8n/dRPQP+MzrE/ojX4xFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ahBwpylr; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93E73DF3;
	Thu, 18 Jun 2026 11:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781775596;
	bh=JG8R3S5e1QwIudxrT6fGQGg3ItczRuN1weOLoZlDnis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ahBwpylrq43dMlpGrGFcBy46fIoU9jCt4vug1S2akpVxH49CyxPdUOKxcmfPdUuQl
	 1E0gOjDGOT7neA+ZCatYgasUwXWwATxVfGDUCI2tEco/Y1HpSujdLK+vFENM7oxdov
	 RGDyUWv8uWZ6m7tkQlAVR1QWVycborrlKQ4qIvyc=
Message-ID: <9c09b125-1d7f-459c-9896-72f16759684a@ideasonboard.com>
Date: Thu, 18 Jun 2026 12:40:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: j721e-csi2rx: Minor cleanup of loop variables
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
References: <20260520135705.661455-1-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260520135705.661455-1-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65161-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:y-abhilashchandra@ti.com,m:devarsht@ti.com,m:s-jain1@ti.com,m:vigneshr@ti.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:p.zabel@pengutronix.de,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:hverkuil-cisco@xs4all.nl,m:jai.luthra@ideasonboard.com,m:changhuang.liang@starfivetech.com,m:jack.zhu@starfivetech.com,m:sjoerd@collabora.com,m:dan.carpenter@linaro.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:jai.luthra@linux.dev,m:laurent.pinchart@ideasonboard.com,m:mripard@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,ti.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3354769EF2C

Hi,

On 20/05/2026 16:57, Rishikesh Donadkar wrote:
> Replace open-coded `i--; for (; i >= 0; i--)` patterns with the
> idiomatic `while (i--)` in the error unwind paths of
> csi_async_notifier_complete() and ti_csi2rx_probe().
> 
> Also scope loop variables directly in the for statement instead of
> declaring them at the top of the function in ti_csi2rx_suspend(),
> ti_csi2rx_resume() and ti_csi2rx_remove(). Change the type to
> unsigned int in the first two to match csi->num_ctx.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> ---
> This patch depends on [1]
> 
> [1]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.com/
> 
>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c     | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 21388284cbaa..ef74e2da19b6 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -485,8 +485,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>   	return 0;
>   
>   unregister_dev:
> -	i--;
> -	for (; i >= 0; i--) {
> +	while (i--) {
>   		media_entity_remove_links(&csi->ctx[i].vdev.entity);
>   		video_unregister_device(&csi->ctx[i].vdev);
>   	}
> @@ -1552,7 +1551,7 @@ static int ti_csi2rx_suspend(struct device *dev)
>   	struct ti_csi2rx_ctx *ctx;
>   	struct ti_csi2rx_dma *dma;
>   	unsigned long flags = 0;
> -	int i, ret = 0;
> +	int ret = 0;
>   
>   	/* If device was not in use we can simply suspend */
>   	if (pm_runtime_status_suspended(dev))
> @@ -1564,7 +1563,7 @@ static int ti_csi2rx_suspend(struct device *dev)
>   	 */
>   	writel(0, csi->shim + SHIM_CNTL);
>   
> -	for (i = 0; i < csi->num_ctx; i++) {
> +	for (unsigned int i = 0; i < csi->num_ctx; i++) {
>   		ctx = &csi->ctx[i];
>   		dma = &ctx->dma;
>   
> @@ -1604,7 +1603,7 @@ static int ti_csi2rx_resume(struct device *dev)
>   	struct ti_csi2rx_buffer *buf;
>   	unsigned long flags = 0;
>   	unsigned int reg;
> -	int i, ret = 0;
> +	int ret = 0;
>   
>   	/* If device was not in use, we can simply wakeup */
>   	if (pm_runtime_status_suspended(dev))
> @@ -1614,7 +1613,7 @@ static int ti_csi2rx_resume(struct device *dev)
>   	reg = SHIM_CNTL_PIX_RST;
>   	writel(reg, csi->shim + SHIM_CNTL);
>   
> -	for (i = 0; i < csi->num_ctx; i++) {
> +	for (unsigned int i = 0; i < csi->num_ctx; i++) {
>   		ctx = &csi->ctx[i];
>   		dma = &ctx->dma;
>   		spin_lock_irqsave(&dma->lock, flags);
> @@ -1755,8 +1754,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>   err_notifier:
>   	ti_csi2rx_cleanup_notifier(csi);
>   err_ctx:
> -	i--;
> -	for (; i >= 0; i--)
> +	while (i--)
>   		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>   	ti_csi2rx_cleanup_v4l2(csi);
>   err_dma_chan:
> @@ -1768,12 +1766,11 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>   static void ti_csi2rx_remove(struct platform_device *pdev)
>   {
>   	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
> -	unsigned int i;
>   
>   	if (!pm_runtime_status_suspended(&pdev->dev))
>   		pm_runtime_set_suspended(&pdev->dev);
>   
> -	for (i = 0; i < csi->num_ctx; i++)
> +	for (unsigned int i = 0; i < csi->num_ctx; i++)
>   		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>   
>   	ti_csi2rx_cleanup_notifier(csi);


