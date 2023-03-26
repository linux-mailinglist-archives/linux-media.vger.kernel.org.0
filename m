Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4135C6C9598
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjCZOeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbjCZOc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78038186
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0000L2-44; Sun, 26 Mar 2023 16:32:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-006rgc-Uv; Sun, 26 Mar 2023 16:32:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0088aH-7i; Sun, 26 Mar 2023 16:32:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 100/117] media: radio-timb: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:07 +0200
Message-Id: <20230326143224.572654-103-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nWvweDVqfu3Nzzfs+iXDU6woYmBXHy6lg55QsX9SW0w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFcQYHRMdQAN/UTpdGePU06mqNjXFAPLlgfTK CbJ7e8jy4yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXEAAKCRCPgPtYfRL+ Thc2CACALeSbXVVS1FH7Un3EpAi9OlN1oMBqi26jnj8Ter3oASBeXd9j+CKpkJbbTgnm4gg3GA2 X895KD0IjBR0ZL6kxJENjh9nNl0ngNV03Lgk9w7ua2sO3EMSFTVQGKaQ/pKakXs47aP1+zsbjPN m6cN384bpUDG0PvrsIquA++CZxI7KRKGzLJNmjBkQPnKE99lNBHOVCktZQsbQse+WO0TH+0kBGA K0LoRKwoQhRX2SF3Cwx8Secr6DdhQTR6iGFxJxuDVc7CK9ou1vSRmziqWMj+hEx02LYpRk9aoy/ Uu2C34jVF/ydfYU+V87i8NG6GuILYNQ+Fl32mI8dS1jU9/RK
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
 drivers/media/radio/radio-timb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/radio/radio-timb.c b/drivers/media/radio/radio-timb.c
index 948ee3eec914..04daa9c358c2 100644
--- a/drivers/media/radio/radio-timb.c
+++ b/drivers/media/radio/radio-timb.c
@@ -151,13 +151,12 @@ static int timbradio_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int timbradio_remove(struct platform_device *pdev)
+static void timbradio_remove(struct platform_device *pdev)
 {
 	struct timbradio *tr = platform_get_drvdata(pdev);
 
 	video_unregister_device(&tr->video_dev);
 	v4l2_device_unregister(&tr->v4l2_dev);
-	return 0;
 }
 
 static struct platform_driver timbradio_platform_driver = {
@@ -165,7 +164,7 @@ static struct platform_driver timbradio_platform_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= timbradio_probe,
-	.remove		= timbradio_remove,
+	.remove_new	= timbradio_remove,
 };
 
 module_platform_driver(timbradio_platform_driver);
-- 
2.39.2

