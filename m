Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36341BB1CB
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 01:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgD0XDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 19:03:08 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:32562 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgD0XDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 19:03:07 -0400
Date:   Mon, 27 Apr 2020 23:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1588028582;
        bh=5KbX6fD2SAg2AAyWdY6oDFG4VKk9InqE+tSj8yPjgcc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=LSxcM9EWNNaWxr1u/D/wU7T5zM2Ylc3M8Y8LDAFTyPkW9nQmhO4d8V5K1s+j5CwcX
         IwFUj2hjS12FKYq8a669mDnmaBDfxsd/O0fPwNAqR+DJDNTLrRAxw+VlWrtRupG8Cr
         223wXZQXMxrE9qDGj21wquJY6aNEfTbpERq0WBwo=
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
Subject: [PATCH v3 1/3] media: vimc: Support multiple media bus codes for each pixelformat
Message-ID: <20200427230234.3114565-2-nfraprado@protonmail.com>
In-Reply-To: <20200427230234.3114565-1-nfraprado@protonmail.com>
References: <20200427230234.3114565-1-nfraprado@protonmail.com>
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

Change vimc_pix_map_list to allow multiple media bus codes to map to the
same pixelformat, making it possible to add media bus codes for which
there are no pixelformat.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---

Changes in v3:
- Make loop in vimc_mbus_code_by_index() clearer by using break instead of =
if
- Use VIMC_PIX_FMT_MAX_CODES define instead of hardcoded value for the size=
 of
  code array in struct vimc_pix_map

Changes in v2:
- Fix vimc_mbus_code_by_index not checking code array bounds
- Fix array formatting
- Rename variables
- Change code array size
- Add comment about vimc_mbus_code_by_index return value

 drivers/media/test-drivers/vimc/vimc-common.c | 71 ++++++++++++-------
 drivers/media/test-drivers/vimc/vimc-common.h | 13 +++-
 drivers/media/test-drivers/vimc/vimc-scaler.c | 10 ++-
 drivers/media/test-drivers/vimc/vimc-sensor.c |  6 +-
 4 files changed, 68 insertions(+), 32 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/=
test-drivers/vimc/vimc-common.c
index c95c17c048f2..e11107e4796c 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -19,19 +19,19 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* RGB formats */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_BGR888_1X24,
+=09=09.code =3D { MEDIA_BUS_FMT_BGR888_1X24 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_BGR24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_RGB888_1X24,
+=09=09.code =3D { MEDIA_BUS_FMT_RGB888_1X24 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_RGB24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_ARGB8888_1X32,
+=09=09.code =3D { MEDIA_BUS_FMT_ARGB8888_1X32 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_ARGB32,
 =09=09.bpp =3D 4,
 =09=09.bayer =3D false,
@@ -39,49 +39,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* Bayer formats */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SBGGR8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SGBRG8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SGRBG8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SRGGB8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
+=09=09.code =3D { MEDIA_BUS_FMT_SBGGR10_1X10 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
+=09=09.code =3D { MEDIA_BUS_FMT_SGBRG10_1X10 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
+=09=09.code =3D { MEDIA_BUS_FMT_SGRBG10_1X10 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
+=09=09.code =3D { MEDIA_BUS_FMT_SRGGB10_1X10 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
@@ -89,25 +89,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* 10bit raw bayer a-law compressed to 8 bits */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10ALAW8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
@@ -115,49 +115,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* 10bit raw bayer DPCM compressed to 8 bits */
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
+=09=09.code =3D { MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10DPCM8,
 =09=09.bpp =3D 1,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
+=09=09.code =3D { MEDIA_BUS_FMT_SBGGR12_1X12 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
+=09=09.code =3D { MEDIA_BUS_FMT_SGBRG12_1X12 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
+=09=09.code =3D { MEDIA_BUS_FMT_SGRBG12_1X12 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
 =09},
 =09{
-=09=09.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
+=09=09.code =3D { MEDIA_BUS_FMT_SRGGB12_1X12 },
 =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB12,
 =09=09.bpp =3D 2,
 =09=09.bayer =3D true,
@@ -182,13 +182,32 @@ const struct vimc_pix_map *vimc_pix_map_by_index(unsi=
gned int i)
 =09return &vimc_pix_map_list[i];
 }
=20
+const u32 vimc_mbus_code_by_index(unsigned int index)
+{
+=09unsigned int i, j;
+
+=09for (i =3D 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
+=09=09for (j =3D 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j++) {
+=09=09=09if (!vimc_pix_map_list[i].code[j])
+=09=09=09=09break;
+
+=09=09=09if (!index)
+=09=09=09=09return vimc_pix_map_list[i].code[j];
+=09=09=09index--;
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
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/=
test-drivers/vimc/vimc-common.h
index 487bd020f85c..dfebf6f75cfc 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -32,6 +32,8 @@
 #define VIMC_IS_SRC(pad)=09(pad)
 #define VIMC_IS_SINK(pad)=09(!(pad))
=20
+#define VIMC_PIX_FMT_MAX_CODES 1
+
 /**
  * vimc_colorimetry_clamp - Adjust colorimetry parameters
  *
@@ -70,7 +72,7 @@ do {=09=09=09=09=09=09=09=09=09\
  * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
  */
 struct vimc_pix_map {
-=09unsigned int code;
+=09unsigned int code[VIMC_PIX_FMT_MAX_CODES];
 =09unsigned int bpp;
 =09u32 pixelformat;
 =09bool bayer;
@@ -169,6 +171,15 @@ extern struct vimc_ent_type vimc_cap_type;
  */
 const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
=20
+/**
+ * vimc_mbus_code_by_index - get mbus code by its index
+ *
+ * @index:=09=09index of the mbus code in vimc_pix_map_list
+ *
+ * Returns 0 if no mbus code is found for the given index.
+ */
+const u32 vimc_mbus_code_by_index(unsigned int index);
+
 /**
  * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
  *
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/=
test-drivers/vimc/vimc-scaler.c
index 465b906b7497..02615ded1c93 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
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
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/=
test-drivers/vimc/vimc-sensor.c
index 228120b3a6dd..9391f5b5c58a 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
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
2.26.1


