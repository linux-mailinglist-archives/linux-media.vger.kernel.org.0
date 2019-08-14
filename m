Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C508D55B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 15:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfHNNtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 09:49:13 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22310 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725800AbfHNNtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 09:49:12 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7EDkpEU005599;
        Wed, 14 Aug 2019 15:48:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=17uDe87c50tKQgdxVxYmeWeDXo+AdHkkYcqYlgcRwu4=;
 b=Xn1MjXalTICfjjmlEl6TW7qHPbJ45Zp7R9U2o9mWObvK1D1idr4wkShKAw5Ny5XdgKo4
 8lWSaZ5AhNDkRD6MHlAG0LVCikkcn4K4I4vO0CknzqZR/FmVEuzdrzqQ9XmerPPM1v3W
 V34A/JQFFT52ONOjrVC2BAkTJ+jmgSnYS9N0z2UezE+R/ZH4sMRcrd6IG722yEgWvKK7
 Ivb4qOUf6Kt5n45UKyQAr0nRt1lOqxnocBGAWxBqI9nNdVHsA9Sn/MKi8orBZWvR2R4Y
 qXT17yyO5ctMMVOoQuXLmYd3aKWWhGOosxzkvydq5ZUDoXS1v0ufOHg664cQ3JrwJUtY pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2u9k2a64rm-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 14 Aug 2019 15:48:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 627F234;
        Wed, 14 Aug 2019 13:48:58 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 584572FFE8F;
        Wed, 14 Aug 2019 15:48:58 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 15:48:58 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug 2019 15:48:57
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
Subject: [PATCH v6 1/4] media: stm32-dcmi: improve sensor subdev naming
Date:   Wed, 14 Aug 2019 15:48:50 +0200
Message-ID: <1565790533-10043-2-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-14_05:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename "subdev" entity struct field to "source"
to prepare for several subdev support.
Move asd field on top of entity struct.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 46 +++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b9dad0a..b462f71 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -100,10 +100,10 @@ enum state {
 #define OVERRUN_ERROR_THRESHOLD	3
 
 struct dcmi_graph_entity {
-	struct device_node *node;
-
 	struct v4l2_async_subdev asd;
-	struct v4l2_subdev *subdev;
+
+	struct device_node *remote_node;
+	struct v4l2_subdev *source;
 };
 
 struct dcmi_format {
@@ -595,7 +595,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	/* Enable stream on the sub device */
-	ret = v4l2_subdev_call(dcmi->entity.subdev, video, s_stream, 1);
+	ret = v4l2_subdev_call(dcmi->entity.source, video, s_stream, 1);
 	if (ret && ret != -ENOIOCTLCMD) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, subdev streamon error",
 			__func__);
@@ -685,7 +685,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err_subdev_streamoff:
-	v4l2_subdev_call(dcmi->entity.subdev, video, s_stream, 0);
+	v4l2_subdev_call(dcmi->entity.source, video, s_stream, 0);
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
@@ -713,7 +713,7 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 	int ret;
 
 	/* Disable stream on the sub device */
-	ret = v4l2_subdev_call(dcmi->entity.subdev, video, s_stream, 0);
+	ret = v4l2_subdev_call(dcmi->entity.source, video, s_stream, 0);
 	if (ret && ret != -ENOIOCTLCMD)
 		dev_err(dcmi->dev, "%s: Failed to stop streaming, subdev streamoff error (%d)\n",
 			__func__, ret);
@@ -857,7 +857,7 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad, set_fmt,
+	ret = v4l2_subdev_call(dcmi->entity.source, pad, set_fmt,
 			       &pad_cfg, &format);
 	if (ret < 0)
 		return ret;
@@ -934,7 +934,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	mf->width = sd_framesize.width;
 	mf->height = sd_framesize.height;
 
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad,
+	ret = v4l2_subdev_call(dcmi->entity.source, pad,
 			       set_fmt, NULL, &format);
 	if (ret < 0)
 		return ret;
@@ -991,7 +991,7 @@ static int dcmi_get_sensor_format(struct stm32_dcmi *dcmi,
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(dcmi->entity.source, pad, get_fmt, NULL, &fmt);
 	if (ret)
 		return ret;
 
@@ -1020,7 +1020,7 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad, set_fmt,
+	ret = v4l2_subdev_call(dcmi->entity.source, pad, set_fmt,
 			       &pad_cfg, &format);
 	if (ret < 0)
 		return ret;
@@ -1043,7 +1043,7 @@ static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
 	/*
 	 * Get sensor bounds first
 	 */
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad, get_selection,
+	ret = v4l2_subdev_call(dcmi->entity.source, pad, get_selection,
 			       NULL, &bounds);
 	if (!ret)
 		*r = bounds.r;
@@ -1224,7 +1224,7 @@ static int dcmi_enum_framesizes(struct file *file, void *fh,
 
 	fse.code = sd_fmt->mbus_code;
 
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad, enum_frame_size,
+	ret = v4l2_subdev_call(dcmi->entity.source, pad, enum_frame_size,
 			       NULL, &fse);
 	if (ret)
 		return ret;
@@ -1241,7 +1241,7 @@ static int dcmi_g_parm(struct file *file, void *priv,
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
 
-	return v4l2_g_parm_cap(video_devdata(file), dcmi->entity.subdev, p);
+	return v4l2_g_parm_cap(video_devdata(file), dcmi->entity.source, p);
 }
 
 static int dcmi_s_parm(struct file *file, void *priv,
@@ -1249,7 +1249,7 @@ static int dcmi_s_parm(struct file *file, void *priv,
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
 
-	return v4l2_s_parm_cap(video_devdata(file), dcmi->entity.subdev, p);
+	return v4l2_s_parm_cap(video_devdata(file), dcmi->entity.source, p);
 }
 
 static int dcmi_enum_frameintervals(struct file *file, void *fh,
@@ -1271,7 +1271,7 @@ static int dcmi_enum_frameintervals(struct file *file, void *fh,
 
 	fie.code = sd_fmt->mbus_code;
 
-	ret = v4l2_subdev_call(dcmi->entity.subdev, pad,
+	ret = v4l2_subdev_call(dcmi->entity.source, pad,
 			       enum_frame_interval, NULL, &fie);
 	if (ret)
 		return ret;
@@ -1291,7 +1291,7 @@ MODULE_DEVICE_TABLE(of, stm32_dcmi_of_match);
 static int dcmi_open(struct file *file)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
-	struct v4l2_subdev *sd = dcmi->entity.subdev;
+	struct v4l2_subdev *sd = dcmi->entity.source;
 	int ret;
 
 	if (mutex_lock_interruptible(&dcmi->lock))
@@ -1322,7 +1322,7 @@ static int dcmi_open(struct file *file)
 static int dcmi_release(struct file *file)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
-	struct v4l2_subdev *sd = dcmi->entity.subdev;
+	struct v4l2_subdev *sd = dcmi->entity.source;
 	bool fh_singular;
 	int ret;
 
@@ -1433,7 +1433,7 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 {
 	const struct dcmi_format *sd_fmts[ARRAY_SIZE(dcmi_formats)];
 	unsigned int num_fmts = 0, i, j;
-	struct v4l2_subdev *subdev = dcmi->entity.subdev;
+	struct v4l2_subdev *subdev = dcmi->entity.source;
 	struct v4l2_subdev_mbus_code_enum mbus_code = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -1479,7 +1479,7 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 static int dcmi_framesizes_init(struct stm32_dcmi *dcmi)
 {
 	unsigned int num_fsize = 0;
-	struct v4l2_subdev *subdev = dcmi->entity.subdev;
+	struct v4l2_subdev *subdev = dcmi->entity.source;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = dcmi->sd_format->mbus_code,
@@ -1526,7 +1526,7 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
 	int ret;
 
-	dcmi->vdev->ctrl_handler = dcmi->entity.subdev->ctrl_handler;
+	dcmi->vdev->ctrl_handler = dcmi->entity.source->ctrl_handler;
 	ret = dcmi_formats_init(dcmi);
 	if (ret) {
 		dev_err(dcmi->dev, "No supported mediabus format found\n");
@@ -1582,7 +1582,7 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 
 	dev_dbg(dcmi->dev, "Subdev %s bound\n", subdev->name);
 
-	dcmi->entity.subdev = subdev;
+	dcmi->entity.source = subdev;
 
 	return 0;
 }
@@ -1608,7 +1608,7 @@ static int dcmi_graph_parse(struct stm32_dcmi *dcmi, struct device_node *node)
 		return -EINVAL;
 
 	/* Remote node to connect */
-	dcmi->entity.node = remote;
+	dcmi->entity.remote_node = remote;
 	dcmi->entity.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
 	dcmi->entity.asd.match.fwnode = of_fwnode_handle(remote);
 	return 0;
@@ -1631,7 +1631,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 					     &dcmi->entity.asd);
 	if (ret) {
 		dev_err(dcmi->dev, "Failed to add subdev notifier\n");
-		of_node_put(dcmi->entity.node);
+		of_node_put(dcmi->entity.remote_node);
 		return ret;
 	}
 
-- 
2.7.4

