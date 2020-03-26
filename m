Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D5A194AEB
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 22:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgCZVr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 17:47:59 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:10724 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbgCZVr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 17:47:58 -0400
Date:   Thu, 26 Mar 2020 21:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1585259277;
        bh=18CceoDh9UrcHTAVgytEoyZx8kyTstuJIIJjwoHl4TE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=c7EYnump6tFPcO299rWZ8X6sJZE976P/peUKGUJJuqHgi3iOsrjPUGwrgv+FF3d+R
         /Xc365MqGJLcUBE6DQ7ewGGlyEuLwmpPbK8zMtdAUao1ppJ1PVUNkGyF8LVW2Oc2KO
         AEYiBGcpIOAVVxK7W3hmoB1oP9XtzHwMqSWLD/3c=
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
Subject: [PATCH v2 2/3] media: vimc: Add missing {RGB,BGR,GBR}888 media bus codes
Message-ID: <20200326214730.2449707-3-nfraprado@protonmail.com>
In-Reply-To: <20200326214730.2449707-1-nfraprado@protonmail.com>
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
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

Add missing RGB888_*, BGR888_* and GBR888_* media bus codes in the
vimc_pix_map_list. Since there is no GBR24 pixelformat, use the RGB24
pixelformat for MEDIA_BUS_FMT_GBR888_1X24.

Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---

Changes in v2:
- Fix array formatting
- Change commit message to reflect v2 changes
- Change code array size
- Add other BGR888 and RGB888 formats to BGR24 and RGB24 pixelformats

 drivers/media/platform/vimc/vimc-common.c | 16 ++++++++++++++--
 drivers/media/platform/vimc/vimc-common.h |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/plat=
form/vimc/vimc-common.c
index 119846f3eaa5..11489334cff7 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -19,13 +19,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
=20
 =09/* RGB formats */
 =09{
-=09=09.code =3D { MEDIA_BUS_FMT_BGR888_1X24 },
+=09=09.code =3D {
+=09=09=09MEDIA_BUS_FMT_BGR888_1X24,
+=09=09=09MEDIA_BUS_FMT_BGR888_3X8
+=09=09},
 =09=09.pixelformat =3D V4L2_PIX_FMT_BGR24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
 =09},
 =09{
-=09=09.code =3D { MEDIA_BUS_FMT_RGB888_1X24 },
+=09=09.code =3D {
+=09=09=09MEDIA_BUS_FMT_RGB888_1X24,
+=09=09=09MEDIA_BUS_FMT_RGB888_2X12_BE,
+=09=09=09MEDIA_BUS_FMT_RGB888_2X12_LE,
+=09=09=09MEDIA_BUS_FMT_RGB888_3X8,
+=09=09=09MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+=09=09=09MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+=09=09=09MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+=09=09=09MEDIA_BUS_FMT_GBR888_1X24
+=09=09},
 =09=09.pixelformat =3D V4L2_PIX_FMT_RGB24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/plat=
form/vimc/vimc-common.h
index 585441694c86..d5e0e8d32542 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -69,7 +69,7 @@ do {=09=09=09=09=09=09=09=09=09\
  * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
  */
 struct vimc_pix_map {
-=09unsigned int code[1];
+=09unsigned int code[8];
 =09unsigned int bpp;
 =09u32 pixelformat;
 =09bool bayer;
--=20
2.25.2


