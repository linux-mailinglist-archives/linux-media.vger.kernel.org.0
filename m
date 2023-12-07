Return-Path: <linux-media+bounces-1899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C3808EF7
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 18:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C94751F21204
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 17:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8FB4B127;
	Thu,  7 Dec 2023 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wx2uHuTI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14E481A7;
	Thu,  7 Dec 2023 17:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A48C433C7;
	Thu,  7 Dec 2023 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701971081;
	bh=kE0n2gr2CaIRus73ES8kcVH1cf0yVteSBzOYtQB63UE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wx2uHuTI6SpzzO+4J24LEQXHwI8kMMjn/qOqux/fXdUtdAWG2QCL8sILWDpJv+ZRF
	 KHg3m32XXp9M0JHczC1pJ5mbyuf2v+IBiI4TxCk3wJuJ8gF3M9cRUR/+1F7JeGjaIn
	 sGFKQ4y5dzNIUi712KgDXAfT8xTWq/lrdNamvAiVIjOxeBxsCzjK3vwAts6s3KZll+
	 lAHTujKHv4mzVF64GL9BrxMY0ixS8kqGzoqDwQphiKSb7NTU8hSLtNWWvAHjjsYKSn
	 eEpZKEROovsfYnyVFHO8rc0FM5HySlfHMJ+nD6KqHaBHXSEB2auLMHiVxI+C6WhlWq
	 rLdKHrenbru5g==
Date: Thu, 7 Dec 2023 17:44:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	shengnan.wang@mediatek.com, yaya.chang@mediatek.com,
	10572168@qq.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	heiko@sntech.de, jernej.skrabec@gmail.com, macromorgan@hotmail.com,
	linus.walleij@linaro.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
	gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <20231207-outcome-acclaim-d179c8c07fff@spud>
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <20231207052016.25954-2-zhi.mao@mediatek.com>
 <ZXGtqwjYruBQVaUr@kekkonen.localdomain>
 <129e3a8b-5e91-424a-8ff8-b015d5175f1a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N40z4CafL7X1rYMV"
Content-Disposition: inline
In-Reply-To: <129e3a8b-5e91-424a-8ff8-b015d5175f1a@linaro.org>


--N40z4CafL7X1rYMV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 01:30:35PM +0100, Krzysztof Kozlowski wrote:
> On 07/12/2023 12:34, Sakari Ailus wrote:
> >> +	ret =3D gc08a3_parse_fwnode(dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	gc08a3 =3D devm_kzalloc(dev, sizeof(*gc08a3), GFP_KERNEL);
> >> +	if (!gc08a3)
> >> +		return -ENOMEM;
> >> +
> >> +	gc08a3->dev =3D dev;
> >> +
> >> +	gc08a3->xclk =3D devm_clk_get(dev, NULL);
> >> +	if (IS_ERR(gc08a3->xclk))
> >> +		return dev_err_probe(dev, PTR_ERR(gc08a3->xclk),
> >> +					 "failed to get xclk\n");
> >> +
> >> +	ret =3D clk_set_rate(gc08a3->xclk, GC08A3_DEFAULT_CLK_FREQ);
> >=20
> > Please see:
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html=
#devicetree>.
>=20
>=20
> Oh, that's cool it was documented!
>=20
> The canonical link would be:
> https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.htm=
l#devicetree

I believe this is that answer to the "why are these needed" that I asked
on the previous version and never got a response to. Instead, they were
just removed from the binding etc.

--N40z4CafL7X1rYMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXIEgAAKCRB4tDGHoIJi
0ouqAQDUTa6OU1g0zJUvJGN1UaS5mtsII2EiSZDKd4calhNwgAD8D7luYf3WpePJ
KUxA5v4yxt6pUlaZ/sKzTzU/x1c2/QQ=
=YQab
-----END PGP SIGNATURE-----

--N40z4CafL7X1rYMV--

