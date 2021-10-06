Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A38D423BF2
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 13:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbhJFLIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 07:08:22 -0400
Received: from comms.puri.sm ([159.203.221.185]:50232 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237931AbhJFLIV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 07:08:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 6C431E1339;
        Wed,  6 Oct 2021 04:05:59 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TEq-cT8BT5Xw; Wed,  6 Oct 2021 04:05:58 -0700 (PDT)
Date:   Wed, 6 Oct 2021 13:05:44 +0200
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
Subject: [PATCH] media: imx: Round line size to 4 bytes
Message-ID: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c0QfgXQ3Vn.SH0LtEafw=gY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/c0QfgXQ3Vn.SH0LtEafw=gY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Section 13.7.6.13 "CSI Image Parameter Register" of the
i.MX 8M Quad Applications Processors Reference Manual
states that the line size should be divisible by 8 bytes.
However, the hardware also accepts sizes divisible by 4 bytes.

This patch accepts line sizes divisible 4-bytes in non-planar mode.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---

Hello,

my previous patch identified something that was not a problem,
so I'm sending a different one.

This has been tested on the Librem 5.

Cheers,
Dorota

 drivers/staging/media/imx/imx-media-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index 5128915a5d6f..a303003929e3 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_for=
mat *pix,
 	}
=20
 	/* Round up width for minimum burst size */
-	width =3D round_up(mbus->width, 8);
+	width =3D round_up(mbus->width, 4);
=20
 	/* Round up stride for IDMAC line start address alignment */
 	if (cc->planar)
 		stride =3D round_up(width, 16);
 	else
-		stride =3D round_up((width * cc->bpp) >> 3, 8);
+		stride =3D round_up((width * cc->bpp) >> 3, 4);
=20
 	pix->width =3D width;
 	pix->height =3D mbus->height;
--=20
2.31.1


--Sig_/c0QfgXQ3Vn.SH0LtEafw=gY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFdgwgACgkQADBpX4S8
ZneTgA/8CbO6LOy5XYlOp9HtcO+gJkFF9YLeRQpRapSy3H9017+x7DeCvPIm/xsl
wn8T+ONTMCZZ7gRy5BnQUzUAANauc6Wn+lRgEaPrXYV/B+jx8IxWbMX/w15ajTDP
D5p7J0+D1RrEmJ5aemm9KoaT4e2RHGG7EwdmRaHrpnFX/yGr2y3H5wZSceS/5EU6
nl55XEq5GpsJ5m/7ZpdVDjesEFSOmFfCfH0NLXdFlXmKUwT/WAntFni/LPNSnNWl
Ul1GWU/EQXJ/YOwY0wexfuNqTS+9s8zJHawQOYwdViOsPRIG6J2jdtVyab+kjl6n
u8+RZqdKPiQAb6+NZezpMvf1KPU/gZVeRj4+Gr7puczHp3rgb86VKTpDoQ48yVY2
Z8ayOkioHt/WGXnJvK7iyQT5dgr7ND/7VPD/j2E0k+ev0ViB+i052+HBdfErWNxv
QSmpPGaEYB6qEFEcCiZhqExLo5W1hW81d06NuXPO3WUI6B/3mZGClJUdKFnV3D+M
pjrSURr8ejy0wah3VH+jiYoo33rrDbX0+254m3mNeFO+ExPxvw4Sgg/6A2UrkQSX
4auLKo2xxORsXQwkT8dZ/92eap5C1zsvgRHMqV5FDzzbvGp2Af9F3Pis/T9+9L1C
h3ef3CaUHr5xgQvr8MtwCdPHIV/6eiFdQTLkgEUDT6vShMfSCwY=
=XGed
-----END PGP SIGNATURE-----

--Sig_/c0QfgXQ3Vn.SH0LtEafw=gY--
