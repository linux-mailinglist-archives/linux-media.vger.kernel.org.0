Return-Path: <linux-media+bounces-52384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK4YAp+fiWlU/wQAu9opvQ
	(envelope-from <linux-media+bounces-52384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:49:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC8C10D312
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E5A0300C905
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348D232571A;
	Mon,  9 Feb 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vBUo6s2S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD1318140;
	Mon,  9 Feb 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626953; cv=none; b=DblZTI/7l3ek8iUiYRHf3Hf8F304y3nZihVnQ1jK1TUKJilroXNmhrQnahQCjwG50AI9lz3qol9jSecEcxVTaFTzlZ7Tpm1tVmHkO1gHu/wDsVWVKlF3uBeJEsSAUI74HNcTYXW4/pdWwoYSSuW4JdoRMq0G2DpBJp6yoDXS8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626953; c=relaxed/simple;
	bh=WkNrPs+7WJ+c6mRjQ0ySSYA82z8S0y6bLziFTH1LCoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWAGBmDmsd/ZsIbG5R5y9xVP4j+RvSrOiZf2jmQg3Tl/YxoSCCD6KVqUo549YOOgw8KsmGomJScHwgwRGIWgMhkAUiOl1mfgYSPPT0i9WV7NF2VlKAr3uXzMHfAXDiqLVqXv0pFhaDY+yNVfqeybsxLLhGv+3Ov0CFG9uZONOgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vBUo6s2S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AA95C6C;
	Mon,  9 Feb 2026 09:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770626905;
	bh=WkNrPs+7WJ+c6mRjQ0ySSYA82z8S0y6bLziFTH1LCoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBUo6s2STzBdlKoZTGhX6jZqSBivJZ272r3Vb4wsxd1CJee9zNHA8OWLCGozGq/QC
	 pOf3ZeuzDhRI79y2DS8L7/zcTl4cmfM6ot1oefV5H+/BrrXJ2CBsuAHyJ3C1Z8AyRe
	 J4tBEhNS16WWyRrrgZ4xJ9FdZ1INaSX1AXgL7YhA=
Date: Mon, 9 Feb 2026 09:49:08 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: malic55: Fix possible ERR_PTR deference in
 enable_streams
Message-ID: <aYme0vuJtoBI591u@zed>
References: <20260207091822.601255-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207091822.601255-1-alperyasinak1@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52384-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 6CC8C10D312
X-Rspamd-Action: no action

Hi Alper

On Sat, Feb 07, 2026 at 12:18:22PM +0300, Alper Ak wrote:
> The media_pad_remote_pad_unique() function returns either a valid
> pointer or an ERR_PTR() on failure (-ENOTUNIQ if multiple links are
> enabled, -ENOLINK if no connected pad is found). The return value
> was assigned directly to isp->remote_src and dereferenced in the
> next line without checking for errors, which could lead to an
> ERR_PTR dereference.
>
> Add proper error checking with IS_ERR() before dereferencing the
> pointer. Also set isp->remote_src to NULL on error to maintain
> consistency with other error paths in the function.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>

As the media link on the ISP sink pad #0 can connect to either the TPG
entity or to the [CSI-2 RX | IVC] pair, it is created without an
IMMUTABLE flag and can be in facts disabled.

So I guess the check is correct in this case:
Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

As per the other patch for the CRU, it might be nice to attribute
credit to the static analysis tool you have used.

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..c7225e9c8df7 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -360,6 +360,13 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
>
>  	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
>  	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
> +	if (IS_ERR(isp->remote_src))  {
> +		ret = PTR_ERR(isp->remote_src);
> +		dev_err(mali_c55->dev, "Failed to get remote source pad: %d\n", ret);
> +		isp->remote_src = NULL;
> +		return ret;
> +	}
> +
>  	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
>
>  	isp->frame_sequence = 0;
> --
> 2.43.0
>

