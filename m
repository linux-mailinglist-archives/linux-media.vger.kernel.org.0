Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAB86C959B
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjCZOeR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbjCZOdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2533C1FFA
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQS-0000Up-39; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-006rhX-9t; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0088ay-LI; Sun, 26 Mar 2023 16:32:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 111/117] media: vicodec-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:18 +0200
Message-Id: <20230326143224.572654-114-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=j1Q2miNrJ6gXWbqYIrvvkQQNM18mtJRkrTiAC8i+MOY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdLHlQJto3xLikC2rC2IW99fAmqzzxNTbFzX Nlpjr6n1XOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXSwAKCRCPgPtYfRL+ TkVJB/931L4glvHdrTJY8PmhTNrtjNgVTFYW6pxTXtGXglLTqf+DSOnpGLCIGdwd60sMASaSq7w ykz2tP7O1NpGgns/s2zx5KrIs/gLo/iiyjDILy1NM03E7cnmNUCjbI1feEMFI0q1Lix2CsYCxbU HTfRyupCuvquyuvs97KALrrRv+JuACRTIiWNhrAXi71hpY4evDauFEYyTGumIV6iuNkPGEN+II8 LvN8GZ/1/EcKmlcWIoFrVEu2uuUE91IILoaciaUMWq/mHA8g4lmYnTmmdqjfK0zkpXjPF9CVz0r WJbhAFePsGVptw13vg/Wp2nAE7NAcn/A7pxyzLuYfH0xO67y
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
 drivers/media/test-drivers/vicodec/vicodec-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 1d1bee111732..6f0e20df74e9 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -2179,7 +2179,7 @@ static int vicodec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vicodec_remove(struct platform_device *pdev)
+static void vicodec_remove(struct platform_device *pdev)
 {
 	struct vicodec_dev *dev = platform_get_drvdata(pdev);
 
@@ -2196,13 +2196,11 @@ static int vicodec_remove(struct platform_device *pdev)
 	video_unregister_device(&dev->stateful_dec.vfd);
 	video_unregister_device(&dev->stateless_dec.vfd);
 	v4l2_device_put(&dev->v4l2_dev);
-
-	return 0;
 }
 
 static struct platform_driver vicodec_pdrv = {
 	.probe		= vicodec_probe,
-	.remove		= vicodec_remove,
+	.remove_new	= vicodec_remove,
 	.driver		= {
 		.name	= VICODEC_NAME,
 	},
-- 
2.39.2

