Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD9BCAEE8
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732817AbfJCTJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:09:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45122 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732733AbfJCTJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:09:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EA93028FEA5
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v2 3/4] media: hantro: Rework media topology
Date:   Thu,  3 Oct 2019 16:08:32 -0300
Message-Id: <20191003190833.29046-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191003190833.29046-1-ezequiel@collabora.com>
References: <20191003190833.29046-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As suggested by Helen Koike, the decoder processing entity can be
modeled as a V4L2 subdevice.

This change will allow to describe more complex topology
and/or behavior to userspace, starting with the post-processing
feature, which will be soon introduced.

For now, introduce a simple subdevice, maintaining an immutable
topology, and now exposing the subdevices to userspace.

Suggested-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h      |  21 +-
 drivers/staging/media/hantro/hantro_drv.c  | 250 +++++++++++++++------
 drivers/staging/media/hantro/hantro_v4l2.c |  18 +-
 3 files changed, 205 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index deb90ae37859..15506b9a34f4 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -124,25 +124,19 @@ struct hantro_ctrl {
  *			%MEDIA_ENT_F_PROC_VIDEO_DECODER)
  * @vdev:		&struct video_device that exposes the encoder or
  *			decoder functionality
- * @source_pad:		&struct media_pad with the source pad.
- * @sink:		&struct media_entity pointer with the sink entity
- * @sink_pad:		&struct media_pad with the sink pad.
- * @proc:		&struct media_entity pointer with the M2M device itself.
- * @proc_pads:		&struct media_pad with the @proc pads.
- * @intf_devnode:	&struct media_intf devnode pointer with the interface
- *			with controls the M2M device.
+ * @vdev_pads:		&struct media_pad with the @vdev pads.
+ * @sd_proc:		&struct v4l2_subdev exposing the encoder or decoder sub-device
+ * @sd_proc_pads:	&struct media_pad with the @sd_proc pads.
  *
  * Contains everything needed to attach the video device to the media device.
  */
 struct hantro_func {
 	unsigned int id;
 	struct video_device vdev;
-	struct media_pad source_pad;
-	struct media_entity sink;
-	struct media_pad sink_pad;
-	struct media_entity proc;
-	struct media_pad proc_pads[2];
-	struct media_intf_devnode *intf_devnode;
+	struct media_pad vdev_pads[2];
+
+	struct v4l2_subdev sd_proc;
+	struct media_pad sd_proc_pads[2];
 };
 
 static inline struct hantro_func *
