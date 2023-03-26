Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885E66C9526
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbjCZOck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbjCZOcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C79F6EA9
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0007pq-IZ; Sun, 26 Mar 2023 16:32:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ5-006rZv-N1; Sun, 26 Mar 2023 16:32:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0088Uj-OC; Sun, 26 Mar 2023 16:32:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 015/117] media: vpu_core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:42 +0200
Message-Id: <20230326143224.572654-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uWJoADSe8unMBF1PXvz1xJOQaeh403qpKoHJWEMsKwk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaUVPNuMmBrk/3Jc7xZqrqr/DamAgknp8n6K d6g2HKKPTuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWlAAKCRCPgPtYfRL+ TjWMB/441xL02tLrXDIlKB0U36Wq2my2ziav0yB9bhhUzZO+cX4mCqRYyo3U/Ywp0Usm1wgoFod PQ2/J1MBE/s6RMlhBdrTnainB06wa30dleElcZ7g2bKYYdNsvaDjzJTGGcGWnhi7KprMlTaBcZg Al8PnjQvCZgr9xoVLcOKYiqgbb0JwGOhRvLPaRy4jNBoxd5ekbbxFfVAb92hwHkXuR9wdF3iky+ mtdAQrC5KKUQ++rS01VX2T8adG1DAJdsciLvQvPtz4XEBxQeWG6deRpajw8NhtmHMjVvu7ExVpN Jhb3dFlvgHtur5VIaPGa9uhXH7jtuocejljpHwbCef77FFCx
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
 drivers/media/platform/amphion/vpu_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index f9ec1753f7c8..de23627a119a 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -709,7 +709,7 @@ static int vpu_core_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vpu_core_remove(struct platform_device *pdev)
+static void vpu_core_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vpu_core *core = platform_get_drvdata(pdev);
@@ -728,8 +728,6 @@ static int vpu_core_remove(struct platform_device *pdev)
 	memunmap(core->rpc.virt);
 	mutex_destroy(&core->lock);
 	mutex_destroy(&core->cmd_lock);
-
-	return 0;
 }
 
 static int __maybe_unused vpu_core_runtime_resume(struct device *dev)
@@ -864,7 +862,7 @@ MODULE_DEVICE_TABLE(of, vpu_core_dt_match);
 
 static struct platform_driver amphion_vpu_core_driver = {
 	.probe = vpu_core_probe,
-	.remove = vpu_core_remove,
+	.remove_new = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
 		.of_match_table = vpu_core_dt_match,
-- 
2.39.2

