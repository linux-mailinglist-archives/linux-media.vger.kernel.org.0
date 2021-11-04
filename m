Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E4A445268
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhKDLrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:47:23 -0400
Received: from comms.puri.sm ([159.203.221.185]:37174 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231486AbhKDLrU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 07:47:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 96867DFE40;
        Thu,  4 Nov 2021 04:44:12 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uCzicKJ1KF7d; Thu,  4 Nov 2021 04:44:11 -0700 (PDT)
Date:   Thu, 4 Nov 2021 12:43:47 +0100
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
Subject: [PATCH v4 3/5] media: imx: Forward type of hardware implementation
Message-ID: <20211104113631.206899-3-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
References: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bd0IZZel4AazB2mpXrgCqdd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/bd0IZZel4AazB2mpXrgCqdd
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


--Sig_/bd0IZZel4AazB2mpXrgCqdd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDx3MACgkQADBpX4S8
ZndWEg/3UVLguQPbZpQyqnXryyMLb8lqwwG/zTsHU9SlhI2k3vp1ArjEkgKTtOjH
zOExJmTVf8xK3+NAMWgg2bDiKk6cv+EM5GvR786PR7MV++8dgSLzV8dqkSgMMm2A
LR1ORFb7ZWsNFGtXhN3IH3QHMJaXQvpRzXbY8w+2U5CjRxpNaoKc4hhl3ibLjove
17/4Tit4c77ZwDgQLBairpZqmYyjWMTOXNrLiHi6+Kg4pagEz24RRU2rnMvkkuFb
+5n4scwDVrXiKRZIpOthZja5d/5CgDjERM+O6MGm5cL9kZTGz2vhTRN7YzxKTlJ4
eaDyy7x0Rdxck+NV/HXje5zGADh17aYdQeTF1aOXpDGut8ssPQ3ZGpPlU1D2Eohp
BQ/os49/ZgxcSoWNTnikT5jr9cQdbj7/566rFmxAaEpgsBLLcgB74Yse179JfNOA
cwrUyyU+NbBH7QgqqtedUvxrj5qEhRnvm/nkV6nilL3HR3VjnJa4qBaqK8/gJK1Q
Yfkhnd71KcAvnVeEN+LmCRkSgLg+Mpa1m+woA3ReZwKSE+WTZnqA5gk3xRJELsMM
5BVONfH9hawJMVsUkd6vI0BmncbeX18Smki/TZdHg+pKwX5TMRpiS6vEnv+n+mys
BpaFRE4U8Zsf+r08vS0SQwl/+pXGwm6mTy14Q8GAOzWj4N+Umg==
=I38U
-----END PGP SIGNATURE-----

--Sig_/bd0IZZel4AazB2mpXrgCqdd--