@@ -220,6 +214,7 @@ struct hantro_dev {
 struct hantro_ctx {
 	struct hantro_dev *dev;
 	struct v4l2_fh fh;
+	struct media_pipeline pipe;
 
 	u32 sequence_cap;
 	u32 sequence_out;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 26108c96b674..35beb5a9bf52 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -488,9 +488,67 @@ static const struct of_device_id of_hantro_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_hantro_match);
 
+static int link_setup(struct media_entity *entity,
+		      const struct media_pad *local,
+		      const struct media_pad *remote, u32 flags)
+{
+	/* empty for now */
+	return 0;
+}
+
+static const struct media_entity_operations sd_mops = {
+	.link_setup = link_setup,
+};
+
+static const struct v4l2_subdev_ops sd_ops = {
+	/* empty */
+};
+
+static int
+hantro_subdev_register(struct hantro_dev *vpu,
+		       struct hantro_func *func,
+		       struct v4l2_subdev *sd,
+		       const char *const name,
+		       u32 function,
+		       struct media_pad *pads,
+		       const struct v4l2_subdev_internal_ops *sd_int_ops,
+		       const struct v4l2_subdev_ops *sd_ops)
+{
+	int ret;
+
+	/* Initialize the subdev */
+	v4l2_subdev_init(sd, sd_ops);
+	sd->internal_ops = sd_int_ops;
+	sd->entity.function = function;
+	sd->entity.ops = &sd_mops;
+	sd->owner = THIS_MODULE;
+	strscpy(sd->name, name, sizeof(sd->name));
+	v4l2_set_subdevdata(sd, vpu);
+
+	if (sd->ctrl_handler)
+		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+
+	/* Initialize the media entity */
+	pads[0].flags = MEDIA_PAD_FL_SINK;
+	pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, 2, pads);
+	if (ret)
+		return ret;
+
+	/* Register the subdev with the v4l2 and the media frameworks */
+	ret = v4l2_device_register_subdev(&vpu->v4l2_dev, sd);
+	if (ret) {
+		v4l2_err(&vpu->v4l2_dev,
+			"%s: subdev register failed (err=%d)\n",
+			name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int hantro_register_entity(struct media_device *mdev,
 				  struct media_entity *entity,
-				  const char *entity_name,
 				  struct media_pad *pads, int num_pads,
 				  int function, struct video_device *vdev)
 {
@@ -503,8 +561,7 @@ static int hantro_register_entity(struct media_device *mdev,
 		entity->info.dev.minor = vdev->minor;
 	}
 
-	name = devm_kasprintf(mdev->dev, GFP_KERNEL, "%s-%s", vdev->name,
-			      entity_name);
+	name = devm_kasprintf(mdev->dev, GFP_KERNEL, "%s", vdev->name);
 	if (!name)
 		return -ENOMEM;
 
@@ -522,61 +579,132 @@ static int hantro_register_entity(struct media_device *mdev,
 	return 0;
 }
 
+#define HANTRO_LINK_(_src, _sink, link_flags) {	\
+	.source = _src,				\
+	.sink = _sink,				\
+	.flags = link_flags,			\
+}
+
+#define HANTRO_LINK_IM(_src, _sink) \
+	HANTRO_LINK_(_src, _sink, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE)
+
+#define HANTRO_LINK_EN(_src, _sink) \
+	HANTRO_LINK_(_src, _sink, MEDIA_LNK_FL_ENABLED)
+
+#define HANTRO_LINK(_src, _sink) \
+	HANTRO_LINK_(_src, _sink, 0)
+
+#define HANTRO_SUBDEV(_subdev, _name, _function, _pads) { \
+	.subdev = _subdev,			\
+	.name = _name,				\
+	.function = _function,			\
+	.pads = _pads,				\
+}
+
 static int hantro_attach_func(struct hantro_dev *vpu,
 			      struct hantro_func *func)
 {
 	struct media_device *mdev = &vpu->mdev;
 	struct media_link *link;
+	unsigned int i, num_subdevs, num_links;
 	int ret;
 
-	/* Create the three encoder entities with their pads */
-	func->source_pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = hantro_register_entity(mdev, &func->vdev.entity, "source",
-				     &func->source_pad, 1, MEDIA_ENT_F_IO_V4L,
-				     &func->vdev);
-	if (ret)
-		return ret;
+	/*
+	 * In order to ease the media topology setup,
+	 * define a couple compound types. Keep these
+	 * types local, as they are not needed them
+	 * elsewhere.
+	 */
+	struct hantro_subdev {
+		struct v4l2_subdev *subdev;
+		struct media_pad *pads;
+		const char *name;
+		u32 function;
+	};
+	struct hantro_link {
+		struct media_entity *source;
+		struct media_entity *sink;
+		u32 flags;
+	};
+	const struct hantro_subdev decoder_subdevs[] = {
+		HANTRO_SUBDEV(&func->sd_proc, "decoder", func->id,
+			      func->sd_proc_pads),
+	};
+	const struct hantro_subdev encoder_subdevs[] = {
+		HANTRO_SUBDEV(&func->sd_proc, "encoder", func->id,
+			      func->sd_proc_pads),
+	};
+	const struct hantro_link decoder_links[] = {
+		/* decoder -> vdev */
+		HANTRO_LINK_IM(&func->sd_proc.entity, &func->vdev.entity),
+		/* vdev -> decoder */
+		HANTRO_LINK_IM(&func->vdev.entity, &func->sd_proc.entity),
+	};
+	const struct hantro_link encoder_links[] = {
+		/* encoder -> vdev */
+		HANTRO_LINK_IM(&func->sd_proc.entity, &func->vdev.entity),
+		/* vdev -> encoder */
+		HANTRO_LINK_IM(&func->vdev.entity, &func->sd_proc.entity),
+	};
+	const struct hantro_subdev *subdevs;
+	const struct hantro_link *links;
 
-	func->proc_pads[0].flags = MEDIA_PAD_FL_SINK;
-	func->proc_pads[1].flags = MEDIA_PAD_FL_SOURCE;
-	ret = hantro_register_entity(mdev, &func->proc, "proc",
-				     func->proc_pads, 2, func->id,
-				     &func->vdev);
-	if (ret)
-		goto err_rel_entity0;
+	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
+		subdevs = encoder_subdevs;
+		links = encoder_links;
+		num_subdevs = ARRAY_SIZE(encoder_subdevs);
+		num_links = ARRAY_SIZE(encoder_links);
+	} else {
+		subdevs = decoder_subdevs;
+		links = decoder_links;
+		num_subdevs = ARRAY_SIZE(decoder_subdevs);
+		num_links = ARRAY_SIZE(decoder_links);
+	}
 
-	func->sink_pad.flags = MEDIA_PAD_FL_SINK;
-	ret = hantro_register_entity(mdev, &func->sink, "sink",
-				     &func->sink_pad, 1, MEDIA_ENT_F_IO_V4L,
+	for (i = 0; i < num_subdevs; i++) {
+		const struct hantro_subdev *subdev = &subdevs[i];
+
+		ret = hantro_subdev_register(vpu, func, subdev->subdev,
+					     subdev->name, subdev->function,
+					     subdev->pads,
+					     NULL, &sd_ops);
+		if (ret)
+			goto err_unreg_subdevs;
+	}
+
+	func->vdev_pads[0].flags = MEDIA_PAD_FL_SINK;
+	func->vdev_pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	ret = hantro_register_entity(mdev, &func->vdev.entity,
+				     func->vdev_pads, 2,
+				     MEDIA_ENT_F_IO_V4L,
 				     &func->vdev);
 	if (ret)
-		goto err_rel_entity1;
+		goto err_unreg_subdevs;
 
-	/* Connect the three entities */
-	ret = media_create_pad_link(&func->vdev.entity, 0, &func->proc, 1,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		goto err_rel_entity2;
+	for (i = 0; i < num_links; i++) {
+		const struct hantro_link *link = &links[i];
 
-	ret = media_create_pad_link(&func->proc, 0, &func->sink, 0,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		goto err_rm_links0;
+		ret = media_create_pad_link(link->source, 1,
+					    link->sink, 0,
+					    link->flags);
+		if (ret) {
+			ret = -ENOMEM;
+			goto err_unreg_entity;
+		}
+	}
 
-	/* Create video interface */
-	func->intf_devnode = media_devnode_create(mdev, MEDIA_INTF_T_V4L_VIDEO,
-						  0, VIDEO_MAJOR,
-						  func->vdev.minor);
-	if (!func->intf_devnode) {
+	/* Create the video device interface and link it. */
+	func->vdev.intf_devnode =
+		media_devnode_create(mdev, MEDIA_INTF_T_V4L_VIDEO,
+				     0, VIDEO_MAJOR,
+				     func->vdev.minor);
+	if (!func->vdev.intf_devnode) {
 		ret = -ENOMEM;
-		goto err_rm_links1;
+		goto err_unreg_entity;
 	}
 
-	/* Connect the two DMA engines to the interface */
 	link = media_create_intf_link(&func->vdev.entity,
-				      &func->intf_devnode->intf,
+				      &func->vdev.intf_devnode->intf,
 				      MEDIA_LNK_FL_IMMUTABLE |
 				      MEDIA_LNK_FL_ENABLED);
 	if (!link) {
@@ -584,45 +712,22 @@ static int hantro_attach_func(struct hantro_dev *vpu,
 		goto err_rm_devnode;
 	}
 
-	link = media_create_intf_link(&func->sink, &func->intf_devnode->intf,
-				      MEDIA_LNK_FL_IMMUTABLE |
-				      MEDIA_LNK_FL_ENABLED);
-	if (!link) {
-		ret = -ENOMEM;
-		goto err_rm_devnode;
-	}
 	return 0;
-
 err_rm_devnode:
-	media_devnode_remove(func->intf_devnode);
-
-err_rm_links1:
-	media_entity_remove_links(&func->sink);
-
-err_rm_links0:
-	media_entity_remove_links(&func->proc);
-	media_entity_remove_links(&func->vdev.entity);
-
-err_rel_entity2:
-	media_device_unregister_entity(&func->sink);
-
-err_rel_entity1:
-	media_device_unregister_entity(&func->proc);
-
-err_rel_entity0:
+	media_devnode_remove(func->vdev.intf_devnode);
+err_unreg_entity:
 	media_device_unregister_entity(&func->vdev.entity);
+err_unreg_subdevs:
+	for (i = 0; i < num_subdevs; i++)
+		v4l2_device_unregister_subdev(subdevs[i].subdev);
 	return ret;
 }
 
 static void hantro_detach_func(struct hantro_func *func)
 {
-	media_devnode_remove(func->intf_devnode);
-	media_entity_remove_links(&func->sink);
-	media_entity_remove_links(&func->proc);
-	media_entity_remove_links(&func->vdev.entity);
-	media_device_unregister_entity(&func->sink);
-	media_device_unregister_entity(&func->proc);
+	media_devnode_remove(func->vdev.intf_devnode);
 	media_device_unregister_entity(&func->vdev.entity);
+	v4l2_device_unregister_subdev(&func->sd_proc);
 }
 
 static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
@@ -866,6 +971,11 @@ static int hantro_probe(struct platform_device *pdev)
 		goto err_rm_dec_func;
 	}
 
+	ret = v4l2_device_register_subdev_nodes(&vpu->v4l2_dev);
+	if (ret) {
+		v4l2_err(&vpu->v4l2_dev, "Failed to register subdev nodes\n");
+		goto err_rm_dec_func;
+	}
 	return 0;
 
 err_rm_dec_func:
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 238e53b28f8f..58fa4b52275b 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -594,6 +594,7 @@ static bool hantro_vq_is_coded(struct vb2_queue *q)
 static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
+	struct media_entity *entity = &ctx->fh.vdev->entity;
 	int ret = 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
@@ -601,6 +602,11 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 	else
 		ctx->sequence_cap = 0;
 
+	/* Start the media pipeline */
+	ret = media_pipeline_start(entity, &ctx->pipe);
+	if (ret)
+		return ret;
+
 	if (hantro_vq_is_coded(q)) {
 		enum hantro_codec_mode codec_mode;
 
@@ -611,11 +617,18 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 
 		vpu_debug(4, "Codec mode = %d\n", codec_mode);
 		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
-		if (ctx->codec_ops->init)
+		if (ctx->codec_ops->init) {
 			ret = ctx->codec_ops->init(ctx);
+			if (ret)
+				goto err_pipe_stop;
+		}
 	}
 
 	return ret;
+
+err_pipe_stop:
+	media_pipeline_stop(entity);
+	return ret;
 }
 
 static void
@@ -639,12 +652,15 @@ hantro_return_bufs(struct vb2_queue *q,
 static void hantro_stop_streaming(struct vb2_queue *q)
 {
 	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
+	struct media_entity *entity = &ctx->fh.vdev->entity;
 
 	if (hantro_vq_is_coded(q)) {
 		if (ctx->codec_ops && ctx->codec_ops->exit)
 			ctx->codec_ops->exit(ctx);
 	}
 
+	media_pipeline_stop(entity);
+
 	/*
 	 * The mem2mem framework calls v4l2_m2m_cancel_job before
 	 * .stop_streaming, so there isn't any job running and
-- 
2.22.0

