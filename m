Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA7E6C957E
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbjCZOdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbjCZOcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DDB65A4
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000EN-8j; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rfl-17; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-0088Zb-0O; Sun, 26 Mar 2023 16:32:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 090/117] media: isp: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:57 +0200
Message-Id: <20230326143224.572654-93-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3VExVSSsO7/B3lm+SWJ9hExfHLfDuHO1c63efMmRrZA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbxKlUq2guXl9nh7e6yGwM7qnfZSdnk+oogK hBhK9CZAmOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW8QAKCRCPgPtYfRL+ TqTnB/9siqx02HYG7IroqTm3QTuqlVawrm3Jz/tmn/6HrubQvQP2BeKz/jc4cPAfoJhifjz0WSj E23uYRSLMAc1TmL3EIKtX93vnDLJLk+x5eCYh0i1Su9ct4uLHLD1PqnEqngPYbuLmY/9FGK230N 9TOOhNSX3FWwtyfLfMp8G647sWBlqDXvuK5lKZ2rGNsxhWkw9kyKq4vQOOUL17kkGdrEbBsl+60 aJDLJpBmfxsiIaKMbDuKyRd6y/F0jjwRx+JLn2y/+cdx7zDsVnOrrOGoh2gcKQeluUPa8q7CeUP 3s1a1BvZvv6QUjBhAh4kkfHJybAKJZADoiHtD1C9DZsRFsXQ
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
 drivers/media/platform/ti/omap3isp/isp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index e7327e38482d..f3aaa9e76492 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -1997,7 +1997,7 @@ static int isp_attach_iommu(struct isp_device *isp)
  *
  * Always returns 0.
  */
-static int isp_remove(struct platform_device *pdev)
+static void isp_remove(struct platform_device *pdev)
 {
 	struct isp_device *isp = platform_get_drvdata(pdev);
 
@@ -2014,8 +2014,6 @@ static int isp_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 
 	kfree(isp);
-
-	return 0;
 }
 
 enum isp_of_phy {
@@ -2476,7 +2474,7 @@ MODULE_DEVICE_TABLE(of, omap3isp_of_table);
 
 static struct platform_driver omap3isp_driver = {
 	.probe = isp_probe,
-	.remove = isp_remove,
+	.remove_new = isp_remove,
 	.id_table = omap3isp_id_table,
 	.driver = {
 		.name = "omap3isp",
-- 
2.39.2

