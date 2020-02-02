Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E3A14FE2C
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2020 16:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBBPuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Feb 2020 10:50:51 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:11801 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgBBPuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Feb 2020 10:50:51 -0500
Date:   Sun, 02 Feb 2020 15:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1580658649;
        bh=zW6Svbt5NnA5y5wS8kTvIgyaL51d8CkmvjMU7/bynj8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=Xxm6BKKnOQVIA6ZIVgLDrqD0Nvpz3FfUy+5UCbJ88JgDtT0EqMdi2fopJb5LYWxgx
         U4dE6cffhaQn+ea6YMF6o755OwZZe238gWMe4TG9O2dfyg1+kUyHtr/exOPpFsdBJr
         RG1TPErAcFpAsGCd/LCkVggf+v0SqBep07FLjUJ8=
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
Subject: [PATCH 2/3] media: vimc: Add GBR media bus code
Message-ID: <20200202155019.1029993-3-nfraprado@protonmail.com>
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

Add missing GBR888_1X24 media bus code in the vimc_pix_map_list. Since
there is no pixel format for it, use the pixelformat for RGB.

Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 drivers/media/platform/vimc/vimc-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/plat=
form/vimc/vimc-common.c
index 55797e5ab2b1..591a50f63766 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -25,7 +25,7 @@ static const struct vimc_pix_map vimc_pix_map_list[] =3D =
{
 =09=09.bayer =3D false,
 =09},
 =09{
-=09=09.code =3D {MEDIA_BUS_FMT_RGB888_1X24},
+=09=09.code =3D {MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_GBR888_1X24},
 =09=09.pixelformat =3D V4L2_PIX_FMT_RGB24,
 =09=09.bpp =3D 3,
 =09=09.bayer =3D false,
--=20
2.25.0


