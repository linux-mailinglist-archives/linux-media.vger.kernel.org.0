Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E50A4335B0
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbhJSMQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:16:37 -0400
Received: from comms.puri.sm ([159.203.221.185]:50172 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235524AbhJSMQS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:16:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id C756CDF854;
        Tue, 19 Oct 2021 05:13:35 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id u6hY7IWskrw3; Tue, 19 Oct 2021 05:13:35 -0700 (PDT)
Date:   Tue, 19 Oct 2021 14:13:22 +0200
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
Subject: [PATCHv3 1/4] media: imx: Remove unused functions
Message-ID: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zE61Nvhg4oWy18kcbGp8hJ/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/zE61Nvhg4oWy18kcbGp8hJ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Neither imx_media_mbus_fmt_to_ipu_image nor imx_media_ipu_image_to_mbus_fmt
were used anywhere.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
Hello,

In this revision, the big change is in the 4th patch, where I followed Phil=
ipp Zabel's suggestions for i.MX7/8. The biggest change comes from the use =
of `v4l2_fill_pixfmt` to fill out the pixel format. Thanks to that, I could=
 simplify the logic to select between 8-pixel- and 4-pixel-divisible line l=
engths. Thanks Philipp for pointing out this function, this is closer to wh=
at I originally hoped to do.

The use of `v4l2_fill_pixfmt` comes with the downside of breaking 10-bit Ba=
yer formats, or at least until my other series gets accepted (Subject: "med=
ia: Add 16-bit Bayer formats". Sorry, I don't have the message id.).

Regards,
Dorota Czaplejewicz


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


--Sig_/zE61Nvhg4oWy18kcbGp8hJ/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFutmIACgkQADBpX4S8
ZndV0g/+JN9tNswLpyPjd8h1b0p6RtIR7vg2TwWVv5VDhIJCbf2S0dOKlyFFwT15
SuJhXGrJsKo+NYcT6jbRe99UEjHU1duxGbQHue6+g1d7BmFMG87z+pb23RP8fIBH
t7tXEJ7HQ1gKKmQVctdQlB5Ey8D1tufikZWpH0+HLArzDzVUMf3QQFAN7Npmsosf
VKk6Yh9YuqqNs8gDGMjRFnrtUGUlG0+1BLAAfXj2DmDxnT/P9+B8u342bLFCUFTQ
GMdBOG+PHsIvjN5jajgr7Y1j6YZLQdeE1BlKG6aOhuPiQK4YjmaE69F+YH3FsJAz
q9LPa5+B9zmRU+hoanNUjb+5dgYGYT9XyilcytWNkavgIhEhf3irWGe0ufLMj6jb
qr2BlYgLcg5lY/WmBuer3H8wZGWo+GOt1my+KhhHyQVDNMacJm929c5QNczYKzAy
cTsxEbOuUA3iucBbxgeHPFTI5t5Z9EUqpfiMrxGz7r6nfd0TG8g4LIVkqpompDXN
0Fr8U0dRvdPr6rNTPYbbu+C2LvUUB99ix97vdmxJpZfItAVlh5meE24oFz/OZ6Un
KhslGjKdPbNvXB3Bbz+isrlUC8zgzkDlVHDGTunOHGJpg/+GZ3P+AkArmIjlX8zy
FukQaS0mTnkueQv59Rig74qz66IJVAc+NrbXAt+f8l4Ti+HflSI=
=Lsmm
-----END PGP SIGNATURE-----

--Sig_/zE61Nvhg4oWy18kcbGp8hJ/--
