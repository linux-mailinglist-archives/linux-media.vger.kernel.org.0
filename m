Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8891E6C9599
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjCZOeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjCZOdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892943C0A
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQS-0000Wx-N5; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-006rhg-QX; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0088b1-Tg; Sun, 26 Mar 2023 16:32:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 112/117] media: vidtv_bridge: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:19 +0200
Message-Id: <20230326143224.572654-115-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hy44/ZfCUQags6wJta3/fPH5qWXuZtGZpZeBQrnbG3c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdMTP+tUS1Ld11GRu0Y56C51BD3IgN/yQvPw /vqj0jqWDuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXTAAKCRCPgPtYfRL+ TvBtB/9ruTCb8by65GGIX31jFvoR8s2l+gCQJ55rDD1RrORWEnwprbLuGjbKovWx8xNnXiLhd5b EfHsUNh+Yzkkn1ZyWZYtTT+qpkcvvhsqF0IQU8rdDWfiR57g/kxneZf+2IkoeNjnel5+Gf9W6ou pC8CsRogNhVi6e7JXJVa+4eGrhIH0g44Dt5jYSWOqUOTJej+hirgPVlRvo3LgQ/8tMsup0FWU8e Ye/9kN9RduZcna5pVaTmEcrFQy23fgttln17eYOrdkyMsXNMSk2KnHy0szPq9jCA3r/6B8PzkJM bORnQ+lg/FyGIUEaI2O3anfKaNo1k28+0h6YZ1Qi/t0CRoXS
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
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index dff7265a42ca..8b04e12af286 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -528,7 +528,7 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vidtv_bridge_remove(struct platform_device *pdev)
+static void vidtv_bridge_remove(struct platform_device *pdev)
 {
 	struct vidtv_dvb *dvb;
 	u32 i;
@@ -552,8 +552,6 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
 	dev_info(&pdev->dev, "Successfully removed vidtv\n");
-
-	return 0;
 }
 
 static void vidtv_bridge_dev_release(struct device *dev)
@@ -574,7 +572,7 @@ static struct platform_driver vidtv_bridge_driver = {
 		.name = VIDTV_PDEV_NAME,
 	},
 	.probe    = vidtv_bridge_probe,
-	.remove   = vidtv_bridge_remove,
+	.remove_new = vidtv_bridge_remove,
 };
 
 static void __exit vidtv_bridge_exit(void)
-- 
2.39.2

