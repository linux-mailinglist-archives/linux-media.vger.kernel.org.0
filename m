Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1C1C0890
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 17:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbfI0P1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 11:27:49 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36565 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbfI0P1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 11:27:48 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 9C71B8054F; Fri, 27 Sep 2019 17:27:31 +0200 (CEST)
Date:   Fri, 27 Sep 2019 17:27:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20190927152745.GA23113@amd>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20190912201055.13964-2-jacopo@jmondi.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add the 'location' device property, used to specify a device mounting
> position. The property is particularly meaningful for mobile devices
> with a well defined usage orientation.
>=20
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt=
 b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..e71b90a29d7a 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,17 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
>=20
> +- location: The device, typically an image sensor or a flash LED, mounti=
ng
> +  location expressed as a position relative to the usage orientation of =
the
> +  system where the device is installed on.
> +  Possible values are:
> +  0 - Front. The device is mounted on the front facing side of the syste=
m For
> +  mobile devices such as smartphones, tablets and laptops the front side=
 is the
> +  user facing side.

I don't think this is nearly enough of description. We have phones
with displays and cameras at both sides, where both sides can be used
to operate the system.

We have phone with display spanning both sides -- Mi Max.

https://www.idnes.cz/mobil/telefony/xiaomi-mi-mix-alpha-predstaveni.A190924=
_105858_telefony_oma

We have Galaxy Fold.

https://www.samsung.com/global/galaxy/galaxy-fold/

What is front side when device can be used in different
configurations?

Could we instead say that it is "main" vs "selfie" camera?

Notebooks usually have just "selfie" camera, tablets often have
both... DSLRs have just "main" camera.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2OKnEACgkQMOfwapXb+vKKAgCfYmjlA9n1hExHQbiCr02po1sr
074AoIYkRdpXlF79DPVHouVBXtp4PSYj
=c3we
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
