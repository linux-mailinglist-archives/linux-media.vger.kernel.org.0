Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C9B5D397
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfGBPx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:53:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25540 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726308AbfGBPxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 11:53:22 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62FotjK006865;
        Tue, 2 Jul 2019 17:53:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9pZ9+lN83272LNcYF2gVJa9JSX/Zw4AAwmBGzwFkaA8=;
 b=gi4d86vI4gFJ1fnAyJfSJVdglTwhbpoQBHvvbiTemgRDqkoNsnab/XmtF8BiOt0stB3u
 I7/kpuHpxtxBYtZVlCd2RbFRCIsSWzDBr9g2/rLfhbL115JQQR9xa/cdsmkZ7EECM166
 EGnJ8mt5IPlbnGl+K/Ng8OrXnzvB62C0V6RG2rb33M/GiutQrUjEjHmUGHcSIjkHDbOg
 HKaGdLiCTN2YcpJk3S05lujVeaIB73p7NTmyJmE6kDMBAjJE09j8L+F0olrfYd02Ij37
 dUabbjiWeiTWZ9wAmRpkkJMDWXzGvbGD4xVcWjPSwrpm26BwFO37lHzliixRmyK2kBbi JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tdw49wgyc-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 17:53:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F65631;
        Tue,  2 Jul 2019 15:53:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29ECD4ADC;
        Tue,  2 Jul 2019 15:53:10 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 17:53:10 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 17:53:09
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: [PATCH v3 3/3] media: stm32-dcmi: add support of several sub-devices
Date:   Tue, 2 Jul 2019 17:52:59 +0200
Message-ID: <1562082779-31165-4-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562082779-31165-1-git-send-email-hugues.fruchet@st.com>
References: <1562082779-31165-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of several sub-devices within pipeline instead
of a single one.
This allows to support a CSI-2 camera sensor connected
through a CSI-2 to parallel bridge.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 204 +++++++++++++++++++++++++++---
 1 file changed, 186 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 6f37617..6921e6b 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -172,6 +172,7 @@ struct stm32_dcmi {
 
 	struct media_device		mdev;
 	struct media_pad		vid_cap_pad;
+	struct media_pipeline		pipeline;
 };
 
 static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
@@ -583,6 +584,131 @@ static void dcmi_buf_queue(struct vb2_buffer *vb)
 	spin_unlock_irq(&dcmi->irqlock);
 }
 
+static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
+{
+	struct media_entity *entity = &dcmi->vdev->entity;
+	struct media_pad *pad;
+
+	/* Walk searching for entity having no sink */
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_entity_remote_pad(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+	}
+
+	return entity;
+}
+
+static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
+			       struct v4l2_subdev_pad_config *pad_cfg,
+			       struct v4l2_subdev_format *format)
+{
+	struct media_entity *entity = &dcmi->entity.source->entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *sink_pad = NULL;
+	struct media_pad *src_pad = NULL;
+	struct media_pad *pad = NULL;
+	struct v4l2_subdev_format fmt = *format;
+	bool found = false;
+	int ret;
+
+	/*
+	 * Starting from sensor subdevice, walk within
+	 * pipeline and set format on each subdevice
+	 */
+	while (1) {
+		unsigned int i;
+
+		/* Search if current entity has a source pad */
+		for (i = 0; i < entity->num_pads; i++) {
+			pad = &entity->pads[i];
+			if (pad->flags & MEDIA_PAD_FL_SOURCE) {
+				src_pad = pad;
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			break;
+
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		/* Propagate format on sink pad if any, otherwise source pad */
+		if (sink_pad)
+			pad = sink_pad;
+
+		dev_dbg(dcmi->dev, "%s[%d] pad format set to 0x%x %ux%u\n",
+			subdev->name, pad->index, format->format.code,
+			format->format.width, format->format.height);
+
+		fmt.pad = pad->index;
+		ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
+		if (ret < 0)
+			return ret;
+
+		/* Walk to next entity */
+		sink_pad = media_entity_remote_pad(src_pad);
+		if (!sink_pad || !is_media_entity_v4l2_subdev(sink_pad->entity))
+			break;
+
+		entity = sink_pad->entity;
+	}
+	*format = fmt;
+
+	return 0;
+}
+
+static int dcmi_pipeline_s_stream(struct stm32_dcmi *dcmi, int state)
+{
+	struct media_entity *entity = &dcmi->vdev->entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret;
+
+	/* Start/stop all entities within pipeline */
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_entity_remote_pad(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, state);
+		if (ret < 0 && ret != -ENOIOCTLCMD) {
+			dev_err(dcmi->dev, "%s: %s failed to %s streaming (%d)\n",
+				__func__, subdev->name,
+				state ? "start" : "stop", ret);
+			return ret;
+		}
+
+		dev_dbg(dcmi->dev, "%s is %s\n",
+			subdev->name, state ? "started" : "stopped");
+	}
+
+	return 0;
+}
+
+static int dcmi_pipeline_start(struct stm32_dcmi *dcmi)
+{
+	return dcmi_pipeline_s_stream(dcmi, 1);
+}
+
+static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
+{
+	dcmi_pipeline_s_stream(dcmi, 0);
+}
+
 static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
@@ -597,14 +723,17 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_release_buffers;
 	}
 
