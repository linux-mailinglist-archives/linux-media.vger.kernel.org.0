Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8D8C9EF6
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbfJCM7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:59:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41072 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727911AbfJCM7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:59:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id A9F1128CFE7
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v2] media: vimc: embed the pads of entities in the entities' structs
Date:   Thu,  3 Oct 2019 14:59:42 +0200
Message-Id: <20191003125942.7108-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

since the pads array is of known small size, there is no reason to
allocate it separately. Instead, it is embedded in the entity struct.
This also conforms to the media controller doc:
'Most drivers will embed the pads array in a driver-specific structure,
avoiding dynamic allocation.'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
This patch is rebased on top of v2 of the patchset
"media: vimc: bug fixes related to memory management"

Changes from v1:
Using a pad field in the sensor and capture instead of an array of
size 1.

 drivers/media/platform/vimc/vimc-capture.c | 17 +++--------
 drivers/media/platform/vimc/vimc-common.c  | 13 ++-------
 drivers/media/platform/vimc/vimc-common.h  | 33 ++++------------------
 drivers/media/platform/vimc/vimc-debayer.c |  9 ++++--
 drivers/media/platform/vimc/vimc-scaler.c  |  8 ++++--
 drivers/media/platform/vimc/vimc-sensor.c  |  6 ++--
 6 files changed, 26 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 5f353c20e605..936bfb96ebaa 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -30,6 +30,7 @@ struct vimc_cap_device {
 	struct mutex lock;
 	u32 sequence;
 	struct vimc_stream stream;
+	struct media_pad pad;
 };
 
 static const struct v4l2_pix_format fmt_default = {
@@ -331,7 +332,6 @@ static void vimc_cap_release(struct video_device *vdev)
 		container_of(vdev, struct vimc_cap_device, vdev);
 
 	media_entity_cleanup(vcap->ved.ent);
-	vimc_pads_cleanup(vcap->ved.pads);
 	kfree(vcap);
 }
 
@@ -398,21 +398,14 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	if (!vcap)
 		return NULL;
 
-	/* Allocate the pads */
-	vcap->ved.pads =
-		vimc_pads_init(1, (const unsigned long[1]) {MEDIA_PAD_FL_SINK});
-	if (IS_ERR(vcap->ved.pads)) {
-		ret = PTR_ERR(vcap->ved.pads);
-		goto err_free_vcap;
-	}
-
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = vcfg_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
+	vcap->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vcap->vdev.entity,
-				     1, vcap->ved.pads);
+				     1, &vcap->pad);
 	if (ret)
-		goto err_clean_pads;
+		goto err_free_vcap;
 
 	/* Initialize the lock */
 	mutex_init(&vcap->lock);
@@ -481,8 +474,6 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vb2_queue_release(q);
 err_clean_m_ent:
 	media_entity_cleanup(&vcap->vdev.entity);
-err_clean_pads:
-	vimc_pads_cleanup(vcap->ved.pads);
 err_free_vcap:
 	kfree(vcap);
 
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 67b53dc1849d..2c74b3fe97b1 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -369,17 +369,12 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 const char *const name,
 			 u32 function,
 			 u16 num_pads,
