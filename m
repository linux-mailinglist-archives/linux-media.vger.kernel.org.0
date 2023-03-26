Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1323A6C95A0
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbjCZOeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbjCZOdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A9E116
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000Fu-TQ; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rg3-Mt; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-0088Zl-KM; Sun, 26 Mar 2023 16:32:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 093/117] media: via-camera: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:00 +0200
Message-Id: <20230326143224.572654-96-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2h6vp3wygh+fbHmZXfq4/Vx9AJtxfUJMECyNAvYwd04=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFb09U6of+mDzpe4TOPtOftDqHMmIDD4eDNsw QXpuK0/f5OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW9AAKCRCPgPtYfRL+ Tp1cCACN+Tn57qYVYJ5RHB4upQZ8VPnlyvyz/FoirmxlnxTBzIGF/b1ZYA8LdcrdoSLVGsYgp30 heDQx5DdEgCNeWMeHM+8xxgSnciVs4ym8wSBO0m5fy+g86aGW47RJLTDihcByr5rHr6EhnfO9Ix EfV9bQkZRc/P1uGK4/K3CRVMeM56Hr3GV/tEY1URgfDP0oT73X3olQTOrE1xw7B5uMffuhCV+bC 3yrg4/mebS4E93q3HrpVcdKzoTCqGvQsdFd0oAxY21ZxqJtHuZU8ytFLLPy5Jt0rW0c6MRMTfUo 8vfroEMevnNzdOxdatfI4SbjaJbLwE3BkIzog6AqHaSPuvXp
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
 drivers/media/platform/via/via-camera.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 95483c84c3f2..94a1260ac393 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -1294,7 +1294,7 @@ static int viacam_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int viacam_remove(struct platform_device *pdev)
+static void viacam_remove(struct platform_device *pdev)
 {
 	struct via_camera *cam = via_cam_info;
 	struct viafb_dev *viadev = pdev->dev.platform_data;
@@ -1309,7 +1309,6 @@ static int viacam_remove(struct platform_device *pdev)
 	v4l2_ctrl_handler_free(&cam->ctrl_handler);
 	kfree(cam);
 	via_cam_info = NULL;
-	return 0;
 }
 
 static struct platform_driver viacam_driver = {
@@ -1317,7 +1316,7 @@ static struct platform_driver viacam_driver = {
 		.name = "viafb-camera",
 	},
 	.probe = viacam_probe,
-	.remove = viacam_remove,
+	.remove_new = viacam_remove,
 };
 
 module_platform_driver(viacam_driver);
-- 
2.39.2

