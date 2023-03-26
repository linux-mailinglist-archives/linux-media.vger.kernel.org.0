Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4865B6C95A5
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjCZOe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbjCZOdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21D749D9
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQT-0000af-No; Sun, 26 Mar 2023 16:32:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-006ri1-SW; Sun, 26 Mar 2023 16:32:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0088bI-Oa; Sun, 26 Mar 2023 16:32:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 116/117] media: vivid-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:23 +0200
Message-Id: <20230326143224.572654-119-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=psP47iJQfgDho0z51O3/c3SCet6c2oqTgrRbhvyMpa8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSF8Gjd+R2hv2YcY6ws6xKYG3zuScXDZVHPovKfVu88a ph9fnJzJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATeV/O/j+wXsVg8/afeT2+ gWsZOCymzb82JzEtSc59o53Y8cD7SSIae4zdisyOvs5YFM7Oc3lbVyef4eHD93ucq/Myw7nldd9 N35prrB+frCJzw2aP5zZurjmn9HfGhzFprilK9Zhzos123ay6hMwcPY/fuVN8fi45HfuU1ePemR oDBlX2db0VZY+4ru/4lRAy/eXHQ6GlLLWvoldaVHxgrfj8OLVdxCq7KKjA9MPD2Ef1OTrtm90ZV u2aP3U3Y6PtnMaaxSXvLi6dNG+By89UT9nXK4SO6k5pttJ7nPtbaOVh0e8lnoWStm0r765+/uNc RV/67Pu2WZKmR1l7rygoKJV5tMQ/mOshPrl02snoo9NTAQ==
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
 drivers/media/test-drivers/vivid/vivid-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f28440e6c9f8..b4fbe32ed538 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -2058,7 +2058,7 @@ static int vivid_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vivid_remove(struct platform_device *pdev)
+static void vivid_remove(struct platform_device *pdev)
 {
 	struct vivid_dev *dev;
 	unsigned int i, j;
@@ -2138,7 +2138,6 @@ static int vivid_remove(struct platform_device *pdev)
 		v4l2_device_put(&dev->v4l2_dev);
 		vivid_devs[i] = NULL;
 	}
-	return 0;
 }
 
 static void vivid_pdev_release(struct device *dev)
@@ -2152,7 +2151,7 @@ static struct platform_device vivid_pdev = {
 
 static struct platform_driver vivid_pdrv = {
 	.probe		= vivid_probe,
-	.remove		= vivid_remove,
+	.remove_new	= vivid_remove,
 	.driver		= {
 		.name	= "vivid",
 	},
-- 
2.39.2

