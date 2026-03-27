Return-Path: <linux-media+bounces-57251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI+/M1iNxmlLLwUAu9opvQ
	(envelope-from <linux-media+bounces-57251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:59:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F3345B06
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B47AB3008442
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7004A3A6F1C;
	Fri, 27 Mar 2026 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QMKMDuTL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398930F7EA
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619493; cv=none; b=Mje15xFE0iDBJ83VvfLFJMnZ4pGyvyxkNG3ksO/5k3knOSa63EZDEETkUeDyH1OIHZHtrImCOd2/Tf+GpDBmTw6LY0uSkkKPMnGu3L+AUawgcoua5CmRVp2s+Fk+qzlbOF7P019R8fE6zZoX5yLz/B/z8ZoEgKLnchWkeWR0ZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619493; c=relaxed/simple;
	bh=dvj56tOk11P1afbjzVl+NRLKc3GiFlEIFpBctLw57k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtZ1rCB9Y5Ueslo2pYFJlNEImly7TsCIuI6UfbN0m1MK5jwD3gL7U+Gw/23d9hM5P35NvjqaorkYthnuUgTEAOqFcSozUcqnQHdrRbe3rDjmQWAt0LJjDokB2P9z0DH+yRS5lhHYUKRsJ0bGTQO3gPP4VLso7tNLnR4JAyHx5RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QMKMDuTL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81369201C;
	Fri, 27 Mar 2026 14:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774619404;
	bh=dvj56tOk11P1afbjzVl+NRLKc3GiFlEIFpBctLw57k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMKMDuTL4nwTzUGzyukRR8kpDC4FgqBtWnRyzHQTicm9ySNKTVhS1czIJ0/I0xIwe
	 gK4Sc/pZP3kqYVDOCZvdCduy3xB7/0EImNp+jNBzIqQgto2eFvYHvadH62iuaEcnw+
	 ikYTKIZaMSDYHh9l0jX1Oz3ft/u/ELUb0RuVcDFw=
Date: Fri, 27 Mar 2026 14:51:20 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: fix resource leaks in probe and remove
Message-ID: <acZH-gbQsp6zl0lQ@zed>
References: <20260326190052.11780-1-devnexen@gmail.com>
 <20260326203339.35852-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326203339.35852-1-devnexen@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57251-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: CA4F3345B06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello David

   first of all, there are two version of this patch, one sent in
response the the other. Which one should I look at ?

If you intended to send a v2, mark it as v2 (depending on the tooling
you use either let b4 handle it or use -vX switch to
git-format-patches) and send it out -not- in reply to the first
version.

On Thu, Mar 26, 2026 at 08:33:39PM +0000, David Carlier wrote:
> mali_c55_probe() calls of_reserved_mem_device_init() to associate
> reserved memory regions with the device. This function allocates a
> struct rmem_assigned_device and adds it to a global linked list, which
> must be explicitly released via of_reserved_mem_device_release() — there
> is no devm variant of this API.
>
> However, neither the probe error paths nor mali_c55_remove() called
> of_reserved_mem_device_release(). Any probe failure after the
> of_reserved_mem_device_init() call, as well as every normal device
> removal, leaked the reserved memory association on the global list.

Thanks! The of_reserved_mem_device_ APIs documentation is -horrible-.

It tells you what the functions do but not how the API should be
used. I can only resort of the fact that a _release() should
logically follow an _init()...

>
> Additionally, pm_runtime_enable() called during probe was never undone
> in mali_c55_remove(), leaving the device's runtime PM state enabled

Ok, but this is a separate patch

> after the driver is unbound. The probe error path had a related issue:
> when mali_c55_media_frameworks_init() failed, the goto target jumped
> directly to err_free_context_registers, skipping pm_runtime_disable()
> despite pm_runtime having already been enabled earlier in the function.

Ups, yes.

A separate patch as well please.

>
> Fix these issues by:
>  - Adding an err_release_mem label at the end of the error chain so all
>    post-init failure paths release the reserved memory association.
>  - Splitting pm_runtime_disable() into its own err_runtime_disable label
>    so the media frameworks init failure correctly unwinds it.
>  - Adding of_reserved_mem_device_release() and pm_runtime_disable() to
>    mali_c55_remove(), with the teardown order mirroring probe in
>    reverse.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  .../media/platform/arm/mali-c55/mali-c55-core.c  | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index c1a562cd214e..de895b69d786 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *pdev)
>  	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>
>  	ret = __mali_c55_power_on(mali_c55);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to power on\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to power on\n");
> +		goto err_release_mem;
> +	}
>
>  	ret = mali_c55_check_hwcfg(mali_c55);
>  	if (ret)
> @@ -826,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
>
>  	ret = mali_c55_media_frameworks_init(mali_c55);
>  	if (ret)
> -		goto err_free_context_registers;
> +		goto err_runtime_disable;
>
>  	pm_runtime_idle(&pdev->dev);
>
> @@ -841,11 +843,13 @@ static int mali_c55_probe(struct platform_device *pdev)
>
>  err_deinit_media_frameworks:
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +err_runtime_disable:

maybe err_pm_runtime_disable

>  	pm_runtime_disable(&pdev->dev);
> -err_free_context_registers:
>  	kfree(mali_c55->context.registers);
>  err_power_off:
>  	__mali_c55_power_off(mali_c55);
> +err_release_mem:
> +	of_reserved_mem_device_release(dev);
>
>  	return ret;
>  }
> @@ -854,8 +858,10 @@ static void mali_c55_remove(struct platform_device *pdev)
>  {
>  	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>
> -	kfree(mali_c55->context.registers);
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +	pm_runtime_disable(&pdev->dev);
> +	kfree(mali_c55->context.registers);
> +	of_reserved_mem_device_release(&pdev->dev);

This patched prompted me to looking into module load/unload more
closely and indeed there are more things to fix on top.

If you split this patch in three I'll take them in and work on top of
them. Would this work ?

Thanks
  j

>  }
>
>  static const struct of_device_id mali_c55_of_match[] = {
> --
> 2.53.0
>
>

