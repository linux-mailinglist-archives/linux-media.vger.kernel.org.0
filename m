Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658C240A803
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241774AbhINHli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:41:38 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:49857 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241102AbhINHlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:41:08 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A31FD100009;
        Tue, 14 Sep 2021 07:39:44 +0000 (UTC)
Date:   Tue, 14 Sep 2021 09:39:44 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/22] dt-bindings: sun6i-a31-mipi-dphy: Add optional
 direction property
Message-ID: <YUBRwNxIuU0+/CyS@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-4-paul.kocialkowski@bootlin.com>
 <20210913080008.2rxa22ifisuu3dwn@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3sJ9a4xR7kppdInQ"
Content-Disposition: inline
In-Reply-To: <20210913080008.2rxa22ifisuu3dwn@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3sJ9a4xR7kppdInQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 13 Sep 21, 10:00, Maxime Ripard wrote:
> On Fri, Sep 10, 2021 at 08:41:28PM +0200, Paul Kocialkowski wrote:
> > The Allwinner A31 MIPI D-PHY block supports both tx and rx directions,
> > although each instance of the block is meant to be used in one
> > direction only. There will typically be one instance for MIPI DSI and
> > one for MIPI CSI-2 (it seems unlikely to ever see a shared instance).
> >=20
> > Describe the direction with a new allwinner,direction property.
> > For backwards compatibility, the property is optional and tx mode
> > should be assumed by default.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml
> > index d0b541a461f3..303bbaf3b915 100644
> > --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > @@ -37,6 +37,18 @@ properties:
> >    resets:
> >      maxItems: 1
> > =20
> > +  allwinner,direction:
> > +    $ref: '/schemas/types.yaml#/definitions/string'
> > +    description: |
> > +      Direction of the D-PHY:
> > +      - "rx" for receiving (e.g. when used with MIPI CSI-2);
> > +      - "tx" for transmitting (e.g. when used with MIPI DSI).
> > +
> > +      When the property is missing, "tx" direction is assumed.
>=20
> You can provide this using default

Understood.

> > +    oneOf:
> > +      - const: tx
> > +      - const: rx
> > +
>=20
> enum?

Ah yes, enum feels like a better fit!

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--3sJ9a4xR7kppdInQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmFAUb8ACgkQ3cLmz3+f
v9G6MQf+LFXtO+lLmczqO2FeIZ57ZBvDX1arKZiS0kXZP+nN3Y+7FjpJoF5qxpPd
M7yIhPccBdpJshGqMhFh4swhZeM2tgml5hQfLhXYWKObKp1UZXcfCQ9uQ0b6jX7l
pE94RTNuf7KUOalTc7SIIKEHGcCtelN2QP5QkN9dCVIQx/QR2LQPweh1Pyrejgnc
k8rktdvc9Fta19KFbvjC8ni1WFQfsZs0h3jo6xoMrC8w1cVEVvQ8dTkljzRJ+k4W
DFDBlmrHneE+pgmpDsHM9L2kKcYm/7EsKPc3KWkwQwTZ7QS220qH42+rDnpXtH8l
Z5HvmxYSzkOVIahP4X1VEmzWLeQ7rg==
=+9YF
-----END PGP SIGNATURE-----

--3sJ9a4xR7kppdInQ--
