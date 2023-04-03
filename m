Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6368C6D4C21
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbjDCPk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjDCPk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBA226AF
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIB-0004fG-6D; Mon, 03 Apr 2023 17:40:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-008ibL-GH; Mon, 03 Apr 2023 17:40:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-00AHxK-HR; Mon, 03 Apr 2023 17:40:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 14/24] staging: media: rkvdec: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:04 +0200
Message-Id: <20230403154014.2564054-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aYW8yQnBrMkMM77Xam+1yHywljoTQ6r3WzFLmSM8zHo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNFHj+rVqhEcmHGr+5GVmb/w2GoHnRBwVd0l EQflEQSGxqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzRQAKCRCPgPtYfRL+ Tor+B/9aiLVMyDmNRvI39fdjAvqB99aUsPoL2ns6k0IdyGNhJZsa/VB/3bcOZJIKLG+q7KTZA3Y VOhuzpRAzuLGUDcSz8VKLO9wr17bwM7rGjOA4jHFwgDUf0FCdf629s5l+GinjNKEJwoirx8fXOY Ca8ETjl3uI7nNA36R2Tb67iSyU5GWXm3DblCSQJbT7Q3VkBk5qHPQreaCgd+FMceqqS3Y4yuY1R uni9mOF1vu1RdzRe65jqwpRFPQflADqX61/KWpbBM+AjDrawAFLEek0NgwPB0LdQUEf/MMILvrD l2w3j6sJO82LkdtdsEjBMViNFWATJFAZvNw7yXwPnxiaWW7D
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
 drivers/staging/media/rkvdec/rkvdec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7bab7586918c..3df977653ba5 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1062,14 +1062,13 @@ static int rkvdec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rkvdec_remove(struct platform_device *pdev)
+static void rkvdec_remove(struct platform_device *pdev)
 {
 	struct rkvdec_dev *rkvdec = platform_get_drvdata(pdev);
 
 	rkvdec_v4l2_cleanup(rkvdec);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1099,7 +1098,7 @@ static const struct dev_pm_ops rkvdec_pm_ops = {
 
 static struct platform_driver rkvdec_driver = {
 	.probe = rkvdec_probe,
-	.remove = rkvdec_remove,
+	.remove_new = rkvdec_remove,
 	.driver = {
 		   .name = "rkvdec",
 		   .of_match_table = of_rkvdec_match,
-- 
2.39.2

