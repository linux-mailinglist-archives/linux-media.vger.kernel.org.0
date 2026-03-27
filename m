Return-Path: <linux-media+bounces-57285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIbLN5u5xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:08:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B82B348147
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7C18301BED4
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9647371D01;
	Fri, 27 Mar 2026 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f3SUMV3K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349D361DB3
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630895; cv=none; b=X9Evz5WppjkjJ10XBvAhVAX5Vh6GAP/8GdgsYN1Tum40ESLVN6JTFjHkS9PnPSCDwWLptrtXoxAEHalsK8hx50+OAHHRqPh2qS0V2HcwrHbxjtCv5eo0yQ+WcxObGXtNwKcJ8CaIIh5MoBb6ACpqOdQ5ZwIASE3CK2px3limVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630895; c=relaxed/simple;
	bh=WjLnJd//dgaJXd0BcTXj6vm10TfF0noy6kMxAb9P9g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWGqFn2o8wow8RIgpCIZJBb4pOOHSOLyBABDvZiRyQsxWAulAoz34A30CSHmfcl0j1pKq42Vjt09GAgPmmDoqaOoSJqAZFAYb82zYpIce6ity3QNS0o6kzn8SVWvyCyP3o5TjjKExAnEn6bkfr85YHgcswj/w7myYYTP/9C/E30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f3SUMV3K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6340D21CD;
	Fri, 27 Mar 2026 18:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774630812;
	bh=WjLnJd//dgaJXd0BcTXj6vm10TfF0noy6kMxAb9P9g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3SUMV3KjwhvtCLxNln3EK/StjXmFWcnewNOCHUYFxhhOyOn0yETDvJDnnMfn4FpB
	 fiMVUq5tXnHAiIFlwPz2QoPAM72oghOJ8lke11Df0GMsv7VhrgzUMrrqO6LC2QmtOy
	 jFgtTCB7dFKULJ28Qldd51QI4ADzIUJX2aHlDdcA=
Date: Fri, 27 Mar 2026 18:01:29 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: mali-c55: add missing pm_runtime_disable()
 in remove
Message-ID: <aca3Y6FHItK1cb9l@zed>
References: <20260327150707.256752-1-devnexen@gmail.com>
 <20260327150707.256752-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327150707.256752-2-devnexen@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57285-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 5B82B348147
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David

On Fri, Mar 27, 2026 at 03:07:06PM +0000, David Carlier wrote:
> pm_runtime_enable() is called during probe but mali_c55_remove() never
> calls pm_runtime_disable(), leaving the device's runtime PM state
> enabled after the driver is unbound.
>
> Add the missing pm_runtime_disable() call to the remove path.

The driver doesn't depend on PM, so we need to explicitly power-off
the peripheral in remove() (and set the pm_runtime status to
suspended)

>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

This patch is however correct, I'll add the power-off on top.

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 5cb59c70ffc9..38b11d5ba168 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -859,6 +859,7 @@ static void mali_c55_remove(struct platform_device *pdev)
>  	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +	pm_runtime_disable(&pdev->dev);
>  	kfree(mali_c55->context.registers);
>  	of_reserved_mem_device_release(&pdev->dev);
>  }
> --
> 2.53.0
>
>

