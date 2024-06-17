Return-Path: <linux-media+bounces-13447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668590B37D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1F21F26A4F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E0B153504;
	Mon, 17 Jun 2024 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QycA+yN1"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447031527B7;
	Mon, 17 Jun 2024 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634215; cv=none; b=IyPyqPdlDk9gnUkYEUwHBehMoaG3UaITv+NGpTIcQB4v1LVaRGGFVhxyNhkXpY5wdM7qGauAJgT9YXSqf/BsXBJg7ocDOFXn2bU40IutRFJqVItP9MnvvwBywGxzTbVUeCwl40gNSd42vIaN6yWDbRr9GR2vfNPG4AdFPz6fkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634215; c=relaxed/simple;
	bh=NYdwtkKMhVFmdCeDOXPFe4EYASFOC1auQBRabkcAkBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X44Jq+u1jc/FVfjwpNUw6Qb92TqF0PhlgTJ4fNaTBKNYcBakpJYqJMDsaaHigjawnO28h/6RC6hPq51t22C2AZIKN+gD2D5o4ShePh+0xbvXwu4p8iqMXiT70R1a5QZ6W12MOX8qRiG81Oa85UDGPd5flGJTjjBIUH3ld3yKqX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QycA+yN1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718634212;
	bh=NYdwtkKMhVFmdCeDOXPFe4EYASFOC1auQBRabkcAkBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QycA+yN1DBqMWJffQUrr+Z/8VSeoNhnVVXeh/nVr7mB6TEViR4sgHaQfm5ebp2M8u
	 u9I3841WhKqD9fC7hFGjGusWeVuthMISOHSe2EClyfWBqK1B9vpIlhs0C6YvEhfuvY
	 1P2fRqBIkTT62Xeb8jNYSPQenLXD2W35Ssae6Wfy/JYExNDiKP/RLS5MUm9/QUalbr
	 3ADlo8cfDuw+zwfRvMb5IF9ny0WmI76kt69BtgW26CtCKbqAgrdSGbmrgGChxgA3zC
	 MV4C7HEsFbxhD1V+jyZAAZ3bxQ2IHKAMqkiFf5GSGRoJI04hxvAFH+B97YPRZ4LMAK
	 4rhdXAOo7jJsw==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B0C2237812FD;
	Mon, 17 Jun 2024 14:23:29 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 10:23:02 -0400
Message-ID: <5810431.QJadu78ljV@arisu>
Organization: Collabora
In-Reply-To: <94b9e0fd-2f4f-4d75-ae39-7d780a4e6374@moroto.mountain>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <94b9e0fd-2f4f-4d75-ae39-7d780a4e6374@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4215044.CQOukoFCf9";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4215044.CQOukoFCf9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 10:23:02 -0400
Message-ID: <5810431.QJadu78ljV@arisu>
Organization: Collabora
In-Reply-To: <94b9e0fd-2f4f-4d75-ae39-7d780a4e6374@moroto.mountain>
MIME-Version: 1.0

On Monday, June 17, 2024 8:02:56 A.M. EDT Dan Carpenter wrote:
> On Fri, Jun 14, 2024 at 09:56:27PM -0400, Detlev Casanova wrote:
> > +static int rkvdec2_start_streaming(struct vb2_queue *q, unsigned int
> > count) +{
> > +	struct rkvdec2_ctx *ctx = vb2_get_drv_priv(q);
> > +	const struct rkvdec2_coded_fmt_desc *desc;
> > +	int ret, i;
> > +	u32 width, height;
> > +
> > +	if (V4L2_TYPE_IS_CAPTURE(q->type))
> > +		return 0;
> > +
> > +	desc = ctx->coded_fmt_desc;
> > +	if (WARN_ON(!desc))
> > +		return -EINVAL;
> > +
> > +	width = ctx->decoded_fmt.fmt.pix_mp.width;
> > +	height = ctx->decoded_fmt.fmt.pix_mp.height;
> > +	for (i = 0; i < RKVDEC2_RCB_COUNT; i++) {
> > +		ctx->rcb_bufs[i].cpu =
> > +			dma_alloc_coherent(ctx->dev->dev,
> > +					   RCB_SIZE(i),
> > +					   &ctx-
>rcb_bufs[i].dma,
> > +					   GFP_KERNEL);
> > +		if (!ctx->rcb_bufs[i].cpu) {
> > +			ret = -ENOMEM;
> > +			goto err_rcb;
> > +		}
> > +	}
> > +
> > +	if (desc->ops->start) {
> > +		ret = desc->ops->start(ctx);
> > +		if (ret)
> > +			goto err_ops_start;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_ops_start:
> > +err_rcb:
> > +	i--;
> > +	while (i) {
> > +		dma_free_coherent(ctx->dev->dev,
> > +				  RCB_SIZE(i),
> > +				  ctx->rcb_bufs[i].cpu,
> > +				  ctx->rcb_bufs[i].dma);
> > +		i--;
> > +	}
> 
> This will leak the first element of the ctx->rcb_bufs[i] array.  The
> traditional way to write this is either while (--i >= 0) or for unsigned
> int i iterators it would be while (i--).

Yes, I was thinking that an even better solution would be to allocate 1 dma 
buffer and use offsets in it when configuring the hw. But this is only one 
allocation per streamon, not per frame, so this might just be good enough as 
is.

I'll fix the freeing code part

> > +
> > +	return ret;
> > +}
> 
> regards,
> dan carpenter


--nextPart4215044.CQOukoFCf9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZwRsYACgkQ5EFKUk4x
7bZSPAgAhkFN4znImbWicUjn/vFThqGJ7eK+qD8sQIiPYruMztMGf/OshXbcOp2l
4ujwbpPWbde3YhrjMTyegzr1LKKcmZ0y4o/DqKk1yy36lulpCYz5uOWTO4jszXpT
cmA9/pk+LwnnKaAw6uuL84ydKpFqxnTOiOwRQHrVn55oL3KJ3t8fxLPAfaR+i1s5
eg1azdgqZLtyFodhj9W+UA3/mQj+QPtfydwIytJN1b86F7WramVH7sl3QZ0OT7GJ
2VimlE0ejk9rZnktSoe6o7sPAJFa0WhFNDera+EOGk+JgWbBvXUm2oOLw+N7TmNa
bNoyojqYFuKcGMe3I4xkNLFruLyGtg==
=NvSr
-----END PGP SIGNATURE-----

--nextPart4215044.CQOukoFCf9--




