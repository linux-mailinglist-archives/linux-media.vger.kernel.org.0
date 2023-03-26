Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE086C958E
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjCZOeE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbjCZOc4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8497D8C
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-0008S2-Pp; Sun, 26 Mar 2023 16:32:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-006rdO-Qe; Sun, 26 Mar 2023 16:32:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-0088XZ-6K; Sun, 26 Mar 2023 16:32:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 059/117] media: rga: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:26 +0200
Message-Id: <20230326143224.572654-62-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rQQfsHrwV+c5wQvF4lxwVI1GbxtOlE3rn040X1cCNXs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbNZWAoNfeZ9R1R0Vor7bhu8//Bx1HBz2Mvn 0ZZ6FSPkJeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWzQAKCRCPgPtYfRL+ TkKbCAC3ciBfPEnrewhCphhzSZ6Rle7/TOFS75TLT2UAgJBi2wBF9i1OqQtpBCR2MJ757dV0EHS 29H8a2jNlXTrt17GCzk+Nkf3uC1mbcrFPkQFS6JmnD5RCcLdX5/48563D2J7MDa/a70OiXpu9F2 pxG4750fz8oNQZMlYcyjm9/vZQcDmMi5+iIf8IwYNz9PAjBzEZSHuPcMrLGIIed/2zZIQbuPbEO ePSPCv71Y9BZB74NpmbPQ6GwLuGtBg/Q8+ifuz2+Ud5MvXjpfAkDtFf4BL018kCjKKLE0SNRvJ8 GJcU4IO56EVXd70rqdmIRvrzGE3cFHTpOIbzxc/RcYU8KV4d
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
 drivers/media/platform/rockchip/rga/rga.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 61b25fcf826e..67dcf22e5ba3 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -930,7 +930,7 @@ static int rga_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rga_remove(struct platform_device *pdev)
+static void rga_remove(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga = platform_get_drvdata(pdev);
 
@@ -947,8 +947,6 @@ static int rga_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&rga->v4l2_dev);
 
 	pm_runtime_disable(rga->dev);
-
-	return 0;
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)
@@ -986,7 +984,7 @@ MODULE_DEVICE_TABLE(of, rockchip_rga_match);
 
 static struct platform_driver rga_pdrv = {
 	.probe = rga_probe,
-	.remove = rga_remove,
+	.remove_new = rga_remove,
 	.driver = {
 		.name = RGA_NAME,
 		.pm = &rga_pm,
-- 
2.39.2

