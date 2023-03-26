Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB1C6C956A
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjCZOdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjCZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDA07D84
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-00089h-P3; Sun, 26 Mar 2023 16:32:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-006rc1-LJ; Sun, 26 Mar 2023 16:32:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-0088WP-CZ; Sun, 26 Mar 2023 16:32:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 041/117] media: mx2_emmaprp: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:08 +0200
Message-Id: <20230326143224.572654-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TcgSvyXz30JD9Fu92pOx8XV/iV3Tk0/AitEz0iTvp8c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa4So/HuY3eI/Ohv8pGTB1onYDGIBgslCQt0 HlmIHp1yCuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWuAAKCRCPgPtYfRL+ TldfCAC6S2LWDJNYqtcZKMPejYK7vvUv+9Dgnmovcor7j+0ufpThZuCHjGGOwAB7RyEbbkZmRL0 NtNG+RhtBc6bnxpCudQUV1aRMfL+JUtfiHimx69Tl6ess080hQsPVwK6bQkpoa1b5VifAzxGCRs HaEPYCXirnMLAjAy0ToBDlatqo2GDjYoaBQnpNlnqLr1sQhQ5pTZrRgHWnV8vkv/0GKinnQPdlf +Jy84DlKDBFYAFfBke0X6+xyJAcwYPfY/vkb9L9mGPiaPfK9M3prH0ZNMR66ux8PzSgLsV6IR1b BWV0Dwv06ve64M7nYjOhb3XuOThzMnK0l4BQphY98zMjHfpV
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
 drivers/media/platform/nxp/mx2_emmaprp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 3ce84d0f078c..023ed40c6b08 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -888,7 +888,7 @@ static int emmaprp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int emmaprp_remove(struct platform_device *pdev)
+static void emmaprp_remove(struct platform_device *pdev)
 {
 	struct emmaprp_dev *pcdev = platform_get_drvdata(pdev);
 
@@ -898,13 +898,11 @@ static int emmaprp_remove(struct platform_device *pdev)
 	v4l2_m2m_release(pcdev->m2m_dev);
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 	mutex_destroy(&pcdev->dev_mutex);
-
-	return 0;
 }
 
 static struct platform_driver emmaprp_pdrv = {
 	.probe		= emmaprp_probe,
-	.remove		= emmaprp_remove,
+	.remove_new	= emmaprp_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 	},
-- 
2.39.2

