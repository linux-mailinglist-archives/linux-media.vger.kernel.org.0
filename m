Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3251C12A6
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 15:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgEANLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 09:11:31 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:18809 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgEANLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 09:11:31 -0400
Date:   Fri, 01 May 2020 13:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1588338688;
        bh=PIB2K8Yw5EwBdrfXSF6xtVui4Zg441ssTDvwGoGwAgM=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=kPa33wfn58w6p364UM48VkKQQ6SYLz1lmfECsbEfxL57UeuulInj2Vv+1gjWJ+HRc
         XIcPXDKDlc4tR5CmnJyhUBpH0fQKdiVOlnZMku8J/xoKwp3hpWurPsvXlYNBSbXozz
         C7xWInrEwgIcaQBOZ7//AVbd8iZeUbiVZ3jyjpLU=
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
Subject: [PATCH v4 3/3] media: vimc: deb: Add support for {RGB,BGR,GBR}888 bus formats on source pad
Message-ID: <20200501131045.1849315-4-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
the source pad of debayer subdevices.

Acked-by: Helen Koike <helen.koike@collabora.com>
Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---

Changes in v4:
- Rename vimc_deb_set_rgb_mbus_fmt_rgb888_1x24() to vimc_deb_process_rgb_fr=
ame()

Changes in v3:
- Rename vimc_deb_is_src_code_invalid() to vimc_deb_src_code_is_valid()
- Change vimc_deb_src_code_is_valid() to return bool

Changes in v2:
- Change commit message to reflect v2 changes
- Rename variables
- Fix array formatting
- Add vimc_deb_is_src_code_valid function
- Add other BGR888 and RGB888 formats to debayer source pad supported
  formats

 .../media/test-drivers/vimc/vimc-debayer.c    | 71 ++++++++++++++-----
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media=
/test-drivers/vimc/vimc-debayer.c
index d10aee9f84c4..b13530017364 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_default =
=3D {
 =09.colorspace =3D V4L2_COLORSPACE_DEFAULT,
 };
=20
+static const u32 vimc_deb_src_mbus_codes[] =3D {
+=09MEDIA_BUS_FMT_GBR888_1X24,
+=09MEDIA_BUS_FMT_BGR888_1X24,
+=09MEDIA_BUS_FMT_BGR888_3X8,
+=09MEDIA_BUS_FMT_RGB888_1X24,
+=09MEDIA_BUS_FMT_RGB888_2X12_BE,
+=09MEDIA_BUS_FMT_RGB888_2X12_LE,
+=09MEDIA_BUS_FMT_RGB888_3X8,
+=09MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+=09MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+=09MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+};
+
 static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] =3D {
 =09{
 =09=09.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_pix_map=
_by_code(u32 code)
 =09return NULL;
 }
=20
+static bool vimc_deb_src_code_is_valid(u32 code)
+{
+=09unsigned int i;
+
+=09for (i =3D 0; i < ARRAY_SIZE(vimc_deb_src_mbus_codes); i++)
+=09=09if (vimc_deb_src_mbus_codes[i] =3D=3D code)
+=09=09=09return true;
+
+=09return false;
+}
+
 static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
 =09=09=09     struct v4l2_subdev_pad_config *cfg)
 {
@@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev=
 *sd,
 =09=09=09=09   struct v4l2_subdev_pad_config *cfg,
 =09=09=09=09   struct v4l2_subdev_mbus_code_enum *code)
 {
-=09/* We only support one format for source pads */
 =09if (VIMC_IS_SRC(code->pad)) {
-=09=09struct vimc_deb_device *vdeb =3D v4l2_get_subdevdata(sd);
-
-=09=09if (code->index)
+=09=09if (code->index >=3D ARRAY_SIZE(vimc_deb_src_mbus_codes))
 =09=09=09return -EINVAL;
=20
-=09=09code->code =3D vdeb->src_code;
+=09=09code->code =3D vimc_deb_src_mbus_codes[code->index];
 =09} else {
 =09=09if (code->index >=3D ARRAY_SIZE(vimc_deb_pix_map_list))
 =09=09=09return -EINVAL;
@@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev =
*sd,
 =09=09=09=09    struct v4l2_subdev_pad_config *cfg,
 =09=09=09=09    struct v4l2_subdev_frame_size_enum *fse)
 {
-=09struct vimc_deb_device *vdeb =3D v4l2_get_subdevdata(sd);
-
 =09if (fse->index)
 =09=09return -EINVAL;
=20
@@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev =
*sd,
=20
 =09=09if (!vpix)
 =09=09=09return -EINVAL;
-=09} else if (fse->code !=3D vdeb->src_code) {
+=09} else if (!vimc_deb_src_code_is_valid(fse->code)) {
 =09=09return -EINVAL;
 =09}
=20
@@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 {
 =09struct vimc_deb_device *vdeb =3D v4l2_get_subdevdata(sd);
 =09struct v4l2_mbus_framefmt *sink_fmt;
+=09u32 *src_code;
=20
 =09if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
 =09=09/* Do not change the format while stream is on */
@@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
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
@@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 =09 * it is propagated from the sink
 =09 */
 =09if (VIMC_IS_SRC(fmt->pad)) {
+=09=09u32 code =3D fmt->format.code;
+
 =09=09fmt->format =3D *sink_fmt;
-=09=09/* TODO: Add support for other formats */
-=09=09fmt->format.code =3D vdeb->src_code;
+
+=09=09if (vimc_deb_src_code_is_valid(code))
+=09=09=09*src_code =3D code;
+
+=09=09fmt->format.code =3D *src_code;
 =09} else {
 =09=09/* Set the new format in the sink pad */
 =09=09vimc_deb_adjust_sink_fmt(&fmt->format);
@@ -286,16 +313,26 @@ static const struct v4l2_subdev_pad_ops vimc_deb_pad_=
ops =3D {
 =09.set_fmt=09=09=3D vimc_deb_set_fmt,
 };
=20
-static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *=
vdeb,
-=09=09=09=09=09=09  unsigned int lin,
-=09=09=09=09=09=09  unsigned int col,
-=09=09=09=09=09=09  unsigned int rgb[3])
+static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
+=09=09=09=09       unsigned int lin,
+=09=09=09=09       unsigned int col,
+=09=09=09=09       unsigned int rgb[3])
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
@@ -568,7 +605,7 @@ static struct vimc_ent_device *vimc_deb_add(struct vimc=
_device *vimc,
 =09 * for the code
 =09 */
 =09vdeb->src_code =3D MEDIA_BUS_FMT_RGB888_1X24;
-=09vdeb->set_rgb_src =3D vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
+=09vdeb->set_rgb_src =3D vimc_deb_process_rgb_frame;
=20
 =09return &vdeb->ved;
=20
--=20
2.26.2


