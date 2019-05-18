Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 588E02244F
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 19:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbfERRo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 May 2019 13:44:26 -0400
Received: from mailoutvs59.siol.net ([185.57.226.250]:42530 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726050AbfERRo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 May 2019 13:44:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 3DCC6520A8D;
        Sat, 18 May 2019 19:44:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GueISRJvbvib; Sat, 18 May 2019 19:44:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id C2B30520939;
        Sat, 18 May 2019 19:44:21 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id F058D520A8D;
        Sat, 18 May 2019 19:44:20 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cedrus: Allow different mod clock rates
Date:   Sat, 18 May 2019 19:44:15 +0200
Message-Id: <20190518174415.17795-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some VPU variants may run at higher clock speeds. They actually need
extra speed to be capable of decoding more complex codecs like HEVC or
bigger image sizes (4K).

Expand variant structure with mod_rate information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 11 ++++++++---
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h |  2 --
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
index d0429c0e6b6b..9349a082a29c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -369,36 +369,41 @@ static int cedrus_remove(struct platform_device *pd=
ev)
 }
=20
 static const struct cedrus_variant sun4i_a10_cedrus_variant =3D {
-	/* No particular capability. */
+	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun5i_a13_cedrus_variant =3D {
-	/* No particular capability. */
+	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun7i_a20_cedrus_variant =3D {
-	/* No particular capability. */
+	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun8i_a33_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun8i_h3_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	.mod_rate	=3D 402000000,
 };
=20
 static const struct cedrus_variant sun50i_a64_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	.mod_rate	=3D 402000000,
 };
=20
 static const struct cedrus_variant sun50i_h5_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	.mod_rate	=3D 402000000,
 };
=20
 static const struct cedrus_variant sun50i_h6_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
 	.quirks		=3D CEDRUS_QUIRK_NO_DMA_OFFSET,
+	.mod_rate	=3D 600000000,
 };
=20
 static const struct of_device_id cedrus_dt_match[] =3D {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index c57c04b41d2e..25ee1f80f2c7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -94,6 +94,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	quirks;
+	unsigned int	mod_rate;
 };
=20
 struct cedrus_dev {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
index fbfff7c1c771..60406b2d4595 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -236,7 +236,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		goto err_sram;
 	}
=20
-	ret =3D clk_set_rate(dev->mod_clk, CEDRUS_CLOCK_RATE_DEFAULT);
+	ret =3D clk_set_rate(dev->mod_clk, variant->mod_rate);
 	if (ret) {
 		dev_err(dev->dev, "Failed to set clock rate\n");
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
index b43c77d54b95..27d0882397aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
@@ -16,8 +16,6 @@
 #ifndef _CEDRUS_HW_H_
 #define _CEDRUS_HW_H_
=20
-#define CEDRUS_CLOCK_RATE_DEFAULT	320000000
-
 int cedrus_engine_enable(struct cedrus_dev *dev, enum cedrus_codec codec=
);
 void cedrus_engine_disable(struct cedrus_dev *dev);
=20
--=20
2.21.0

