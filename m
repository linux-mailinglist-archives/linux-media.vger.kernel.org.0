Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D620F14FE2D
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2020 16:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgBBPu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Feb 2020 10:50:59 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:22736 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgBBPu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Feb 2020 10:50:59 -0500
Date:   Sun, 02 Feb 2020 15:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1580658657;
        bh=6kUBFxuC2rO7/kfngE/XoXma3JcXpxCqXT3zxI0Rd0Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=q0CxtXNIZLgcY7UFWJbjtll1UPkYMV+czY3JTpRMle7TMfUupVBspGV7O4E1nLzOE
         O8Q91Vg0KwNBHIKvDjgiqNZUU5FjwhogCz2uJGSqkL/idXSAM9aEfdnr+BR69esiF/
         0BUBrP91sn3t/n7RjmlqE52SGAms5zXAXuD0MI68=
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH 3/3] media: vimc: deb: Add support for GBR and BGR bus formats on source pad
Message-ID: <20200202155019.1029993-4-nfraprado@protonmail.com>
In-Reply-To: <20200202155019.1029993-1-nfraprado@protonmail.com>
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
Feedback-ID: cwTKJQq-dqva77NrgNeIaWzOvcDQqfI9VSy7DoyJdvgY6-nEE7fD-E-3GiKFHexW4OBWbzutmMZN6q4SflMDRw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for GBR and BGR media bus formats for the source pad of
debayer subdevices.

Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 drivers/media/platform/vimc/vimc-debayer.c | 53 +++++++++++++++++-----
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/pla=
tform/vimc/vimc-debayer.c
index 5d1b67d684bb..463cafbe107e 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -51,6 +51,11 @@ static const struct v4l2_mbus_framefmt sink_fmt_default =
=3D {
 =09.colorspace =3D V4L2_COLORSPACE_DEFAULT,
 };
=20
+static const u32 src_rgb_codes[] =3D {
+=09MEDIA_BUS_FMT_BGR888_1X24,
+=09MEDIA_BUS_FMT_RGB888_1X24,
+=09MEDIA_BUS_FMT_GBR888_1X24};
+
 static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] =3D {
 =09{
 =09=09.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -148,14 +153,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev=
 *sd,
 =09=09=09=09   struct v4l2_subdev_pad_config *cfg,
 =09=09=09=09   struct v4l2_subdev_mbus_code_enum *code)
 {
-=09/* We only support one format for source pads */
 =09if (VIMC_IS_SRC(code->pad)) {
-=09=09struct vimc_deb_device *vdeb =3D v4l2_get_subdevdata(sd);
-
-=09=09if (code->index)
+=09=09if (code->index >=3D ARRAY_SIZE(src_rgb_codes))
 =09=09=09return -EINVAL;
=20
-=09=09code->code =3D vdeb->src_code;
+=09=09code->code =3D src_rgb_codes[code->index];
 =09} else {
 =09=09if (code->index >=3D ARRAY_SIZE(vimc_deb_pix_map_list))
 =09=09=09return -EINVAL;
@@ -170,7 +172,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev =
*sd,
 =09=09=09=09    struct v4l2_subdev_pad_config *cfg,
 =09=09=09=09    struct v4l2_subdev_frame_size_enum *fse)
 {
-=09struct vimc_deb_device *vdeb =3D v4l2_get_subdevdata(sd);
+=09int i;
=20
 =09if (fse->index)
 =09=09return -EINVAL;
@@ -181,8 +183,13 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev=
 *sd,
=20
 =09=09if (!vpix)
 =09=09=09return -EINVAL;
-=09} else if (fse->code !=3D vdeb->src_code) {
-=09=09return -EINVAL;
+=09} else {
+=09=09for (i =3D 0; i < ARRAY_SIZE(src_rgb_codes); i++) {
+=09=09=09if (src_rgb_codes[i] =3D=3D fse->code)
+=09=09=09=09break;
+=09=09}
+=09=09if (i =3D=3D ARRAY_SIZE(src_rgb_codes))
+=09=09=09return -EINVAL;
 =09}
=20
 =09fse->min_width =3D VIMC_FRAME_MIN_WIDTH;
@@ -237,6 +244,8 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 {
 =09struct vimc_deb_device *vdeb =3D v4l2_get_subdevdata(sd);
 =09struct v4l2_mbus_framefmt *sink_fmt;
+=09unsigned int i;
+=09u32 *src_code;
=20
 =09if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
 =09=09/* Do not change the format while stream is on */
@@ -244,8 +253,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 =09=09=09return -EBUSY;
=20
 =09=09sink_fmt =3D &vdeb->sink_fmt;
+=09=09src_code =3D &vdeb->src_code;
 =09} else {
 =09=09sink_fmt =3D v4l2_subdev_get_try_format(sd, cfg, 0);
+=09=09src_code =3D &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
 =09}
=20
 =09/*
@@ -253,9 +264,17 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 =09 * it is propagated from the sink
 =09 */
 =09if (VIMC_IS_SRC(fmt->pad)) {
+=09=09u32 code =3D fmt->format.code;
+
 =09=09fmt->format =3D *sink_fmt;
-=09=09/* TODO: Add support for other formats */
-=09=09fmt->format.code =3D vdeb->src_code;
+
+=09=09for (i =3D 0; i < ARRAY_SIZE(src_rgb_codes); i++) {
+=09=09=09if (src_rgb_codes[i] =3D=3D code) {
+=09=09=09=09*src_code =3D src_rgb_codes[i];
+=09=09=09=09break;
+=09=09=09}
+=09=09}
+=09=09fmt->format.code =3D *src_code;
 =09} else {
 =09=09/* Set the new format in the sink pad */
 =09=09vimc_deb_adjust_sink_fmt(&fmt->format);
@@ -291,11 +310,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(str=
uct vimc_deb_device *vdeb,
 =09=09=09=09=09=09  unsigned int col,
 =09=09=09=09=09=09  unsigned int rgb[3])
 {
+=09const struct vimc_pix_map *vpix;
 =09unsigned int i, index;
=20
+=09vpix =3D vimc_pix_map_by_code(vdeb->src_code);
 =09index =3D VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
-=09for (i =3D 0; i < 3; i++)
-=09=09vdeb->src_frame[index + i] =3D rgb[i];
+=09for (i =3D 0; i < 3; i++) {
+=09=09switch (vpix->pixelformat) {
+=09=09case V4L2_PIX_FMT_RGB24:
+=09=09=09vdeb->src_frame[index + i] =3D rgb[i];
+=09=09=09break;
+=09=09case V4L2_PIX_FMT_BGR24:
+=09=09=09vdeb->src_frame[index + i] =3D rgb[2-i];
+=09=09=09break;
+=09=09}
+=09}
 }
=20
 static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
--=20
2.25.0


