Return-Path: <linux-media+bounces-57666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GODALdupymkG/AUAu9opvQ
	(envelope-from <linux-media+bounces-57666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:50:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D499835F0F2
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61A6E3006D63
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5FD3246ED;
	Mon, 30 Mar 2026 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="WuSQtMB0"
X-Original-To: linux-media@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9236EAB4;
	Mon, 30 Mar 2026 16:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889424; cv=none; b=A/1GdXMG1o6iNVn0Lff/wKdYjBlgf1wX24eRVOYlqkf2dW7+UfS/zMmhACIA8hvQGubh1wUl2OVhDxETE0lPJmBCO4m6xfNjpFE6Gu1S2woI2WsSp9To7ulBkIXkFdzA5mLtHp4xdjIQRB7o+RyZ3gyyYm/3X0WbPOGcblWniD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889424; c=relaxed/simple;
	bh=e1lA9VF7YSc6fEgJuMaHil7dWhmhmORYzhmbCRx7aPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VmUIKc1me0/rIXjgQa2rVU3/k9B7ag5H2EiLFqi7Bh1x/gF/3vSqnhhzogmT4ukHnLPx+pAk98JPB6hcumZAw2G4x2PIZTd6wZoKhVGH1CVMPJ7IwwSrHtGc39BzsKzlGEklAsfi/cTvAlgPI5U16rq3S4QlQbrzvc8Xy5M7OhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=WuSQtMB0; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1774889414;
	bh=e1lA9VF7YSc6fEgJuMaHil7dWhmhmORYzhmbCRx7aPM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WuSQtMB0gDRbuM9Mwm0TBG5yX9MAGEL50ABrdLltkXNaUZwBAAk+pCtvnjrEyN/LB
	 2IWLnM9e5FkZikI0rUAZ5T0Eo9KLB5vH42HBM5d7hKHZeQhFKPgm6hE43y9dK+r5BH
	 xvp0kwrvqfEDc5ThnD0zr2/aEUqR+KJJ1LoojJgs=
Message-ID: <cbb88a06a4570c6e33b2125819572647efcd5b1a.camel@crapouillou.net>
Subject: Re: [PATCH v2] media: v4l2-common: Always register clock with
 device-specific name
From: Paul Cercueil <paul@crapouillou.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 30 Mar 2026 18:50:10 +0200
In-Reply-To: <acqilV_y6FxIgBbY@mdjait-mobl>
References: <20260327225750.607033-1-paul@crapouillou.net>
	 <acqilV_y6FxIgBbY@mdjait-mobl>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[crapouillou.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57666-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[crapouillou.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@crapouillou.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: D499835F0F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,

Le lundi 30 mars 2026 =C3=A0 18:21 +0200, Mehdi Djait a =C3=A9crit=C2=A0:
> Hi Paul,
>=20
> Thank you for the patch!
>=20
> On Fri, Mar 27, 2026 at 11:57:50PM +0100, Paul Cercueil wrote:
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
> >=20
> > Notes:
> > =C2=A0=C2=A0=C2=A0 v2: include requested clock id in fixed clock name
> >=20
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
> > =C2=A01 file changed, 4 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c
> > b/drivers/media/v4l2-core/v4l2-common.c
> > index 554c591e1113..f32263ba96c4 100644
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
> > +	clk_id =3D kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev),
> > id);
>=20
> How about this, for drivers calling this without id:
>=20
> 	if (id)
> 		clk_id =3D kasprintf(GFP_KERNEL, "clk-%s-%s",
> dev_name(dev), id);
> 	else
> 		clk_id =3D kasprintf(GFP_KERNEL, "clk-%s-%s",
> dev_name(dev));
>=20
> 	if (!clk_id)
> 		return ERR_PTR(-ENOMEM);

In the case where "id" is NULL then the name will be e.g.
"clk-ov2680@1c-(null)" which I assumed was fine - even with a valid
"id" the clock name wouldn't be very pretty anyway.

But I can't update it to your suggestion and send a v3.

Cheers,
-Paul Cercueil

