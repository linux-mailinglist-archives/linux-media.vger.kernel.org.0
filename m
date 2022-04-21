Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93F950AC35
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442640AbiDUXpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442639AbiDUXpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DB6DFE7
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:42:47 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B496501;
        Fri, 22 Apr 2022 01:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584565;
        bh=00++B/c6NezAjKzB6EkA97wjR+htZ+WGmHdXQ0/mfW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b4jH6CMAY8U5TcfbOYKvL8sGeLUFafaX1Kw7d7uU5i+DwexrB89ztbmE6+2N5HAgP
         +RhirC9oZ0rj2EDr3uT7B8SKBba7/EgQWZfwEIi2fpLS5k8r8kG9u/TG1awXjI5MxI
         AOddefRIdpSLA5INlcWh4S+cHavlmUi9Xphoj6NA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 02/21] media: rkisp1: capture: Fix and simplify (un)registration
Date:   Fri, 22 Apr 2022 02:42:21 +0300
Message-Id: <20220421234240.1694-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkisp1_register_capture() and rkisp1_unregister_capture() functions
don't destroy the mutex (in the error path for the former). Fix this and
make rkisp1_unregister_capture() and rkisp1_capture_devs_unregister()
safe to be called on an unregistered capture node to prepare for
simplification of error handling at probe time.

While at it, drop the double initialization of cap->rkisp1 in
rkisp1_capture_devs_register() as the field is already initialized in
rkisp1_capture_init().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Use video_is_registered() as registration test
- Drop double initialization of cap->rkisp1
- Move part of 03/17 to this patch

Changes since v1:

- Reset cap->rkisp1 in rkisp1_capture_devs_register()
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index e88749488969..6c54e95a529b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1326,8 +1326,12 @@ static const struct v4l2_file_operations rkisp1_fops = {
 
 static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
 {
+	if (!video_is_registered(&cap->vnode.vdev))
+		return;
+
 	media_entity_cleanup(&cap->vnode.vdev.entity);
 	vb2_video_unregister_device(&cap->vnode.vdev);
+	mutex_destroy(&cap->vnode.vlock);
 }
 
 void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
@@ -1381,14 +1385,14 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	if (ret) {
 		dev_err(cap->rkisp1->dev,
 			"vb2 queue init failed (err=%d)\n", ret);
-		return ret;
+		goto error;
 	}
 
 	vdev->queue = q;
 
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -1404,6 +1408,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 
 error:
 	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&node->vlock);
 	return ret;
 }
 
@@ -1439,26 +1444,21 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
 
 int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
 {
-	struct rkisp1_capture *cap;
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
+		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
+
 		rkisp1_capture_init(rkisp1, i);
-		cap = &rkisp1->capture_devs[i];
-		cap->rkisp1 = rkisp1;
+
 		ret = rkisp1_register_capture(cap);
-		if (ret)
-			goto err_unreg_capture_devs;
+		if (ret) {
+			rkisp1_capture_devs_unregister(rkisp1);
+			return ret;
+		}
 	}
 
 	return 0;
 
-err_unreg_capture_devs:
-	for (j = 0; j < i; j++) {
-		cap = &rkisp1->capture_devs[j];
-		rkisp1_unregister_capture(cap);
-	}
-
-	return ret;
 }
-- 
Regards,

Laurent Pinchart

