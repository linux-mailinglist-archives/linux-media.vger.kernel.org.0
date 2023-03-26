Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7546B6C956F
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjCZOdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjCZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB09658D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-000881-7r; Sun, 26 Mar 2023 16:32:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-006rbr-8u; Sun, 26 Mar 2023 16:32:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-0088WL-6M; Sun, 26 Mar 2023 16:32:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 040/117] media: imx7-media-csi: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:07 +0200
Message-Id: <20230326143224.572654-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EHmAwc5CElaBSZ9+9vvkD8ZZISHGW5Ahfuivx7WO49o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa3mYsOeikmiEQJFYElae3MsqEYG79iYj63C k/2Ws7tE5GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWtwAKCRCPgPtYfRL+ TjmWCACxbtRyWoIHYdRH3oYsHH0xdyTykhvFUJu1F2lgLMHQ5pr9RId81ZIiUEK0sExyUHDSTdz wat7oLBXD1h27mAF83033mbgBntCtd+1wcP06ArIjGQrZAg2avxkq3UJObHAvrPaqXp58pwwkNQ tek9veBau8pLnfvlbc/2GevfDv9HHeFQmleQ0rBSD1VpHcZsACbtOlpHAA5aoFzeiKxUfLER7a1 VTiY9EO0lzL1mR5JIaHZflnQgPu9Mrsl3a8RjcBFS3CaA2PqKGRdzlOhiVqQ/apPZnGfHAFi1sw Yuk2jKwl9flNaB11vIGLu111LMHNmbZH10LFr5FzYijJNoHk
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
 drivers/media/platform/nxp/imx7-media-csi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index c22bf5c827e7..9ee46c17bd02 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2278,7 +2278,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx7_csi_remove(struct platform_device *pdev)
+static void imx7_csi_remove(struct platform_device *pdev)
 {
 	struct imx7_csi *csi = platform_get_drvdata(pdev);
 
@@ -2287,8 +2287,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
 	v4l2_async_unregister_subdev(&csi->sd);
-
-	return 0;
 }
 
 static const struct of_device_id imx7_csi_of_match[] = {
@@ -2301,7 +2299,7 @@ MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
 
 static struct platform_driver imx7_csi_driver = {
 	.probe = imx7_csi_probe,
-	.remove = imx7_csi_remove,
+	.remove_new = imx7_csi_remove,
 	.driver = {
 		.of_match_table = imx7_csi_of_match,
 		.name = "imx7-csi",
-- 
2.39.2

