Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8466C9578
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjCZOdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjCZOcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33247DA8
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-00006I-EB; Sun, 26 Mar 2023 16:32:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-006reU-Ok; Sun, 26 Mar 2023 16:32:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-0088YT-4h; Sun, 26 Mar 2023 16:32:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 072/117] media: bdisp-v4l2: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:39 +0200
Message-Id: <20230326143224.572654-75-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6oNpflcOfl1SzEjPbuYEUR09Hb2dlSPtdmiOhtCulig=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbc+I+q3kfUf8JJojWW18kLNbE1jeCcJcdsc wl+ohfs+ZKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW3AAKCRCPgPtYfRL+ Tl4HB/9ib9yNl+1dZIMR38U9WiJyCh6cNX6bd3eYEYJkW1skVMaurJQi6ph6s1KW2TLjkwlmJ/k XgRau5UdrltUMCtlKTh+of357GkB12cgVDY3awoHjiUyzAr4ond8bNzta4ZIVDTuOB0gtcrmI/A IgooRUgWNyOeC4IDEp755EO+CAPbQXs8tPY79gUOYfe2gTkYBzrndN9Hr0BeBl/ZDSNkmRGN67r zEUzZWK+uYrLCeO+1o9bT/Mt43PndRrnNKnHU2HEqAC9VED27mLXVw+RIc3K+BdGpa0viXGxePn 2FAfi7gpCAJpEV8c+aodrGwMnZdqT3vEedRgJ83etjcUfNCf
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
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index dd74cc43920d..4471b5c944ca 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -1257,7 +1257,7 @@ static const struct dev_pm_ops bdisp_pm_ops = {
 	.runtime_resume         = bdisp_runtime_resume,
 };
 
-static int bdisp_remove(struct platform_device *pdev)
+static void bdisp_remove(struct platform_device *pdev)
 {
 	struct bdisp_dev *bdisp = platform_get_drvdata(pdev);
 
@@ -1277,8 +1277,6 @@ static int bdisp_remove(struct platform_device *pdev)
 	destroy_workqueue(bdisp->work_queue);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-
-	return 0;
 }
 
 static int bdisp_probe(struct platform_device *pdev)
@@ -1411,7 +1409,7 @@ MODULE_DEVICE_TABLE(of, bdisp_match_types);
 
 static struct platform_driver bdisp_driver = {
 	.probe          = bdisp_probe,
-	.remove         = bdisp_remove,
+	.remove_new     = bdisp_remove,
 	.driver         = {
 		.name           = BDISP_NAME,
 		.of_match_table = bdisp_match_types,
-- 
2.39.2

