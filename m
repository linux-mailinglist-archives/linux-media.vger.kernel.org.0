Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E436C959F
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjCZOeV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjCZOdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4FA3591
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQT-0000YH-0B; Sun, 26 Mar 2023 16:32:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-006rhm-46; Sun, 26 Mar 2023 16:32:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0088b4-4e; Sun, 26 Mar 2023 16:32:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 113/117] media: vim2m: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:20 +0200
Message-Id: <20230326143224.572654-116-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7o52xkodu6t64Pqyc/kc6V6sDslcxfg6NqdzZK5ejc0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSF8KCXBYoKcR4F2ZrZzLZ7r7pNymW/9vD/wTz1e/PsW esOch/rZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiwWHs/6NMGhiXMXxqzFA+ OPP4h0cfJSwyYn/ZByub5JdMFJn0r1G5fIofx20HtgeZlfvezoi32iP16CPfiVeMi4TXO725b1U qbebGUBb/0mrOxklhOQ3s5bxarxZGFbBY9Dtxtzu9K18n3PlqeZfIgfSC9Vfil25ia7J5W7iwgN lENrgmxyJ30izZzJSmqxzxPh4mQhWHtrnc1TKZa+6Szm/IePopQ17s5VdKxv6XtJoV7WweFf7Y+ WKXTfPCHRPfSshNXGG/S3CDo95txjcmbfe37zmocfPLlQeaH75NzVkzwVf537VDDaKyqtHbNNof qnNci1+mJKyQGf3sWkmhdMa3jV+vaS2xFNTIXlnsetwZAA==
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
 drivers/media/test-drivers/vim2m.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 7964426bf2f7..3e3b424b4860 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1379,7 +1379,7 @@ static int vim2m_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vim2m_remove(struct platform_device *pdev)
+static void vim2m_remove(struct platform_device *pdev)
 {
 	struct vim2m_dev *dev = platform_get_drvdata(pdev);
 
@@ -1390,13 +1390,11 @@ static int vim2m_remove(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 #endif
 	video_unregister_device(&dev->vfd);
-
-	return 0;
 }
 
 static struct platform_driver vim2m_pdrv = {
 	.probe		= vim2m_probe,
-	.remove		= vim2m_remove,
+	.remove_new	= vim2m_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 	},
-- 
2.39.2

