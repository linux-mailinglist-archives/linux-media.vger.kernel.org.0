Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E480D6C958C
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjCZOeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbjCZOcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE2D7EDF
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000EB-Au; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-006rfg-Ue; Sun, 26 Mar 2023 16:32:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQK-0088ZY-Pj; Sun, 26 Mar 2023 16:32:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 089/117] media: omap_vout: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:56 +0200
Message-Id: <20230326143224.572654-92-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nblhNa8GMIbQ6zHewbCwjyp1L651cE5gn0ls0Q9QTMk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsA9VejVPo842nfmjHG2ft7pdVEWmm/fApRmL00TWJ 56ut8zvZDRiYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAibR/Zf3RVVeqLiE3zc3KX nftAek+Wj0RJ7+WWI6vqkrnWPVa8fFa57+pLmQKFAIc04QPpkrUu2ydv2bTOd/u9NUmP4quDfKY vdWpKlAhq2a604sKd94dyVLU/yCgHqZ7UUlj5Sq1p615PKwmtI4ru2/56tBhEzPTzi9Q6vTWo6/ KyXlnFjTH+u4zW+7lYyf387ZX2p+vnVKvfYbyBEdGJsXsZ0+/17W7rjTD1lk3+G7wt+abA/GmP9 9817flcZF32Lt13gcIH1yuv3V/1tgYlnZVe6tl7cfIaH7YFU2xM/6afSdF/Zx8VunL/2ZkbFSZm pthpXFwdmTjrJv8n66UT105kbWp8N3XxifMfYtybleQA
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
 drivers/media/platform/ti/omap/omap_vout.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 3e0d9af7ffec..4143274089c3 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1569,7 +1569,7 @@ static void omap_vout_cleanup_device(struct omap_vout_device *vout)
 	kfree(vout);
 }
 
-static int omap_vout_remove(struct platform_device *pdev)
+static void omap_vout_remove(struct platform_device *pdev)
 {
 	int k;
 	struct v4l2_device *v4l2_dev = platform_get_drvdata(pdev);
@@ -1587,7 +1587,6 @@ static int omap_vout_remove(struct platform_device *pdev)
 		omap_dss_put_device(vid_dev->displays[k]);
 	}
 	kfree(vid_dev);
-	return 0;
 }
 
 static int __init omap_vout_probe(struct platform_device *pdev)
@@ -1721,7 +1720,7 @@ static struct platform_driver omap_vout_driver = {
 	.driver = {
 		.name = VOUT_NAME,
 	},
-	.remove = omap_vout_remove,
+	.remove_new = omap_vout_remove,
 };
 
 static int __init omap_vout_init(void)
-- 
2.39.2

