Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA189E9B8E
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 13:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfJ3Mar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 08:30:47 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:34487 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfJ3Mar (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 08:30:47 -0400
Date:   Wed, 30 Oct 2019 12:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1572438642;
        bh=/TNmPMMrrOxzVHmmt6NNgn0N1f69TdWyViY3NRHlFjc=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=xjv1GAhE/pWAjwaHonqmQmCRGtcYU8jTSWmzxC/PjyZj5jV8ygVsEVYXiLrd3iZnj
         BNjrLdO+Gu/vt+aVl7vpMvxGvdB3tOwYFt8L60AQmJJOI6kEMywRzirlCNPZGJyOE2
         fpdvLZQ6uYFEdpt3Cz8fcq9L9CUPZ/yXhTtd2tgQ=
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
Subject: [PATCH v4] media: vimc: Make capture devices and subdevices use different link_validates
Message-ID: <20191030122934.2154307-1-nfraprado@protonmail.com>
Feedback-ID: cwTKJQq-dqva77NrgNeIaWzOvcDQqfI9VSy7DoyJdvgY6-nEE7fD-E-3GiKFHexW4OBWbzutmMZN6q4SflMDRw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of validating the links to capture devices and subdevices with
the same function, use the default v4l function for links between
subdevices and only use a different function for validating between
capture device and subdevice.
This change should also ease future work to associate multiple mbus
codes for the same pixelformat in vimc_pix_map.

These changes were tested with
v4l2-compliance SHA: 3f806630e2ecbcebe31872b865c5c4b42f111a99, 64 bits
and passed all tests:
Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Wa=
rnings: 0

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
Changes in v4:
- Fix checkpatch checks "Logical continuations should be on the previous li=
ne"

Changes in v3:
- Rebase patch on current media tree
- Make vimc_get_pix_format() static

Changes in v2:
- Remove blank lines
- Rename vimc_cap_link_validate to vimc_vdev_link_validate and move it back=
 to
  vimc-common.c
- Fix style issue on vimc_get_pix_format header
- Remove vimc_get_pix_format declaration from vimc-common.h

 drivers/media/platform/vimc/vimc-capture.c |  2 +-
 drivers/media/platform/vimc/vimc-common.c  | 85 +++++++++++-----------
 drivers/media/platform/vimc/vimc-common.h  |  4 +-
 3 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/pla=
tform/vimc/vimc-capture.c
index a5d79fb25dff..76c015898cfd 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -322,7 +322,7 @@ static const struct vb2_ops vimc_cap_qops =3D {
 };
=20
 static const struct media_entity_operations vimc_cap_mops =3D {
-=09.link_validate=09=09=3D vimc_link_validate,
+=09.link_validate=09=09=3D vimc_vdev_link_validate,
 };
=20
 static void vimc_cap_release(struct video_device *vdev)
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/plat=
form/vimc/vimc-common.c
index 2a0c40e9ae88..43e6fa5886da 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -194,35 +194,36 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelforma=
t(u32 pixelformat)
 =09return NULL;
 }
