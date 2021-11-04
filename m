Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72844445260
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhKDLpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:45:50 -0400
Received: from comms.puri.sm ([159.203.221.185]:36872 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKDLpt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 07:45:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id AE546DFE2F;
        Thu,  4 Nov 2021 04:43:11 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mES61NqjuTj8; Thu,  4 Nov 2021 04:43:11 -0700 (PDT)
Date:   Thu, 4 Nov 2021 12:41:53 +0100
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
Subject: [PATCH v4 1/5] media: imx: Remove unused functions
Message-ID: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FosWe/py5YeTF16MIhH8wU1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/FosWe/py5YeTF16MIhH8wU1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Neither imx_media_mbus_fmt_to_ipu_image nor imx_media_ipu_image_to_mbus_fmt
were used anywhere.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---

Hi,

Compared to v3, this patch series introduces the checks of imx_media_find_m=
bus_format return values in patch 4 and 5.

Cheers,
Dorota

 drivers/staging/media/imx/imx-media-utils.c | 42 ---------------------
 drivers/staging/media/imx/imx-media.h       |  4 --
 2 files changed, 46 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index 5128915a5d6f..afa96e05ea7f 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -569,48 +569,6 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_form=
at *pix,
 }
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
=20
-int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    const struct v4l2_mbus_framefmt *mbus)
-{
-	int ret;
-
-	memset(image, 0, sizeof(*image));
-
-	ret =3D imx_media_mbus_fmt_to_pix_fmt(&image->pix, mbus, NULL);
-	if (ret)
-		return ret;
-
-	image->rect.width =3D mbus->width;
-	image->rect.height =3D mbus->height;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
-
-int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    const struct ipu_image *image)
-{
-	const struct imx_media_pixfmt *fmt;
-
-	fmt =3D imx_media_find_pixel_format(image->pix.pixelformat,
-					  PIXFMT_SEL_ANY);
-	if (!fmt || !fmt->codes || !fmt->codes[0])
-		return -EINVAL;
-
-	memset(mbus, 0, sizeof(*mbus));
-	mbus->width =3D image->pix.width;
-	mbus->height =3D image->pix.height;
-	mbus->code =3D fmt->codes[0];
-	mbus->field =3D image->pix.field;
-	mbus->colorspace =3D image->pix.colorspace;
-	mbus->xfer_func =3D image->pix.xfer_func;
-	mbus->ycbcr_enc =3D image->pix.ycbcr_enc;
-	mbus->quantization =3D image->pix.quantization;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(imx_media_ipu_image_to_mbus_fmt);
-
 void imx_media_free_dma_buf(struct device *dev,
 			    struct imx_media_dma_buf *buf)
 {
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/=
imx/imx-media.h
index 492d9a64e704..d2a150aac6cd 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -199,10 +199,6 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framef=
mt *tryfmt,
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc);
-int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    const struct v4l2_mbus_framefmt *mbus);
-int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    const struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
--=20
2.31.1


--Sig_/FosWe/py5YeTF16MIhH8wU1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDxwEACgkQADBpX4S8
Znd5oQ/9HejktqulgSMWb/IIotetpDnUoWOCt8OLHAjOg9Cqtuf1rXtrezAATMNR
2MBpQSax2ajkQtl18pbpfWZvxpSVyU6o9Ntr/AZKUGzSH3spZTkivKn0P04+3lNN
GUoKVJa4bCmZCrQsBcQs88aibLV3L15ZrAuQw2qfe8geMQbwkQPMrRaKzxXeTU2s
igOmaxhEabV/iZJgTuDQHj5HSdjNEPzd46alpbB7DQxp+aU4fWPzpObV5YNuQgqC
Bh3ErPyKNn2tmspuZ56CnyZqYXqm/fTrwY4bQZ5EQ7aVuYzU88rf7FhE+uO+iIA0
2FNWSYqpCHCeUQLw5fsERGE/ukqnCmsSnDHsfnEKKqcQOabjDmwibs6GK904dshO
HTH8FZO5m7gkHFbwjuxNEbUuQ7NynhWXaU7r0RSHZHP6Angegf3UlBwHww2EHQ56
E49CqKJ1RhI0IE3rheLAJb/6SX1DhKIXUGwmHebP7W3LZyRtJ3LrHy0RCG1aV2oF
tNre+TbvwxZfwgo62cK2JtMIYZSn8ZkiiHX7tf5W4HxlXRvO1TvcaS64jjOtp4ts
V1AzHf2CRkug2Ip7boxZUbF+0kSms+UlmfuRHz9Xi3cMDdxe7VrDiC5FIHUK9tbt
UR8v8yQzmiFO6ghedJ+ARRwd8ZD1dDCmhGPpz4tyhoBYKjxDnGI=
=T6CZ
-----END PGP SIGNATURE-----

--Sig_/FosWe/py5YeTF16MIhH8wU1--
