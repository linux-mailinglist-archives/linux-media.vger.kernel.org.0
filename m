Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B567E416FF3
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 12:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245423AbhIXKIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 06:08:43 -0400
Received: from comms.puri.sm ([159.203.221.185]:34686 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245565AbhIXKIm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 06:08:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id A7B1DDF4E2;
        Fri, 24 Sep 2021 03:06:38 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id K32DZ-SiYatL; Fri, 24 Sep 2021 03:06:38 -0700 (PDT)
Date:   Fri, 24 Sep 2021 12:06:31 +0200
From:   Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     kernel@puri.sm, phone-devel@vger.kernel.org
Subject: [PATCH] media: imx: Fix rounding
Message-ID: <20210924120631.7060da0f.dorota.czaplejewicz@puri.sm>
Organization: Purism
Content-Type: multipart/signed; boundary="Sig_/UUZqa0L2d=8613N2HL_AjKP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/UUZqa0L2d=8613N2HL_AjKP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Change rounding to the minimal burst size from 2^n to n.

This fixes images with sizes that are a multiple of 8 pixels.

See section 13.7.6.13 CSI Image Parameter Register of the
i.MX 8M Quad Applications Processors Reference Manual.

Fixes: 451a7b7815d0b ("media: imx: lift CSI and PRP ENC/VF width
alignment restriction")
Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
Hi,

I tested this patch on the Librem 5 with the main camera.

--Dorota
 drivers/staging/media/imx/imx-media-utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index 5128915a5d6f..a2d8fab32a39 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_for=
mat *pix,
 	}
=20
 	/* Round up width for minimum burst size */
-	width =3D round_up(mbus->width, 8);
+	width =3D round_up(mbus->width, 3);
=20
 	/* Round up stride for IDMAC line start address alignment */
 	if (cc->planar)
-		stride =3D round_up(width, 16);
+		stride =3D round_up(width, 4);
 	else
-		stride =3D round_up((width * cc->bpp) >> 3, 8);
+		stride =3D round_up((width * cc->bpp) >> 3, 3);
=20
 	pix->width =3D width;
 	pix->height =3D mbus->height;
--=20
2.31.1


--Sig_/UUZqa0L2d=8613N2HL_AjKP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFNoycACgkQADBpX4S8
ZnfWxQ/7Bsgm4pW+bgC74d2aR9/Qr3fJvkaOaUvTwkTzUCFpgmYKVXSCMSDHAJfY
akNsFylqSMo5s0KfaKZnhvqSuH/7USaOdETm2K79AitzY1dyTWNZ/SD3ef8hrCe0
LEkCdX0LIU6z0o3bTFnVo1Sq5uN0LZ2rrZ66CPaapqe8W6Fhn2FRy0CoB2m+vwII
MiwsE/kZnaXSyhN+QpkMD+f1RuvVBtg8iYN3vNxLVdo3s1KBqKYy2M8Q0xy7hOWx
JQ2WNVZtv8V4m193HwEUKmhQt9Pa4G4Ds4bwvX1qr4dv7kJCVjK6xYAo83Qptnjy
otkyky3FcKN2hs6lkuw1Z5nQWM3iEVykqX43APqiiUrZEOHkLuO11PZfFoK173g7
953xofK7fxCyWWYghzoOBFNJZApUFRd30yCye7HGLtAeLCOmw0DgVd47kp24E58E
9DCiP/zNtEqxWzYwlt5ZoJZvvXmlZmhEHeQps4CBV/QVz9oIfEvrUzr/1pCBp+1e
aXG6gaLwm1xRyZbWmxVJC3/+rQ8SjCETLbg6+Bykm4tfQi9xq0qwuMcqsCkX8O9N
UkA0wkx9krr36h7cWXfEIuOZVb91yrL3K4c12IeJOw9DKeqDom+XS4vtZNCztuIa
3AFQNbZ/BpC3GYbhbSNxMESJERl0gKB0DJ0InhWpdc4NdXrkhto=
=FBdR
-----END PGP SIGNATURE-----

--Sig_/UUZqa0L2d=8613N2HL_AjKP--
