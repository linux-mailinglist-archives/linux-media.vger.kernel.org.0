Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1C1CF413
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 09:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730351AbfJHHkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 03:40:55 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60253 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfJHHkz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 03:40:55 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 3945080477; Tue,  8 Oct 2019 09:40:38 +0200 (CEST)
Date:   Tue, 8 Oct 2019 09:40:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191008074052.GA633@amd>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20191007162913.250743-2-jacopo@jmondi.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-10-07 18:29:03, Jacopo Mondi wrote:
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
> index f884ada0bffc..1211bdf80722 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,17 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
> =20
> +- location: The mount location of a device (typically an image sensor or=
 a flash
> +  LED) expressed as a position relative to the usage orientation of the =
system
> +  where the device is installed on.
> +  Possible values are:
> +  0 - Front. The device is mounted on the front facing side of the syste=
m.
> +  For mobile devices such as smartphones, tablets and laptops the front =
side is
> +  the user facing side.
> +  1 - Back. The device is mounted on the back side of the system, which =
is
> +  defined as the opposite side of the front facing one.
> +  2 - External. The device is not attached directly to the system but is
> +  attached in a way that allows it to move freely.

I explained why this is not enough, and it did not change.

NAK.
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2cPYQACgkQMOfwapXb+vIISACdHOnVXGL3AESuOtYxsMb8PA/J
YJMAniNC3hhH/UHm5os5gdHO9Aoe/2Ot
=/Org
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
