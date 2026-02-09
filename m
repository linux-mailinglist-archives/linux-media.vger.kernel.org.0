Return-Path: <linux-media+bounces-52429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GfgIkYAimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:41:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E8112061
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E91FA3008982
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB3137FF66;
	Mon,  9 Feb 2026 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jDQQE4Lr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673272F5A1F;
	Mon,  9 Feb 2026 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651712; cv=none; b=dNnjthsDoNuiV0ibEnVK8e2YRTNAoFQe1bsXPiLSChtIpFeakfwjGuELa2sZweJo+2+I5wJe8ajfIoS9GjyuLf6NyOuie8616E8oF80AX65BxkZElUu1b+4UUqOBMdFIDJp9UKt6paLbg+b4Oh+yoE8otxGg/aiUX4Rt7cnjDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651712; c=relaxed/simple;
	bh=kr8bHstkJr5WS/KBEqkNvQ4bLvF2ylnvDhywgcYIVIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmQdunHAkBdJbdxtaTBxi0X1mlmSo/kE+XTSifa/jj+AsjpmP1jbycN0/QxEFxw4J/1/PMfcbJWIGg23koe6ORte/d3K4Bp8kg/Ag7cXpYjqbk0lelrVVuDRks//L4ksG8EN8l0cg+ZV1ma0Fv7kaBAertGeYpw1bUyJEbjo1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jDQQE4Lr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9F08454;
	Mon,  9 Feb 2026 16:41:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770651664;
	bh=kr8bHstkJr5WS/KBEqkNvQ4bLvF2ylnvDhywgcYIVIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDQQE4LrAeT6IgPuJf5B4V7U4n7AgD0xiYSKw0Jm4ni2tGkx6fvJ1SJDBKjiD+1UX
	 D6VKDjfc9PjligwlTzdrkt1AYUzH/zF8hRaTiTwFzJ2o5Kh34ITBhV4SNMA0UnEPlh
	 kGzsA+S6U5uD8nfIDMBdU1TOedm5yQY5MMlgf354=
Date: Mon, 9 Feb 2026 16:41:47 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rzg2l-cru: Drop redundant buffer address
 clearing
Message-ID: <aYn_uMMzNn3fj4yE@zed>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
 <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52429-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,ideasonboard.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 2F9E8112061
X-Rspamd-Action: no action

Hi Tommaso

On Tue, Dec 30, 2025 at 06:09:17PM +0100, Tommaso Merciai wrote:
> Remove the clearing of cru->buf_addr[slot] in rzg3e_cru_irq().
>
> The buffer address is already managed by rzg2l_cru_set_slot_addr(),
> and explicitly setting it to zero here has no effect on the driver
> behavior. Removing this assignment simplifies the code and avoids
> unnecessary operations.

The CRU driver in mainline is already unstable enough. I can capture
up to a few K of frames before hitting:

         rzg2l-cru 16010000.cru1: Invalid MB address 0xf2793e00 (out of range)

With this change I can capture up to a few hundred of frames before
hitting that.

I still have to investigate the actual reasons for the above error,
but before piling up more changes for this driver I think we should
try to fix it.

>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 34e74e5796e8..8ae6ef82a0da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -709,7 +709,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  			return IRQ_HANDLED;
>
>  		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -		cru->buf_addr[slot] = 0;
>
>  		/*
>  		 * To hand buffers back in a known order to userspace start
> --
> 2.43.0
>
>

