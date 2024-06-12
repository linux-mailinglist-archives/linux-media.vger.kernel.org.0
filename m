Return-Path: <linux-media+bounces-13118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12795905EAD
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F781C21631
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B70412C486;
	Wed, 12 Jun 2024 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ICZ7bLF4"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F915524D7;
	Wed, 12 Jun 2024 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718232282; cv=none; b=ZSgKI9p4LodvR7ZKSy4EIHn3gR44zPcKp/Rr5kNQHxz2qMpkIwd84IzzxhC9kQ8i/GFTmuiL2X3fPEN+ipLYbJgSt1KBFxq/f4Rr89KTkQMzWVDEOKsFbJeoAt2p6NKjQ+A4GKY5xqoKa4/5Qn0uDjyRBFTb8BAdM9S9CdAAB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718232282; c=relaxed/simple;
	bh=3BxgOK0jJWH4MvqrDuL12E5Mcp8yWGXac4bSSPonAmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ak91x8mFwWg7Sj0TtDtOVddjL3Dx89GYEpVGrkO9vVO56Rzsw/AAVMcWjOg/pIY6BRgXHS9Xg46bY1dBBvrf9w1MevN2N83APboepNDDU4vy7DEznbT6chW12kJDyKlBKJQW4Z2hvBmrb6MsNLwdreQBW9cII2x8hmkV87yLUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ICZ7bLF4; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718232279;
	bh=3BxgOK0jJWH4MvqrDuL12E5Mcp8yWGXac4bSSPonAmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICZ7bLF4RWMq9xQO1IKI6TW1ooCB0kjkDK+QdmsYtRLzNNRlG7WogBzsIZivgAVfH
	 jIzMTUMCqjidC7GaeybXz8GFzJlQioSyVlk4dxXlyzrnPyNEknVnqUrjdbbY6ovdew
	 D+kVT2W+Q24uydwG1v/c2jnU4NYKbsgreUkBCxrTfBxvzZg10QDxdnIeVZrTn5zM7Z
	 NONzyoTreS4HPwZBGVSf41vTTBrxYsZ2siAsCVIyduE4VuLJoguJq7f7uchUVfMs6d
	 iCCAhTEQ21AiAEIsWVqx/5TUKIpx91IZHxDk0jXuxG4ZOP8oVnmrh61Ui/wsrA5RkI
	 BZvmoJgdUtEGw==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0DBED37813C0;
	Wed, 12 Jun 2024 22:44:39 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 7869110608F7; Thu, 13 Jun 2024 00:44:38 +0200 (CEST)
Date: Thu, 13 Jun 2024 00:44:38 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v5 3/5] media: hantro: Add RK3588 VEPU121 support
Message-ID: <g3zzuwv2pti6oudc5xlab3cdjpqbhjsdxdsphzch4mtcaisqxl@iwkxgillwi2f>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <20240612173213.42827-4-sebastian.reichel@collabora.com>
 <1739853.izSxrag8PF@diego>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o666ufvarx7zeimk"
Content-Disposition: inline
In-Reply-To: <1739853.izSxrag8PF@diego>


