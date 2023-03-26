Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6914A6C95AE
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjCZOeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjCZOdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862346A69
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0000JC-It; Sun, 26 Mar 2023 16:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-006rgS-Jx; Sun, 26 Mar 2023 16:32:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-0088a8-Q6; Sun, 26 Mar 2023 16:32:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 098/117] media: xilinx-vtc: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:05 +0200
Message-Id: <20230326143224.572654-101-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fjr9tIdSc05qYF67imX4hoFI+DzF97z0DWpSMN62+oE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFcEFx/flNwnvLYI9GWtIGv3ypiUAXSmRQPyV ZcEej2frS2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXBAAKCRCPgPtYfRL+ TsYdB/9MMLLYwXMHe4GjBsaII48sj95krtIMwxjGZOT8LmA2PwFQAk3rLk6/97DB0SJe2ONfvY4 6Y6r1Lc+A83Q1R/Y9NbKC9BnzXYrB8ItU+OnCo8iWD9P2AKj2OHGamp3BYZtSv6uXBLoVbiaymO eYpHrTrOTejCfsjHliMNGesmNPl0+xcNez7bCpDJYl4BSjlEykBVpZ5JQSAiSyryphp315oksar vRbkKgPcfGsWKmKt5ftNF0rThPhr1hVfR44EL6aAwReXvc1oCilt8fbsFZJAnERgVBd9ec9EBa6 jLAPGgNmIdn6nynsLI30O/MhyQEFw7lv2F436u+PNkU/tuio
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
 drivers/media/platform/xilinx/xilinx-vtc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
index 0ae0208d7529..0d5e35c29488 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.c
+++ b/drivers/media/platform/xilinx/xilinx-vtc.c
@@ -344,15 +344,13 @@ static int xvtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int xvtc_remove(struct platform_device *pdev)
+static void xvtc_remove(struct platform_device *pdev)
 {
 	struct xvtc_device *xvtc = platform_get_drvdata(pdev);
 
 	xvtc_unregister_device(xvtc);
 
 	xvip_cleanup_resources(&xvtc->xvip);
-
-	return 0;
 }
 
 static const struct of_device_id xvtc_of_id_table[] = {
@@ -367,7 +365,7 @@ static struct platform_driver xvtc_driver = {
 		.of_match_table = xvtc_of_id_table,
 	},
 	.probe = xvtc_probe,
-	.remove = xvtc_remove,
+	.remove_new = xvtc_remove,
 };
 
 module_platform_driver(xvtc_driver);
-- 
2.39.2

