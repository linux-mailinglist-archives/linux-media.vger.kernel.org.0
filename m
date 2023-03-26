Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A93F6C9579
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjCZOdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjCZOcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA247D92
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-0000BX-TA; Sun, 26 Mar 2023 16:32:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-006rfI-GQ; Sun, 26 Mar 2023 16:32:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0088ZB-Oj; Sun, 26 Mar 2023 16:32:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 084/117] media: am437x-vpfe: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:51 +0200
Message-Id: <20230326143224.572654-87-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lTaE3SKdNq66F1jzyqhg1rfYfg3OY2uFDbXBo2/LMsw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbqWfYcJFKFZd8oS5F20KVPr15wIMRpHsGm8 FG++sg4mVaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW6gAKCRCPgPtYfRL+ TjV+B/0YJZiw1tGCmYj0kXcu3tYzxXV3fszJMUaHUnC9ZvL3BlJgbHB8lMD1OFDMWmQXZ0auLnJ vOHSvZb3bQ8nhL+HrpmBImcR5nMTbMZr41tWUg/rZVsg0wCb0Apq+DGVGZYlDnpFkTBxQNffQEw N1Ko3niP7hD77qeZcXwB+yCcSM20mEyA2RHzeJpFfXLRStjU89TdGTGJHEtcdJwSGQOnW/MDffs X4LrxEtKWt+nPVAC5772shmOi78/Q/5pE75GEINaff47IDsTkdQ346DdntBZSfZtrH+m0UGpIb4 63vXyJtP4PTL/URipcSjAaVDetYHIhDYdKmQExPEvQiw2Q5h
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
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 2dfae9bc0bba..aac377fcaf35 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2483,7 +2483,7 @@ static int vpfe_probe(struct platform_device *pdev)
 /*
  * vpfe_remove : It un-register device from V4L2 driver
  */
-static int vpfe_remove(struct platform_device *pdev)
+static void vpfe_remove(struct platform_device *pdev)
 {
 	struct vpfe_device *vpfe = platform_get_drvdata(pdev);
 
@@ -2493,8 +2493,6 @@ static int vpfe_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&vpfe->notifier);
 	v4l2_device_unregister(&vpfe->v4l2_dev);
 	video_unregister_device(&vpfe->video_dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2625,7 +2623,7 @@ MODULE_DEVICE_TABLE(of, vpfe_of_match);
 
 static struct platform_driver vpfe_driver = {
 	.probe		= vpfe_probe,
-	.remove		= vpfe_remove,
+	.remove_new	= vpfe_remove,
 	.driver = {
 		.name	= VPFE_MODULE_NAME,
 		.pm	= &vpfe_pm_ops,
-- 
2.39.2

