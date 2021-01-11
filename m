Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A6B2F1C2A
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbhAKRVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:21:04 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:45665 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbhAKRVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:21:03 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 595964000B;
        Mon, 11 Jan 2021 17:20:17 +0000 (UTC)
Date:   Mon, 11 Jan 2021 18:20:16 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/5] dt-bindings: media: rockchip-vpu: Add PX30 compatible
Message-ID: <X/yI0BCrkrEI/K42@aptenodytes>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
 <20210107134101.195426-4-paul.kocialkowski@bootlin.com>
 <a23ab40e50a761bd2127df6bc8b2a91e99a1617c.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7MHoYb//4iLnyjZi"
Content-Disposition: inline
In-Reply-To: <a23ab40e50a761bd2127df6bc8b2a91e99a1617c.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7MHoYb//4iLnyjZi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Thu 07 Jan 21, 15:55, Philipp Zabel wrote:
> Hi Paul,
>=20
> On Thu, 2021-01-07 at 14:40 +0100, Paul Kocialkowski wrote:
> > The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
> > and an encoder (VEPU2). It is similar to the RK3399's VPU but takes an
> > extra clock (SCLK).
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/media/rockchip-vpu.yaml          | 25 +++++++++++++------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml =
b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > index c81dbc3e8960..c446b9ead21b 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > @@ -15,10 +15,13 @@ description:
> > =20
> >  properties:
> >    compatible:
> > -    enum:
> > -      - rockchip,rk3288-vpu
> > -      - rockchip,rk3328-vpu
> > -      - rockchip,rk3399-vpu
> > +    oneOf:
> > +      - const: rockchip,rk3288-vpu
> > +      - const: rockchip,rk3328-vpu
> > +      - const: rockchip,rk3399-vpu
> > +      - items:
> > +        - const: rockchip,px30-vpu
> > +        - const: rockchip,rk3399-vpu
> > =20
> >    reg:
> >      maxItems: 1
> > @@ -35,12 +38,18 @@ properties:
> >            - const: vdpu
> > =20
> >    clocks:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 3
> > =20
> >    clock-names:
> > -    items:
> > -      - const: aclk
> > -      - const: hclk
> > +    oneOf:
> > +      - items:
> > +        - const: aclk
> > +        - const: hclk
> > +      - items:
> > +        - const: aclk
> > +        - const: hclk
> > +        - const: sclk
>=20
> You could make this:
>=20
>     clock-names:
>       minItems: 2
>       items:
>         - const: aclk
>         - const: hclk
>         - const: sclk
>=20
> And then:
>=20
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: rockchip,px30-vpu
>     then:
>       properties:
>         clock-names:
>           minItems: 3
>=20
> to make sure each variant has the correct clocks set.

Thanks for the suggestion! That's a finer grain that my proposal.

Rob, is there a preference for how this case should be handled?
Here, we want to specify an extra clock for the PX30 case.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--7MHoYb//4iLnyjZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/8iNAACgkQ3cLmz3+f
v9EGTgf/cgOKh4wu1sCC8/0p35XnHK1fKqvY0710rustUO1l4hbVKA0uavtIZ0ei
2xTeicq6AK40n0SPvMiyYB/Naz/YT1CJ3xY+rm+fBARG2tW+IPZS16/EudbQYrb2
aW1iXXj8hGqTPjIDaKMbTBRv/r+mSFsEZuimq2iNbF5Qq2J0AkESeEj6H3YLvl9z
BibYPcx+NHtHlA6iogqV5iqvmUT+x0ur0+NeUDj8Tu4qDZhPZY2I++U5WNSIqAlQ
jPsef+ABZ5Uzq2JmrjJqY9PATVuuTx8kbHIqCLpKRW1a+1PnZf7zedf1BRI19EgL
lg9SFntpJ6LjCpUVWLPLlpHIgWMqBA==
=L38N
-----END PGP SIGNATURE-----

--7MHoYb//4iLnyjZi--
