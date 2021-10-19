Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795334335B6
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbhJSMRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:17:05 -0400
Received: from comms.puri.sm ([159.203.221.185]:50388 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230129AbhJSMRC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:17:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id BD63BDF8A3;
        Tue, 19 Oct 2021 05:14:19 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id woGARjsew7sL; Tue, 19 Oct 2021 05:14:19 -0700 (PDT)
Date:   Tue, 19 Oct 2021 14:14:12 +0200
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
Subject: [PATCHv3 4/4] media: imx: Use dedicated format handler for i.MX7/8
Message-ID: <20211019120047.827915-4-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
References: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OrfD4L/d0u/BfKgT0T7LQaI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/OrfD4L/d0u/BfKgT0T7LQaI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This splits out a format handler which takes into account
the capabilities of the i.MX7/8 video device,
as opposed to the default handler compatible with both i.MX5/6 and i.MX7/8.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-media-utils.c | 56 +++++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index 8b5c6bcfd4fa..1ff7ec4c877a 100644
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
@@ -568,6 +567,55 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_form=
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


--Sig_/OrfD4L/d0u/BfKgT0T7LQaI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFutpQACgkQADBpX4S8
Znedzw//bzwh5zl4ZO7nmbF0ECF891A7VSwTcttePok80enVZxZqQhpYKydrNgEI
BldE0MyfcP5oJ0RHLqiEDDDi/e+wkS2p2bddmvzGHCXjm3ITCd0+Hfu3LOY6DJsC
qIbNYz3i9NGOkbfcxj6zW3Fq8+U/XouOTO+zwpqOKxCHQbLa3FWvkdhfFngah0gb
oIul+P43EGoZcrxL37oMvYXIvVOcIIE29m2ThVWQAdI2iTDBvFq7iHxZ37qF712Y
7PgDt0E/U8upIQtO/UFqpluI1yZe7byNc6cwR5CHYupw0fc/VL040RYAS3HlbVV1
DC9p8RPSML5x/tQMsm+LblF0izwlZg5I5o/s+ZOoQySqccNWJg3lADVrZTLexmHM
MavzC8UiXsW6iI+ByZVvxLHVOvhlcqQcYqoAsMj9z/XEqmMuaRV8MB3Z1bkd1VEk
1/okpyeRZRzzcBT6Dd1fzfKKWVd8YVWneJgdbjZFOjpIh7ZEVVnrUAXWKjNOIJyW
JW1Q85POxP3LfIRJk30WgOyAmpht5q3B2uSZEHVUC/VzgPXNMY+VqQSd6hl0q6uB
uwxouUd73ucpf/CrnT/sgHhnikB0OXnjGlWOfLYkbrkcZAHnPgRbAif7q12TXC88
xEumN1x95efo6q6gDxf50SEzX651fDSPCGsRE4lueofS44MbkGs=
=tgUC
-----END PGP SIGNATURE-----

--Sig_/OrfD4L/d0u/BfKgT0T7LQaI--
