Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A9213FFB
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2019 16:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfEEOBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 May 2019 10:01:03 -0400
Received: from shell.v3.sk ([90.176.6.54]:55710 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727608AbfEEOBD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 5 May 2019 10:01:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 1E532103D25;
        Sun,  5 May 2019 16:00:59 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id dqIgvJsipZHb; Sun,  5 May 2019 16:00:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id E81DB103D27;
        Sun,  5 May 2019 16:00:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Agye__H3dehs; Sun,  5 May 2019 16:00:37 +0200 (CEST)
Received: from nedofet.lan (ip-89-102-31-34.net.upcbroadband.cz [89.102.31.34])
        by zimbra.v3.sk (Postfix) with ESMTPSA id E78C5103D2A;
        Sun,  5 May 2019 16:00:36 +0200 (CEST)
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
Subject: [PATCH v5 04/10] Revert "[media] marvell-ccic: reset ccic phy when stop streaming for stability"
Date:   Sun,  5 May 2019 16:00:25 +0200
Message-Id: <20190505140031.9636-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505140031.9636-1-lkundrak@v3.sk>
References: <20190505140031.9636-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This accesses the clock registers directly and thus is going to stay in t=
he
way of making the driver devicetree friendly.

No boards seems to actually use this. If it's somehow actually needed it
needs to be done differently.

This reverts commit 7c269f454e7a51b151d94f99344120efa1cd0acb.
---
 .../media/platform/marvell-ccic/mcam-core.c   |  6 -----
 .../media/platform/marvell-ccic/mcam-core.h   |  2 --
 .../media/platform/marvell-ccic/mmp-driver.c  | 25 -------------------
 3 files changed, 33 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/me=
dia/platform/marvell-ccic/mcam-core.c
index d24e5b7a3bc52..1b879035948c5 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1154,12 +1154,6 @@ static void mcam_vb_stop_streaming(struct vb2_queu=
e *vq)
 	if (cam->state !=3D S_STREAMING)
 		return;
 	mcam_ctlr_stop_dma(cam);
-	/*
-	 * Reset the CCIC PHY after stopping streaming,
-	 * otherwise, the CCIC may be unstable.
-	 */
-	if (cam->ctlr_reset)
-		cam->ctlr_reset(cam);
 	/*
 	 * VB2 reclaims the buffers, so we need to forget
 	 * about them.
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/me=
dia/platform/marvell-ccic/mcam-core.h
index ad8955f9f0a17..a3a097a45e78b 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.h
+++ b/drivers/media/platform/marvell-ccic/mcam-core.h
@@ -116,7 +116,6 @@ struct mcam_camera {
 	int mclk_src;	/* which clock source the mclk derives from */
 	int mclk_div;	/* Clock Divider Value for MCLK */
=20
-	int ccic_id;
 	enum v4l2_mbus_type bus_type;
 	/* MIPI support */
 	/* The dphy config value, allocated in board file
@@ -137,7 +136,6 @@ struct mcam_camera {
 	int (*plat_power_up) (struct mcam_camera *cam);
 	void (*plat_power_down) (struct mcam_camera *cam);
 	void (*calc_dphy) (struct mcam_camera *cam);
-	void (*ctlr_reset) (struct mcam_camera *cam);
=20
 	/*
 	 * Everything below here is private to the mcam core and
diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index af76eb6377735..8d982c4aae0d8 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -105,7 +105,6 @@ static struct mmp_camera *mmpcam_find_device(struct p=
latform_device *pdev)
 #define CPU_SUBSYS_PMU_BASE	0xd4282800
 #define REG_CCIC_DCGCR		0x28	/* CCIC dyn clock gate ctrl reg */
 #define REG_CCIC_CRCR		0x50	/* CCIC clk reset ctrl reg	*/
-#define REG_CCIC2_CRCR		0xf4	/* CCIC2 clk reset ctrl reg	*/
=20
 static void mcam_clk_enable(struct mcam_camera *mcam)
 {
@@ -183,28 +182,6 @@ static void mmpcam_power_down(struct mcam_camera *mc=
am)
 	mcam_clk_disable(mcam);
 }
=20
-static void mcam_ctlr_reset(struct mcam_camera *mcam)
-{
-	unsigned long val;
-	struct mmp_camera *cam =3D mcam_to_cam(mcam);
-
-	if (mcam->ccic_id) {
-		/*
-		 * Using CCIC2
-		 */
-		val =3D ioread32(cam->power_regs + REG_CCIC2_CRCR);
-		iowrite32(val & ~0x2, cam->power_regs + REG_CCIC2_CRCR);
-		iowrite32(val | 0x2, cam->power_regs + REG_CCIC2_CRCR);
-	} else {
-		/*
-		 * Using CCIC1
-		 */
-		val =3D ioread32(cam->power_regs + REG_CCIC_CRCR);
-		iowrite32(val & ~0x2, cam->power_regs + REG_CCIC_CRCR);
-		iowrite32(val | 0x2, cam->power_regs + REG_CCIC_CRCR);
-	}
-}
-
 /*
  * calc the dphy register values
  * There are three dphy registers being used.
@@ -352,11 +329,9 @@ static int mmpcam_probe(struct platform_device *pdev=
)
 	mcam =3D &cam->mcam;
 	mcam->plat_power_up =3D mmpcam_power_up;
 	mcam->plat_power_down =3D mmpcam_power_down;
-	mcam->ctlr_reset =3D mcam_ctlr_reset;
 	mcam->calc_dphy =3D mmpcam_calc_dphy;
 	mcam->dev =3D &pdev->dev;
 	mcam->use_smbus =3D 0;
-	mcam->ccic_id =3D pdev->id;
 	mcam->mclk_min =3D pdata->mclk_min;
 	mcam->mclk_src =3D pdata->mclk_src;
 	mcam->mclk_div =3D pdata->mclk_div;
--=20
2.21.0

