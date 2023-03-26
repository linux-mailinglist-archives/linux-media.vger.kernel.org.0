Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938E86C9554
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbjCZOdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbjCZOcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8307D84
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-00082Z-Cz; Sun, 26 Mar 2023 16:32:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-006rbU-5E; Sun, 26 Mar 2023 16:32:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ8-0088Vv-Kv; Sun, 26 Mar 2023 16:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Eugen Hristev <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 033/117] media: microchip-sama5d2-isc: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:00 +0200
Message-Id: <20230326143224.572654-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6DLkcjBsFIXRydyOgDhKMvBKli+gRBDanO5gWRa8atU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFauywHHSaT3npKYmgiU1TU6g94tHBpoJJO4D 3jKRP1UGWeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWrgAKCRCPgPtYfRL+ TmPWB/9WkVzdAVu+bKuIyvCSS0xpZvohmWGbBt6Tyirkh00kZuY4HUxwsMV7HJWHKeLMDxAdq1W Yma7zktveK8hGD5BenWwRWiTlJvY13xVi7z8XCc93wM07I9h9+m8AZ+EXen0AXXaXfsiJWPQeyB YpKBoC4VpB585k02QiaYxrpowMYLdDrIsYmkCF8GwRxX81tk5tedqzavIv3Bih3VQcewIncMz9w jnQPP/C/FA3G8eLmh73SF49oURSOwjg6dJiaFoVU5kimLp0DNMpUwxuTOhWHwI8tEbk+PfEatcm N7oWefHrsZ+VRDlcTHfeuxUrhnUqvBqWerYXA9qDCs4Agy0K
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
 drivers/media/platform/microchip/microchip-sama5d2-isc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index ac4715d91de6..746f4a2fa9f6 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -608,7 +608,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int microchip_isc_remove(struct platform_device *pdev)
+static void microchip_isc_remove(struct platform_device *pdev)
 {
 	struct isc_device *isc = platform_get_drvdata(pdev);
 
@@ -624,8 +624,6 @@ static int microchip_isc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(isc->hclock);
 
 	microchip_isc_clk_cleanup(isc);
-
-	return 0;
 }
 
 static int __maybe_unused isc_runtime_suspend(struct device *dev)
@@ -668,7 +666,7 @@ MODULE_DEVICE_TABLE(of, microchip_isc_of_match);
 
 static struct platform_driver microchip_isc_driver = {
 	.probe	= microchip_isc_probe,
-	.remove	= microchip_isc_remove,
+	.remove_new = microchip_isc_remove,
 	.driver	= {
 		.name		= "microchip-sama5d2-isc",
 		.pm		= &microchip_isc_dev_pm_ops,
-- 
2.39.2

