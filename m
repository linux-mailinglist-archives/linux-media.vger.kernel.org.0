Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27FCE102B5
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfD3Wux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:50:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41614 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727901AbfD3Wul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:50:41 -0400
Received: by mail-pl1-f195.google.com with SMTP id d9so7416476pls.8;
        Tue, 30 Apr 2019 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Mt/4C8J2+WuIzsUr+8UIaSGs3lgDJztc9MhMFE4AkHQ=;
        b=sNFR9+Wh+0Pt6Iz6Yb9fVZIZCIbFJxwbyGrLsuu+NtIBHFekRqqVbavayjXOVuDQNL
         sS1uLLssAa6LtiR7oJS4lkHbgNSwzpS/HFyDXJnLPt586e6TRVm5rGM0I8bKytG4IcMZ
         d7WI4iJUNzhuyB10u4BnD98V24GKO+MzLZ/klqWsTVBdb92KqhUe7YxRjXe1L1lg3KHY
         wwNGUQIXgrkRZr91iSn19HFz2QTOi1SQFj8XtWln5Yvp9/PIig9uHMKyH0NYVjRQ/4bT
         SYJjQJt9eNw5U2+0ZWg40nzEUltAOsPFMV5wvpSo9AZMNPMOxmmnR6JQLShKFELnFgMv
         ck2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Mt/4C8J2+WuIzsUr+8UIaSGs3lgDJztc9MhMFE4AkHQ=;
        b=DwbT1PYfKz2vHeC6QNp479apUlERLOjSO4ryxp/Uv+6YHPakf+9H6DeiZVMQ6Gr2Wa
         2Ib42dMG+T/o3Br9bmxQK0PLv3C50h0tIDme1KxMt5RTcXrCesnBes3VGVbxpZe9vojP
         of5xWJ90A0nVRdkQGO6obXbb8DKfM/iDMi6vVKeYKC3DSTtveH0Q6sulix4XdC0g7MJ6
         TOHWQunKPzUJepHd0a7cCqCTS4AL2eAgSjQ5jgaQ7IaqxlmqkXQc+MXSIjLZgnz287Ut
         I/YVVuYkQxVgn9UH1Y7CRIVPumwIlzRUR+p5r2zpkV2SGqYSynXpYapX/F1ma+hZNUbm
         grDA==
X-Gm-Message-State: APjAAAVpfJ8igLeXj2z/7SVJkg3uDM8eVMSyPueq7IK0VqxnoX8EkuIx
        VQHSYz4HY/bQF/BZztFJwvUj47kn
X-Google-Smtp-Source: APXvYqyUwrL7Cg7RnVMQjyrp2jRw2ZJNiuiEj1mSwoVFtSelfTz/3zK9RcXjsWmivpsk9xp3KaTIPg==
X-Received: by 2002:a17:902:a988:: with SMTP id bh8mr53894762plb.243.1556664639772;
        Tue, 30 Apr 2019 15:50:39 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id l23sm9804654pgj.36.2019.04.30.15.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:50:39 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/8] media: staging/imx: Improve pipeline searching
Date:   Tue, 30 Apr 2019 15:50:17 -0700
Message-Id: <20190430225018.30252-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430225018.30252-1-slongerbeam@gmail.com>
References: <20190430225018.30252-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Export find_pipeline_pad(), renaming to imx_media_pipeline_pad(), and
extend its functionality to allow searching for video devices in the
enabled pipeline in addition to sub-devices.

As part of this:

- Rename imx_media_find_mipi_csi2_channel() to
  imx_media_pipeline_csi2_channel().

- Remove imx_media_find_upstream_pad(), it is redundant now.

- Rename imx_media_find_upstream_subdev() to imx_media_pipeline_subdev()
  with an additional boolean argument for searching upstream or downstream.

- Add imx_media_pipeline_video_device() which is analogous to
  imx_media_pipeline_subdev() but searches for video devices.

