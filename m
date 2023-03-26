Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3D76C9533
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbjCZOcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbjCZOcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135267A80
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-0007sO-M2; Sun, 26 Mar 2023 16:32:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-006raQ-1A; Sun, 26 Mar 2023 16:32:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0088VB-8j; Sun, 26 Mar 2023 16:32:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 022/117] media: pxa_camera: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:49 +0200
Message-Id: <20230326143224.572654-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jrpOEJnFdFmE7i1O2jp+S+tb1tnnzMW7ufd8w5AMPfo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFahI/1zsbMz1QYGND+QaSAeuIc3Bcxfwzb5v c/0Ogn7oSGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWoQAKCRCPgPtYfRL+ TrycCACTHTqHQc+UqMuSc7jHh6OWlIq7MSuzDsUjgqkow39rxXgvpnPYqJzMuT9SdUDjUQLND9I 7gbqBGgKiDhMIYKprdV6FF06zgBGTx8mx1UyLfE2P+GqjiMpUXZ707rLpHdeTQrhesA2jNVM5Rx pWcD6UpgyNFpo6FoHmtwf0tNvlAHI92tcx7eSvUBg1v5e3lRF/x+5OZK/9a50G2rgkN3dDjffft 8/xbjp3/wkOg2eui8DtKeUgra9KyWVpDRltH6mwhovoJGFQ59mX1b10d6ryG2eAJCdK512/rANC ilNAoBLX38SjLAlZ+HDh+6G4z7pGobOl127X2tzcGTUVWzea
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/platform/intel/pxa_camera.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 54270d6b6f50..99a6973b4b54 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2421,7 +2421,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int pxa_camera_remove(struct platform_device *pdev)
+static void pxa_camera_remove(struct platform_device *pdev)
 {
 	struct pxa_camera_dev *pcdev = platform_get_drvdata(pdev);
 
@@ -2437,8 +2437,6 @@ static int pxa_camera_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 
 	dev_info(&pdev->dev, "PXA Camera driver unloaded\n");
-
-	return 0;
 }
 
 static const struct dev_pm_ops pxa_camera_pm = {
@@ -2459,7 +2457,7 @@ static struct platform_driver pxa_camera_driver = {
 		.of_match_table = of_match_ptr(pxa_camera_of_match),
 	},
 	.probe		= pxa_camera_probe,
-	.remove		= pxa_camera_remove,
+	.remove_new	= pxa_camera_remove,
 };
 
 module_platform_driver(pxa_camera_driver);
-- 
2.39.2

