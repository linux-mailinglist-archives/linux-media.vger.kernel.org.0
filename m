Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369917D53ED
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 16:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343757AbjJXOZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 10:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343770AbjJXOZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 10:25:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE6AB6;
        Tue, 24 Oct 2023 07:25:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E8D69CC;
        Tue, 24 Oct 2023 16:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698157503;
        bh=3oku6C+GG9cPGZA7hJgl/BDLhXRdGDjJ7lRFk8t7noQ=;
        h=From:To:Cc:Subject:Date:From;
        b=so9oTYiZi83azn1FU1DQotqQ3Ej9FcEZb2otyNJDBOaev87xlziB1e+NNeYaf0v9B
         H/ghi25nRRKfYEKt7j53IhCMdRm+chKmy5cBCzEOr9EDBFpsj64nn1hMjVpBm8CHvb
         NaqHDP3bWvX68LXnW0MreV/v/48eJR7wcFgTUp1Q=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
Date:   Tue, 24 Oct 2023 17:25:22 +0300
Message-ID: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
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

The VSP1 driver uses the subdev .s_stream() operation to stop WPF
instances, without a corresponding call to start them. The V4L2 subdev
core started warning about unbalanced .s_stream() calls in commit
009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream()
requirements"), causing a regression with this driver.

Fix the problem by replacing the .s_stream() operation with an explicit
function call for WPF instances. This allows sharing an additional data
structure between RPF and WPF instances.

Fixes: 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream() requirements")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/linux-media/2221395-6a9b-9527-d697-e76aebc6af@linux-m68k.org/
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  2 +-
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 10 +------
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  8 +++--
 .../media/platform/renesas/vsp1/vsp1_rwpf.h   |  4 ++-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    | 29 ++-----------------
 5 files changed, 14 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f8093ba9539e..68d05243c3ee 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -373,7 +373,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 			   (7 << VI6_DPR_SMPPT_TGW_SHIFT) |
 			   (VI6_DPR_NODE_UNUSED << VI6_DPR_SMPPT_PT_SHIFT));
 
-	v4l2_subdev_call(&pipe->output->entity.subdev, video, s_stream, 0);
+	vsp1_wpf_stop(pipe->output);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 3b17f5fa4067..ea12c3f12c92 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -43,14 +43,6 @@ static inline void vsp1_rpf_write(struct vsp1_rwpf *rpf,
 			       data);
 }
 
-/* -----------------------------------------------------------------------------
- * V4L2 Subdevice Operations
- */
-
-static const struct v4l2_subdev_ops rpf_ops = {
-	.pad    = &vsp1_rwpf_pad_ops,
-};
-
 /* -----------------------------------------------------------------------------
  * VSP1 Entity Operations
  */
@@ -411,7 +403,7 @@ struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device *vsp1, unsigned int index)
 	rpf->entity.index = index;
 
 	sprintf(name, "rpf.%u", index);
-	ret = vsp1_entity_init(vsp1, &rpf->entity, name, 2, &rpf_ops,
+	ret = vsp1_entity_init(vsp1, &rpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
 	if (ret < 0)
 		return ERR_PTR(ret);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 22a82d218152..e0f87c8103ca 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -24,7 +24,7 @@ struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
 }
 
 /* -----------------------------------------------------------------------------
- * V4L2 Subdevice Pad Operations
+ * V4L2 Subdevice Operations
  */
 
 static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
@@ -243,7 +243,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	return ret;
 }
 
-const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
+static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
 	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
 	.enum_frame_size = vsp1_rwpf_enum_frame_size,
@@ -253,6 +253,10 @@ const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
 	.set_selection = vsp1_rwpf_set_selection,
 };
 
+const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops = {
+	.pad    = &vsp1_rwpf_pad_ops,
+};
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
index eac5c04c2239..e0d212c70b2f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
@@ -79,9 +79,11 @@ static inline struct vsp1_rwpf *entity_to_rwpf(struct vsp1_entity *entity)
 struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device *vsp1, unsigned int index);
 struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index);
 
+void vsp1_wpf_stop(struct vsp1_rwpf *wpf);
+
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
 
-extern const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops;
+extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
 
 struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
 				     struct v4l2_subdev_state *sd_state);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index d0074ca00920..cab4445eca69 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -186,17 +186,13 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
 }
 
 /* -----------------------------------------------------------------------------
- * V4L2 Subdevice Core Operations
+ * VSP1 Entity Operations
  */
 
-static int wpf_s_stream(struct v4l2_subdev *subdev, int enable)
+void vsp1_wpf_stop(struct vsp1_rwpf *wpf)
 {
-	struct vsp1_rwpf *wpf = to_rwpf(subdev);
 	struct vsp1_device *vsp1 = wpf->entity.vsp1;
 
-	if (enable)
-		return 0;
-
 	/*
 	 * Write to registers directly when stopping the stream as there will be
 	 * no pipeline run to apply the display list.
@@ -204,27 +200,8 @@ static int wpf_s_stream(struct v4l2_subdev *subdev, int enable)
 	vsp1_write(vsp1, VI6_WPF_IRQ_ENB(wpf->entity.index), 0);
 	vsp1_write(vsp1, wpf->entity.index * VI6_WPF_OFFSET +
 		   VI6_WPF_SRCRPF, 0);
-
-	return 0;
 }
 
-/* -----------------------------------------------------------------------------
- * V4L2 Subdevice Operations
- */
-
-static const struct v4l2_subdev_video_ops wpf_video_ops = {
-	.s_stream = wpf_s_stream,
-};
-
-static const struct v4l2_subdev_ops wpf_ops = {
-	.video	= &wpf_video_ops,
-	.pad    = &vsp1_rwpf_pad_ops,
-};
-
-/* -----------------------------------------------------------------------------
- * VSP1 Entity Operations
- */
-
 static void vsp1_wpf_destroy(struct vsp1_entity *entity)
 {
 	struct vsp1_rwpf *wpf = entity_to_rwpf(entity);
@@ -583,7 +560,7 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index)
 	wpf->entity.index = index;
 
 	sprintf(name, "wpf.%u", index);
-	ret = vsp1_entity_init(vsp1, &wpf->entity, name, 2, &wpf_ops,
+	ret = vsp1_entity_init(vsp1, &wpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
 	if (ret < 0)
 		return ERR_PTR(ret);

base-commit: 19e67e01eb1e84f3529770d084b93f16a4894c42
-- 
Regards,

Laurent Pinchart