- Remove imxmd pointer arg from all of the functions above, it was
  never used in those functions. With that change the i.MX5/6 CSI,
  VDIC, and IC sub-devices no longer require the media_device.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-ic-common.c     |   4 +-
 drivers/staging/media/imx/imx-ic-prp.c        |   4 +-
 drivers/staging/media/imx/imx-ic.h            |   1 -
 drivers/staging/media/imx/imx-media-csi.c     |  13 +-
 drivers/staging/media/imx/imx-media-fim.c     |   4 -
 .../staging/media/imx/imx-media-internal-sd.c |   5 +-
 drivers/staging/media/imx/imx-media-utils.c   | 128 ++++++++++--------
 drivers/staging/media/imx/imx-media-vdic.c    |   5 +-
 drivers/staging/media/imx/imx-media.h         |  20 +--
 drivers/staging/media/imx/imx7-media-csi.c    |   2 +-
 10 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-common.c b/drivers/staging/media/imx/imx-ic-common.c
index ad0c291db03c..37734984beb4 100644
--- a/drivers/staging/media/imx/imx-ic-common.c
+++ b/drivers/staging/media/imx/imx-ic-common.c
@@ -22,12 +22,11 @@ static struct imx_ic_ops *ic_ops[IC_NUM_OPS] = {
 	[IC_TASK_VIEWFINDER]     = &imx_ic_prpencvf_ops,
 };
 
