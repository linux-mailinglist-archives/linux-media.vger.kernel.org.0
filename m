Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0E54CDA11
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241074AbiCDRVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241135AbiCDRUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:20:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1581CE987
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:20:00 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50BFF1861;
        Fri,  4 Mar 2022 18:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414385;
        bh=/jCGev2WvWrATWk4TzkConlBUZHS/yDNrmdcWqEHp7s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oe6ms9J6V8zFJ5Nycagd50RoDO/e9myWpOl5F/GnPlDgekyuj8YtD0Gd+Th4ycp7B
         V3B6iatl1il922So880OZpHC3U2M61lP2B9KFZbsPp8yXvFr2PIN1xmVDgtN0D+JoH
         wvri4AWAi+4q5YvHo8m/T8LNDB5TAsSYFIcL0tZA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 07/17] media: rkisp1: Simplify rkisp1_entities_register() error path
Date:   Fri,  4 Mar 2022 19:19:15 +0200
Message-Id: <20220304171925.1592-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that all the unregistration functions are safe to call on
non-registered entities, the error path in rkisp1_entities_register()
can be simplified. Factor out the unregistration to a separate function
to share code with rkisp1_remove().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 40 +++++++++----------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 3f5cfa7eb937..f8b2573aa9da 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -346,48 +346,50 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
  * Core
  */
 
+static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
+{
+	rkisp1_params_unregister(rkisp1);
+	rkisp1_stats_unregister(rkisp1);
+	rkisp1_capture_devs_unregister(rkisp1);
+	rkisp1_resizer_devs_unregister(rkisp1);
+	rkisp1_isp_unregister(rkisp1);
+}
+
 static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 {
 	int ret;
 
 	ret = rkisp1_isp_register(rkisp1);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = rkisp1_resizer_devs_register(rkisp1);
 	if (ret)
-		goto err_unreg_isp_subdev;
+		goto error;
 
 	ret = rkisp1_capture_devs_register(rkisp1);
 	if (ret)
-		goto err_unreg_resizer_devs;
+		goto error;
 
 	ret = rkisp1_stats_register(rkisp1);
 	if (ret)
-		goto err_unreg_capture_devs;
+		goto error;
 
 	ret = rkisp1_params_register(rkisp1);
 	if (ret)
-		goto err_unreg_stats;
+		goto error;
 
 	ret = rkisp1_subdev_notifier(rkisp1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"Failed to register subdev notifier(%d)\n", ret);
-		goto err_unreg_params;
+		goto error;
 	}
 
 	return 0;
-err_unreg_params:
-	rkisp1_params_unregister(rkisp1);
-err_unreg_stats:
-	rkisp1_stats_unregister(rkisp1);
-err_unreg_capture_devs:
-	rkisp1_capture_devs_unregister(rkisp1);
-err_unreg_resizer_devs:
-	rkisp1_resizer_devs_unregister(rkisp1);
-err_unreg_isp_subdev:
-	rkisp1_isp_unregister(rkisp1);
+
+error:
+	rkisp1_entities_unregister(rkisp1);
 	return ret;
 }
 
@@ -583,11 +585,7 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&rkisp1->notifier);
 	v4l2_async_nf_cleanup(&rkisp1->notifier);
 
-	rkisp1_params_unregister(rkisp1);
-	rkisp1_stats_unregister(rkisp1);
-	rkisp1_capture_devs_unregister(rkisp1);
-	rkisp1_resizer_devs_unregister(rkisp1);
-	rkisp1_isp_unregister(rkisp1);
+	rkisp1_entities_unregister(rkisp1);
 
 	media_device_unregister(&rkisp1->media_dev);
 	v4l2_device_unregister(&rkisp1->v4l2_dev);
-- 
Regards,

Laurent Pinchart

