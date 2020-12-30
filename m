Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2472E78B8
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 13:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgL3M4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 07:56:49 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33746 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgL3M4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 07:56:49 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E78431C0B85; Wed, 30 Dec 2020 13:55:50 +0100 (CET)
Date:   Wed, 30 Dec 2020 13:55:50 +0100
From:   Pavel Machek <pavel@denx.de>
To:     sakari.ailus@linux.intel.com, andy.shevchenko@gmail.com,
        laurent.pinchart@ideasonboard.com, mchehab+huawei@kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu3-cio2: Fix mbus_code processing in
 cio2_subdev_set_fmt()
Message-ID: <20201230125550.GA14074@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Loop was useless as it would always exit on the first iteration. Fix
it with right condition.=20

Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
Fixes: a86cf9b29e8b ("media: ipu3-cio2: Validate mbus format in setting sub=
dev format")

index 36e354ecf71e..e8ea69d30bfd 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1269,7 +1269,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.code =3D formats[0].mbus_code;
=20
 	for (i =3D 0; i < ARRAY_SIZE(formats); i++) {
-		if (formats[i].mbus_code =3D=3D fmt->format.code) {
+		if (formats[i].mbus_code =3D=3D mbus_code) {
 			fmt->format.code =3D mbus_code;
 			break;
 		}

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+x41gAKCRAw5/Bqldv6
8i+mAKCHsIm46MSL3YqNC9y2aZBbqUsRUwCcD1mOTaJgCn1SCO8EItO+i7PduYc=
=Rvsp
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
