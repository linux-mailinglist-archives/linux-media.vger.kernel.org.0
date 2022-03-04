Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2524CDA1B
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiCDRVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241103AbiCDRUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:20:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5591C74EA
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:19:53 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46F331870;
        Fri,  4 Mar 2022 18:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414383;
        bh=tLZBOFv4Sua4nht15QHP+PeXEWtGdX9eu22/SW0N0NY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DEuX4DLm18LPAZunE+iKMFc9QHLbiYJ5/jWXLr/9A4i7yEsmYEY47smpD4G97wklo
         mcUYaIHq0+CtRbofNDVqSqNwzKldQT8gpoQvSORYB40Q8sXW88iXKYjUmP8fMWes9V
         yhe/WZlxsuoiDGLaCtRfswFqfwpExlzXiVcofF/s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 04/17] media: rkisp1: resizer: Fix and simplify (un)registration
Date:   Fri,  4 Mar 2022 19:19:12 +0200
Message-Id: <20220304171925.1592-5-laurent.pinchart@ideasonboard.com>
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

The rkisp1_rsz_register() and rkisp1_rsz_unregister() functions don't
destroy the mutex (in the error path for the former). Fix this, simplify
error handling at registration time as media_entity_cleanup() can be
called on an uninitialized entity, and make rkisp1_rsz_unregister() and
rkisp1_resizer_devs_unregister() safe to be called on an unregistered
resizer subdev to prepare for simplification of error handling at probe
time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Reset rsz->rkisp1 in rkisp1_resizer_devs_register()
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 2070f4b06705..df2beee1be99 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -782,8 +782,12 @@ static const struct v4l2_subdev_ops rkisp1_rsz_ops = {
 
 static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 {
+	if (!rsz->rkisp1)
+		return;
+
 	v4l2_device_unregister_subdev(&rsz->sd);
 	media_entity_cleanup(&rsz->sd.entity);
+	mutex_destroy(&rsz->ops_lock);
 }
 
 static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
@@ -821,47 +825,43 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 	mutex_init(&rsz->ops_lock);
 	ret = media_entity_pads_init(&sd->entity, RKISP1_RSZ_PAD_MAX, pads);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = v4l2_device_register_subdev(&rsz->rkisp1->v4l2_dev, sd);
 	if (ret) {
 		dev_err(sd->dev, "Failed to register resizer subdev\n");
-		goto err_cleanup_media_entity;
+		goto error;
 	}
 
 	rkisp1_rsz_init_config(sd, &state);
 	return 0;
 
-err_cleanup_media_entity:
+error:
 	media_entity_cleanup(&sd->entity);
-
+	mutex_destroy(&rsz->ops_lock);
 	return ret;
 }
 
 int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1)
 {
-	struct rkisp1_resizer *rsz;
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(rkisp1->resizer_devs); i++) {
-		rsz = &rkisp1->resizer_devs[i];
+		struct rkisp1_resizer *rsz = &rkisp1->resizer_devs[i];
+
 		rsz->rkisp1 = rkisp1;
 		rsz->id = i;
+
 		ret = rkisp1_rsz_register(rsz);
-		if (ret)
-			goto err_unreg_resizer_devs;
+		if (ret) {
+			rsz->rkisp1 = NULL;
+			rkisp1_resizer_devs_unregister(rkisp1);
+			return ret;
+		}
 	}
 
 	return 0;
-
-err_unreg_resizer_devs:
-	for (j = 0; j < i; j++) {
-		rsz = &rkisp1->resizer_devs[j];
-		rkisp1_rsz_unregister(rsz);
-	}
-
-	return ret;
 }
 
 void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1)
-- 
Regards,

Laurent Pinchart

