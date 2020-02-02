Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C68D14FE2A
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2020 16:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgBBPuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Feb 2020 10:50:46 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:12946 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgBBPuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Feb 2020 10:50:46 -0500
Date:   Sun, 02 Feb 2020 15:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1580658642;
        bh=JGfmEE34wwCHJbRehi9mkBdjd8a9QxVtXocWsQWMo1I=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=HtaeTKt4nNPP9Q6S6kU5kFqfPmE8nrkMAFD+0E1QAFF0mDno7NOb/Z7MyERDihzpE
         aKBNR07Zq/g2PZ2a/tCA6z5F6BwXuDrfqN4zWKke9yNJKGf5sSaWTMd8InU6aUXuuB
         8r+6FNrscLXUwHRl3UArQezU+X0cZjdiMDU0uLcM=
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
Subject: [PATCH 1/3] media: vimc: Support multiple buscodes for each pixelformat
Message-ID: <20200202155019.1029993-2-nfraprado@protonmail.com>
In-Reply-To: <20200202155019.1029993-1-nfraprado@protonmail.com>
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
Feedback-ID: cwTKJQq-dqva77NrgNeIaWzOvcDQqfI9VSy7DoyJdvgY6-nEE7fD-E-3GiKFHexW4OBWbzutmMZN6q4SflMDRw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,BAYES_05,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM
        shortcircuit=no autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change vimc_pix_map_list to allow multiple media bus codes to map to the
same pixelformat, making it possible to add media bus codes for which
there are no pixelformat.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 drivers/media/platform/vimc/vimc-common.c | 68 ++++++++++++++---------
 drivers/media/platform/vimc/vimc-common.h |  9 ++-
 drivers/media/platform/vimc/vimc-scaler.c | 10 +++-
 drivers/media/platform/vimc/vimc-sensor.c |  6 +-
 4 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/plat=
form/vimc/vimc-common.c
index 16ce9f3b7c75..55797e5ab2b1 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -19,19 +19,19 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* RGB formats */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_BGR888_1X24,
+=09=09.code =3D {MEDIA_BUS_FMT_BGR888_1X24},
 =09=09.pixelformat =3D V4L2_PIX_FMT_BGR24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_RGB888_1X24,
+=09=09.code =3D {MEDIA_BUS_FMT_RGB888_1X24},
 =09=09.pixelformat =3D V4L2_PIX_FMT_RGB24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_ARGB8888_1X32,
+=09=09.code =3D {MEDIA_BUS_FMT_ARGB8888_1X32},
 =09=09.pixelformat =3D V4L2_PIX_FMT_ARGB32,
 =09=09.bpp =3D 4,
 =09=09.bayer =3D false,
@@ -39,49 +39,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* Bayer formats */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SBGGR8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SGBRG8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SGRBG8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SRGGB8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
+=09=09.code =3D {MEDIA_BUS_FMT_SBGGR10_1X10},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
+=09=09.code =3D {MEDIA_BUS_FMT_SGBRG10_1X10},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
+=09=09.code =3D {MEDIA_BUS_FMT_SGRBG10_1X10},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
+=09=09.code =3D {MEDIA_BUS_FMT_SRGGB10_1X10},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
@@ -89,25 +89,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* 10bit raw bayer a-law compressed to 8 bits */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
@@ -115,49 +115,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* 10bit raw bayer DPCM compressed to 8 bits */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
+=09=09.code =3D {MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
+=09=09.code =3D {MEDIA_BUS_FMT_SBGGR12_1X12},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
+=09=09.code =3D {MEDIA_BUS_FMT_SGBRG12_1X12},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
+=09=09.code =3D {MEDIA_BUS_FMT_SGRBG12_1X12},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
+=09=09.code =3D {MEDIA_BUS_FMT_SRGGB12_1X12},
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
@@ -182,13 +182,29 @@ const struct vimc_pix_map *vimc_pix_map_by_index(unsi=
gned int i)
 =09return &vimc_pix_map_list[i];
 }
=20
+const u32 vimc_mbus_code_by_index(unsigned int i)
+{
+=09unsigned int j, k;
+
+=09for (j =3D 0; j < ARRAY_SIZE(vimc_pix_map_list); j++) {
+=09=09for (k =3D 0; vimc_pix_map_list[j].code[k]; k++) {
+=09=09=09if (!i)
+=09=09=09=09return vimc_pix_map_list[j].code[k];
+=09=09=09i--;
+=09=09}
+=09}
+=09return 0;
+}
+
 const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
 {
-=09unsigned int i;
+=09unsigned int i, j;
=20
 =09for (i =3D 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
-=09=09if (vimc_pix_map_list[i].code =3D=3D code)
-=09=09=09return &vimc_pix_map_list[i];
+=09=09for (j =3D 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j++) {
+=09=09=09if (vimc_pix_map_list[i].code[j] =3D=3D code)
+=09=09=09=09return &vimc_pix_map_list[i];
+=09=09}
 =09}
 =09return NULL;
 }
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/plat=
form/vimc/vimc-common.h
index 87eb8259c2a8..132a5889f1ea 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -69,7 +69,7 @@ do {=09=09=09=09=09=09=09=09=09\
  * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
  */
 struct vimc_pix_map {
-=09unsigned int code;
+=09unsigned int code[3];
 =09unsigned int bpp;
 =09u32 pixelformat;
 =09bool bayer;
@@ -171,6 +171,13 @@ void vimc_sen_rm(struct vimc_device *vimc, struct vimc=
_ent_device *ved);
  */
 const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
=20
+/**
+ * vimc_mbus_code_by_index - get mbus code by its index
+ *
+ * @i:=09=09=09index of the mbus code in vimc_pix_map_list
+ */
+const u32 vimc_mbus_code_by_index(unsigned int i);
+
 /**
  * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
  *
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/plat=
form/vimc/vimc-scaler.c
index e2e551bc3ded..d2ba0a2cfcc4 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -110,13 +110,19 @@ static int vimc_sca_enum_mbus_code(struct v4l2_subdev=
 *sd,
 =09=09=09=09   struct v4l2_subdev_pad_config *cfg,
 =09=09=09=09   struct v4l2_subdev_mbus_code_enum *code)
 {
-=09const struct vimc_pix_map *vpix =3D vimc_pix_map_by_index(code->index);
+=09const u32 mbus_code =3D vimc_mbus_code_by_index(code->index);
+=09const struct vimc_pix_map *vpix;
+
+=09if (!mbus_code)
+=09=09return -EINVAL;
+
+=09vpix =3D vimc_pix_map_by_code(mbus_code);
=20
 =09/* We don't support bayer format */
 =09if (!vpix || vpix->bayer)
 =09=09return -EINVAL;
=20
-=09code->code =3D vpix->code;
+=09code->code =3D mbus_code;
=20
 =09return 0;
 }
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/plat=
form/vimc/vimc-sensor.c
index 32380f504591..9f4dd7fee9ab 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -52,12 +52,12 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subdev *=
sd,
 =09=09=09=09   struct v4l2_subdev_pad_config *cfg,
 =09=09=09=09   struct v4l2_subdev_mbus_code_enum *code)
 {
-=09const struct vimc_pix_map *vpix =3D vimc_pix_map_by_index(code->index);
+=09const u32 mbus_code =3D vimc_mbus_code_by_index(code->index);
=20
-=09if (!vpix)
+=09if (!mbus_code)
 =09=09return -EINVAL;
=20
-=09code->code =3D vpix->code;
+=09code->code =3D mbus_code;
=20
 =09return 0;
 }
--=20
2.25.0


