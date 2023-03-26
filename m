Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7238A6C9597
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbjCZOeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbjCZOc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE6A198
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-0008No-88; Sun, 26 Mar 2023 16:32:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-006rct-LL; Sun, 26 Mar 2023 16:32:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-0088XG-D6; Sun, 26 Mar 2023 16:32:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 055/117] media: rzg2l-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:22 +0200
Message-Id: <20230326143224.572654-58-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=b6L/l/VBIAmAssUNJg0IOOO3LNYWI2puHGSlGl2+BGU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbIf1DXjA/46S8j3G/OGk0JjJ1nPKS8NR0ki gtaZgg9Wm2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWyAAKCRCPgPtYfRL+ TitBB/4t7CUpdZ/t2QiFg/sKbzkW5XWq4tyQ6kEcc+zy5pWMqc1pPMRJVD2rseMo5R3pmxM6e38 yXClqtwFgVOiucdg+uqQkmAyhUE6mv75K3+5lFFK3cgiFmTnFXTdeFf3mC9xiry6dCE/fNmhyON xmCmKpDOcPmrtzDnPjvUM7Coi8g6HrmBYjgvrAsV6acCoF7Dyl543WYFSjmUEtPQ1+nt/BPylU1 gB0LhWcGjrT7kIlYBqWybDdOaLipQZ1WuZcnc7+qWIM8wOy/sX4kgC0UydWc6bImnWwVB42xfK3 6LFP//jRXoHB02txlYcYFoQVkZJVvAK1v2AygpWCZXW4OcHH
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
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 5939f5165a5e..7a71370fcc32 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -298,7 +298,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rzg2l_cru_remove(struct platform_device *pdev)
+static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
@@ -312,8 +312,6 @@ static int rzg2l_cru_remove(struct platform_device *pdev)
 	mutex_destroy(&cru->mdev_lock);
 
 	rzg2l_cru_dma_unregister(cru);
-
-	return 0;
 }
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
@@ -328,7 +326,7 @@ static struct platform_driver rzg2l_cru_driver = {
 		.of_match_table = rzg2l_cru_of_id_table,
 	},
 	.probe = rzg2l_cru_probe,
-	.remove = rzg2l_cru_remove,
+	.remove_new = rzg2l_cru_remove,
 };
 
 module_platform_driver(rzg2l_cru_driver);
-- 
2.39.2

