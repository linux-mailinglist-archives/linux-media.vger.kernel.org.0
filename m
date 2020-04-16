Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2DE1AC093
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634813AbgDPMAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:00:39 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:53135 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634711AbgDPMAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 08:00:34 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 254D41C001F;
        Thu, 16 Apr 2020 12:00:26 +0000 (UTC)
Date:   Thu, 16 Apr 2020 14:00:25 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/4] media: rockchip: rga: Add support for the PX30
 compatible
Message-ID: <20200416120025.GF125838@aptenodytes>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <20200416115047.233720-4-paul.kocialkowski@bootlin.com>
 <cd224bf8-5b0a-46e5-1657-4b40c6d3915e@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Content-Disposition: inline
In-Reply-To: <cd224bf8-5b0a-46e5-1657-4b40c6d3915e@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 16 Apr 20, 13:58, Hans Verkuil wrote:
> On 16/04/2020 13:50, Paul Kocialkowski wrote:
> > The PX30 SoC has a RGA block, so add the associated compatible to
> > support it.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/platform/rockchip/rga/rga.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/=
platform/rockchip/rga/rga.c
> > index e9ff12b6b5bb..0ebeb9b4c14a 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > @@ -880,7 +880,6 @@ static int rga_probe(struct platform_device *pdev)
> >  	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
> >  					   &rga->cmdbuf_phy, GFP_KERNEL,
> >  					   DMA_ATTR_WRITE_COMBINE);
> > -
>=20
> Spurious change?

Ah sorry about that. Will fix in v2.

Cheers,

Paul

> Regards,
>=20
> 	Hans
>=20
> >  	rga->src_mmu_pages =3D
> >  		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
> >  	rga->dst_mmu_pages =3D
> > @@ -955,6 +954,9 @@ static const struct dev_pm_ops rga_pm =3D {
> >  };
> > =20
> >  static const struct of_device_id rockchip_rga_match[] =3D {
> > +	{
> > +		.compatible =3D "rockchip,px30-rga",
> > +	},
> >  	{
> >  		.compatible =3D "rockchip,rk3288-rga",
> >  	},
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6YSNkACgkQ3cLmz3+f
v9HcIwf/SaOTWWzEOe0dZG4yxmCG1gZdhPpc/T2J0x3X4fh6wY1AQ5SojDHUl0Qg
eUMyWPA+vb5dxmGDgY8W9uIE0/yEI/mvPhhvYDw3kcn7O7KyeqrL0Jet3K15/iJ4
AzZUCb8tBJ+CYVeevmlklRwlYsjjxEwqhfxFDud4aI0hP3spuP8rQebtgyTTAEYI
6r36v0557kcmjUyFy2oKsF1iJ2ifCOVIFhBvTYMhgYBZILoHb8NBIJUq9Ys2XwvL
BVCMZHMWYKysP7pjoL3ulQp3AoM3K951fL/YYu4gNZaXNIJC02DYboIm1xpIF1iy
0fFdRNBEynGwtsc2yLefFg2d1YeXow==
=JROB
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--
