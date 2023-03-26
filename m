Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD5B6C952B
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjCZOcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjCZOcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BBB6593
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0007mb-5d; Sun, 26 Mar 2023 16:32:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZX-QR; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-0088US-VS; Sun, 26 Mar 2023 16:32:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 011/117] media: rtl2832_sdr: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:38 +0200
Message-Id: <20230326143224.572654-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vE13OBywjSGQAtKRy9vyU6KCfvR9dbYK8EQyoIjKxyI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaDpef24v6GE3tEtLjcZf2O1ymSm5hVdjig3 iTbH3k7UkuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWgwAKCRCPgPtYfRL+ TvXLCACmYC/R1fl7aaM51Fj6pO+D/1fUAWu1Kk0JgBxYe6/fsLbY7k7flAF094PI2DaxXcvR51d CA1a+30ylC+ZTkEcvXm+5mxlH2SCMWavlctSXaFBBg7HAr581H30PymT+wUJZNasWDTP9BdEZY3 eLLEAkWobTMIVv5EQpLP7lOoK+34oEQyRVd41MDsJ0JUCEFTAz6CdN/4Uj6gdC0pW8GmFvvZqeJ wKhoap29YMvn+GI7h/QHKTThsOxH8NjM/w8qbEAVgH+lReReftjxYJOpnuAscGsH7rn5Kk/3eWH 64XettA7uZtwIeoOtO+U/5KSBWdV92GrIpcFPCtrIFhxwRho
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
 drivers/media/dvb-frontends/rtl2832_sdr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 05f71d169726..02c619e51641 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1463,7 +1463,7 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rtl2832_sdr_remove(struct platform_device *pdev)
+static void rtl2832_sdr_remove(struct platform_device *pdev)
 {
 	struct rtl2832_sdr_dev *dev = platform_get_drvdata(pdev);
 
@@ -1479,8 +1479,6 @@ static int rtl2832_sdr_remove(struct platform_device *pdev)
 	mutex_unlock(&dev->vb_queue_lock);
 	v4l2_device_put(&dev->v4l2_dev);
 	module_put(pdev->dev.parent->driver->owner);
-
-	return 0;
 }
 
 static struct platform_driver rtl2832_sdr_driver = {
@@ -1488,7 +1486,7 @@ static struct platform_driver rtl2832_sdr_driver = {
 		.name   = "rtl2832_sdr",
 	},
 	.probe          = rtl2832_sdr_probe,
-	.remove         = rtl2832_sdr_remove,
+	.remove_new     = rtl2832_sdr_remove,
 };
 module_platform_driver(rtl2832_sdr_driver);
 
-- 
2.39.2

