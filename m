Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77CD433540
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 13:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235527AbhJSMCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:02:03 -0400
Received: from comms.puri.sm ([159.203.221.185]:49260 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235389AbhJSMB7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:01:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 0C42ADF854;
        Tue, 19 Oct 2021 04:59:46 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id guT2m-3wI9ko; Tue, 19 Oct 2021 04:59:45 -0700 (PDT)
Date:   Tue, 19 Oct 2021 13:59:29 +0200
From:   Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@purism
Subject: [PATCH] media: Add 16-bit Bayer formats
Message-ID: <20211019114718.827400-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wpPNuNnC_Dn6UWVV0uU2aGA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/wpPNuNnC_Dn6UWVV0uU2aGA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

16-bit bayer formats are used by the i.MX driver.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
Hello,

While working on the i.MX8 video driver, I discovered that `v4l2_fill_pixfm=
t` will fail when using 10-bit sensor formats. (For background, see the con=
versation at https://lkml.org/lkml/2021/10/17/93 .)

It appears that the video hardware will fill a 16-bit-per-pixel buffer when=
 fed 10-bit-per-pixel Bayer data, making `v4l2_fill_pixfmt` effectively bro=
ken for this case.

This change adds the relevant entries to the format info structure.

Difference in behaviour observed using the i846 driver on the Librem 5.

Regards,
Dorota Czaplejewicz

 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-cor=
e/v4l2-common.c
index 04af03285a20..d2e61538e979 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -309,6 +309,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 fo=
rmat)
 		{ .format =3D V4L2_PIX_FMT_SGBRG12,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
 		{ .format =3D V4L2_PIX_FMT_SGRBG12,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
 		{ .format =3D V4L2_PIX_FMT_SRGGB12,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
+		{ .format =3D V4L2_PIX_FMT_SBGGR16,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
+		{ .format =3D V4L2_PIX_FMT_SGBRG16,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
+		{ .format =3D V4L2_PIX_FMT_SGRBG16,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
+		{ .format =3D V4L2_PIX_FMT_SRGGB16,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D =
1, .vdiv =3D 1 },
 	};
 	unsigned int i;
=20
--=20
2.31.1


--Sig_/wpPNuNnC_Dn6UWVV0uU2aGA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFusyEACgkQADBpX4S8
ZndwxQ/+LzSvfUPU6hgPC3U3pA2+klpV5QsqXz+Ikai/azH38h3ZdVe5JbXiI6MH
p4TjBi2fteQHms0MyqRI9PAMcY9DtL67NOI9DUAxo8XQxjpft8f0Z9d6gWGXt/Su
jLDaBBzGxbeSN0dPYs7l2CwjYHou4S0dMYF0iQZV280tb/qOj5GEc+qlIrtb10t8
Vl3Ws7mNhUvezFzRstZwGuXtM1e4EXh1g1k2R5UDliIKEhYgWq24m8iuuJtPNCaH
fFlhMyNrR4cqRT/P0Aoe2bViujhN8itmXLjI3P2uue2sflsGIB/ZnW6Wc7/eKuyd
lp0llnEsIdbSdIguvYrX2U2B3ktayKX0BT4qC2tFr3ye9WQONv3GEHxonQo1qGXZ
ovAezDI0ZGshOf4+cbLPGIMewR32tBJkG6//87J7PNznO+sCQ1JT83E2QJvIrqaQ
vAaPGTkdrwUjCI3SjD6AyW8cC4NmLPL0d3XKRfIh+0i/KShhYFqoVdF18CDYQpbX
Z+2Jl4xuLiEUeb5xsq5e9U5MWwkxY4GcWSuR5ttI0CS8bBigU8eim5YsIuwauZvI
0PNn0wldmb6zjNZ4HXE3mZxbBeISJAG+Cf12uGWXtyE5TsRf+1oUBao2viukFKyj
MlN7Trs9NEHconaL0Ivu1ghDoGSNawc2sHgUIM8feDILQa0+E6Q=
=V9Ml
-----END PGP SIGNATURE-----

--Sig_/wpPNuNnC_Dn6UWVV0uU2aGA--
