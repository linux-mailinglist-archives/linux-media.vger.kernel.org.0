Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC876C9570
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbjCZOdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjCZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B0F7AAB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0008Rv-5H; Sun, 26 Mar 2023 16:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-006rdM-Og; Sun, 26 Mar 2023 16:32:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-0088XU-0M; Sun, 26 Mar 2023 16:32:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 058/117] media: vsp1_drv: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:25 +0200
Message-Id: <20230326143224.572654-61-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EjRcTYlo35y82/L20Z81gnE14v2Xv5gdgq+8cV2/JKk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbMOk/UOndLqfRzqpes0DNym0NOJWfrjM61O Dy7cqSuJ/WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWzAAKCRCPgPtYfRL+ Tr8sB/4gUbHY3UrlevoJV054i3j8+uqfuciL5D7OsMmV2uyEGiX8GxkUgXrz2XwHfQzyddkNhC5 YWSUnk+ThKJsdqa5JGQcBU2L27bow3btqgg88MfaJQe0tHiiYmX7MguUkdI4iKPbbyHajUOhqXu yyEFnm8nLMgx+5kkVSw7732Lyb6R7SIsb40GP2o7n3uYLQ9RB5TwA334Vj+xI/3uUDEGRsB3rQj lQnSzvR6W0qCsXcEkf5a9h9J7ouM15cy1nu2NJL1wyJWNb1mIzBWcs2D8BaBVEw0dTZ9SO5MGKD eERDqs+s1TG3wHdar4udoZSP9OYPlwEO5wgMhSMGRjq1jzde
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
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 5710152d6511..c1c28f98bd10 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -977,7 +977,7 @@ static int vsp1_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vsp1_remove(struct platform_device *pdev)
+static void vsp1_remove(struct platform_device *pdev)
 {
 	struct vsp1_device *vsp1 = platform_get_drvdata(pdev);
 
@@ -985,8 +985,6 @@ static int vsp1_remove(struct platform_device *pdev)
 	rcar_fcp_put(vsp1->fcp);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id vsp1_of_match[] = {
@@ -999,7 +997,7 @@ MODULE_DEVICE_TABLE(of, vsp1_of_match);
 
 static struct platform_driver vsp1_platform_driver = {
 	.probe		= vsp1_probe,
-	.remove		= vsp1_remove,
+	.remove_new	= vsp1_remove,
 	.driver		= {
 		.name	= "vsp1",
 		.pm	= &vsp1_pm_ops,
-- 
2.39.2

