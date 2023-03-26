Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AECEE6C9593
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbjCZOeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbjCZOc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96B47DBA
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000Fb-QZ; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rfu-Hs; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-0088Ze-84; Sun, 26 Mar 2023 16:32:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 091/117] media: vpe: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:58 +0200
Message-Id: <20230326143224.572654-94-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SaKb+M7SZFcHMEysg5wDiPuqmhYqhK2drrNQp5pds38=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbyQpp6VepQDtlLVuvwIXNeeOBBOKN6lKs53 4qfFuWzuZeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW8gAKCRCPgPtYfRL+ TtUdB/0f1ijkgu/EuWxbhugIXF7JLxYQa4loEp6Bfmg+0bZ3jPkWNONnbtqoTONCZ7RJBl3p6tT AUqSpfvoHnZ5WQI4UY05rEfeip3zsuHs3U57X/UtVl02IfcKfk6Ji6F9DmezhQtw1WkEBlSuOkO rdX3S8a30zvU6e7pCO18AgEYi8ku1udFR0+lB/s6NrW0D8Q3XvdFtGiGLNyOwvWUXAD/J3BCEEE uRl18TCPvbSwhHMkGKXhjMZN3SWjAKCJJSGB5+sjYB79HIJg7B29ohzz0Sgw20WBmo7wBKHy2Xb WnC3lRM0usdrwGVWml4gO0vHxU4zI1fiGNyG+ELTlwPUN+gO
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
 drivers/media/platform/ti/vpe/vpe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 5b1c5d96a407..6848cbc82f52 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2622,7 +2622,7 @@ static int vpe_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vpe_remove(struct platform_device *pdev)
+static void vpe_remove(struct platform_device *pdev)
 {
 	struct vpe_dev *dev = platform_get_drvdata(pdev);
 
@@ -2635,8 +2635,6 @@ static int vpe_remove(struct platform_device *pdev)
 	vpe_set_clock_enable(dev, 0);
 	vpe_runtime_put(pdev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #if defined(CONFIG_OF)
@@ -2651,7 +2649,7 @@ MODULE_DEVICE_TABLE(of, vpe_of_match);
 
 static struct platform_driver vpe_pdrv = {
 	.probe		= vpe_probe,
-	.remove		= vpe_remove,
+	.remove_new	= vpe_remove,
 	.driver		= {
 		.name	= VPE_MODULE_NAME,
 		.of_match_table = of_match_ptr(vpe_of_match),
-- 
2.39.2

