Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EE043083C
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 13:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245414AbhJQLKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 07:10:45 -0400
Received: from comms.puri.sm ([159.203.221.185]:53440 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245410AbhJQLKo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 07:10:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 57A81DFAA8;
        Sun, 17 Oct 2021 04:08:35 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ffprkWN9vgA5; Sun, 17 Oct 2021 04:08:34 -0700 (PDT)
Date:   Sun, 17 Oct 2021 13:08:27 +0200
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
Subject: [PATCHv2 3/4] media: imx: Forward type of hardware implementation
Message-ID: <20211017102904.756408-3-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bi6pmz6thjiVMmB9+40egm_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/Bi6pmz6thjiVMmB9+40egm_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-media-capture.c | 14 ++++++++------
 drivers/staging/media/imx/imx-media-utils.c   |  3 ++-
 drivers/staging/media/imx/imx-media.h         |  3 ++-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stagin=
g/media/imx/imx-media-capture.c
index fdf0f3a8f253..22208b7ce825 100644
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
+		  enum imx_device_type type)
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
@@ -184,7 +185,8 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struc=
t v4l2_rect *compose)
 static int capture_try_fmt_vid_cap(struct file *file, void *fh,
 				   struct v4l2_format *f)
 {
-	__capture_try_fmt(&f->fmt.pix, NULL);
+	struct capture_priv *priv =3D video_drvdata(file);
+	__capture_try_fmt(&f->fmt.pix, NULL, priv->type);
 	return 0;
 }
=20
@@ -199,7 +201,7 @@ static int capture_s_fmt_vid_cap(struct file *file, voi=
d *fh,
 		return -EBUSY;
 	}
=20
-	cc =3D __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose);
+	cc =3D __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose, priv->type);
=20
 	priv->vdev.cc =3D cc;
 	priv->vdev.fmt =3D f->fmt.pix;
@@ -418,7 +420,7 @@ __capture_legacy_try_fmt(struct capture_priv *priv,
 		}
 	}
=20
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc, priv->type);
=20
 	return cc;
 }
@@ -889,7 +891,7 @@ static int capture_init_format(struct capture_priv *pri=
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
index afa96e05ea7f..e124dd722107 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -518,7 +518,8 @@ EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
=20
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc)
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_device_type type)
 {
 	u32 width;
 	u32 stride;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/=
imx/imx-media.h
index 2bacfb96da85..4ecfa6c51994 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -203,7 +203,8 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefm=
t *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc);
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_device_type type);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
--=20
2.31.1


--Sig_/Bi6pmz6thjiVMmB9+40egm_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFsBCsACgkQADBpX4S8
Znf53w//diRqgyW/EZ5XeDeXLJ7P+i88RvY0otqU2TaqyM28O69iK1FkjvBy9HwD
+AvluQwgltqSiImuVa6b/fDF7xT5z4vbezHsbGEJTZ1IyCYoyxS+3gY2CmibO3z7
L/aPKtDZJY497W+8DtfAQyjxAMgBiL7bIbzs8xGBWg+rs8ai5fuGd/JSd+cr0hpI
FOIaUKrOffI74Q8ZgmSHvqawYjMCrwazSRtRJueRr4Km3uNxLJLycbRnHo/wGp/O
4jgmFo8tUkvEA4LFqKsM3oGxnNtuNhGG83xdggbFR6k1RNK3cqoZBu93ugcOzTxC
qGTOxAbhwDX4Jp053T/Li3Tql4ggrD7NzzUfcmakxf67yRNMFDETdBo2Tru8Cyyo
6qirx0F+FOFy/3F6M+2yO7m/0pfQ7k3r+N61LiuRf9Ckqs2qLknF/Vw93k6B6lGM
wXqriPHA6DkWjgVAgJ2jqAy1vmD+YtIJdlf3cYisABfQzPoiV/S5CfEafP6LK0o/
Z0GEj4Mtywhh+EJ3fNV9S6qiW9Q9EXzbP64hlXhJTfFiXg+Lb+OF1sT+TV6a1Z3K
qtNpVyFRFLQbZTTC+pR0mCtY4b6pi0ldwKlYq3oETofluJV65dWLte1pnvWMyR6A
u01eFVUo0mGIsuJ6yvmxLSD8IKEgpPThr2vhuyAuF0hMCvnX/8g=
=UwVO
-----END PGP SIGNATURE-----

--Sig_/Bi6pmz6thjiVMmB9+40egm_--
