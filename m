Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62856D4C1F
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbjDCPk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbjDCPk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A4326B9
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-0004cF-Pm; Mon, 03 Apr 2023 17:40:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-008ibA-U6; Mon, 03 Apr 2023 17:40:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-00AHxC-6k; Mon, 03 Apr 2023 17:40:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 12/24] staging: media: meson: vdec: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:02 +0200
Message-Id: <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=P35Ck+M/VCEEhMxrFcldV2WJMFcTdpa/K3Pjr50rJgY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNC+Co7HXuwCgK9dynbHKEeaG/SrHOkFUjJf PSTTykY77WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzQgAKCRCPgPtYfRL+ Tq8iB/9x4510NGqWNWqDe3F7xIdKw4MHr48k3D6ErVInKJ8cbY2e9hxwfh+QDDN2NrfyEORhugN dAVuUglboK+yBgqO2sRgzqPeiCe4YxZ0DSE8qz+ZWFeja9SnkRipTWUYSlvA/j79DeEK6qkp+z6 1U1iy14P7YzLKp53mlAYIzl3dRTWwjzsNGPfjxMBxBmDPkztxADjGiTbtewobyMMP6ciUNY0atm D2kYwZNSDgy5gX00iy1hHAj69rYE9VGYUgikPMjRT3vifLU5IiaHa0CL0d2nb1PZNTCa4hqxXt1 Q7+vQd/NqegyuVe3qIBq99mNdpZje2hyLylux42jeV10bvTj
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
 drivers/staging/media/meson/vdec/vdec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 52f224d8def1..5ca4b1200831 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1106,19 +1106,17 @@ static int vdec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vdec_remove(struct platform_device *pdev)
+static void vdec_remove(struct platform_device *pdev)
 {
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
 	v4l2_device_unregister(&core->v4l2_dev);
-
-	return 0;
 }
 
 static struct platform_driver meson_vdec_driver = {
 	.probe = vdec_probe,
-	.remove = vdec_remove,
+	.remove_new = vdec_remove,
 	.driver = {
 		.name = "meson-vdec",
 		.of_match_table = vdec_dt_match,
-- 
2.39.2

