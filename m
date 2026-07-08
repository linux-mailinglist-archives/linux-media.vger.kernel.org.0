Return-Path: <linux-media+bounces-67048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GktGLqF5TmoINgIAu9opvQ
	(envelope-from <linux-media+bounces-67048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:24:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E58728A6E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:24:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ccMpnuuu;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67048-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67048-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93D30303EE7C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A3236F903;
	Wed,  8 Jul 2026 16:02:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D613B2949E0;
	Wed,  8 Jul 2026 16:02:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526571; cv=none; b=L+KE9E233frF8ToEgNadY7JogxT2B/FFeh3/CsTcpRrmlcGDYEL7YHUj1np9CKPj4J3D9N/G7zb6Hl6j4zj3gSxtrBXD2a5WMm5UjrXyRbBzh2pjRRxnbN2amPpIl9skrhigDdQjKPi3NlH22YvNkKoH/JWn/gwoaFUE2CD+S1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526571; c=relaxed/simple;
	bh=9zzaZUv8KiEl1PkZH1yBjf1pc+o80nBplH7xffI0+Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcrqDTOkgyXtYNOpaAMRRZ/C2PPHx47A1ZlGLcaGnnBZyET8C6WMrbk9R0inkEpEo+MPRO03sbQXE4Iz8M+xmej8C7GOKJZRfX1FQh1NYUjrfErzeBVOmwEskQEPgNouJpj+RGVSGOBBMcLbkPYkhLaJnHOHwCJcvg/bh+5C5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ccMpnuuu; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86739EAA;
	Wed,  8 Jul 2026 18:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783526518;
	bh=9zzaZUv8KiEl1PkZH1yBjf1pc+o80nBplH7xffI0+Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccMpnuuunoZ2qgyO4hgTkyUZNbkjthL01dQ9edwqXBdUF+ZWOT6hnVQIOQ/8hewzF
	 sUxWeiDFsX4Ql+imN03HQDoUMF9kRDOvuYrKIIh9EZrDEzAetcoViVbtBikMCDl9w9
	 DcYIf0VkGBploIL/u0L2+CsfcxRVcz7laYAzGwlw=
Date: Wed, 8 Jul 2026 18:02:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niklas.soderlund@ragnatech.se, mchehab@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v3 4/4] media: renesas: rzg2l-core: Add missing
 media_entity_cleanup()
Message-ID: <ak50Yfw3DbewFDv0@zed>
References: <20260704174638.66302-6-birenpandya@gmail.com>
 <20260704174638.66302-10-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704174638.66302-10-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67048-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2E58728A6E

On Sat, Jul 04, 2026 at 11:16:43PM +0530, Biren Pandya wrote:
> The remove function fails to call media_entity_cleanup() upon teardown.
>
> While currently a no-op in most cases, calling media_entity_cleanup()
> is an API requirement for entities initialized with media_entity_pads_init()
> to prevent memory leaks.
>
> Add the missing media_entity_cleanup() call in rzg2l_cru_remove().

Same comments as per the other patches

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 3c5fbd857371..84d4883e2fe7 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c

While at it, you could consider patching the error path in
rzg2l_cru_media_init()

Thanks
  j

> @@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&cru->notifier);
>
>  	rzg2l_cru_video_unregister(cru);
> +	media_entity_cleanup(&cru->vdev.entity);
>  	media_device_cleanup(&cru->mdev);
>  	mutex_destroy(&cru->mdev_lock);
>
> --
> 2.50.1 (Apple Git-155)
>
>

