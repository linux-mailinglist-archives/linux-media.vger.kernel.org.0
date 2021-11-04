Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E16445262
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhKDLqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:46:46 -0400
Received: from comms.puri.sm ([159.203.221.185]:37028 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKDLqq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 07:46:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 8EEF6DFE31;
        Thu,  4 Nov 2021 04:44:08 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id K-Bxxti0XGVE; Thu,  4 Nov 2021 04:44:07 -0700 (PDT)
Date:   Thu, 4 Nov 2021 12:43:53 +0100
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
Subject: [PATCH v4 4/5] media: imx: Use dedicated format handler for i.MX7/8
Message-ID: <20211104113631.206899-4-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
References: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pS5pEzxMVfzfuB+hLohE1qn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/pS5pEzxMVfzfuB+hLohE1qn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This splits out a format handler which takes into account
the capabilities of the i.MX7/8 video device,
as opposed to the default handler compatible with both i.MX5/6 and i.MX7/8.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-media-utils.c | 58 +++++++++++++++++++--
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index 8b5c6bcfd4fa..c0a84c79947e 100644
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
-				  enum imx_media_device_type type)
+static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					   const struct v4l2_mbus_framefmt *mbus,
+					   const struct imx_media_pixfmt *cc)
 {
 	u32 width;
 	u32 stride;
@@ -568,6 +567,57 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_form=
at *pix,
=20
 	return 0;
 }
+
+static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					   const struct v4l2_mbus_framefmt *mbus,
+					   const struct imx_media_pixfmt *cc)
+{
+	int ret;
+
+	if (!cc)
+		cc =3D imx_media_find_mbus_format(mbus->code, PIXFMT_SEL_ANY);
+
+	if (!cc)
+		return -EINVAL;
+	/*
+	 * The hardware can handle line lengths divisible by 4 pixels
+	 * as long as the whole buffer size ends up divisible by 8 bytes.
+	 * If not, use the value of 8 pixels recommended in the datasheet.
+	 */
+	ret =3D v4l2_fill_pixfmt(pix, cc->fourcc,
+			       round_up(mbus->width, 4), mbus->height);
+	if (ret)
+		return ret;
+
+	/* Only 8bits-per-pixel formats may need to get aligned to 8 pixels,
+	 * because both 10-bit and 16-bit pixels occupy 2 bytes.
+	 * In those, 4-pixel aligmnent is equal to 8-byte alignment.
+	 */
+	if (pix->sizeimage % 8 !=3D 0)
+		ret =3D v4l2_fill_pixfmt(pix, cc->fourcc,
+				       round_up(mbus->width, 8), mbus->height);
+
+	pix->colorspace =3D mbus->colorspace;
+	pix->xfer_func =3D mbus->xfer_func;
+	pix->ycbcr_enc =3D mbus->ycbcr_enc;
+	pix->quantization =3D mbus->quantization;
+	pix->field =3D mbus->field;
+
+	return ret;
+}
+
+int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+				  const struct v4l2_mbus_framefmt *mbus,
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_media_device_type type) {
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


--Sig_/pS5pEzxMVfzfuB+hLohE1qn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDx3kACgkQADBpX4S8
Znd3GhAAmuWw0NyRJHKAKl/r3CNVBq+XmQpSeY/6/4vQpU+DMOQLvZiUQ3HEklBb
QM9Bon9o316LFNOfPR8uERyiYHu7e9OfOuDiQHNBeqiuu5sbMfr1nDCO5QR8pZB5
Nduo7e+ZAJLbcNG44K0oub4xPDFuXX5HRCHkjbwJUZGUMWGFQBaWAtHnqYnkc9cS
ESeW1L/tyJIgtB+L3emK0NRwFb1lEGPdD3AuBPvxKXOTAYi7YMc/134VTHguu3s2
Zx35eZEcEYcdYVa5GIwddMBI1BmYEC+2rYD8pDZIfJH3dD5scaxz7tCkxmq72UUo
ozh0aj/hIxR/c87JFt0QGi+zbZjN3hG6g5PUOBkfL5u3abkp4LYx0cm3bFwBCXrd
sr044vo18IqqX/QiUYIvK8QXlBq8hw5PlRCXIw7SZWiJ0SQTNz3u36uZUOgkWA7t
MU2xWP0ZjSP9toTGlqOjcRzrzverpWDz5L5NlcpJhWv7oDmx/sf1liP4y3QJW90m
RBYRWWHOQQrYVcPoRoLkvUUQmUIW3cWkKE80Cgc2hjfvrfouC595pNp+rxkQHvgk
YysUNd07zeUtIEg68VP64gxaOepu4eDQN0/ro9hmE9Uh73tP4N3duiN1fF5HxBsf
jSZ/aYciqPZDY5eBrkfpH4Y4J/0ENsZWXX0aGsoaSRZD9buJCZI=
=2zgq
-----END PGP SIGNATURE-----

--Sig_/pS5pEzxMVfzfuB+hLohE1qn--
