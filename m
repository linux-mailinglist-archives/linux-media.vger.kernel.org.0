Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31D1247A68
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 00:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgHQW05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 18:26:57 -0400
Received: from mail.v3.sk ([167.172.186.51]:54088 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726778AbgHQW0y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 18:26:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 7A9CFDFA7A;
        Mon, 17 Aug 2020 22:08:04 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id W7eiLtROr_7X; Mon, 17 Aug 2020 22:08:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 29FF7DFA54;
        Mon, 17 Aug 2020 22:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BbzJIudQYf77; Mon, 17 Aug 2020 22:08:02 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 5D62CDFA73;
        Mon, 17 Aug 2020 22:08:02 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 4/4] media: marvell-ccic: add support for runtime PM
Date:   Tue, 18 Aug 2020 00:08:50 +0200
Message-Id: <20200817220850.401287-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220850.401287-1-lkundrak@v3.sk>
References: <20200817220850.401287-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On MMP3, the camera block lives on na separate power island. We want to
turn it off if the CCIC is not in use to conserve power.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
(all at suggestions from Sakari Ailus)
- s/on na separate/on a separate/ in commit message
- Move clock management into PM callbacks

 .../media/platform/marvell-ccic/mcam-core.c   | 31 ++-----------
 .../media/platform/marvell-ccic/mmp-driver.c  | 43 +++++++++++++++++--
 2 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/me=
dia/platform/marvell-ccic/mcam-core.c
index 3d4242b8182ba..a967f010341fa 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -24,6 +24,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/videodev2.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
@@ -893,30 +894,6 @@ static void mcam_ctlr_power_down(struct mcam_camera =
*cam)
 	spin_unlock_irqrestore(&cam->dev_lock, flags);
 }
=20
-/* ---------------------------------------------------------------------=
- */
-/*
- * Controller clocks.
- */
-static void mcam_clk_enable(struct mcam_camera *mcam)
-{
-	unsigned int i;
-
-	for (i =3D 0; i < NR_MCAM_CLK; i++) {
-		if (!IS_ERR(mcam->clk[i]))
-			clk_prepare_enable(mcam->clk[i]);
-	}
-}
-
-static void mcam_clk_disable(struct mcam_camera *mcam)
-{
-	int i;
-
-	for (i =3D NR_MCAM_CLK - 1; i >=3D 0; i--) {
-		if (!IS_ERR(mcam->clk[i]))
-			clk_disable_unprepare(mcam->clk[i]);
-	}
-}
-
 /* ---------------------------------------------------------------------=
- */
 /*
  * Master sensor clock.
@@ -1633,7 +1610,7 @@ static int mcam_v4l_open(struct file *filp)
 		ret =3D sensor_call(cam, core, s_power, 1);
 		if (ret)
 			goto out;
-		mcam_clk_enable(cam);
+		pm_runtime_get_sync(cam->dev);
 		__mcam_cam_reset(cam);
 		mcam_set_config_needed(cam, 1);
 	}
@@ -1656,7 +1633,7 @@ static int mcam_v4l_release(struct file *filp)
 	if (last_open) {
 		mcam_disable_mipi(cam);
 		sensor_call(cam, core, s_power, 0);
-		mcam_clk_disable(cam);
+		pm_runtime_put(cam->dev);
 		if (cam->buffer_mode =3D=3D B_vmalloc && alloc_bufs_at_read)
 			mcam_free_dma_bufs(cam);
 	}
@@ -1977,7 +1954,6 @@ void mccic_suspend(struct mcam_camera *cam)
=20
 		mcam_ctlr_stop_dma(cam);
 		sensor_call(cam, core, s_power, 0);
-		mcam_clk_disable(cam);
 		cam->state =3D cstate;
 	}
 	mutex_unlock(&cam->s_mutex);
@@ -1990,7 +1966,6 @@ int mccic_resume(struct mcam_camera *cam)
=20
 	mutex_lock(&cam->s_mutex);
 	if (!list_empty(&cam->vdev.fh_list)) {
-		mcam_clk_enable(cam);
 		ret =3D sensor_call(cam, core, s_power, 1);
 		if (ret) {
 			mutex_unlock(&cam->s_mutex);
diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index 78263e746cad2..c4b28a00a3a24 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/pm.h>
@@ -274,6 +275,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
=20
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 out:
 	fwnode_handle_put(mcam->asd.match.fwnode);
@@ -288,6 +290,7 @@ static int mmpcam_remove(struct mmp_camera *cam)
 	struct mcam_camera *mcam =3D &cam->mcam;
=20
 	mccic_shutdown(mcam);
+	pm_runtime_force_suspend(mcam->dev);
 	return 0;
 }
=20
@@ -304,11 +307,40 @@ static int mmpcam_platform_remove(struct platform_d=
evice *pdev)
  * Suspend/resume support.
  */
=20
+static int mmpcam_runtime_resume(struct device *dev)
+{
+	struct mmp_camera *cam =3D dev_get_drvdata(dev);
+	struct mcam_camera *mcam =3D &cam->mcam;
+	unsigned int i;
+
+	for (i =3D 0; i < NR_MCAM_CLK; i++) {
+		if (!IS_ERR(mcam->clk[i]))
+			clk_prepare_enable(mcam->clk[i]);
+	}
+
+	return 0;
+}
+
+static int mmpcam_runtime_suspend(struct device *dev)
+{
+	struct mmp_camera *cam =3D dev_get_drvdata(dev);
+	struct mcam_camera *mcam =3D &cam->mcam;
+	int i;
+
+	for (i =3D NR_MCAM_CLK - 1; i >=3D 0; i--) {
+		if (!IS_ERR(mcam->clk[i]))
+			clk_disable_unprepare(mcam->clk[i]);
+	}
+
+	return 0;
+}
+
 static int mmpcam_suspend(struct device *dev)
 {
 	struct mmp_camera *cam =3D dev_get_drvdata(dev);
=20
-	mccic_suspend(&cam->mcam);
+	if (!pm_runtime_suspended(dev))
+		mccic_suspend(&cam->mcam);
 	return 0;
 }
=20
@@ -316,10 +348,15 @@ static int mmpcam_resume(struct device *dev)
 {
 	struct mmp_camera *cam =3D dev_get_drvdata(dev);
=20
-	return mccic_resume(&cam->mcam);
+	if (!pm_runtime_suspended(dev))
+		return mccic_resume(&cam->mcam);
+	return 0;
 }
=20
-static SIMPLE_DEV_PM_OPS(mmpcam_pm_ops, mmpcam_suspend, mmpcam_resume);
+static const struct dev_pm_ops mmpcam_pm_ops =3D {
+	SET_RUNTIME_PM_OPS(mmpcam_runtime_suspend, mmpcam_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(mmpcam_suspend, mmpcam_resume)
+};
=20
 static const struct of_device_id mmpcam_of_match[] =3D {
 	{ .compatible =3D "marvell,mmp2-ccic", },
--=20
2.26.2

