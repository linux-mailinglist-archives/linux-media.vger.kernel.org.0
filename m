Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBFE1CA3BA
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 08:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgEHGWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 02:22:12 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:18276 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgEHGWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 02:22:11 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 May 2020 11:52:06 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 May 2020 11:51:54 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 030C03AD3; Fri,  8 May 2020 11:51:52 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RFC PATCH 1/3] Register for media device 
Date:   Fri,  8 May 2020 11:51:28 +0530
Message-Id: <1588918890-673-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change-Id: I5a9629d562ef80560361d777da79ff06c3e00131
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/Kconfig              |   2 +-
 drivers/media/platform/qcom/venus/core.h    |  33 ++++++
 drivers/media/platform/qcom/venus/helpers.c | 172 ++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  15 +++
 drivers/media/platform/qcom/venus/venc.c    |  36 ++++++
 5 files changed, 257 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ca3cb4f..a51f76e 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -481,7 +481,7 @@ config VIDEO_TI_VPE_DEBUG
 
 config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM if ARCH_QCOM
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 922cb7e..91ff08d 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -74,6 +74,37 @@ struct venus_caps {
 };
 
 /**
+ * struct venus_media - per-device context
+ * @source:		&struct media_entity pointer with the source entity
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_unregister_media_controller().
+ * @source_pad:		&struct media_pad with the source pad.
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_unregister_media_controller().
+ * @sink:		&struct media_entity pointer with the sink entity
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_unregister_media_controller().
+ * @sink_pad:		&struct media_pad with the sink pad.
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_unregister_media_controller().
+ * @proc:		&struct media_entity pointer with the M2M device itself.
+ * @proc_pads:		&struct media_pad with the @proc pads.
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_unregister_media_controller().
+ * @intf_devnode:	&struct media_intf devnode pointer with the interface
+ *			with controls the M2M device.
+ */
+struct venus_media {
+	struct media_entity	*source;
+	struct media_pad	source_pad;
+	struct media_entity	sink;
+	struct media_pad	sink_pad;
+	struct media_entity	proc;
+	struct media_pad	proc_pads[2];
+	struct media_intf_devnode *intf_devnode;
+};
+
+/**
  * struct venus_core - holds core parameters valid for all instances
  *
  * @base:	IO memory base address
@@ -118,6 +149,8 @@ struct venus_core {
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
+	struct media_device	m_dev;
+	struct venus_media *media;
 	const struct venus_resources *res;
 	struct device *dev;
 	struct device *dev_dec;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1ad96c2..2c766cd 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1378,3 +1378,175 @@ int venus_helper_power_enable(struct venus_core *core, u32 session_type,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(venus_helper_power_enable);
+
+static int venus_helper_register_entity(struct media_device *mdev,
+	struct venus_media *media, enum venus_helper_entity_type type,
+	struct video_device *vdev, int function)
+{
+	struct media_entity *entity;
+	struct media_pad *pads;
+	char *name;
+	unsigned int len;
+	int num_pads;
+	int ret;
+
+	switch (type) {
+	case MEM2MEM_ENT_TYPE_SOURCE:
+		entity = media->source;
+		pads = &media->source_pad;
+		pads[0].flags = MEDIA_PAD_FL_SOURCE;
+		num_pads = 1;
+		break;
+	case MEM2MEM_ENT_TYPE_SINK:
+		entity = &media->sink;
+		pads = &media->sink_pad;
+		pads[0].flags = MEDIA_PAD_FL_SINK;
+		num_pads = 1;
+		break;
+	case MEM2MEM_ENT_TYPE_PROC:
+		entity = &media->proc;
+		pads = media->proc_pads;
+		pads[0].flags = MEDIA_PAD_FL_SINK;
+		pads[1].flags = MEDIA_PAD_FL_SOURCE;
+		num_pads = 2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	entity->obj_type = MEDIA_ENTITY_TYPE_BASE;
+	if (type != MEM2MEM_ENT_TYPE_PROC) {
+		entity->info.dev.major = VIDEO_MAJOR;
+		entity->info.dev.minor = vdev->minor;
+	}
+	len = strlen(vdev->name) + 2 + strlen(venus_helper_entity_name[type]);
+	name = kmalloc(len, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+	snprintf(name, len, "%s-%s", vdev->name, venus_helper_entity_name[type]);
+	entity->name = name;
+	entity->function = function;
+
+	ret = media_entity_pads_init(entity, num_pads, pads);
+	if (ret)
+		return ret;
+	ret = media_device_register_entity(mdev, entity);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int venus_helper_register_media_controller(struct venus_media *media,
+		struct video_device *vdev, int function)
+{
+	struct media_device *mdev = vdev->v4l2_dev->mdev;
+	struct media_link *link;
+	int ret;
+	v4l2_err(vdev, "1.\n");
+	if (!mdev)
+		return 0;
+	v4l2_err(vdev, "2.\n");
+	/* A memory-to-memory device consists in two
+	 * DMA engine and one video processing entities.
+	 * The DMA engine entities are linked to a V4L interface
+	 */
+
+	/* Create the three entities with their pads */
+	media->source = &vdev->entity;
+	ret = venus_helper_register_entity(mdev, media,
+			MEM2MEM_ENT_TYPE_SOURCE, vdev, MEDIA_ENT_F_IO_V4L);
+	if (ret) {
+		v4l2_err(vdev, "3_error.\n");
+		return ret;
+		}
+	v4l2_err(vdev, "3 pass.\n");
+	ret = venus_helper_register_entity(mdev, media,
+			MEM2MEM_ENT_TYPE_PROC, vdev, function);
+	if (ret){
+		v4l2_err(vdev, "4 error.\n");
+		goto err_rel_entity0;
+	}
+	v4l2_err(vdev, "4 pass.\n");
+	ret = venus_helper_register_entity(mdev, media,
+			MEM2MEM_ENT_TYPE_SINK, vdev, MEDIA_ENT_F_IO_V4L);
+	if (ret)
+		goto err_rel_entity1;
+	v4l2_err(vdev, "5 pass.\n");
+	/* Connect the three entities */
+	ret = media_create_pad_link(media->source, 0, &media->proc, 1,
+			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto err_rel_entity2;
+	v4l2_err(vdev, "6 pass.\n");
+	ret = media_create_pad_link(&media->proc, 0, &media->sink, 0,
+			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto err_rm_links0;
+	v4l2_err(vdev, "7 pass.\n");
+	/* Create video interface */
+	media->intf_devnode = media_devnode_create(mdev,
+			MEDIA_INTF_T_V4L_VIDEO, 0,
+			VIDEO_MAJOR, vdev->minor);
+	if (!media->intf_devnode) {
+		ret = -ENOMEM;
+		goto err_rm_links1;
+	}
+	v4l2_err(vdev, "8 pass.\n");
+	/* Connect the two DMA engines to the interface */
+	link = media_create_intf_link(media->source,
+			&media->intf_devnode->intf,
+			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_rm_devnode;
+	}
+
+	link = media_create_intf_link(&media->sink,
+			&media->intf_devnode->intf,
+			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_rm_intf_link;
+	}
+	return 0;
+
+err_rm_intf_link:
+	media_remove_intf_links(&media->intf_devnode->intf);
+err_rm_devnode:
+	media_devnode_remove(media->intf_devnode);
+err_rm_links1:
+	media_entity_remove_links(&media->sink);
+err_rm_links0:
+	media_entity_remove_links(&media->proc);
+	media_entity_remove_links(media->source);
+err_rel_entity2:
+	media_device_unregister_entity(&media->proc);
+	kfree(media->proc.name);
+err_rel_entity1:
+	media_device_unregister_entity(&media->sink);
+	kfree(media->sink.name);
+err_rel_entity0:
+	media_device_unregister_entity(media->source);
+	kfree(media->source->name);
+	return ret;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(venus_helper_register_media_controller);
+
+void venus_helper_unregister_media_controller(struct venus_media *media)
+{
+	media_remove_intf_links(&media->intf_devnode->intf);
+	media_devnode_remove(media->intf_devnode);
+
+	media_entity_remove_links(media->source);
+	media_entity_remove_links(&media->sink);
+	media_entity_remove_links(&media->proc);
+	media_device_unregister_entity(media->source);
+	media_device_unregister_entity(&media->sink);
+	media_device_unregister_entity(&media->proc);
+	kfree(media->source->name);
+	kfree(media->sink.name);
+	kfree(media->proc.name);
+}
+EXPORT_SYMBOL_GPL(venus_helper_unregister_media_controller);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 01f411b..ca4db82 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -11,6 +11,18 @@
 struct venus_inst;
 struct venus_core;
 
+enum venus_helper_entity_type {
+	MEM2MEM_ENT_TYPE_SOURCE,
+	MEM2MEM_ENT_TYPE_SINK,
+	MEM2MEM_ENT_TYPE_PROC
+};
+
+static const char * const venus_helper_entity_name[] = {
+	"source",
+	"sink",
+	"proc"
+};
+
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
 struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
 					      unsigned int type, u32 idx);
@@ -64,4 +76,7 @@ int venus_helper_power_enable(struct venus_core *core, u32 session_type,
 int venus_helper_process_initial_out_bufs(struct venus_inst *inst);
 void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 				  struct vb2_v4l2_buffer *vbuf);
+int venus_helper_register_media_controller(struct venus_media *media,
+		struct video_device *vdev, int function);
+void venus_helper_unregister_media_controller(struct venus_media *media);
 #endif
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 30028ce..f57542f 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -22,6 +22,17 @@
 #include "venc.h"
 
 #define NUM_B_FRAMES_MAX	4
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device	mdev;
+#endif
+static int venc_request_validate(struct media_request *req)
+{
+	return vb2_request_validate(req);
+}
+static const struct media_device_ops venus_m2m_media_ops = {
+	.req_validate	= venc_request_validate,
+	.req_queue	= v4l2_m2m_request_queue,
+};
 
 /*
  * Three resons to keep MPLANE formats (despite that the number of planes
@@ -1287,8 +1298,33 @@ static int venc_probe(struct platform_device *pdev)
 	video_set_drvdata(vdev, core);
 	pm_runtime_enable(dev);
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+	core->m_dev.dev = &pdev->dev;
+	strscpy(core->m_dev.model, "media_enc", sizeof(core->m_dev.model));
+	media_device_init(&core->m_dev);
+	core->m_dev.ops = &venus_m2m_media_ops;
+	core->v4l2_dev.mdev = &core->m_dev;
+	core->media = kzalloc(sizeof *core->media, GFP_KERNEL);
+	if (!core->media)
+		return ERR_PTR(-ENOMEM);
+	ret = venus_helper_register_media_controller(core->media,
+						 core->vdev_enc,
+						 MEDIA_ENT_F_PROC_VIDEO_ENCODER);
+	if (ret) {
+		v4l2_err(core->vdev_enc, "Failed to init mem2mem media controller for enc\n");
+		goto err_vdev_release;
+	}
+
+	ret = media_device_register(&core->m_dev);
+	if (ret) {
+		//v4l2_err(&core->m_dev, "Failed to register mem2mem media device\n");
+		goto err_unreg_m2m;
+	}
+#endif
 	return 0;
 
+err_unreg_m2m:
+	venus_helper_unregister_media_controller(core->media);
 err_vdev_release:
 	video_device_release(vdev);
 	return ret;
-- 
1.9.1