-struct v4l2_subdev *imx_media_ic_register(struct imx_media_dev *imxmd,
+struct v4l2_subdev *imx_media_ic_register(struct v4l2_device *v4l2_dev,
 					  struct device *ipu_dev,
 					  struct ipu_soc *ipu,
 					  u32 grp_id)
 {
-	struct v4l2_device *v4l2_dev = &imxmd->v4l2_dev;
 	struct imx_ic_priv *priv;
 	int ret;
 
@@ -37,7 +36,6 @@ struct v4l2_subdev *imx_media_ic_register(struct imx_media_dev *imxmd,
 
 	priv->ipu_dev = ipu_dev;
 	priv->ipu = ipu;
-	priv->md = imxmd;
 
 	/* get our IC task id */
 	switch (grp_id) {
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 663db200e594..1432776a33f9 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -302,8 +302,8 @@ static int prp_link_validate(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	csi = imx_media_find_upstream_subdev(ic_priv->md, &ic_priv->sd.entity,
-					     IMX_MEDIA_GRP_ID_IPU_CSI);
+	csi = imx_media_pipeline_subdev(&ic_priv->sd.entity,
+					IMX_MEDIA_GRP_ID_IPU_CSI, true);
 	if (IS_ERR(csi))
 		csi = NULL;
 
diff --git a/drivers/staging/media/imx/imx-ic.h b/drivers/staging/media/imx/imx-ic.h
index 1dcbb37aeada..ff2f66f11982 100644
--- a/drivers/staging/media/imx/imx-ic.h
+++ b/drivers/staging/media/imx/imx-ic.h
@@ -16,7 +16,6 @@
 struct imx_ic_priv {
 	struct device *ipu_dev;
 	struct ipu_soc *ipu;
-	struct imx_media_dev *md;
 	struct v4l2_subdev sd;
 	int    task_id;
 	void   *task_priv;
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 68c2b1a3066a..555904759078 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -60,7 +60,6 @@ struct csi_skip_desc {
 struct csi_priv {
 	struct device *dev;
 	struct ipu_soc *ipu;
-	struct imx_media_dev *md;
 	struct v4l2_subdev sd;
 	struct media_pad pad[CSI_NUM_PADS];
 	/* the video device at IDMAC output pad */
@@ -182,8 +181,8 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 		 * CSI-2 receiver if it is in the path, otherwise stay
 		 * with video mux.
 		 */
-		sd = imx_media_find_upstream_subdev(priv->md, src,
-						    IMX_MEDIA_GRP_ID_CSI2);
+		sd = imx_media_pipeline_subdev(src, IMX_MEDIA_GRP_ID_CSI2,
+					       true);
 		if (!IS_ERR(sd))
 			src = &sd->entity;
 	}
@@ -197,7 +196,7 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 		src = &priv->sd.entity;
 
 	/* get source pad of entity directly upstream from src */
-	pad = imx_media_find_upstream_pad(priv->md, src, 0);
+	pad = imx_media_pipeline_pad(src, 0, 0, true);
 	if (IS_ERR(pad))
 		return PTR_ERR(pad);
 
@@ -1138,8 +1137,7 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 		 */
 #if 0
 		mutex_unlock(&priv->lock);
-		vc_num = imx_media_find_mipi_csi2_channel(priv->md,
-							  &priv->sd.entity);
+		vc_num = imx_media_find_mipi_csi2_channel(&priv->sd.entity);
 		if (vc_num < 0)
 			return vc_num;
 		mutex_lock(&priv->lock);
@@ -1753,9 +1751,6 @@ static int csi_registered(struct v4l2_subdev *sd)
 	int i, ret;
 	u32 code;
 
-	/* get media device */
-	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
-
 	/* get handle to IPU CSI */
 	csi = ipu_csi_get(priv->ipu, priv->csi_id);
 	if (IS_ERR(csi)) {
diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index 6d283f4ea4d1..750682fcd48d 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -41,8 +41,6 @@ enum {
 #define FIM_CL_TOLERANCE_MAX_DEF   0 /* no max tolerance (unbounded) */
 
 struct imx_media_fim {
-	struct imx_media_dev *md;
-
 	/* the owning subdev of this fim instance */
 	struct v4l2_subdev *sd;
 
@@ -474,8 +472,6 @@ struct imx_media_fim *imx_media_fim_init(struct v4l2_subdev *sd)
 	if (!fim)
 		return ERR_PTR(-ENOMEM);
 
-	/* get media device */
-	fim->md = dev_get_drvdata(sd->v4l2_dev->dev);
 	fim->sd = sd;
 
 	spin_lock_init(&fim->lock);
diff --git a/drivers/staging/media/imx/imx-media-internal-sd.c b/drivers/staging/media/imx/imx-media-internal-sd.c
index 618a930da37c..f74e2ab4f37f 100644
--- a/drivers/staging/media/imx/imx-media-internal-sd.c
+++ b/drivers/staging/media/imx/imx-media-internal-sd.c
@@ -35,7 +35,7 @@ struct internal_subdev {
 	u32 grp_id;
 	struct internal_pad pad[MAX_INTERNAL_PADS];
 
-	struct v4l2_subdev * (*sync_register)(struct imx_media_dev *imxmd,
+	struct v4l2_subdev * (*sync_register)(struct v4l2_device *v4l2_dev,
 					      struct device *ipu_dev,
 					      struct ipu_soc *ipu,
 					      u32 grp_id);
@@ -228,7 +228,8 @@ int imx_media_register_ipu_internal_subdevs(struct imx_media_dev *imxmd,
 			continue;
 
 		mutex_unlock(&imxmd->mutex);
-		sd = intsd->sync_register(imxmd, ipu_dev, ipu, intsd->grp_id);
+		sd = intsd->sync_register(&imxmd->v4l2_dev, ipu_dev, ipu,
+					  intsd->grp_id);
 		mutex_lock(&imxmd->mutex);
 		if (IS_ERR(sd)) {
 			ret = PTR_ERR(sd);
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index a80ef0b087ad..862508d5d30c 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -772,19 +772,22 @@ void imx_media_add_video_device(struct imx_media_dev *imxmd,
 EXPORT_SYMBOL_GPL(imx_media_add_video_device);
 
 /*
- * Search upstream/downstream for a subdevice in the current pipeline
- * with given grp_id, starting from start_entity. Returns the subdev's
- * source/sink pad that it was reached from. If grp_id is zero, just
- * returns the nearest source/sink pad to start_entity. Must be called
- * with mdev->graph_mutex held.
+ * Search upstream/downstream for a subdevice or video device pad in the
+ * current pipeline, starting from start_entity. Returns the device's
+ * source/sink pad that it was reached from. Must be called with
+ * mdev->graph_mutex held.
+ *
+ * If grp_id != 0, finds a subdevice's pad of given grp_id.
+ * Else If buftype != 0, finds a video device's pad of given buffer type.
+ * Else, returns the nearest source/sink pad to start_entity.
  */
-static struct media_pad *
-find_pipeline_pad(struct imx_media_dev *imxmd,
-		  struct media_entity *start_entity,
-		  u32 grp_id, bool upstream)
+struct media_pad *
+imx_media_pipeline_pad(struct media_entity *start_entity, u32 grp_id,
+		       enum v4l2_buf_type buftype, bool upstream)
 {
 	struct media_entity *me = start_entity;
 	struct media_pad *pad = NULL;
+	struct video_device *vfd;
 	struct v4l2_subdev *sd;
 	int i;
 
@@ -796,16 +799,27 @@ find_pipeline_pad(struct imx_media_dev *imxmd,
 			continue;
 
 		pad = media_entity_remote_pad(spad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		if (!pad)
 			continue;
 
-		if (grp_id != 0) {
-			sd = media_entity_to_v4l2_subdev(pad->entity);
-			if (sd->grp_id & grp_id)
-				return pad;
+		if (grp_id) {
+			if (is_media_entity_v4l2_subdev(pad->entity)) {
+				sd = media_entity_to_v4l2_subdev(pad->entity);
+				if (sd->grp_id & grp_id)
+					return pad;
+			}
+
+			return imx_media_pipeline_pad(pad->entity, grp_id,
+						      buftype, upstream);
+		} else if (buftype) {
+			if (is_media_entity_v4l2_video_device(pad->entity)) {
+				vfd = media_entity_to_video_device(pad->entity);
+				if (buftype == vfd->queue->type)
+					return pad;
+			}
 
-			return find_pipeline_pad(imxmd, pad->entity,
-						 grp_id, upstream);
+			return imx_media_pipeline_pad(pad->entity, grp_id,
+						      buftype, upstream);
 		} else {
 			return pad;
 		}
@@ -813,28 +827,33 @@ find_pipeline_pad(struct imx_media_dev *imxmd,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(imx_media_pipeline_pad);
 
 /*
- * Search upstream for a subdev in the current pipeline with
- * given grp_id. Must be called with mdev->graph_mutex held.
+ * Search upstream/downstream for a subdev or video device in the current
+ * pipeline. Must be called with mdev->graph_mutex held.
  */
-static struct v4l2_subdev *
-find_upstream_subdev(struct imx_media_dev *imxmd,
-		     struct media_entity *start_entity,
-		     u32 grp_id)
+static struct media_entity *
+find_pipeline_entity(struct media_entity *start, u32 grp_id,
+		     enum v4l2_buf_type buftype, bool upstream)
 {
+	struct media_pad *pad = NULL;
+	struct video_device *vfd;
 	struct v4l2_subdev *sd;
-	struct media_pad *pad;
 
-	if (is_media_entity_v4l2_subdev(start_entity)) {
-		sd = media_entity_to_v4l2_subdev(start_entity);
+	if (grp_id && is_media_entity_v4l2_subdev(start)) {
+		sd = media_entity_to_v4l2_subdev(start);
 		if (sd->grp_id & grp_id)
-			return sd;
+			return &sd->entity;
+	} else if (buftype && is_media_entity_v4l2_video_device(start)) {
+		vfd = media_entity_to_video_device(pad->entity);
+		if (buftype == vfd->queue->type)
+			return &vfd->entity;
 	}
 
-	pad = find_pipeline_pad(imxmd, start_entity, grp_id, true);
+	pad = imx_media_pipeline_pad(start, grp_id, buftype, upstream);
 
-	return pad ? media_entity_to_v4l2_subdev(pad->entity) : NULL;
+	return pad ? pad->entity : NULL;
 }
 
 /*
@@ -842,62 +861,57 @@ find_upstream_subdev(struct imx_media_dev *imxmd,
  * start entity in the current pipeline.
  * Must be called with mdev->graph_mutex held.
  */
-int imx_media_find_mipi_csi2_channel(struct imx_media_dev *imxmd,
-				     struct media_entity *start_entity)
+int imx_media_pipeline_csi2_channel(struct media_entity *start_entity)
 {
 	struct media_pad *pad;
 	int ret = -EPIPE;
 
-	pad = find_pipeline_pad(imxmd, start_entity, IMX_MEDIA_GRP_ID_CSI2,
-				true);
-	if (pad) {
+	pad = imx_media_pipeline_pad(start_entity, IMX_MEDIA_GRP_ID_CSI2,
+				     0, true);
+	if (pad)
 		ret = pad->index - 1;
-		dev_dbg(imxmd->md.dev, "found vc%d from %s\n",
-			ret, start_entity->name);
-	}
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(imx_media_find_mipi_csi2_channel);
+EXPORT_SYMBOL_GPL(imx_media_pipeline_csi2_channel);
 
 /*
- * Find a source pad reached upstream from the given start entity in
- * the current pipeline. Must be called with mdev->graph_mutex held.
+ * Find a subdev reached upstream from the given start entity in
+ * the current pipeline.
+ * Must be called with mdev->graph_mutex held.
  */
-struct media_pad *
-imx_media_find_upstream_pad(struct imx_media_dev *imxmd,
-			    struct media_entity *start_entity,
-			    u32 grp_id)
+struct v4l2_subdev *
+imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
+			  bool upstream)
 {
-	struct media_pad *pad;
+	struct media_entity *me;
 
-	pad = find_pipeline_pad(imxmd, start_entity, grp_id, true);
-	if (!pad)
+	me = find_pipeline_entity(start_entity, grp_id, 0, upstream);
+	if (!me)
 		return ERR_PTR(-ENODEV);
 
-	return pad;
+	return media_entity_to_v4l2_subdev(me);
 }
-EXPORT_SYMBOL_GPL(imx_media_find_upstream_pad);
+EXPORT_SYMBOL_GPL(imx_media_pipeline_subdev);
 
 /*
  * Find a subdev reached upstream from the given start entity in
  * the current pipeline.
  * Must be called with mdev->graph_mutex held.
  */
-struct v4l2_subdev *
-imx_media_find_upstream_subdev(struct imx_media_dev *imxmd,
-			       struct media_entity *start_entity,
-			       u32 grp_id)
+struct video_device *
+imx_media_pipeline_video_device(struct media_entity *start_entity,
+				enum v4l2_buf_type buftype, bool upstream)
 {
-	struct v4l2_subdev *sd;
+	struct media_entity *me;
 
-	sd = find_upstream_subdev(imxmd, start_entity, grp_id);
-	if (!sd)
+	me = find_pipeline_entity(start_entity, 0, buftype, upstream);
+	if (!me)
 		return ERR_PTR(-ENODEV);
 
-	return sd;
+	return media_entity_to_video_device(me);
 }
-EXPORT_SYMBOL_GPL(imx_media_find_upstream_subdev);
+EXPORT_SYMBOL_GPL(imx_media_pipeline_video_device);
 
 /*
  * Turn current pipeline streaming on/off starting from entity.
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 5dd4c733de97..5f6a1d5853f3 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -65,7 +65,6 @@ struct vdic_priv {
 	struct device *ipu_dev;
 	struct ipu_soc *ipu;
 
-	struct imx_media_dev *md;
 	struct v4l2_subdev   sd;
 	struct media_pad pad[VDIC_NUM_PADS];
 
@@ -927,12 +926,11 @@ static const struct v4l2_subdev_internal_ops vdic_internal_ops = {
 	.unregistered = vdic_unregistered,
 };
 
-struct v4l2_subdev *imx_media_vdic_register(struct imx_media_dev *imxmd,
+struct v4l2_subdev *imx_media_vdic_register(struct v4l2_device *v4l2_dev,
 					    struct device *ipu_dev,
 					    struct ipu_soc *ipu,
 					    u32 grp_id)
 {
-	struct v4l2_device *v4l2_dev = &imxmd->v4l2_dev;
 	struct vdic_priv *priv;
 	int ret;
 
@@ -942,7 +940,6 @@ struct v4l2_subdev *imx_media_vdic_register(struct imx_media_dev *imxmd,
 
 	priv->ipu_dev = ipu_dev;
 	priv->ipu = ipu;
-	priv->md = imxmd;
 
 	v4l2_subdev_init(&priv->sd, &vdic_subdev_ops);
 	v4l2_set_subdevdata(&priv->sd, priv);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index c0e58d4f2dfb..a3b60f99a7d8 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -190,16 +190,16 @@ imx_media_find_subdev_by_devname(struct imx_media_dev *imxmd,
 				 const char *devname);
 void imx_media_add_video_device(struct imx_media_dev *imxmd,
 				struct imx_media_video_dev *vdev);
-int imx_media_find_mipi_csi2_channel(struct imx_media_dev *imxmd,
-				     struct media_entity *start_entity);
+int imx_media_pipeline_csi2_channel(struct media_entity *start_entity);
 struct media_pad *
-imx_media_find_upstream_pad(struct imx_media_dev *imxmd,
-			    struct media_entity *start_entity,
-			    u32 grp_id);
+imx_media_pipeline_pad(struct media_entity *start_entity, u32 grp_id,
+		       enum v4l2_buf_type buftype, bool upstream);
 struct v4l2_subdev *
-imx_media_find_upstream_subdev(struct imx_media_dev *imxmd,
-			       struct media_entity *start_entity,
-			       u32 grp_id);
+imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
+			  bool upstream);
+struct video_device *
+imx_media_pipeline_video_device(struct media_entity *start_entity,
+				enum v4l2_buf_type buftype, bool upstream);
 
 struct imx_media_dma_buf {
 	void          *virt;
@@ -250,14 +250,14 @@ int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 			 struct device_node *csi_np);
 
 /* imx-media-vdic.c */
-struct v4l2_subdev *imx_media_vdic_register(struct imx_media_dev *imxmd,
+struct v4l2_subdev *imx_media_vdic_register(struct v4l2_device *v4l2_dev,
 					    struct device *ipu_dev,
 					    struct ipu_soc *ipu,
 					    u32 grp_id);
 int imx_media_vdic_unregister(struct v4l2_subdev *sd);
 
 /* imx-ic-common.c */
-struct v4l2_subdev *imx_media_ic_register(struct imx_media_dev *imxmd,
+struct v4l2_subdev *imx_media_ic_register(struct v4l2_device *v4l2_dev,
 					  struct device *ipu_dev,
 					  struct ipu_soc *ipu,
 					  u32 grp_id);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 75514618d021..7eda67ed1bd7 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -450,7 +450,7 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 
 skip_video_mux:
 	/* get source pad of entity directly upstream from src */
-	pad = imx_media_find_upstream_pad(csi->imxmd, src, 0);
+	pad = imx_media_pipeline_pad(src, 0, 0, true);
 	if (IS_ERR(pad))
 		return PTR_ERR(pad);
 
-- 
2.17.1

