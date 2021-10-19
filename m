Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6604335B2
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhJSMQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:16:44 -0400
Received: from comms.puri.sm ([159.203.221.185]:50192 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235733AbhJSMQU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:16:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 36846DF897;
        Tue, 19 Oct 2021 05:14:08 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Bsxw2C1STRmZ; Tue, 19 Oct 2021 05:14:07 -0700 (PDT)
Date:   Tue, 19 Oct 2021 14:14:00 +0200
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Subject: [PATCHv3 3/4] media: imx: Forward type of hardware implementation
Message-ID: <20211019120047.827915-3-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
References: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pgsn8ZsmoWvmonxogq8cvh1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/Pgsn8ZsmoWvmonxogq8cvh1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-media-capture.c | 15 +++++++++------
 drivers/staging/media/imx/imx-media-utils.c   |  3 ++-
 drivers/staging/media/imx/imx-media.h         |  3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stagin=
g/media/imx/imx-media-capture.c
index 65dc95a48ecc..7a6384b3e5e6 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -139,7 +139,8 @@ static int capture_g_fmt_vid_cap(struct file *file, voi=
d *fh,
 }
=20
 static const struct imx_media_pixfmt *
-__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compos=
e)
+__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compos=
e,
+		  enum imx_media_device_type type)
 {
 	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx_media_pixfmt *cc;
@@ -171,7 +172,7 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struc=
t v4l2_rect *compose)
 	}
=20
 	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc, type);
=20
 	if (compose) {
 		compose->width =3D fmt_src.width;
@@ -184,7 +185,9 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struc=
t v4l2_rect *compose)
 static int capture_try_fmt_vid_cap(struct file *file, void *fh,
 				   struct v4l2_format *f)
 {
-	__capture_try_fmt(&f->fmt.pix, NULL);
+	struct capture_priv *priv =3D video_drvdata(file);
+
+	__capture_try_fmt(&f->fmt.pix, NULL, priv->type);
 	return 0;
 }
=20
@@ -199,7 +202,7 @@ static int capture_s_fmt_vid_cap(struct file *file, voi=
d *fh,
 		return -EBUSY;
 	}
=20
-	cc =3D __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose);
+	cc =3D __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose, priv->type);
=20
 	priv->vdev.cc =3D cc;
 	priv->vdev.fmt =3D f->fmt.pix;
@@ -418,7 +421,7 @@ __capture_legacy_try_fmt(struct capture_priv *priv,
 		}
 	}
=20
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc, priv->type);
=20
 	return cc;
 }
@@ -889,7 +892,7 @@ static int capture_init_format(struct capture_priv *pri=
v)
 		fmt_src.format.height =3D IMX_MEDIA_DEF_PIX_HEIGHT;
 	}
=20
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL, priv->ty=
pe);
 	vdev->compose.width =3D fmt_src.format.width;
 	vdev->compose.height =3D fmt_src.format.height;
=20
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index afa96e05ea7f..8b5c6bcfd4fa 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -518,7 +518,8 @@ EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
=20
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc)
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_media_device_type type)
 {
 	u32 width;
 	u32 stride;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/=
imx/imx-media.h
index 08e0c94e2de1..79adab775739 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -203,7 +203,8 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefm=
t *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc);
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_media_device_type type);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
--=20
2.31.1


--Sig_/Pgsn8ZsmoWvmonxogq8cvh1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFutogACgkQADBpX4S8
ZncaGA//VcJMkHdzvqJyH9VSyzXhevtaIpR8hC4IDDXjXefwFnANPdVe4JKb02/V
IP7PqYVk5Oq9xpDuWB26Od7Iaj1vRK8ssDR/SoTV+oNro9Fy0qMaD3fdHM7fRYzH
AB5mpw7S6baXOk71t7wAP4Rz9b+gdHD3zpILI8QBJzVBNbvIM5+BwjJDWyHyBJD8
CvVeBTC7fqFXS4dSOnJLMhRMRG4n6uItODAYIITYguGtussjlvZk55jUIUcJJzwi
bNibi5/gSdqJUjzeas/eSBbSU5M+L8qw2/zBcqQMYD3pahQOBGtByrDqjNimW38u
ygIzp6ENvkHQ99/xSpMgsBVvWyy+2sYpQKCvsig1Md3EgJGgsuz3N9vDXtQ9n7QG
cW7+k7iSMssSUF6IopJ7VQjBmiGGVBOW1fIizpLlkjcSMsyYRqzhOtKFiIu0I8au
PaBr2fYvPRHwqt/tT63qPm9HPEvInTF3CSZGlNV5qq9MnxMYhi0u4Nhdwsm2iB75
+lmm8CI4IuDmv/ZR9pFmdKD1rdA7Qv4LMTxL4cLPGu2DSEmAJsQkKFezqakLtgZE
cLoH/dTWlSr7dKZEqm8zwSXlNi/0/msWR+weZPAvIAaFJi69NNZFZuCtROSghrFG
YBC6l6s0+QH25njHcE3cCO5s9zfWvUZv6H3KHpNrKp9MXu2PIRw=
=GBVd
-----END PGP SIGNATURE-----

--Sig_/Pgsn8ZsmoWvmonxogq8cvh1--
