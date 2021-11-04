Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1460445264
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhKDLqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:46:49 -0400
Received: from comms.puri.sm ([159.203.221.185]:37050 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKDLqt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 07:46:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 6B78EDFE2A;
        Thu,  4 Nov 2021 04:43:41 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2_cJRpYJgNx6; Thu,  4 Nov 2021 04:43:40 -0700 (PDT)
Date:   Thu, 4 Nov 2021 12:43:33 +0100
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
Subject: [PATCH v4 2/5] media: imx: Store the type of hardware
 implementation
Message-ID: <20211104113631.206899-2-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
References: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6WYj67gDDBSSCZ5H4Ks0m=K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/6WYj67gDDBSSCZ5H4Ks0m=K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The driver covers i.MX5/6, as well as i.MX7/8 hardware.
Those implementations differ, e.g. in the sizes of buffers they accept.

Some functionality should be abstracted, and storing type achieves that.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 3 ++-
 drivers/staging/media/imx/imx-media-capture.c | 5 ++++-
 drivers/staging/media/imx/imx-media-csi.c     | 3 ++-
 drivers/staging/media/imx/imx-media.h         | 8 +++++++-
 drivers/staging/media/imx/imx7-media-csi.c    | 3 ++-
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/=
media/imx/imx-ic-prpencvf.c
index d990553de87b..e06f5fbe5174 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1265,7 +1265,8 @@ static int prp_registered(struct v4l2_subdev *sd)
=20
 	priv->vdev =3D imx_media_capture_device_init(ic_priv->ipu_dev,
 						   &ic_priv->sd,
-						   PRPENCVF_SRC_PAD, true);
+						   PRPENCVF_SRC_PAD, true,
+						   DEVICE_TYPE_IMX56);
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);
=20
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stagin=
g/media/imx/imx-media-capture.c
index 93ba09236010..65dc95a48ecc 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -34,6 +34,7 @@ struct capture_priv {
=20
 	struct imx_media_video_dev vdev;	/* Video device */
 	struct media_pad vdev_pad;		/* Video device pad */
+	enum imx_media_device_type type;	/* Type of hardware implementation */
=20
 	struct v4l2_subdev *src_sd;		/* Source subdev */
 	int src_sd_pad;				/* Source subdev pad */
@@ -957,7 +958,8 @@ EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
=20
 struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_=
sd,
-			      int pad, bool legacy_api)
+			      int pad, bool legacy_api,
+			      enum imx_media_device_type type)
 {
 	struct capture_priv *priv;
 	struct video_device *vfd;
@@ -972,6 +974,7 @@ imx_media_capture_device_init(struct device *dev, struc=
t v4l2_subdev *src_sd,
 	priv->src_sd_pad =3D pad;
 	priv->dev =3D dev;
 	priv->legacy_api =3D legacy_api;
+	priv->type =3D type;
=20
 	mutex_init(&priv->mutex);
 	INIT_LIST_HEAD(&priv->ready_q);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/me=
dia/imx/imx-media-csi.c
index 6a94fff49bf6..b6758c3787c7 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1794,7 +1794,8 @@ static int csi_registered(struct v4l2_subdev *sd)
 	}
=20
 	priv->vdev =3D imx_media_capture_device_init(priv->sd.dev, &priv->sd,
-						   CSI_SRC_PAD_IDMAC, true);
+						   CSI_SRC_PAD_IDMAC, true,
+						   DEVICE_TYPE_IMX56);
 	if (IS_ERR(priv->vdev)) {
 		ret =3D PTR_ERR(priv->vdev);
 		goto free_fim;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/=
imx/imx-media.h
index d2a150aac6cd..08e0c94e2de1 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -96,6 +96,11 @@ enum imx_pixfmt_sel {
 	PIXFMT_SEL_ANY =3D PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
 };
=20
+enum imx_media_device_type {
+	DEVICE_TYPE_IMX56,
+	DEVICE_TYPE_IMX78,
+};
+
 struct imx_media_buffer {
 	struct vb2_v4l2_buffer vbuf; /* v4l buffer must be first */
 	struct list_head  list;
@@ -282,7 +287,8 @@ int imx_media_ic_unregister(struct v4l2_subdev *sd);
 /* imx-media-capture.c */
 struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_=
sd,
-			      int pad, bool legacy_api);
+			      int pad, bool legacy_api,
+			      enum imx_media_device_type type);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
 int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
 				      u32 link_flags);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/m=
edia/imx/imx7-media-csi.c
index d7dc0d8edf50..1a11f07620e9 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1012,7 +1012,8 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	}
=20
 	csi->vdev =3D imx_media_capture_device_init(csi->sd.dev, &csi->sd,
-						  IMX7_CSI_PAD_SRC, false);
+						  IMX7_CSI_PAD_SRC, false,
+						  DEVICE_TYPE_IMX78);
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
=20
--=20
2.31.1


--Sig_/6WYj67gDDBSSCZ5H4Ks0m=K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDx2UACgkQADBpX4S8
ZnfKhQ//dKCl27wxQWclaUp8Z1iV9e+MQXYuJ8ORM8CUd3CxfVBEYgzqvaObfHZf
w27gIvmJJ9zvE8q7dlL4atqgpR/0hHcdIvNk4LyEZtGcFRHIP9SB1E4Z0HzeDk2O
nNF9orZ5ZMe3ncrE+RdDexl7fiDMFNGBnn0jU+LwOoqHtDioDbFfAmA+rak0m0o/
OAshPNwR1lvN/ZFDSAXL+noHgHZSgGDHHVpoliSbXx1hxTKYWgDL2X2BPdwomXc1
yfaC2UUHH0QaVeTAABF1FK2c0MiI6pCjIZX5iKPxKpd5eqRG8xM+Hk/2Q/d9zUw0
luUKhVwsSKsz80V3+H0VXT8VzVe5pVkRbAubbNX6k7d6Uc2orpLVLuZ6ODoPElwK
yKiur3su37fseBN31oncdmOvCZZ0Hh+c4kJ5PiBo2W3HW0Qggu5p3wtfP2SncXGM
8RXZBlA0Oksx4skHLpzIP3O2c5/pFYEHnqwYTl9fL2vZqCHitAjmyTV5cOvCOpVU
ZNzw2XR1lT/icOhSTQRhXGueeVhNHWJNtVTnXajGcln8qqp3NyoP6DgNK1c4OD1e
u601nvGCpr2QNJbYBTfWsgcOF/RkfM9EY3d8do9jhrTxGQfszyVuZfhMGnd4icSU
JbkRKja3s2STljuGbgAM/H9rBi4nw0fY0lfuuhbQCMxjoWCKTZc=
=UM74
-----END PGP SIGNATURE-----

--Sig_/6WYj67gDDBSSCZ5H4Ks0m=K--