--o666ufvarx7zeimk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 08:08:51PM GMT, Heiko St=FCbner wrote:
> Am Mittwoch, 12. Juni 2024, 19:15:43 CEST schrieb Sebastian Reichel:
> > Avoid exposing each of the 4 Hantro H1 cores separately to userspace.
> > For now just expose the first one.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../media/platform/verisilicon/hantro_drv.c   | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/=
media/platform/verisilicon/hantro_drv.c
> > index 34b123dafd89..b722a20c5fe3 100644
> > --- a/drivers/media/platform/verisilicon/hantro_drv.c
> > +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> > @@ -722,6 +722,7 @@ static const struct of_device_id of_hantro_match[] =
=3D {
> >  	{ .compatible =3D "rockchip,rk3399-vpu", .data =3D &rk3399_vpu_varian=
t, },
> >  	{ .compatible =3D "rockchip,rk3568-vepu", .data =3D &rk3568_vepu_vari=
ant, },
> >  	{ .compatible =3D "rockchip,rk3568-vpu", .data =3D &rk3568_vpu_varian=
t, },
> > +	{ .compatible =3D "rockchip,rk3588-vepu121", .data =3D &rk3568_vpu_va=
riant, },
> >  	{ .compatible =3D "rockchip,rk3588-av1-vpu", .data =3D &rk3588_vpu981=
_variant, },
> >  #endif
> >  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> > @@ -992,6 +993,39 @@ static const struct media_device_ops hantro_m2m_me=
dia_ops =3D {
> >  	.req_queue =3D v4l2_m2m_request_queue,
> >  };
> > =20
> > +/*
> > + * Some SoCs, like RK3588 have multiple identical Hantro cores, but the
> > + * kernel is currently missing support for multi-core handling. Exposi=
ng
> > + * separate devices for each core to userspace is bad, since that does
> > + * not allow scheduling tasks properly (and creates ABI). With this wo=
rkaround
> > + * the driver will only probe for the first core and early exit for th=
e other
> > + * cores. Once the driver gains multi-core support, the same technique
> > + * for detecting the main core can be used to cluster all cores togeth=
er.
> > + */
> > +static int hantro_disable_multicore(struct hantro_dev *vpu)
> > +{
> > +	const char *compatible;
> > +	struct device_node *node;
> > +	int ret;
> > +
> > +	/* Intentionally ignores the fallback strings */
> > +	ret =3D of_property_read_string(vpu->dev->of_node, "compatible", &com=
patible);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* first compatible node found from the root node is considered the m=
ain core */
> > +	node =3D of_find_compatible_node(NULL, NULL, compatible);
> > +	if (!node)
> > +		return -EINVAL; /* broken DT? */
> > +
> > +	if (vpu->dev->of_node !=3D node) {
> > +		dev_info(vpu->dev, "missing multi-core support, ignoring this instan=
ce\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int hantro_probe(struct platform_device *pdev)
> >  {
> >  	const struct of_device_id *match;
> > @@ -1011,6 +1045,10 @@ static int hantro_probe(struct platform_device *=
pdev)
> >  	match =3D of_match_node(of_hantro_match, pdev->dev.of_node);
> >  	vpu->variant =3D match->data;
> > =20
> > +	ret =3D hantro_disable_multicore(vpu);
> > +	if (ret)
> > +		return ret;
> > +
>=20
> I think this might be better as two patches?
>=20
> As this patch stands, the disable-multicore handling is done for _all_
> hantro variants, so part of me wants this to be labeled as such.
>=20
> The whole reasoning is completely ok, but somehow having this under
> the "add rk3588" umbrella feels strange ;-)

I can do that, but the 'rockchip,rk3588-vepu121' part is only needed
because of the multicore handling. If the kernel already had this bit
in the past, the RK3568 compatible could be used for RK3588 (as a
fallback compatible), just like for VPU121.

-- Sebastian

--o666ufvarx7zeimk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZqJNIACgkQ2O7X88g7
+prmng/+J+JQCs2l7H63PNhtj8waUB5VunmXRE0huPYvni5LWJM+E/nyl8LuDi1i
9ksj+NMfDEH7QNG5tF5AY328o58wgyxPeO5i0d2jBvffgxA3qTY7SWImNWTsRMe2
VHKRXanGyC5Z6sg00UbEnfps4b88sVAl1n7CHxq7IQD+q5tBOjYpL6kNu7oUPS32
oSsTUsrTP9bRe5EduCIRHXIDRbQxRVYCLb6LfCzjXA/3YNvSmctG+lfEqR+5DA/d
bWh3O0eIx3SvUYA6jYbB4P1L26SZ3SsveyYiRtTx7DnUp8WT6jmVZBs++s+PLWRX
t2dMzA6WBEUBAtvq+tjeVHbUs3L9LZlwUJq5p0wTFX46a0horY5JmVHqsxuCwMlL
C2tJ8KIDpDtcDRslsqZZKU014fobeVmNPhX9eaiyjVQk4s7zNcIM/LxUoHX3px1g
0lD8YlYZS3Q5Ejsai25CSBRFAHf+unovtualEIfdElOvosAWCUH/y5esJ2Pfvjr6
acKGw42KOmxeVTaVNeVkfCEvVzuBHE1i4NcUrLuWvsRQPy0cYXvC2i41BQJtQQoE
RU06DS3sO07G6/6V6V5ZQ8UF3BBeymd56976Wq597ZPT6J3cMWHSEsKk5duycOpc
dZ+xzX7m7+fJc/0SdjciE4PEX4NJviqnfetiylfJHLpAyyOPYPw=
=k1nu
-----END PGP SIGNATURE-----

--o666ufvarx7zeimk--

