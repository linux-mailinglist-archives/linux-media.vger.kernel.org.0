Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AAB6C955B
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbjCZOdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjCZOco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123DB65AC
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ9-0007uX-SM; Sun, 26 Mar 2023 16:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ8-006rax-CH; Sun, 26 Mar 2023 16:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-0088Vb-J9; Sun, 26 Mar 2023 16:32:31 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Moudy Ho <moudy.ho@mediatek.com>,
        Qiheng Lin <linqiheng@huawei.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 028/117] media: mtk-mdp3-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:55 +0200
Message-Id: <20230326143224.572654-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jkf5L5dQSyQohhm9KTe95OwaXqfBXlh7AMsHg9iF88o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaoSBDTbn24ir03DGKWIxpj0tpH/SFo14z6b AA5Yd1GPEmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWqAAKCRCPgPtYfRL+ ToTHB/93xJPhkrxuOzwhK6gL5NavTvpgyizxFjQDjhtkK56Kh81623SABfB5cicKJBZkmBD/Eks h7t7fWz2Nq9y+3TAfkeb6D7mfu7euvZCNFM57LMPX2fKRAIORfa4WwtcMCnQaVITlrQCL2gLOvO 4S1GPprLyao83yeakOKSYE4EtFxsma8tmSCtjgCmkOpq7N1E4ZT6nT02OYAh2akkpKLioXVf6Ad aT2DgQVfO8oFJnVMUgPH1F/bCjDXNHvRaxNrWG98hpsAQyGO96M92JYFJuhcaK4J1P8YRNYeDBY bdBT5X+A3LMyFYlcECHJVpCdNaJJuu8/o0B3KvfR/Ibl5VVF
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
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 97edcd9d1c81..041bcad675da 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -298,14 +298,13 @@ static int mdp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mdp_remove(struct platform_device *pdev)
+static void mdp_remove(struct platform_device *pdev)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
 
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-	return 0;
 }
 
 static int __maybe_unused mdp_suspend(struct device *dev)
@@ -345,7 +344,7 @@ static const struct dev_pm_ops mdp_pm_ops = {
 
 static struct platform_driver mdp_driver = {
 	.probe		= mdp_probe,
-	.remove		= mdp_remove,
+	.remove_new	= mdp_remove,
 	.driver = {
 		.name	= MDP_MODULE_NAME,
 		.pm	= &mdp_pm_ops,
-- 
2.39.2

