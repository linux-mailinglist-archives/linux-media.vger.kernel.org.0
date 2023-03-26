Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB066C9553
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbjCZOdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjCZOcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E5C72B2
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-00084G-4N; Sun, 26 Mar 2023 16:32:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-006rbe-I0; Sun, 26 Mar 2023 16:32:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-0088W5-Az; Sun, 26 Mar 2023 16:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 036/117] media: dw100: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:03 +0200
Message-Id: <20230326143224.572654-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=39saJ/iaSI8X/st7qDAkBHEdQgt7KfQVpxQAgTd9M5I=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsE0isRtOn7WYJhbScZfxm27X7JZJdSbTPOVa/D676 63tM9DvZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAi7Ubs/xPtmM0mhGSJ9Gdv VPS7/5W5QEOz61DD8wVJYVMnGpVsZdvfOPX9VE+VfXplHKuv3pi0vb570n6BCDWOzNpL2lO8TI4 +OLHs5uaEuyHnCxIK1mcwm8zc8LnV2tpzwZdHDAl+n8VlC9M/BOtN3ysac3afl2K7K7uQQXH69A vuV+U+p1gc0Kt4e6FYPF588jp/n5N8G/9+l5TVEnHKObzWvthWkYNfmrEp0z3U8DtXdG1/1Ylli ipe2ol3P8rYW1Us4iuK4fuboVOeeUM8do/Dpx+J8gmxwa5rFt2Z837JvayLf/4++8E9/7GqvTFb 0sf9EVe7P63L/NRaN2ej45kZbybcLz65fKVMy9Ulip/UAQ==
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
 drivers/media/platform/nxp/dw100/dw100.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 189d60cd5ed1..6eed4bde9611 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1633,7 +1633,7 @@ static int dw100_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dw100_remove(struct platform_device *pdev)
+static void dw100_remove(struct platform_device *pdev)
 {
 	struct dw100_device *dw_dev = platform_get_drvdata(pdev);
 
@@ -1649,8 +1649,6 @@ static int dw100_remove(struct platform_device *pdev)
 	mutex_destroy(dw_dev->vfd.lock);
 	v4l2_m2m_release(dw_dev->m2m_dev);
 	v4l2_device_unregister(&dw_dev->v4l2_dev);
-
-	return 0;
 }
 
 static int __maybe_unused dw100_runtime_suspend(struct device *dev)
@@ -1692,7 +1690,7 @@ MODULE_DEVICE_TABLE(of, dw100_dt_ids);
 
 static struct platform_driver dw100_driver = {
 	.probe		= dw100_probe,
-	.remove		= dw100_remove,
+	.remove_new	= dw100_remove,
 	.driver		= {
 		.name	= DRV_NAME,
 		.pm = &dw100_pm,
-- 
2.39.2

