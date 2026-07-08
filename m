Return-Path: <linux-media+bounces-67046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eex3CcFzTmowNAIAu9opvQ
	(envelope-from <linux-media+bounces-67046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:58:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8E7285B2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:58:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="txO4/yOd";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67046-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67046-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 168223021CB3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E662241CB2E;
	Wed,  8 Jul 2026 15:58:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB440928F;
	Wed,  8 Jul 2026 15:58:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526320; cv=none; b=fOoRF+rp83docjRE2OyMDiFf5z1RYwIplY40GTuHEYDXjJACWKCgvSkuIDKAHHB9v0FTdcfCh83EV/SZkVNQNHY2bbnQdKAug0q7O+knV05u2PxhOqzNauzHcR+41/AhQrFKRmadGENC3PleFV3pIh3xSgbYBtyWgPyk7xJjgpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526320; c=relaxed/simple;
	bh=H64pAQWin/4nLnoOwLRUiAgOAuwXY2Mu0rbswyzjT5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG1cW8JvnR/8Gc9KIZcGirHrER5KaDn6vMc4ybLipUUfa+s1HBep1YL59iZCpRmhkA2KJFVW79GY/jd+GvxU5mcMR8QeCTVjX6Vu5OjFobtlhbK4uIArBOxb1aafdLesg1YKE6BDx22iHsEN7kx646m6Mw/B7a0H+9qian5PFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=txO4/yOd; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78DF5EAA;
	Wed,  8 Jul 2026 17:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783526266;
	bh=H64pAQWin/4nLnoOwLRUiAgOAuwXY2Mu0rbswyzjT5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txO4/yOdORyxsoX0dieTu5prvMPtz9Y7eEwPl2bngoRLMq0SKqRmYl/5yyr6eRRAJ
	 rnFhRCsmqj8KVe4BdMH8ZNg3LD9WBJO4c+SwhOmuQISXwSLw91HEifbggHtrnMvU9t
	 VxTjBLQjpWBrnubGvr3wAcPvut4/tIdp5EgEhOqk=
Date: Wed, 8 Jul 2026 17:58:33 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niklas.soderlund@ragnatech.se, mchehab@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v3 1/4] media: renesas: rcar-csi2: Add missing
 media_entity_cleanup()
Message-ID: <ak5yyRucx7IKvcse@zed>
References: <20260704174638.66302-6-birenpandya@gmail.com>
 <20260704174638.66302-7-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704174638.66302-7-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67046-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3B8E7285B2

Hi Biren

On Sat, Jul 04, 2026 at 11:16:40PM +0530, Biren Pandya wrote:
> The probe error paths and the remove function fail to call
> media_entity_cleanup() upon teardown.
>
> While currently a no-op in most cases, calling media_entity_cleanup()

Here and in the other patches s/in most cases//

> is an API requirement for entities initialized with media_entity_pads_init()
> to prevent memory leaks.
>
> Add the missing media_entity_cleanup() calls.

Missing empty line

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 7305cc4a04cb..f9c818b0faf7 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_subdev_cleanup(&priv->subdev);
>  error_pm_runtime:
>  	pm_runtime_disable(&pdev->dev);
> +	media_entity_cleanup(&priv->subdev.entity);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> @@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&priv->notifier);
>  	v4l2_async_unregister_subdev(&priv->subdev);
>  	v4l2_subdev_cleanup(&priv->subdev);
> +	media_entity_cleanup(&priv->subdev.entity);

It's hard to guess right now as media_entity_cleanup() is a nop,
but it would feel more safe to first cleanup subdev.entity and then
subdev itself

	media_entity_cleanup(&priv->subdev.entity);
 	v4l2_subdev_cleanup(&priv->subdev);

However, the probe() error path already does it in reverse, order,
so...

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


>
>  	pm_runtime_disable(&pdev->dev);
>  }
> --
> 2.50.1 (Apple Git-155)
>
>