=20
-static int vimc_get_mbus_format(struct media_pad *pad,
-=09=09=09=09struct v4l2_subdev_format *fmt)
+static int vimc_get_pix_format(struct media_pad *pad,
+=09=09=09       struct v4l2_pix_format *fmt)
 {
 =09if (is_media_entity_v4l2_subdev(pad->entity)) {
 =09=09struct v4l2_subdev *sd =3D
 =09=09=09media_entity_to_v4l2_subdev(pad->entity);
+=09=09struct v4l2_subdev_format sd_fmt;
+=09=09const struct vimc_pix_map *pix_map;
 =09=09int ret;
=20
-=09=09fmt->which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
-=09=09fmt->pad =3D pad->index;
+=09=09sd_fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
+=09=09sd_fmt.pad =3D pad->index;
=20
-=09=09ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
+=09=09ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
 =09=09if (ret)
 =09=09=09return ret;
=20
+=09=09v4l2_fill_pix_format(fmt, &sd_fmt.format);
+=09=09pix_map =3D vimc_pix_map_by_code(sd_fmt.format.code);
+=09=09fmt->pixelformat =3D pix_map->pixelformat;
 =09} else if (is_media_entity_v4l2_video_device(pad->entity)) {
 =09=09struct video_device *vdev =3D container_of(pad->entity,
 =09=09=09=09=09=09=09 struct video_device,
 =09=09=09=09=09=09=09 entity);
 =09=09struct vimc_ent_device *ved =3D video_get_drvdata(vdev);
-=09=09const struct vimc_pix_map *vpix;
-=09=09struct v4l2_pix_format vdev_fmt;
=20
 =09=09if (!ved->vdev_get_format)
 =09=09=09return -ENOIOCTLCMD;
=20
-=09=09ved->vdev_get_format(ved, &vdev_fmt);
-=09=09vpix =3D vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
-=09=09v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
+=09=09ved->vdev_get_format(ved, fmt);
 =09} else {
 =09=09return -EINVAL;
 =09}
@@ -230,16 +231,16 @@ static int vimc_get_mbus_format(struct media_pad *pad=
,
 =09return 0;
 }
=20
-int vimc_link_validate(struct media_link *link)
+int vimc_vdev_link_validate(struct media_link *link)
 {
-=09struct v4l2_subdev_format source_fmt, sink_fmt;
+=09struct v4l2_pix_format source_fmt, sink_fmt;
 =09int ret;
=20
-=09ret =3D vimc_get_mbus_format(link->source, &source_fmt);
+=09ret =3D vimc_get_pix_format(link->source, &source_fmt);
 =09if (ret)
 =09=09return ret;
=20
-=09ret =3D vimc_get_mbus_format(link->sink, &sink_fmt);
+=09ret =3D vimc_get_pix_format(link->sink, &sink_fmt);
 =09if (ret)
 =09=09return ret;
=20
@@ -248,21 +249,21 @@ int vimc_link_validate(struct media_link *link)
 =09=09"%s:snk:%dx%d (0x%x, %d, %d, %d, %d)\n",
 =09=09/* src */
 =09=09link->source->entity->name,
-=09=09source_fmt.format.width, source_fmt.format.height,
-=09=09source_fmt.format.code, source_fmt.format.colorspace,
-=09=09source_fmt.format.quantization, source_fmt.format.xfer_func,
-=09=09source_fmt.format.ycbcr_enc,
+=09=09source_fmt.width, source_fmt.height,
+=09=09source_fmt.pixelformat, source_fmt.colorspace,
+=09=09source_fmt.quantization, source_fmt.xfer_func,
+=09=09source_fmt.ycbcr_enc,
 =09=09/* sink */
 =09=09link->sink->entity->name,
-=09=09sink_fmt.format.width, sink_fmt.format.height,
-=09=09sink_fmt.format.code, sink_fmt.format.colorspace,
-=09=09sink_fmt.format.quantization, sink_fmt.format.xfer_func,
-=09=09sink_fmt.format.ycbcr_enc);
-
-=09/* The width, height and code must match. */
-=09if (source_fmt.format.width !=3D sink_fmt.format.width
-=09    || source_fmt.format.height !=3D sink_fmt.format.height
-=09    || source_fmt.format.code !=3D sink_fmt.format.code)
+=09=09sink_fmt.width, sink_fmt.height,
+=09=09sink_fmt.pixelformat, sink_fmt.colorspace,
+=09=09sink_fmt.quantization, sink_fmt.xfer_func,
+=09=09sink_fmt.ycbcr_enc);
+
+=09/* The width, height and pixelformat must match. */
+=09if (source_fmt.width !=3D sink_fmt.width ||
+=09    source_fmt.height !=3D sink_fmt.height ||
+=09    source_fmt.pixelformat !=3D sink_fmt.pixelformat)
 =09=09return -EPIPE;
=20
 =09/*
@@ -270,43 +271,43 @@ int vimc_link_validate(struct media_link *link)
 =09 * to support interlaced hardware connected to bridges that support
 =09 * progressive formats only.
 =09 */
