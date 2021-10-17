Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA2E430840
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 13:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245425AbhJQLLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 07:11:24 -0400
Received: from comms.puri.sm ([159.203.221.185]:54070 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhJQLLX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 07:11:23 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 88E56DFAAA;
        Sun, 17 Oct 2021 04:08:44 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d2kKGqEIxJ38; Sun, 17 Oct 2021 04:08:43 -0700 (PDT)
Date:   Sun, 17 Oct 2021 13:08:37 +0200
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
Subject: [PATCHv2 4/4] media: imx: Use dedicated format handler for i.MX7/8
Message-ID: <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UChzlzgPs98xJxK1DilnSN2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/UChzlzgPs98xJxK1DilnSN2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This splits out a format handler which takes into account
the capabilities of the i.MX7/8 video device,
as opposed to the default handler compatible with both i.MX5/6 and i.MX7/8.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-media-utils.c | 78 +++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index e124dd722107..938db2e2ddb1 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -516,10 +516,9 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framef=
mt *tryfmt,
 }
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
=20
-int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc,
-				  enum imx_device_type type)
+static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					   const struct v4l2_mbus_framefmt *mbus,
+					   const struct imx_media_pixfmt *cc)
 {
 	u32 width;
 	u32 stride;
@@ -568,6 +567,77 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_form=
at *pix,
=20
 	return 0;
 }
+
+static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					   const struct v4l2_mbus_framefmt *mbus,
+					   const struct imx_media_pixfmt *cc)
+{
+	u32 width;
+	u32 stride;
+	u8 divisor;
+
+	if (!cc) {
+		cc =3D imx_media_find_ipu_format(mbus->code,
+					       PIXFMT_SEL_YUV_RGB);
+		if (!cc)
+			cc =3D imx_media_find_mbus_format(mbus->code,
+							PIXFMT_SEL_ANY);
+		if (!cc)
+			return -EINVAL;
+	}
+
+	/*
+	 * TODO: the IPU currently does not support the AYUV32 format,
+	 * so until it does convert to a supported YUV format.
+	 */
+	if (cc->ipufmt && cc->cs =3D=3D IPUV3_COLORSPACE_YUV) {
+		u32 code;
+
+		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
+		cc =3D imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
+	}
+
+	/*
+	 * The hardware can handle line lengths divisible by 4 bytes,
+	 * as long as the number of lines is even.
+	 * Otherwise, use the value of 8 bytes recommended in the datasheet.
+	 */
+	divisor =3D 4 << (mbus->height % 2);
+
+	width =3D round_up(mbus->width, divisor);
+
+	if (cc->planar)
+		stride =3D round_up(width, 16);
+	else
+		stride =3D round_up((width * cc->bpp) >> 3, divisor);
+
+	pix->width =3D width;
+	pix->height =3D mbus->height;
+	pix->pixelformat =3D cc->fourcc;
+	pix->colorspace =3D mbus->colorspace;
+	pix->xfer_func =3D mbus->xfer_func;
+	pix->ycbcr_enc =3D mbus->ycbcr_enc;
+	pix->quantization =3D mbus->quantization;
+	pix->field =3D mbus->field;
+	pix->bytesperline =3D stride;
+	pix->sizeimage =3D cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
+			 stride * pix->height;
+
+	return 0;
+}
+
+int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+				  const struct v4l2_mbus_framefmt *mbus,
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_device_type type) {
+	switch (type) {
+	case DEVICE_TYPE_IMX56:
+		return imx56_media_mbus_fmt_to_pix_fmt(pix, mbus, cc);
+	case DEVICE_TYPE_IMX78:
+		return imx78_media_mbus_fmt_to_pix_fmt(pix, mbus, cc);
+	}
+	return -EINVAL;
+}
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
=20
 void imx_media_free_dma_buf(struct device *dev,
--=20
2.31.1


--Sig_/UChzlzgPs98xJxK1DilnSN2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFsBDUACgkQADBpX4S8
Znd5lw/+IqabIiFF8Lz73MM9TgWmsrSufcFzhPHP1cFb/+I6o1hqNbn6XdPKexKR
I0vGqlHHNV2eFOksDZThEHlKZihp8ZS3PEt+WISJGVjY636uKgQkZ/DYZT5AjV+P
Cdf6mh4x1+Ma/QV1gtyQbAL/eLekP4LChUEq6vL3kRG1ZCRGpEWjyVf/qeKYWq45
si/324AOrvMm8/2bLjiY/SSsB0CIDAr6SwMSP2a6/kuNWbeOE1iCtlFRHsXPqZIH
rPxM8m3yVOjwQaakw1pt5VSNLdpmaXHPLzgEb+N6UAceFWogHgVihTA6ZmvLAo5s
VmwiySl3OPZAY4YFtQtys6vstQXsiWOiDoDkevCF4dM13qCAUjqsvHfk0uyQ35L7
bBF+q1I8FXzAxvwGiCixQeYwhGK6BGe9fjStd9G/GP/M4jHxMZ0rofIOIIVPqQGF
CqQBNksvX9E2TwHcnIkWWP22PdnJImz77Scb2pH+uzgiydtJLrNWkrR8dKLFdJnB
d39bvbxtab7QutBm4SsEvwweR+OnFwmmjcR3E34gnK9YrlaaDXY8EFD5sWkt5o4L
Wu3xTs5J6a0jdg3YBBk1QoPhXNf/pFW29kXYhHvqjiOj8/kOnuiaheO9//twM3FR
SNzUZ5Xk1/ut9E5zndrNyOTlCI/Y6Vks7uD6OzMlgstAqDBH64Q=
=dYEO
-----END PGP SIGNATURE-----

--Sig_/UChzlzgPs98xJxK1DilnSN2--
