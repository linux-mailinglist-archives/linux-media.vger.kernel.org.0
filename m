Return-Path: <linux-media+bounces-57286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGrILBa5xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:06:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F173480C3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B66A03071BFF
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356D823BF9F;
	Fri, 27 Mar 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BuvXmaGt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3FB374170
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631065; cv=none; b=bi/awZJTSDcgwo+EyAPl66xTk+01vPsnqreF9iASq/cmNS+T9t7ugKbKjxrbUh7G8d2i9bGmcXqOCqh35/yXc/YdjMdIcb0x/gwwyZQCsX/jLT6h+LGjb2aoD0GgxUuRms9G5SJ/dD5qbK/0SpVDkCQFzTZDrYZCQV9lHxVbPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631065; c=relaxed/simple;
	bh=nE8zhQ7R704teWyVBKziqWKow2mWXvB46+mZ0OhgyZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ue+Z3cR85uA4lK9CWxly79P1UFcr/s8DV35rxa1i2dSKxADFItaycOt9TwKcZqwdnDjItUC6QRQQBbKNhZP+fSpatyE6q7YO2eLDt7VgNXXj0PcJUDdu9L3LjOlVeR4HFwd7fLdDSFXB8/liSsn3IwV1d0TrR0e5yx0dmRAQcJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BuvXmaGt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6961D21D0;
	Fri, 27 Mar 2026 18:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774630982;
	bh=nE8zhQ7R704teWyVBKziqWKow2mWXvB46+mZ0OhgyZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BuvXmaGtH2e06y6n/U2VqkEM/nFlalmzdBtdRCUWsdKeJWTec5phVWHEl2foBUmAO
	 61NZvuPCBAUMGJ49y55mcVrFl4W3XHRo/e7pZNnwYvNanAqnsY1LhV2MS9Gnv8LEHM
	 NducY6G+NRc+eUq2Y6j/gDmcqVVL1fYTkA6wj2/U=
Date: Fri, 27 Mar 2026 18:04:18 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: mali-c55: fix probe error path skipping
 pm_runtime_disable()
Message-ID: <aca4W1BY4vbqIMnz@zed>
References: <20260327150707.256752-1-devnexen@gmail.com>
 <20260327150707.256752-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327150707.256752-3-devnexen@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57286-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,ideasonboard.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53F173480C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David

On Fri, Mar 27, 2026 at 03:07:07PM +0000, David Carlier wrote:
> When mali_c55_media_frameworks_init() fails, the goto target jumps to
> err_free_context_registers, skipping pm_runtime_disable() despite
> pm_runtime having already been enabled earlier in the function.
>
> Fix this by adding an err_pm_runtime_disable label and redirecting the
> frameworks init failure to it, so pm_runtime is properly unwound on
> that error path.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 38b11d5ba168..f998f914b355 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -828,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
>
>  	ret = mali_c55_media_frameworks_init(mali_c55);
>  	if (ret)
> -		goto err_free_context_registers;
> +		goto err_pm_runtime_disable;
>
>  	pm_runtime_idle(&pdev->dev);
>
> @@ -843,8 +843,8 @@ static int mali_c55_probe(struct platform_device *pdev)
>
>  err_deinit_media_frameworks:
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +err_pm_runtime_disable:

Is it necessary to

        pm_runtime_set_suspended(&pdev->dev);

?

>  	pm_runtime_disable(&pdev->dev);
> -err_free_context_registers:
>  	kfree(mali_c55->context.registers);
>  err_power_off:
>  	__mali_c55_power_off(mali_c55);
> --
> 2.53.0
>
>

