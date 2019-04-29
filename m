Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167FCDF31
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 11:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbfD2JR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 05:17:29 -0400
Received: from shell.v3.sk ([90.176.6.54]:59334 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728026AbfD2JR2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 05:17:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id F16FC10367C;
        Mon, 29 Apr 2019 11:17:24 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id OgZ0hZFOQsii; Mon, 29 Apr 2019 11:17:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 3B5DF10367D;
        Mon, 29 Apr 2019 11:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id mlph10rs77BX; Mon, 29 Apr 2019 11:16:45 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 54809103687;
        Mon, 29 Apr 2019 11:16:41 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 08/10] [media] marvell-ccic/mmp: add devicetree support
Date:   Mon, 29 Apr 2019 11:16:30 +0200
Message-Id: <20190429091632.2462285-9-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429091632.2462285-1-lkundrak@v3.sk>
References: <20190429091632.2462285-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The platform data is actually not used anywhere (along with the CSI
support) and should be safe to remove.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>

---
Changes since v1:
- s/This are/These are/ in a comment

 .../media/platform/marvell-ccic/mmp-driver.c  | 36 ++++++++++++++-----
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index 8f1d2a972bc9..54c2dd8c29d8 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -19,6 +19,8 @@
 #include <media/v4l2-device.h>
 #include <linux/platform_data/media/mmp-camera.h>
 #include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
@@ -196,6 +198,9 @@ static void mmpcam_calc_dphy(struct mcam_camera *mcam=
)
 	struct device *dev =3D &cam->pdev->dev;
 	unsigned long tx_clk_esc;
=20
+	if (!pdata)
+		return;
+
 	/*
 	 * If CSI2_DPHY3 is calculated dynamically,
 	 * pdata->lane_clk should be already set
@@ -314,10 +319,6 @@ static int mmpcam_probe(struct platform_device *pdev=
)
 	struct mmp_camera_platform_data *pdata;
 	int ret;
=20
-	pdata =3D pdev->dev.platform_data;
-	if (!pdata)
-		return -ENODEV;
-
 	cam =3D devm_kzalloc(&pdev->dev, sizeof(*cam), GFP_KERNEL);
 	if (cam =3D=3D NULL)
 		return -ENOMEM;
@@ -330,17 +331,29 @@ static int mmpcam_probe(struct platform_device *pde=
v)
 	mcam->calc_dphy =3D mmpcam_calc_dphy;
 	mcam->dev =3D &pdev->dev;
 	mcam->use_smbus =3D 0;
-	mcam->mclk_src =3D pdata->mclk_src;
-	mcam->mclk_div =3D pdata->mclk_div;
-	mcam->bus_type =3D pdata->bus_type;
-	mcam->dphy =3D pdata->dphy;
+	pdata =3D pdev->dev.platform_data;
+	if (pdata) {
+		mcam->mclk_src =3D pdata->mclk_src;
+		mcam->mclk_div =3D pdata->mclk_div;
+		mcam->bus_type =3D pdata->bus_type;
+		mcam->dphy =3D pdata->dphy;
+		mcam->lane =3D pdata->lane;
+	} else {
+		/*
+		 * These are values that used to be hardcoded in mcam-core and
+		 * work well on a OLPC XO 1.75 with a parallel bus sensor.
+		 * If it turns out other setups make sense, the values should
+		 * be obtained from the device tree.
+		 */
+		mcam->mclk_src =3D 3;
+		mcam->mclk_div =3D 2;
+	}
 	if (mcam->bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
 		cam->mipi_clk =3D devm_clk_get(mcam->dev, "mipi");
 		if ((IS_ERR(cam->mipi_clk) && mcam->dphy[2] =3D=3D 0))
 			return PTR_ERR(cam->mipi_clk);
 	}
 	mcam->mipi_enabled =3D false;
-	mcam->lane =3D pdata->lane;
 	mcam->chip_id =3D MCAM_ARMADA610;
 	mcam->buffer_mode =3D B_DMA_sg;
 	strscpy(mcam->bus_info, "platform:mmp-camera", sizeof(mcam->bus_info));
@@ -475,6 +488,10 @@ static int mmpcam_resume(struct platform_device *pde=
v)
=20
 #endif
=20
+static const struct of_device_id mmpcam_of_match[] =3D {
+	{ .compatible =3D "marvell,mmp2-ccic", },
+	{},
+};
=20
 static struct platform_driver mmpcam_driver =3D {
 	.probe		=3D mmpcam_probe,
@@ -485,6 +502,7 @@ static struct platform_driver mmpcam_driver =3D {
 #endif
 	.driver =3D {
 		.name	=3D "mmp-camera",
+		.of_match_table =3D of_match_ptr(mmpcam_of_match),
 	}
 };
=20
--=20
2.21.0

