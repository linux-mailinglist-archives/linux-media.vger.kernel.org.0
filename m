Return-Path: <linux-media+bounces-13164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F71D906617
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2F43B21860
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 08:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6623C13CFB2;
	Thu, 13 Jun 2024 08:01:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13113CA8D;
	Thu, 13 Jun 2024 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265683; cv=none; b=Apo05thg5jzCqd/sH2oqy0/ocJWw30fz4+zmY19Heyyfk332wX6iTxR6ueiHkQei4qsCFS/+b1R1Q6DCh+xyg4DtzSLXvHKWII3VwyOEBtCNy8HMWFx41t3ow7PLuoIX8uzt6+EyeFlOrdAUEtqNF95cUn+oN3Ab6sbp1LgMELA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265683; c=relaxed/simple;
	bh=ijIgL4trQAoJvWli1jZxpI3we8f18cgQdunh1oh+b3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFn7AqD7Ebo6+yHfeCEpdRkQmPZ65obgubisJClry1tiO9TQTtqtJqCSIzF6q4nJI185uTmWcPOa8K+3Rbz2m2W2oxoR1TXfzrOtZA8PREYTVj3KW6qTK/mc96YGmqt0ybw9p0V32SQz9+OBEmE0jf0yFKWYHKvM6hmFsUDXJ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875be5.versanet.de ([83.135.91.229] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sHfOQ-0007fB-G8; Thu, 13 Jun 2024 10:01:10 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v5 3/5] media: hantro: Add RK3588 VEPU121 support
Date: Thu, 13 Jun 2024 10:01:09 +0200
Message-ID: <14943967.O6BkTfRZtg@diego>
In-Reply-To: <g3zzuwv2pti6oudc5xlab3cdjpqbhjsdxdsphzch4mtcaisqxl@iwkxgillwi2f>
References:
 <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <1739853.izSxrag8PF@diego>
 <g3zzuwv2pti6oudc5xlab3cdjpqbhjsdxdsphzch4mtcaisqxl@iwkxgillwi2f>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 13. Juni 2024, 00:44:38 CEST schrieb Sebastian Reichel:
> Hi,
>=20
> On Wed, Jun 12, 2024 at 08:08:51PM GMT, Heiko St=FCbner wrote:
> > Am Mittwoch, 12. Juni 2024, 19:15:43 CEST schrieb Sebastian Reichel:
> > > Avoid exposing each of the 4 Hantro H1 cores separately to userspace.
> > > For now just expose the first one.
> > >=20
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  .../media/platform/verisilicon/hantro_drv.c   | 38 +++++++++++++++++=
++
> > >  1 file changed, 38 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/driver=
s/media/platform/verisilicon/hantro_drv.c
> > > index 34b123dafd89..b722a20c5fe3 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_drv.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> > > @@ -722,6 +722,7 @@ static const struct of_device_id of_hantro_match[=
] =3D {
> > >  	{ .compatible =3D "rockchip,rk3399-vpu", .data =3D &rk3399_vpu_vari=
ant, },
> > >  	{ .compatible =3D "rockchip,rk3568-vepu", .data =3D &rk3568_vepu_va=
riant, },
> > >  	{ .compatible =3D "rockchip,rk3568-vpu", .data =3D &rk3568_vpu_vari=
ant, },
> > > +	{ .compatible =3D "rockchip,rk3588-vepu121", .data =3D &rk3568_vpu_=
variant, },
> > >  	{ .compatible =3D "rockchip,rk3588-av1-vpu", .data =3D &rk3588_vpu9=
81_variant, },
> > >  #endif
> > >  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> > > @@ -992,6 +993,39 @@ static const struct media_device_ops hantro_m2m_=
media_ops =3D {
> > >  	.req_queue =3D v4l2_m2m_request_queue,
> > >  };
> > > =20
> > > +/*
> > > + * Some SoCs, like RK3588 have multiple identical Hantro cores, but =
the
> > > + * kernel is currently missing support for multi-core handling. Expo=
sing
> > > + * separate devices for each core to userspace is bad, since that do=
es
> > > + * not allow scheduling tasks properly (and creates ABI). With this =
workaround
> > > + * the driver will only probe for the first core and early exit for =
the other
> > > + * cores. Once the driver gains multi-core support, the same techniq=
ue
> > > + * for detecting the main core can be used to cluster all cores toge=
ther.
> > > + */
> > > +static int hantro_disable_multicore(struct hantro_dev *vpu)
> > > +{
> > > +	const char *compatible;
> > > +	struct device_node *node;
> > > +	int ret;
> > > +
> > > +	/* Intentionally ignores the fallback strings */
> > > +	ret =3D of_property_read_string(vpu->dev->of_node, "compatible", &c=
ompatible);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* first compatible node found from the root node is considered the=
 main core */
> > > +	node =3D of_find_compatible_node(NULL, NULL, compatible);
> > > +	if (!node)
> > > +		return -EINVAL; /* broken DT? */
> > > +
> > > +	if (vpu->dev->of_node !=3D node) {
> > > +		dev_info(vpu->dev, "missing multi-core support, ignoring this inst=
ance\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int hantro_probe(struct platform_device *pdev)
> > >  {
> > >  	const struct of_device_id *match;
> > > @@ -1011,6 +1045,10 @@ static int hantro_probe(struct platform_device=
 *pdev)
> > >  	match =3D of_match_node(of_hantro_match, pdev->dev.of_node);
> > >  	vpu->variant =3D match->data;
> > > =20
> > > +	ret =3D hantro_disable_multicore(vpu);
> > > +	if (ret)
> > > +		return ret;
> > > +
> >=20
> > I think this might be better as two patches?
> >=20
> > As this patch stands, the disable-multicore handling is done for _all_
> > hantro variants, so part of me wants this to be labeled as such.
> >=20
> > The whole reasoning is completely ok, but somehow having this under
> > the "add rk3588" umbrella feels strange ;-)
>=20
> I can do that, but the 'rockchip,rk3588-vepu121' part is only needed
> because of the multicore handling. If the kernel already had this bit
> in the past, the RK3568 compatible could be used for RK3588 (as a
> fallback compatible), just like for VPU121.

I meant, you're doing hantro_disable_multicore() here also for everyone
else (i.MX etc), hence I'd like that to be a separate commit in this
series like:

=2D---- 8< ------
media: hantro: Disable multi-core handling for the time being

The VSI doc for the Hantro codec describes the grouping of up to 4 instance=
s.
The kernel currently doesn't handle multi-core processing .... foo bar ....
=2D---- 8< ------

And then add rk3588 support on top of that.


Heiko



