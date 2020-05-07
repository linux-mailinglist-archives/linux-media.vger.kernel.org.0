Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FF21C9C3F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 22:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgEGUXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 16:23:41 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58791 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgEGUXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 16:23:41 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E845A1C0002;
        Thu,  7 May 2020 20:23:37 +0000 (UTC)
Date:   Thu, 7 May 2020 22:23:37 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     devicetree@vger.kernel.org, ezequiel@collabora.com,
        hansverk@cisco.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 1/4] dt-bindings: rockchip-rga: Add PX30 compatible
Message-ID: <20200507202337.GJ2422122@aptenodytes>
References: <20200430164245.1630174-2-paul.kocialkowski@bootlin.com>
 <ed1ac7d6-12d3-5480-3699-70a88595cac2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LQAwcd5tHl0Qlnzi"
Content-Disposition: inline
In-Reply-To: <ed1ac7d6-12d3-5480-3699-70a88595cac2@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--LQAwcd5tHl0Qlnzi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 30 Apr 20, 23:24, Johan Jonker wrote:
> Hi Paul,
>=20
> >=20
> > Add a new compatible for the PX30 Rockchip SoC, which also features
> > a RGA block. It is compatible with the RK3288 RGA block.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml =
b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > index dd645ddccb07..740586299da9 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > @@ -23,6 +23,9 @@ properties:
>=20
>=20
> >        - items:
> >            - const: rockchip,rk3228-rga
> >            - const: rockchip,rk3288-rga
> > +      - items:
> > +          - const: rockchip,px30-rga
> > +          - const: rockchip,rk3288-rga
>=20
> Use enum.
>=20
>       - items:
>           - enum:
>             - rockchip,px30-rga
>             - rockchip,rk3228-rga
>           - const: rockchip,rk3288-rga

Are you sure about this? The rk3228 above does it as I did it and other exa=
mples
like allwinner,sun4i-a10-csi.yaml appear to be doing the same too.

The case with rockchip,rk3288-rga alone already seems covered.

Cheers,

Paul

> > =20
> >    reg:
> >      maxItems: 1
> > --=20
> > 2.26.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--LQAwcd5tHl0Qlnzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl60bkkACgkQ3cLmz3+f
v9FGRQf+NACpI/Qm8LidCAjDd2uHl97xlPGI/gb4zzpGYeK/t1BGJfLcDSY4MCkK
srG+0VSic+47U4qA5hlWqq4jXYTLkV5DBpF79lSqNCI6yrPln2oTaZ2bIcY/mF6E
Q1/AljAuM8pcoBnFdLwJEq7Td82Nb79teutcAlVCSl2uUvVI+bEY5EtLmWjeLnOb
ejYXlItHF3Od/hKE8C7GPpPazLyb4Oh67ZP1/RpnxkCEmkl/J41nni9NIRi+wV7Q
1Sz063fVOuzdDdDgmfc7NHdl9pstkqBq/gKyurtSGkpVnAC/qSfSGSRdCk3JX1Om
QZhzaBXFzWq8bStS1rjzsAz+AHUctA==
=zYey
-----END PGP SIGNATURE-----

--LQAwcd5tHl0Qlnzi--