-=09if (source_fmt.format.field !=3D sink_fmt.format.field &&
-=09    sink_fmt.format.field !=3D V4L2_FIELD_NONE)
+=09if (source_fmt.field !=3D sink_fmt.field &&
+=09    sink_fmt.field !=3D V4L2_FIELD_NONE)
 =09=09return -EPIPE;
=20
 =09/*
 =09 * If colorspace is DEFAULT, then assume all the colorimetry is also
 =09 * DEFAULT, return 0 to skip comparing the other colorimetry parameters
 =09 */
-=09if (source_fmt.format.colorspace =3D=3D V4L2_COLORSPACE_DEFAULT
-=09    || sink_fmt.format.colorspace =3D=3D V4L2_COLORSPACE_DEFAULT)
+=09if (source_fmt.colorspace =3D=3D V4L2_COLORSPACE_DEFAULT ||
+=09    sink_fmt.colorspace =3D=3D V4L2_COLORSPACE_DEFAULT)
 =09=09return 0;
=20
 =09/* Colorspace must match. */
-=09if (source_fmt.format.colorspace !=3D sink_fmt.format.colorspace)
+=09if (source_fmt.colorspace !=3D sink_fmt.colorspace)
 =09=09return -EPIPE;
=20
 =09/* Colorimetry must match if they are not set to DEFAULT */
-=09if (source_fmt.format.ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT
-=09    && sink_fmt.format.ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT
-=09    && source_fmt.format.ycbcr_enc !=3D sink_fmt.format.ycbcr_enc)
+=09if (source_fmt.ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT &&
+=09    sink_fmt.ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT &&
+=09    source_fmt.ycbcr_enc !=3D sink_fmt.ycbcr_enc)
 =09=09return -EPIPE;
=20
-=09if (source_fmt.format.quantization !=3D V4L2_QUANTIZATION_DEFAULT
-=09    && sink_fmt.format.quantization !=3D V4L2_QUANTIZATION_DEFAULT
-=09    && source_fmt.format.quantization !=3D sink_fmt.format.quantization=
)
+=09if (source_fmt.quantization !=3D V4L2_QUANTIZATION_DEFAULT &&
+=09    sink_fmt.quantization !=3D V4L2_QUANTIZATION_DEFAULT &&
+=09    source_fmt.quantization !=3D sink_fmt.quantization)
 =09=09return -EPIPE;
=20
-=09if (source_fmt.format.xfer_func !=3D V4L2_XFER_FUNC_DEFAULT
-=09    && sink_fmt.format.xfer_func !=3D V4L2_XFER_FUNC_DEFAULT
-=09    && source_fmt.format.xfer_func !=3D sink_fmt.format.xfer_func)
+=09if (source_fmt.xfer_func !=3D V4L2_XFER_FUNC_DEFAULT &&
+=09    sink_fmt.xfer_func !=3D V4L2_XFER_FUNC_DEFAULT &&
+=09    source_fmt.xfer_func !=3D sink_fmt.xfer_func)
 =09=09return -EPIPE;
=20
 =09return 0;
 }
=20
 static const struct media_entity_operations vimc_ent_sd_mops =3D {
-=09.link_validate =3D vimc_link_validate,
+=09.link_validate =3D v4l2_subdev_link_validate,
 };
=20
 int vimc_ent_sd_register(struct vimc_ent_device *ved,
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/plat=
form/vimc/vimc-common.h
index c75401a36312..bf729fcde6a9 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -206,12 +206,12 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 =09=09=09 const struct v4l2_subdev_ops *sd_ops);
=20
 /**
- * vimc_link_validate - validates a media link
+ * vimc_vdev_link_validate - validates a media link
  *
  * @link: pointer to &struct media_link
  *
  * This function calls validates if a media link is valid for streaming.
  */
-int vimc_link_validate(struct media_link *link);
+int vimc_vdev_link_validate(struct media_link *link);
=20
 #endif
--=20
2.23.0


