Return-Path: <linux-media+bounces-67045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f7q+Hql5TmoNNgIAu9opvQ
	(envelope-from <linux-media+bounces-67045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:24:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75D728A79
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:24:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="hr0g/akI";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67045-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67045-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7AE30D185C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852AC409286;
	Wed,  8 Jul 2026 15:54:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3972E8DEF;
	Wed,  8 Jul 2026 15:54:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526082; cv=none; b=jyD4a5VXxtf1iheyq1YwqIPaodlLgJmXWA2Zc8lpBq2ms2b3Kd8zYWPI3EJxaC25xfv4OdbroEx3Fzll3Vwkod8Ucwpt5Yqj6ekqTb6y04by8MD/BRnyT1ZrxiHu/FrhI+y+TA9AH6dw85Hj24hyTarWGQn83YqnjyaUNsA5hHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526082; c=relaxed/simple;
	bh=AKhQhkQO9Lc61foB1icnluYqTshu7kNM9DJSZMtmXn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlezfhZgUllBt8QjOMnGH0WSlgU/1qRKEO9hYGclImm4Cw7UGbYyR5HqX4QvcW4f3rzzVY8vh+W79gG9HX9WGQ75r/BnWT49nkeSsCrEf0s+1F4o7iI/DRROIn9TjukT/fwAu5iI3WsDHbMD5bOQduOhiBaveNcqahBAwC7hB1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hr0g/akI; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30FAFEAA;
	Wed,  8 Jul 2026 17:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783526027;
	bh=AKhQhkQO9Lc61foB1icnluYqTshu7kNM9DJSZMtmXn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hr0g/akIpTD/Aspu4h/P7tO0Z3EFMWDizCAlHckYz4u6eAVpEhnIZBXerZ9ci0Z8h
	 MUkxVFiWyVcOOkpEkP0GqxDQmyHbcDb9ZplW1mJIu946oNLQTGGWNXkI24L6v0m38F
	 Hz8afrBasKgfyrZATmYftHcVGuGn4Wk3f59DW5Rc=
Date: Wed, 8 Jul 2026 17:54:34 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niklas.soderlund@ragnatech.se, mchehab@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v3 2/4] media: renesas: csisp: Add missing
 media_entity_cleanup()
Message-ID: <ak5vspKMxPLZ6Zsi@zed>
References: <20260704174638.66302-6-birenpandya@gmail.com>
 <20260704174638.66302-8-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704174638.66302-8-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67045-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:dkim,zed:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB75D728A79

Hi Biren

On Sat, Jul 04, 2026 at 11:16:41PM +0530, Biren Pandya wrote:
> The probe error path and the remove function fail to call
> media_entity_cleanup() upon teardown.
>
> While currently a no-op in most cases, calling media_entity_cleanup()
> is an API requirement for entities initialized with media_entity_pads_init()
> to prevent memory leaks.
>
> Add the missing media_entity_cleanup() calls. Furthermore, introduce a
> dedicated error_entity label in the probe error path to ensure the cleanup
> is only invoked if media_entity_pads_init() has successfully completed.

Empty line please

It could be added when applying though


> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 8fb2cc3b5650..61558a71ee35 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
>
>  	ret = v4l2_subdev_init_finalize(&isp->subdev);
>  	if (ret)
> -		goto error_notifier;
> +		goto error_entity;
>
>  	ret = v4l2_async_register_subdev(&isp->subdev);
>  	if (ret < 0)
> @@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
>
>  error_subdev:
>  	v4l2_subdev_cleanup(&isp->subdev);
> +error_entity:
> +	media_entity_cleanup(&isp->subdev.entity);
>  error_notifier:
>  	v4l2_async_nf_unregister(&isp->notifier);
>  	v4l2_async_nf_cleanup(&isp->notifier);
> @@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
>
>  	v4l2_async_unregister_subdev(&isp->subdev);
>  	v4l2_subdev_cleanup(&isp->subdev);
> +	media_entity_cleanup(&isp->subdev.entity);

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Thanks
  j
>
>  	pm_runtime_disable(&pdev->dev);
>  }
> --
> 2.50.1 (Apple Git-155)
>
>

