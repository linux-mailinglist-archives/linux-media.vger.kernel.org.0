Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA466C956E
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbjCZOda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjCZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECF77DA9
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-00087U-ID; Sun, 26 Mar 2023 16:32:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-006rbp-6w; Sun, 26 Mar 2023 16:32:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-0088WH-Vn; Sun, 26 Mar 2023 16:32:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 039/117] media: imx-pxp: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:06 +0200
Message-Id: <20230326143224.572654-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mVUQPhy61vCRwq0BXxL+2o+PGJnktd/oNm3ktQgT7jo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa1voPinyhetmZyrYhk5xNO3LTQw0NaMqqMc MvXsoUY2ziJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWtQAKCRCPgPtYfRL+ TlABB/4za/6ou3sGTJIz2Ml7ZJC6i7yqbn2lFL3XaxUEuPBy96zgCfOFHc4SgR92m+XpcxCRpK3 RjTtGO5wCYUtyf2/1Gr/8q2xGKwiFEMknITYuOO0xyPskA4bOtSvXxNNyuKb5JgU5BWb6UDfQ0a v41wSUhJkmgFFHreg1+LZq3dq77L0ygdCCcrZiIh4AWmcvT5HhjJ45YYwnasMihmPOXuc5lGNyd zyGH2eE/Udb9UHoQwiMgqo1gkZfqH0jiIoPwiiOjIVUFGT8m+WbpXQbdgLpzGa7bZRViRehs37v Qe+Eyes9NLoFwN2Llzzp4eIqhspTU0p+DQRbAzYLaFLv3fsV
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
 drivers/media/platform/nxp/imx-pxp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index fde3c36e5e1d..90f319857c23 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1904,7 +1904,7 @@ static int pxp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pxp_remove(struct platform_device *pdev)
+static void pxp_remove(struct platform_device *pdev)
 {
 	struct pxp_dev *dev = platform_get_drvdata(pdev);
 
@@ -1922,8 +1922,6 @@ static int pxp_remove(struct platform_device *pdev)
 	video_unregister_device(&dev->vfd);
 	v4l2_m2m_release(dev->m2m_dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
-
-	return 0;
 }
 
 static const struct pxp_pdata pxp_imx6ull_pdata = {
@@ -1943,7 +1941,7 @@ MODULE_DEVICE_TABLE(of, pxp_dt_ids);
 
 static struct platform_driver pxp_driver = {
 	.probe		= pxp_probe,
-	.remove		= pxp_remove,
+	.remove_new	= pxp_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 		.of_match_table = pxp_dt_ids,
-- 
2.39.2

