Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433954DE94E
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243646AbiCSQcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243642AbiCSQcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264E223F9CF
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:30 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DD58E51;
        Sat, 19 Mar 2022 17:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707486;
        bh=j4hkX6PH4+blXGF0tbTTGz04R+UcCuwp26s4lPuwk7Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pRx0L1Prz5LYN/ZTMLDZV86g241c0Hre4ae23h49BETjICPG6eWnbc9WeP09nOkMq
         O8V45nZH+Io0UHpkoyFh0XR8JCMWva82KUuXYHAFHNGh1ZtQCr8fHorXrojnUaqozW
         yTmBMWu5j184+clQQovLlWIxJNBhCxlaxz3yQsrw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 02/17] media: rkisp1: capture: Fix and simplify (un)registration
Date:   Sat, 19 Mar 2022 18:30:45 +0200
Message-Id: <20220319163100.3083-3-laurent.pinchart@ideasonboard.com>
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

