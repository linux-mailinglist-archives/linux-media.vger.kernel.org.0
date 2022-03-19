Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA3624DE951
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243651AbiCSQc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243645AbiCSQcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187E421C73A
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:32 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AB742A35;
        Sat, 19 Mar 2022 17:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707487;
        bh=qndOZ49rx5xr4fCumtbp33uFoQv3KFvDr2L2UUIs5YI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SgtiLxxxfEXdkwbOMFHR5sK0L0t67ZmZAW6AruOkC0Aj4wiD+SjZuVkYm2BL+e1jX
         28Php1pjPW9bgSZYQQtS3rF/8GMLRJuj7kHBgmSZGoZeoPvxf+GFAT3sTrxqVszIuK
         dPY0G0Q0NRbP+OSTU31Idx8kqxexgxD20CiR+/6A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 04/17] media: rkisp1: resizer: Fix and simplify (un)registration
Date:   Sat, 19 Mar 2022 18:30:47 +0200
Message-Id: <20220319163100.3083-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
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