-	/* Enable stream on the sub device */
-	ret = v4l2_subdev_call(dcmi->entity.source, video, s_stream, 1);
-	if (ret && ret != -ENOIOCTLCMD) {
-		dev_err(dcmi->dev, "%s: Failed to start streaming, subdev streamon error",
-			__func__);
+	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
+	if (ret < 0) {
+		dev_err(dcmi->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
+			__func__, ret);
 		goto err_pm_put;
 	}
 
+	ret = dcmi_pipeline_start(dcmi);
+	if (ret)
+		goto err_media_pipeline_stop;
+
 	spin_lock_irq(&dcmi->irqlock);
 
 	/* Set bus width */
@@ -676,7 +805,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret) {
 		dev_err(dcmi->dev, "%s: Start streaming failed, cannot start capture\n",
 			__func__);
-		goto err_subdev_streamoff;
+		goto err_pipeline_stop;
 	}
 
 	/* Enable interruptions */
@@ -687,8 +816,11 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	return 0;
 
-err_subdev_streamoff:
-	v4l2_subdev_call(dcmi->entity.source, video, s_stream, 0);
+err_pipeline_stop:
+	dcmi_pipeline_stop(dcmi);
+
+err_media_pipeline_stop:
+	media_pipeline_stop(&dcmi->vdev->entity);
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
@@ -713,13 +845,10 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
 	struct dcmi_buf *buf, *node;
-	int ret;
 
-	/* Disable stream on the sub device */
-	ret = v4l2_subdev_call(dcmi->entity.source, video, s_stream, 0);
-	if (ret && ret != -ENOIOCTLCMD)
-		dev_err(dcmi->dev, "%s: Failed to stop streaming, subdev streamoff error (%d)\n",
-			__func__, ret);
+	dcmi_pipeline_stop(dcmi);
+
+	media_pipeline_stop(&dcmi->vdev->entity);
 
 	spin_lock_irq(&dcmi->irqlock);
 
@@ -937,8 +1066,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	mf->width = sd_framesize.width;
 	mf->height = sd_framesize.height;
 
-	ret = v4l2_subdev_call(dcmi->entity.source, pad,
-			       set_fmt, NULL, &format);
+	ret = dcmi_pipeline_s_fmt(dcmi, NULL, &format);
 	if (ret < 0)
 		return ret;
 
@@ -1529,7 +1657,20 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
 	int ret;
 
+	/*
+	 * Now that the graph is complete,
+	 * we search for the source subdevice
+	 * in order to expose it through V4L2 interface
+	 */
+	dcmi->entity.source =
+		media_entity_to_v4l2_subdev(dcmi_find_source(dcmi));
+	if (!dcmi->entity.source) {
+		dev_err(dcmi->dev, "Source subdevice not found\n");
+		return -ENODEV;
+	}
+
 	dcmi->vdev->ctrl_handler = dcmi->entity.source->ctrl_handler;
+
 	ret = dcmi_formats_init(dcmi);
 	if (ret) {
 		dev_err(dcmi->dev, "No supported mediabus format found\n");
@@ -1574,12 +1715,30 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd)
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
+	unsigned int ret;
+	int src_pad;
 
 	dev_dbg(dcmi->dev, "Subdev %s bound\n", subdev->name);
 
-	dcmi->entity.source = subdev;
+	/*
+	 * Link this sub-device to DCMI, it could be
+	 * a parallel camera sensor or a bridge
+	 */
+	src_pad = media_entity_get_fwnode_pad(&subdev->entity,
+					      subdev->fwnode,
+					      MEDIA_PAD_FL_SOURCE);
+
+	ret = media_create_pad_link(&subdev->entity, src_pad,
+				    &dcmi->vdev->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(dcmi->dev, "Failed to create media pad link with subdev %s\n",
+			subdev->name);
+	else
+		dev_dbg(dcmi->dev, "DCMI is now linked to %s\n", subdev->name);
 
-	return 0;
+	return ret;
 }
 
 static const struct v4l2_async_notifier_operations dcmi_graph_notify_ops = {
@@ -1639,6 +1798,15 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 		return ret;
 	}
 
+	/* Register all the subdev nodes */
+	ret = v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
+	if (ret) {
+		dev_err(dcmi->dev, "Failed to register subdev nodes\n");
+		v4l2_async_notifier_unregister(&dcmi->notifier);
+		of_node_put(dcmi->entity.remote_node);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.7.4

