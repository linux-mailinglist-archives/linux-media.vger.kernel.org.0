Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E95943083E
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 13:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245428AbhJQLKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 07:10:50 -0400
Received: from comms.puri.sm ([159.203.221.185]:53474 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245421AbhJQLKt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 07:10:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 19645DFA69;
        Sun, 17 Oct 2021 04:08:10 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xdWr8zFnNGxh; Sun, 17 Oct 2021 04:08:09 -0700 (PDT)
Date:   Sun, 17 Oct 2021 13:08:02 +0200
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
Subject: [PATCHv2 1/4] media: imx: Remove unused functions
Message-ID: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IeWBxaTwi59gY3NqHrUWmfD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/IeWBxaTwi59gY3NqHrUWmfD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Neither imx_media_mbus_fmt_to_ipu_image nor imx_media_ipu_image_to_mbus_fmt
were used anywhere.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
Hello,

This patch series attempts to separate image format handling between device=
s in the i.MX5/6 and i.MX7/8 families.

The first patch in the series implements the suggestion I received from Phi=
lipp Zabel as feedback to the previous series.

The last 3 could in principle be submitted as a single patch, but I opted f=
or minimal changes, for reviewing clarity.

The last patch is the core of the change, where i.MX5/6 uses the old code p=
ath, and i.MX7/8 uses a slightly redacted copy of it. I have fairly limited=
 experience with the parameters that go into determining the format, so I o=
pted only to adjust the part I have tested: the rounding.

Regards,
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


--Sig_/IeWBxaTwi59gY3NqHrUWmfD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmFsBBIACgkQADBpX4S8
ZncOpBAAilkWS7552zCmzw6XFP9OCOcjyAcmet2jOnvtWLRzGtLLZJb1RlsfqIXI
Cmty13PyOnHF6Y+pfs8gyB7LtIuICgDkJYDqOGF78eSmLu+0icX9zzEOGef9+ynN
UmysNRJ/Z10KQbg/hf11oVPREV8n5x6/jXEFVF1KAEnr/hASb/ox6OTw6zEpKCE+
jZVpg+YhX//EwNayLEl3R9FGvyVuwarGu0H3Trqb+EktzMVZM9X849snMcZXuabY
oh6Yo8u605H/Zj9E15rqT6U7Rdifn+qoR89Gt0/LBGhxOXEadGXQkNrHawbNpwGU
oUtnGYHYMCPHLOQ3Z3TFxjs0ldlmXtKQ0zCENfQG97p026J9AIwkw84iBXafi3Xr
pfrHdpl59mX6yWZ7R0psgC+mi66FgSbktbunVj1xCro1uV1Df8Ccv05usSMKKtoK
Quq10hwGBvVq+lCrgHk8+yFA4h9rPDemearxqR8VneehBQna5tEzmI7r7dpFc51G
zHFrg483eObfMjcxZGROxvop9QjH22QC45aQ6vNGaZ1Jki+dYxiiWKJk+IcEvSCj
CmWZgcYWfSdchZVCzJSw1APUq/Wr0kRwR5DsZOJI88XNvJbFuPlpKtO7kEcFoRtz
q7f4qFGX6BQEto58WiiZloGzlBJDcQgA12wZvNfA9rF83hD0160=
=Q4YH
-----END PGP SIGNATURE-----

--Sig_/IeWBxaTwi59gY3NqHrUWmfD--
