Return-Path: <linux-media+bounces-57353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0/BAjgxmnAPgUAu9opvQ
	(envelope-from <linux-media+bounces-57353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:52:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9A34A79A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B384300B86F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F5738E5FE;
	Fri, 27 Mar 2026 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="TOMi7ydV"
X-Original-To: linux-media@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AC37757A;
	Fri, 27 Mar 2026 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774641149; cv=none; b=ROXS0z4kWqsAkRS3mAmz4pKZhSPCg83l/CG+v04LD2QvAA5arVjFLv4Om/B1jAw3Z9mCDGEc7AZJLhs0vA+LteH1aUWrE1dOt7Z/SyERorlsTKM0CfzhLDDQCOC4PJeT81VwdocK725vIR8zkclT33IvTGCyshOX2Y+0sWU73/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774641149; c=relaxed/simple;
	bh=l5xhcfs/EX2LpSrFBlhmEVnPuwWPqhiWP7Nbyhhyzr8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rKbUyGHCJJoFHeaVS1q5TqjwPq3/rCUH7NX6gg75ECmcna3xtnpbtSwrZhOPJ9KTPNB1gDfpbGx2W5pPITHchYjSGxvYroNDEwcIWbw++7d8RD0N94Fuo+FBjGPrJruf34QBEGcY+QId2KbwV/ED98bLBlAHzjCFs6LkCl+HCQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=TOMi7ydV; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1774641140;
	bh=l5xhcfs/EX2LpSrFBlhmEVnPuwWPqhiWP7Nbyhhyzr8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TOMi7ydVE3lUoUkkASLBoHrwAORuAjtrea48EYgQEmGMrLx/EY3OLS5JKYv/ojNfr
	 ORrBJkD/vpKwYHVDQZ83sVFVljt4IIg9GMqzy4cZliBV73YKtYa5xrLfLNsJUHWZT6
	 xcnJ+7pvsd4XvC1it9D8L+56ry02eLmSHITY1B1g=
Message-ID: <683e37b4763e533aee87598f0d9968510b203340.camel@crapouillou.net>
Subject: Re: [PATCH] media: v4l2-common: Always register clock with
 device-specific name
From: Paul Cercueil <paul@crapouillou.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mehdi Djait
	 <mehdi.djait@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Mar 2026 20:52:16 +0100
In-Reply-To: <20260327180652.GE3026673@killaraus.ideasonboard.com>
References: <20260327175212.443987-1-paul@crapouillou.net>
	 <20260327180652.GE3026673@killaraus.ideasonboard.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[crapouillou.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[crapouillou.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57353-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[crapouillou.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@crapouillou.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,crapouillou.net:dkim,crapouillou.net:email,crapouillou.net:mid]
X-Rspamd-Queue-Id: 77B9A34A79A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Le vendredi 27 mars 2026 =C3=A0 20:06 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Fri, Mar 27, 2026 at 06:52:12PM +0100, Paul Cercueil wrote:
> > If we need to register a dummy fixed-frequency clock, always
> > register it
> > using a device-specific name.
> >=20
> > This supports the use case where a system has two of the same
> > sensor,
> > meaning two instances of the same driver, which previously both
> > tried
> > (and failed) to create a clock with the same name.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
> > =C2=A01 file changed, 4 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c
> > b/drivers/media/v4l2-core/v4l2-common.c
> > index 554c591e1113..5f3295c3122a 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -792,14 +792,11 @@ struct clk *__devm_v4l2_sensor_clk_get(struct
> > device *dev, const char *id,
> > =C2=A0	if (ret)
> > =C2=A0		return ERR_PTR(ret =3D=3D -EINVAL ? -EPROBE_DEFER :
> > ret);
> > =C2=A0
> > -	if (!id) {
> > -		clk_id =3D kasprintf(GFP_KERNEL, "clk-%s",
> > dev_name(dev));
> > -		if (!clk_id)
> > -			return ERR_PTR(-ENOMEM);
> > -		id =3D clk_id;
> > -	}
> > +	clk_id =3D kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
>=20
> This will now fail if the same device needs to register two clocks.
> You
> need to include the id in the name. Maybe something like
>=20
> 	clk_id =3D kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev),
> id);

Ha, good point. I'll v2.

Cheers,
-Paul

>=20
> > +	if (!clk_id)
> > +		return ERR_PTR(-ENOMEM);
> > =C2=A0
> > -	clk_hw =3D devm_clk_hw_register_fixed_rate(dev, id, NULL, 0,
> > rate);
> > +	clk_hw =3D devm_clk_hw_register_fixed_rate(dev, clk_id,
> > NULL, 0, rate);
> > =C2=A0	if (IS_ERR(clk_hw))
> > =C2=A0		return ERR_CAST(clk_hw);
> > =C2=A0

