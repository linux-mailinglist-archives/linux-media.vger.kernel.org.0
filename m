Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E32343083A
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 13:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245403AbhJQLKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 07:10:35 -0400
Received: from comms.puri.sm ([159.203.221.185]:53370 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235960AbhJQLKe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 07:10:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 42A4EDFA1F;
        Sun, 17 Oct 2021 04:08:25 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hPFtdl-ST-Td; Sun, 17 Oct 2021 04:08:24 -0700 (PDT)
Date:   Sun, 17 Oct 2021 13:08:17 +0200
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
Subject: [PATCHv2 2/4] media: imx: Store the type of hardware implementation
Message-ID: <20211017102904.756408-2-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=3CTC_Z4HKntYsD0qSXe6Gp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/=3CTC_Z4HKntYsD0qSXe6Gp
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
index 93ba09236010..fdf0f3a8f253 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -34,6 +34,7 @@ struct capture_priv {
=20
 	struct imx_media_video_dev vdev;	/* Video device */
 	struct media_pad vdev_pad;		/* Video device pad */
+	enum imx_device_type type;		/* Type of hardware implementation */
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
+			      enum imx_device_type type)
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
index d2a150aac6cd..2bacfb96da85 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -96,6 +96,11 @@ enum imx_pixfmt_sel {
 	PIXFMT_SEL_ANY =3D PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
 };
=20
+enum imx_device_type {
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
+			      enum imx_device_type type);
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


--Sig_/=3CTC_Z4HKntYsD0qSXe6Gp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFsBCEACgkQADBpX4S8
ZncEeBAAni2sIsO33V6GZobm5hF3BfdGzBir1VAaKx63rBHNpBUY+XF/4mIObEBY
9AOaCiBrhseXRfgymsMs09VsMKoZLp1NvfV1PfefsUCu6AVB9mhcqlJF56p4cXrt
gAj9bH/+pfvAFU67bxfCDzLUCJQIBgVGaVOQilpmH87I8tAohfBCOdtZkFnWIrtd
BZfz7nYAh/QuCmwNAZC7+mX8YIPVA7+JyVRnDgKLni9Dm9yyFtyNdjZz+BBrHLU3
q33jBdxGBCrzoN8uV3PQQfs3cBXFDeoA5kz/UbQznJYHAJeOr1dNmlchK6B2ZzzK
9wulQ/6bOpA14HHbIfyIFJYhfy5NWSbGvU74QcKxQLI9HJPp3hTwYcRQR8SgNiZk
phbIJBvXDPwI9M5R6O2XbA4m4hGgU41paUAqZiM5zV8fsK0f4S/uPnx6nZrEaNkY
RfUaCIYpOFt0eQInLigarUDEPm+K8t7O+afd8IcotnmxsVGApvfP5OooRkS12SOS
NqtRlSs3MwwhfcnRlmuw/T/YpxuiIUwQPidE4kEg0zqGw0Y0VVEwWasvbRdTYpnP
MpZeY6g9BTj+7xT+s6s4QR6qXGV0DrTN09EoEWVWpYiNaO/iIq3Sj81Mm+Gp77pV
ntrjB3rLHWFcI086+01oYwn7UmkPMUPH29haVJ8s6MOxtS2CxY8=
=+cL7
-----END PGP SIGNATURE-----

--Sig_/=3CTC_Z4HKntYsD0qSXe6Gp--
