Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D930F4C5CBB
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 17:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbiB0QCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 11:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbiB0QCQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 11:02:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222D25D1AB
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 08:01:39 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 851F2BA9;
        Sun, 27 Feb 2022 17:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645977694;
        bh=NoEmViqwjXZy0nReypcyH9GazypyC2hhqc2cQVbVpJE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J/mXMXtb9D88uTlymS5DV8ISznmVaEEx7HTzogNZGyWShcEAmn2qDMKV07ZJFvl9t
         MYH7thCO18Xd1NK+I65V8cOVXfSnRmSgyDtPmZIUzgJ5RBy+4JYjxRSZaGIStJHJxU
         6ur7XuQMrzbqM9vyqYwFErA9JXyl5qSk5qgKLtME=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 04/16] media: rkisp1: resizer: Fix and simplify (un)registration
Date:   Sun, 27 Feb 2022 18:01:04 +0200
Message-Id: <20220227160116.18556-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
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
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 2070f4b06705..65ce8d647118 100644
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
+	rsz->rkisp1 = NULL;
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

