Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2666C9583
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbjCZOdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E8E7ECC
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0000GL-69; Sun, 26 Mar 2023 16:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rgB-Td; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-0088Zp-TV; Sun, 26 Mar 2023 16:32:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 094/117] media: video-mux: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:01 +0200
Message-Id: <20230326143224.572654-97-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=h1onB/c1Jnrpm4RTRzscKg21G0D/eJyhFSEGCySoO2Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFb1eA7MaooTUb0Xcs81sXqjXayel8WLXW6Ku pTvFH3EZ4KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW9QAKCRCPgPtYfRL+ TvkvCACiUUarEWB50YIbkYouYFf+P+Dus1wS0UYKfx1sdPCefJNdoD8fLfzsOs/bxAF1rbeNcms g3oUl88zSSmR/r7kU4QKxZLrQpPPW6nR6z4VpTioX70KT7w993Uey/XWyVUR1onTAdeFt13KcdM 2e3LGMZlFd6bzgN+aQ81nWYMNj0axKyc0V/fKEgxObGP0KhkKQhEa/eAwQimFDOXwjBZo/kZUOW dAc5htirvnbfdRLUvyQ9wSpiIQ7UL3kkViSLbTWB6GSH4zZzWVpe75WgeIwkB9ModyRML5Orac6 baor3/QkvdmB3bXTcZWtClPPtVquj4jvzXxPu8GHYttC6ALt
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
 drivers/media/platform/video-mux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 71d97042a470..1d9f32e5a917 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -481,7 +481,7 @@ static int video_mux_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int video_mux_remove(struct platform_device *pdev)
+static void video_mux_remove(struct platform_device *pdev)
 {
 	struct video_mux *vmux = platform_get_drvdata(pdev);
 	struct v4l2_subdev *sd = &vmux->subdev;
@@ -490,8 +490,6 @@ static int video_mux_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&vmux->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
-
-	return 0;
 }
 
 static const struct of_device_id video_mux_dt_ids[] = {
@@ -502,7 +500,7 @@ MODULE_DEVICE_TABLE(of, video_mux_dt_ids);
 
 static struct platform_driver video_mux_driver = {
 	.probe		= video_mux_probe,
-	.remove		= video_mux_remove,
+	.remove_new	= video_mux_remove,
 	.driver		= {
 		.of_match_table = video_mux_dt_ids,
 		.name = "video-mux",
-- 
2.39.2