-			 const unsigned long *pads_flag,
+			 struct media_pad *pads,
 			 const struct v4l2_subdev_internal_ops *sd_int_ops,
 			 const struct v4l2_subdev_ops *sd_ops)
 {
 	int ret;
 
-	/* Allocate the pads. Should be released from the sd_int_op release */
-	ved->pads = vimc_pads_init(num_pads, pads_flag);
-	if (IS_ERR(ved->pads))
-		return PTR_ERR(ved->pads);
-
 	/* Fill the vimc_ent_device struct */
 	ved->ent = &sd->entity;
 
@@ -398,9 +393,9 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
 
 	/* Initialize the media entity */
-	ret = media_entity_pads_init(&sd->entity, num_pads, ved->pads);
+	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
 	if (ret)
-		goto err_clean_pads;
+		return ret;
 
 	/* Register the subdev with the v4l2 and the media framework */
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
@@ -415,8 +410,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 
 err_clean_m_ent:
 	media_entity_cleanup(&sd->entity);
-err_clean_pads:
-	vimc_pads_cleanup(ved->pads);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index af5b1166dc1f..0e40dda84756 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -90,10 +90,10 @@ struct vimc_pix_map {
 };
 
 /**
- * struct vimc_ent_device - core struct that represents a node in the topology
+ * struct vimc_ent_device - core struct that represents an entity in the
+ * topology
  *
  * @ent:		the pointer to struct media_entity for the node
- * @pads:		the list of pads of the node
  * @process_frame:	callback send a frame to that node
  * @vdev_get_format:	callback that returns the current format a pad, used
  *			only when is_media_entity_v4l2_video_device(ent) returns
@@ -109,7 +109,6 @@ struct vimc_pix_map {
  */
 struct vimc_ent_device {
 	struct media_entity *ent;
-	struct media_pad *pads;
 	void * (*process_frame)(struct vimc_ent_device *ved,
 				const void *frame);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
@@ -169,29 +168,6 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
 void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
 
-/**
- * vimc_pads_init - initialize pads
- *
- * @num_pads:	number of pads to initialize
- * @pads_flags:	flags to use in each pad
- *
- * Helper functions to allocate/initialize pads
- */
-struct media_pad *vimc_pads_init(u16 num_pads,
-				 const unsigned long *pads_flag);
-
-/**
- * vimc_pads_cleanup - free pads
- *
- * @pads: pointer to the pads
- *
- * Helper function to free the pads initialized with vimc_pads_init
- */
-static inline void vimc_pads_cleanup(struct media_pad *pads)
-{
-	kfree(pads);
-}
-
 /**
  * vimc_pipeline_s_stream - start stream through the pipeline
  *
@@ -234,7 +210,8 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
  *		unique.
  * @function:	media entity function defined by MEDIA_ENT_F_* macros
  * @num_pads:	number of pads to initialize
- * @pads_flag:	flags to use in each pad
+ * @pads:	the array of pads of the entity, the caller should set the
+		flags of the pads
  * @sd_int_ops:	pointer to &struct v4l2_subdev_internal_ops
  * @sd_ops:	pointer to &struct v4l2_subdev_ops.
  *
@@ -247,7 +224,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 const char *const name,
 			 u32 function,
 			 u16 num_pads,
-			 const unsigned long *pads_flag,
+			 struct media_pad *pads,
 			 const struct v4l2_subdev_internal_ops *sd_int_ops,
 			 const struct v4l2_subdev_ops *sd_ops);
 
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 4e5316c671e0..64e92e9f98ba 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -44,6 +44,7 @@ struct vimc_deb_device {
 	u8 *src_frame;
 	const struct vimc_deb_pix_map *sink_pix_map;
 	unsigned int sink_bpp;
+	struct media_pad pads[2];
 };
 
 static const struct v4l2_mbus_framefmt sink_fmt_default = {
@@ -478,7 +479,6 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
 				container_of(sd, struct vimc_deb_device, sd);
 
 	media_entity_cleanup(vdeb->ved.ent);
-	vimc_pads_cleanup(vdeb->ved.pads);
 	kfree(vdeb);
 }
 
@@ -506,12 +506,15 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	if (!vdeb)
 		return NULL;
 
+
 	/* Initialize ved and sd */
+	vdeb->pads[0].flags = MEDIA_PAD_FL_SINK;
+	vdeb->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+
 	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
-				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
-				   MEDIA_PAD_FL_SOURCE},
+				   vdeb->pads,
 				   &vimc_deb_int_ops, &vimc_deb_ops);
 	if (ret) {
 		kfree(vdeb);
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 4fe2ba578652..88a2f6e3218e 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -30,6 +30,7 @@ struct vimc_sca_device {
 	u8 *src_frame;
 	unsigned int src_line_size;
 	unsigned int bpp;
+	struct media_pad pads[2];
 };
 
 static const struct v4l2_mbus_framefmt sink_fmt_default = {
@@ -337,7 +338,6 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
 				container_of(sd, struct vimc_sca_device, sd);
 
 	media_entity_cleanup(vsca->ved.ent);
-	vimc_pads_cleanup(vsca->ved.pads);
 	kfree(vsca);
 }
 
@@ -366,11 +366,13 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 		return NULL;
 
 	/* Initialize ved and sd */
+	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
+	vsca->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+
 	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
-				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
-				   MEDIA_PAD_FL_SOURCE},
+				   vsca->pads,
 				   &vimc_sca_int_ops, &vimc_sca_ops);
 	if (ret) {
 		kfree(vsca);
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 14838362d871..b41e24a7d029 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -24,6 +24,7 @@ struct vimc_sen_device {
 	/* The active format */
 	struct v4l2_mbus_framefmt mbus_format;
 	struct v4l2_ctrl_handler hdl;
+	struct media_pad pad;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -292,7 +293,6 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
 	v4l2_ctrl_handler_free(&vsen->hdl);
 	tpg_free(&vsen->tpg);
 	media_entity_cleanup(vsen->ved.ent);
-	vimc_pads_cleanup(vsen->ved.pads);
 	kfree(vsen);
 }
 
@@ -367,10 +367,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 		goto err_free_hdl;
 
 	/* Initialize ved and sd */
+	vsen->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
 				   vcfg_name,
-				   MEDIA_ENT_F_CAM_SENSOR, 1,
-				   (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
+				   MEDIA_ENT_F_CAM_SENSOR, 1, &vsen->pad,
 				   &vimc_sen_int_ops, &vimc_sen_ops);
 	if (ret)
 		goto err_free_tpg;
-- 
2.20.1

