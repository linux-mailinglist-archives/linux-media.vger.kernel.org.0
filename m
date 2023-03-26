Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDE06C9573
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbjCZOdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbjCZOct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F4C7D94
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0008So-RH; Sun, 26 Mar 2023 16:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-006rdX-5A; Sun, 26 Mar 2023 16:32:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-0088XR-Pn; Sun, 26 Mar 2023 16:32:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 057/117] media: sh_vou: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:24 +0200
Message-Id: <20230326143224.572654-60-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GnkVK7SIodm7ugn6xEylj23OqmAQ9deIMvUSGLhIs1E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbLBdmiEleG0aVjONz4apqzeDrzl8U2Ru7rv rlCYdt/txeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWywAKCRCPgPtYfRL+ Tm/9B/9hSK3oEKGQxVuk5inkcKQAUYxgDE4lwLhPUGs6NyHsrMlCkoj8qQjbxIEHmAMFPeNB+WS iuf0knLsYSFNsw/UvvXAwSyH+ZI4wBmFJHgdqrPO+XUXyysWfybqqj5xFTH6HXot3J6siF4/W0m 5Y9U0Ru9VipKVv6VtXjQLe2T3uprsE4MzjgFSD1NVTt9cXNcGjAD0biOnF2ych7VKBdfYP90q/a OenzkBrmuXpHLKUf4vQLrwcITnKb23DcwckFQtRSoF13Agph5Lk7Q3vtS8zeoFT9ZWwDrDXSH55 K0yxEe9SeOayrzBdHtvsPp1b7XTuotYtkIOgf2Df3kjMyOT0
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
 drivers/media/platform/renesas/sh_vou.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/sh_vou.c b/drivers/media/platform/renesas/sh_vou.c
index ca4310e26c49..8fe3272a541f 100644
--- a/drivers/media/platform/renesas/sh_vou.c
+++ b/drivers/media/platform/renesas/sh_vou.c
@@ -1343,7 +1343,7 @@ static int sh_vou_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sh_vou_remove(struct platform_device *pdev)
+static void sh_vou_remove(struct platform_device *pdev)
 {
 	struct v4l2_device *v4l2_dev = platform_get_drvdata(pdev);
 	struct sh_vou_device *vou_dev = container_of(v4l2_dev,
@@ -1356,11 +1356,10 @@ static int sh_vou_remove(struct platform_device *pdev)
 	video_unregister_device(&vou_dev->vdev);
 	i2c_put_adapter(client->adapter);
 	v4l2_device_unregister(&vou_dev->v4l2_dev);
-	return 0;
 }
 
 static struct platform_driver sh_vou = {
-	.remove  = sh_vou_remove,
+	.remove_new = sh_vou_remove,
 	.driver  = {
 		.name	= "sh-vou",
 	},
-- 
2.39.2

