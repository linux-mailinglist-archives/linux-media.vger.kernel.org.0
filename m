Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39061247A6B
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 00:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgHQW04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 18:26:56 -0400
Received: from mail.v3.sk ([167.172.186.51]:54082 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgHQW0y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 18:26:54 -0400
X-Greylist: delayed 1078 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Aug 2020 18:26:52 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 04D41DF92E;
        Mon, 17 Aug 2020 22:08:03 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id UuIVB_sZDDOv; Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 9005ADFA54;
        Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id b8tZ_xavN7PF; Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 5892ADF880;
        Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 2/4] media: marvell-ccic: mmp: get rid of mmpcam_devices list
Date:   Tue, 18 Aug 2020 00:08:48 +0200
Message-Id: <20200817220850.401287-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220850.401287-1-lkundrak@v3.sk>
References: <20200817220850.401287-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The solemn reason for this was so that it would be possible to get a
mmp_camera from a platform_device in suspend/resume/remove hooks, because
drvdata used to be used by the v4l core.

Since commit 95db3a60e065 ("[media] v4l: Add a media_device pointer to th=
e
v4l2_device structure") it is no longer case and thus we can make things
a great deal simpler.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes since v1:
- Added this patch

 .../media/platform/marvell-ccic/mmp-driver.c  | 78 ++-----------------
 1 file changed, 8 insertions(+), 70 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index 92b92255dac66..f04c01bced2f0 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -46,49 +46,6 @@ static inline struct mmp_camera *mcam_to_cam(struct mc=
am_camera *mcam)
 	return container_of(mcam, struct mmp_camera, mcam);
 }
=20
-/*
- * A silly little infrastructure so we can keep track of our devices.
- * Chances are that we will never have more than one of them, but
- * the Armada 610 *does* have two controllers...
- */
-
-static LIST_HEAD(mmpcam_devices);
-static struct mutex mmpcam_devices_lock;
-
-static void mmpcam_add_device(struct mmp_camera *cam)
-{
-	mutex_lock(&mmpcam_devices_lock);
-	list_add(&cam->devlist, &mmpcam_devices);
-	mutex_unlock(&mmpcam_devices_lock);
-}
-
-static void mmpcam_remove_device(struct mmp_camera *cam)
-{
-	mutex_lock(&mmpcam_devices_lock);
-	list_del(&cam->devlist);
-	mutex_unlock(&mmpcam_devices_lock);
-}
-
-/*
- * Platform dev remove passes us a platform_device, and there's
- * no handy unused drvdata to stash a backpointer in.  So just
- * dig it out of our list.
- */
-static struct mmp_camera *mmpcam_find_device(struct platform_device *pde=
v)
-{
-	struct mmp_camera *cam;
-
-	mutex_lock(&mmpcam_devices_lock);
-	list_for_each_entry(cam, &mmpcam_devices, devlist) {
-		if (cam->pdev =3D=3D pdev) {
-			mutex_unlock(&mmpcam_devices_lock);
-			return cam;
-		}
-	}
-	mutex_unlock(&mmpcam_devices_lock);
-	return NULL;
-}
-
 /*
  * calc the dphy register values
  * There are three dphy registers being used.
@@ -227,6 +184,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	cam =3D devm_kzalloc(&pdev->dev, sizeof(*cam), GFP_KERNEL);
 	if (cam =3D=3D NULL)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, cam);
 	cam->pdev =3D pdev;
 	INIT_LIST_HEAD(&cam->devlist);
=20
@@ -313,11 +271,10 @@ static int mmpcam_probe(struct platform_device *pde=
v)
 	cam->irq =3D res->start;
 	ret =3D devm_request_irq(&pdev->dev, cam->irq, mmpcam_irq, IRQF_SHARED,
 					"mmp-camera", mcam);
-	if (ret =3D=3D 0) {
-		mmpcam_add_device(cam);
-		return 0;
-	}
+	if (ret)
+		goto out;
=20
+	return 0;
 out:
 	fwnode_handle_put(mcam->asd.match.fwnode);
 	mccic_shutdown(mcam);
@@ -330,14 +287,13 @@ static int mmpcam_remove(struct mmp_camera *cam)
 {
 	struct mcam_camera *mcam =3D &cam->mcam;
=20
-	mmpcam_remove_device(cam);
 	mccic_shutdown(mcam);
 	return 0;
 }
=20
 static int mmpcam_platform_remove(struct platform_device *pdev)
 {
-	struct mmp_camera *cam =3D mmpcam_find_device(pdev);
+	struct mmp_camera *cam =3D platform_get_drvdata(pdev);
=20
 	if (cam =3D=3D NULL)
 		return -ENODEV;
@@ -351,7 +307,7 @@ static int mmpcam_platform_remove(struct platform_dev=
ice *pdev)
=20
 static int mmpcam_suspend(struct platform_device *pdev, pm_message_t sta=
te)
 {
-	struct mmp_camera *cam =3D mmpcam_find_device(pdev);
+	struct mmp_camera *cam =3D platform_get_drvdata(pdev);
=20
 	if (state.event !=3D PM_EVENT_SUSPEND)
 		return 0;
@@ -361,7 +317,7 @@ static int mmpcam_suspend(struct platform_device *pde=
v, pm_message_t state)
=20
 static int mmpcam_resume(struct platform_device *pdev)
 {
-	struct mmp_camera *cam =3D mmpcam_find_device(pdev);
+	struct mmp_camera *cam =3D platform_get_drvdata(pdev);
=20
 	return mccic_resume(&cam->mcam);
 }
@@ -387,22 +343,4 @@ static struct platform_driver mmpcam_driver =3D {
 	}
 };
=20
-
-static int __init mmpcam_init_module(void)
-{
-	mutex_init(&mmpcam_devices_lock);
-	return platform_driver_register(&mmpcam_driver);
-}
-
-static void __exit mmpcam_exit_module(void)
-{
-	platform_driver_unregister(&mmpcam_driver);
-	/*
-	 * platform_driver_unregister() should have emptied the list
-	 */
-	if (!list_empty(&mmpcam_devices))
-		printk(KERN_ERR "mmp_camera leaving devices behind\n");
-}
-
-module_init(mmpcam_init_module);
-module_exit(mmpcam_exit_module);
+module_platform_driver(mmpcam_driver);
--=20
2.26.2

