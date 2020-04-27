Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340E41BB1CD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 01:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgD0XDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 19:03:09 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:44108 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD0XDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 19:03:09 -0400
Date:   Mon, 27 Apr 2020 23:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1588028586;
        bh=u3NWUhWMfFeoCq9azo6alFTKsYhWBMCMaFzXPnForq0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=j6BTNekzDaSD96D3moC7wiBzJBmrjoUrxZ4KHbbtOsU+AWS+leTj7sEwEjcexbq69
         WUhjivubjh5G+6xXsvP3yCk2aMxuVSALb8K8UpOoZyQkGNg5LrN7acIyyfWny5Eaaq
         vMQkuN0svAW0aNBLFLkm+e/HzUgI+r6DzSgogjsE=
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
Subject: [PATCH v3 2/3] media: vimc: Add missing {RGB,BGR,GBR}888 media bus codes
Message-ID: <20200427230234.3114565-3-nfraprado@protonmail.com>
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

Add missing RGB888_*, BGR888_* and GBR888_* media bus codes in the
vimc_pix_map_list. Since there is no GBR24 pixelformat, use the RGB24
pixelformat for MEDIA_BUS_FMT_GBR888_1X24.

Acked-by: Helen Koike <helen.koike@collabora.com>
Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---

Changes in v3:
- Use VIMC_PIX_FMT_MAX_CODES define instead of hardcoded value for the size=
 of
  code array in struct vimc_pix_map

Changes in v2:
- Fix array formatting
- Change commit message to reflect v2 changes
- Change code array size
- Add other BGR888 and RGB888 formats to BGR24 and RGB24 pixelformats

 drivers/media/test-drivers/vimc/vimc-common.c | 16 ++++++++++++++--
 drivers/media/test-drivers/vimc/vimc-common.h |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/=
test-drivers/vimc/vimc-common.c
index e11107e4796c..45b5312d6271 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
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
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/=
test-drivers/vimc/vimc-common.h
index dfebf6f75cfc..aa67cfebeb26 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -32,7 +32,7 @@
 #define VIMC_IS_SRC(pad)=09(pad)
 #define VIMC_IS_SINK(pad)=09(!(pad))
=20
-#define VIMC_PIX_FMT_MAX_CODES 1
+#define VIMC_PIX_FMT_MAX_CODES 8
=20
 /**
  * vimc_colorimetry_clamp - Adjust colorimetry parameters
--=20
2.26.1


