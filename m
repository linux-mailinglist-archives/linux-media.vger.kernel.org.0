Return-Path: <linux-media+bounces-13817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39E91067D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902251F2919D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEBF1AD3F9;
	Thu, 20 Jun 2024 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="31rEfK1z"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178E12E4A;
	Thu, 20 Jun 2024 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890866; cv=none; b=W+OuFEIUxZAPwaArc0k8iqu2Vp4IouCK8C8zzhwxToBoQoGWUg1sG2my5Bx1bUzTOyHIrzH/CxkIMwDJSIhTZHYHci62Xm7XMughKX4t4VAXGTRwWeAJ3sjxtXWF7Fc1Ak0I0NVaTDcNxv3HRJ9v/0+oP+7QMAtUNCVGgDSqjtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890866; c=relaxed/simple;
	bh=MXb/JFel+g0jLVI/vSHtNdzpSZ2gi9otcO1O+OJ3IgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRf9bMGMAMC2Zrt0Z0NtzPPCAIqlgJnMHGUuokufGWJfuVJlcZpN7yNJ2QzLGFlcnE1lEeOn+fPba9/wJhaNUPTOqZ1CeTwrVtUpFORRiIk2onoVpq4jJbX+B09RzY2n5zwee739+Ur2j+kto687clngrMItCr/esX0YdRSpIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=31rEfK1z; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718890863;
	bh=MXb/JFel+g0jLVI/vSHtNdzpSZ2gi9otcO1O+OJ3IgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=31rEfK1zKEp5adqlU6WR3ZhzqN8vRiZ/q5Jwns/Crg+wTVk0x3NL5HOstTmAEV19l
	 s4BYiQLQ1V4N0kbAREM9oDSc/0Pz5WY8vNt8MkfQ+n9zCdD7y1PKLSDXLpo+fOcdcu
	 rRV/HsL0xJRQIYWEgn2UuOvGIcAZ62MCZu71WC7EC4YcRwlzGm9r3Qs4Ctz+tBmCOc
	 lklEVSIK4VXQ6+7ik4TIb/fIv9zp7ioBtLy9CZKa+wc1TqMlPv0tDdwcCqzj4P5VKo
	 qzQzwpItuPD/572aWhfGjTCB0uoKZnYgVrtuldPj4Gpm+OkGH2RPrzlfrbx8giTGjw
	 CeZE78Srmwcdw==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D1773782039;
	Thu, 20 Jun 2024 13:41:03 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 0687C106045A; Thu, 20 Jun 2024 15:41:03 +0200 (CEST)
Date: Thu, 20 Jun 2024 15:41:03 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
Message-ID: <klzru2ak3yxccywqr57bslyctqtmrl2d3eghgv5letp7jkel6s@rlupljmxfijg>
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-3-detlev.casanova@collabora.com>
 <dc232a01-1495-42ff-ad2a-5a0aa780b60c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="twf4p3kbbzlssnu2"
Content-Disposition: inline
In-Reply-To: <dc232a01-1495-42ff-ad2a-5a0aa780b60c@kernel.org>


--twf4p3kbbzlssnu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 20, 2024 at 12:30:00PM GMT, Krzysztof Kozlowski wrote:
> On 19/06/2024 16:57, Detlev Casanova wrote:
> > +static const char * const rkvdec2_clk_names[] =3D {
> > +	"axi",
> > +	"ahb",
> > +	"core",
> > +	"cabac",
> > +	"hevc_cabac",
> > +};
> > +
> > +/*
> > + * Some SoCs, like RK3588 have multiple identical vdpu34x cores, but t=
he
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
> > +static int rkvdec2_disable_multicore(struct rkvdec2_dev *rkvdec)
> > +{
> > +	const char *compatible;
> > +	struct device_node *node;
> > +	int ret;
> > +
> > +	/* Intentionally ignores the fallback strings */
> > +	ret =3D of_property_read_string(rkvdec->dev->of_node, "compatible", &=
compatible);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* first compatible node found from the root node is considered the m=
ain core */
>=20
> So you rely on order of nodes? Before you claim "identical cores", but
> now "main core" suggests one is different than others.

Heh, I wrote that comment for Hantro. By main core I was referencing
the software side of things. With a number of equal cores and no DT
node describing a cluster (from HW point of view it's just equal
cores), they somehow need to be combined into a single entity to allow
scheduling work between them. This solves the issue by making one of
the devices the "main" device. From the HW point it's exactly the same
as the others. The function could also use the last core or the second
one. It does not matter as long as there is only one "main" core.

Greetings,

-- Sebastian

--twf4p3kbbzlssnu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZ0MWQACgkQ2O7X88g7
+pqbMA//Z5Ti8uy0mdUzAGS0Mfn5J1NUNWqus8fR5S7wDtYVJYvyqrsEkSeJ0iFw
1f3sPaNTIQQS4KTPhRtjCi6BImU9MnfOAJYELHFqibESxacqAIDxGhqiQkC57t2h
9tI13kcEiUM69czxT6cmJIeZ3Y9cJ0znaJ+HTs/QRGYM+OnOr4tIDdC5/CRWK3od
7cZizdGpbg0q2f/OaY7AAmNLlTL/5UgWD5xXQzud1hAAR1FhZlK3VSp4OPsdlpP+
+zEArBx9XtW+Os6l4Nn73T5p+Ibqgood9dxdq58MEkHhlFzWwoDjCgItqSBMJkby
y8u0whzx/EjJ/onaeBtuzAXsf7OAALtnkz5WV8Cs8lqBI7ekhG5QkMOxZ0AGbKI/
ZmtOrA3n1995HJqxMpKuepyF3oVy28YloNbA/5PNWqOFLAEM3pM7r0/fF6DeMrZf
evKFG4n3BXHcACwScohbaIgBXAsm8fkcoiS2Wh6cyC1nqjhbXtd+jYrlOsdYrziQ
IYpL8zSf5FtjD8uOjFlGNYuVc5tAqit2NBz3ok7VXvY2KdVy6CQpjhdxTk1ZJxwh
cMNGsGx/sKSatNWURaNqmyYKoxaZe/TglJS6sl1Wfk2A8m88krx6aRj2qIfhm8B2
PMoDwflLXjwBRC+gXa7h+SS/yZFcCZ+4DcM/T5WNCmdc8qiJ2ys=
=okQ+
-----END PGP SIGNATURE-----

--twf4p3kbbzlssnu2--

