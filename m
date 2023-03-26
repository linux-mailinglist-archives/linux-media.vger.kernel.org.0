Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBD16C95AA
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjCZOec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbjCZOdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D1765AB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0000GD-Iz; Sun, 26 Mar 2023 16:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rg7-Qn; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-0088Zv-5E; Sun, 26 Mar 2023 16:32:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 095/117] media: xilinx-csi2rxss: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:02 +0200
Message-Id: <20230326143224.572654-98-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FZR4BFA0Qk42KswnwMjnFUu/VtbyKPil5uHT81HsGo4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsD+pFaoTc9sYO8RXXfovlvmVO688aFv8lRROFX+Nl Ok1l7I7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiIJiP7//hJoZW7y091sW6S jqyxmSJjPLnkEA8vTxcTd2V8xtTkatGvk7lfP7z1vYazt/uneoDolIv7c1ZPEWFIqSiJWJDLcCv E4Jv0ng9xXUbH09NmRZzxbvyRwrNVeZ5p2/bK/uJvHz7JaHoblu5YvlHKlqkw7xhLS/RNsSO2Oy 5N/6H6zflchqZ1xbO/8xY1yNVxqfu81dnzmu1QpHC28cTWk3WSma9EdRs6xS4+ms86n+/va6Pqt 7NmV2id9LYRXWNj4L0l7+7v0x0bMn8/ynSpDW6evPHKxrkrtxzflOc7NTAh0U5EPWiVY+GjWX+V bm9UMbHwjA/NmrtWQa7yzjzW1/LyDnnzqxq9d85JDXgPAA==
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
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index d8a23f18cfbc..5b53745fe44e 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -1059,7 +1059,7 @@ static int xcsi2rxss_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xcsi2rxss_remove(struct platform_device *pdev)
+static void xcsi2rxss_remove(struct platform_device *pdev)
 {
 	struct xcsi2rxss_state *xcsi2rxss = platform_get_drvdata(pdev);
 	struct v4l2_subdev *subdev = &xcsi2rxss->subdev;
@@ -1070,8 +1070,6 @@ static int xcsi2rxss_remove(struct platform_device *pdev)
 	mutex_destroy(&xcsi2rxss->lock);
 	clk_bulk_disable_unprepare(num_clks, xcsi2rxss->clks);
 	clk_bulk_put(num_clks, xcsi2rxss->clks);
-
-	return 0;
 }
 
 static const struct of_device_id xcsi2rxss_of_id_table[] = {
@@ -1086,7 +1084,7 @@ static struct platform_driver xcsi2rxss_driver = {
 		.of_match_table	= xcsi2rxss_of_id_table,
 	},
 	.probe			= xcsi2rxss_probe,
-	.remove			= xcsi2rxss_remove,
+	.remove_new		= xcsi2rxss_remove,
 };
 
 module_platform_driver(xcsi2rxss_driver);
-- 
2.39.2

