Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1396C9577
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbjCZOdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjCZOcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08B17D8C
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0008Dd-2a; Sun, 26 Mar 2023 16:32:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-006rcC-Fn; Sun, 26 Mar 2023 16:32:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-0088Wb-1t; Sun, 26 Mar 2023 16:32:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 044/117] media: venus: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:11 +0200
Message-Id: <20230326143224.572654-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ph85ZOcYCUw+0oWI/YAseTqjEMO65pC6gI1xrpySm34=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa7N46eaarZ3UptCgyg1IH71NGjTddZ/Ym33 mQjZkAomuiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWuwAKCRCPgPtYfRL+ TrqdB/90HeO+NrGMq7e7pJASH/PaCtSF9yl01fhDhApdEbmpfvg9h7x2Zq1x1JI6l7MfedvnfAW 9niCmVe0MAs9c1IyA+yELIqyPimvZEft+LGfFA8va3v0LE4PIMhCOcDD2YcaRgiBvwovas6CbVf LrApHDY7Mf0JlnTRiPx4VYWdWbCqmodT3lPv/MFQ0JTwE0TdEyQXwyO+LU4TJZSmRS6V3G76Kd9 KfzyN4K7w2KuqaJG4WTY8sSimVMl8qXXBRwMCDVTc8qpUV7ifvS1wMRk+zT+xQJh5uVCNQPbx9U fcisV5sFjCm8Qv5drmREJ1ixRWNOdUIwz0wliuRdO9PIAyby
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
 drivers/media/platform/qcom/venus/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 403ffb92af60..2ae867cb4c48 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -416,7 +416,7 @@ static int venus_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int venus_remove(struct platform_device *pdev)
+static void venus_remove(struct platform_device *pdev)
 {
 	struct venus_core *core = platform_get_drvdata(pdev);
 	const struct venus_pm_ops *pm_ops = core->pm_ops;
@@ -447,8 +447,6 @@ static int venus_remove(struct platform_device *pdev)
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
 	venus_dbgfs_deinit(core);
-
-	return 0;
 }
 
 static void venus_core_shutdown(struct platform_device *pdev)
@@ -891,7 +889,7 @@ MODULE_DEVICE_TABLE(of, venus_dt_match);
 
 static struct platform_driver qcom_venus_driver = {
 	.probe = venus_probe,
-	.remove = venus_remove,
+	.remove_new = venus_remove,
 	.driver = {
 		.name = "qcom-venus",
 		.of_match_table = venus_dt_match,
-- 
2.39.2

