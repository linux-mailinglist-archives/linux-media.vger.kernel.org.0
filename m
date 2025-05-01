Return-Path: <linux-media+bounces-31498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088AFAA5F63
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 15:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC8719C4AB2
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C561D5CE8;
	Thu,  1 May 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwFeF/qc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F162EAE5
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107018; cv=none; b=tFFw6jHXnpjmNxF3xovGPjVdR6yXBryk0TfA5FCaecPzhXhKPt9c+UFSZLrGaNfuyDCWpb2EFw177zjdVbOUMXQefFiPJdyzUxiVSxIlGT0oZ0s7bbzLktnun5Qh0CK9FzjbcTP/tVFEA/uGIF8bwEc9GH/JMjbSTxerfOfgfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107018; c=relaxed/simple;
	bh=/ZhabCZj0wALJlbf4+SKvdTBeztwMtUf7lCp7y6BtxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tg8kJonMknFlIjBRCiuDClmCbK5yuuJvVKnjCDj8UpJAqOO3tEoYjp4zUALTwExYmTOOAQ7NMwMQT+MjtRxgSLTEQQd7NwBlh2Vr1p2I9JCNWbd00TaVR2dfc02q+k6MOe+ZI23vWnUq4/eDxzx2rNJ60qX8Ae9jd4ud1G2fBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hwFeF/qc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746107015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrgbgRSMevylXTe51cKCrnX0WwZVB4aDB2i/WBRNp5Q=;
	b=hwFeF/qcpAP5WkfmqLk/VyaWaNsoAp8NWjDnZPgDHGUJHp53xo7+uepqie+OAIvff8E1fo
	lT6w2JDQZOhvzoM2DrsyJYudn3M+AaauNFB80yqxZbu8yeu60FnixufePD0oPvFtc7Tz5B
	cFwNTmP2GapfA3nQfdajK5s5itZFD0A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-umXCCe2GMgeJNxzshE7OaQ-1; Thu,
 01 May 2025 09:43:34 -0400
X-MC-Unique: umXCCe2GMgeJNxzshE7OaQ-1
X-Mimecast-MFC-AGG-ID: umXCCe2GMgeJNxzshE7OaQ_1746107013
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EDF551800981;
	Thu,  1 May 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.142])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A4D421956094;
	Thu,  1 May 2025 13:43:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/4] media: atomisp: Add support for sensors with a separate ISP v4l2_subdev
Date: Thu,  1 May 2025 15:43:11 +0200
Message-ID: <20250501134312.104711-4-hdegoede@redhat.com>
In-Reply-To: <20250501134312.104711-1-hdegoede@redhat.com>
References: <20250501134312.104711-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Some sensors have an ISP inside the sensor which the sensor driver models
as a separate v4l2-subdev, like the mt9m114 sensor-driver does.

Since the atomisp driver emulates a standard /dev/video# v4l2-device
without requiring the application to be aware of media-controller centric
/dev/video# devices this requires some special handling in the driver.

Add support for this setup to the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 36 ++++++++++++++++---
 .../media/atomisp/pci/atomisp_internal.h      |  6 ++++
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  6 ++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 28 +++++++++++++--
 4 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index f8ecd07ee9d9..e2d9c5b4bfc0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -881,7 +881,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	spin_unlock_irqrestore(&isp->lock, flags);
 
 	/* stream off sensor */
-	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].sensor, video, s_stream, 0);
+	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].csi_remote_source,
+			       video, s_stream, 0);
 	if (ret)
 		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
 
@@ -936,7 +937,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	/* Requeue unprocessed per-frame parameters. */
 	atomisp_recover_params_queue(&isp->asd.video_out);
 
-	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].sensor, video, s_stream, 1);
+	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].csi_remote_source,
+			       video, s_stream, 1);
 	if (ret)
 		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
 
@@ -3677,7 +3679,7 @@ void atomisp_setup_input_links(struct atomisp_device *isp)
 		 * will end up calling atomisp_link_setup() which calls this
 		 * function again leading to endless recursion.
 		 */
-		if (isp->sensor_subdevs[i] == isp->inputs[isp->asd.input_curr].sensor)
+		if (isp->sensor_subdevs[i] == isp->inputs[isp->asd.input_curr].csi_remote_source)
 			link->flags |= MEDIA_LNK_FL_ENABLED;
 		else
 			link->flags &= ~MEDIA_LNK_FL_ENABLED;
@@ -3746,14 +3748,38 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 			sel.r.left, sel.r.top, sel.r.width, sel.r.height, ret);
 
 set_fmt:
-	if (ret == 0)
+	if (ret == 0) {
 		ret = v4l2_subdev_call(input->sensor, pad, set_fmt, sd_state, &format);
+		dev_dbg(isp->dev, "Set sensor format ret: %d size %dx%d\n",
+			ret, format.format.width, format.format.height);
+	}
 
 	if (sd_state)
 		v4l2_subdev_unlock_state(sd_state);
 
+	/* Propagate new fmt to sensor ISP */
+	if (ret == 0 && which == V4L2_SUBDEV_FORMAT_ACTIVE && input->sensor_isp) {
+		sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor_isp);
+
+		format.pad = SENSOR_ISP_PAD_SINK;
+		ret = v4l2_subdev_call(input->sensor_isp, pad, set_fmt, sd_state, &format);
+		dev_dbg(isp->dev, "Set sensor ISP sink format ret: %d size %dx%d\n",
+			ret, format.format.width, format.format.height);
+
+		if (ret == 0) {
+			format.pad = SENSOR_ISP_PAD_SOURCE;
+			ret = v4l2_subdev_call(input->sensor_isp, pad, set_fmt, sd_state, &format);
+			dev_dbg(isp->dev, "Set sensor ISP source format ret: %d size %dx%d\n",
+				ret, format.format.width, format.format.height);
+		}
+
+		if (sd_state)
+			v4l2_subdev_unlock_state(sd_state);
+	}
+
 	/* Propagate new fmt to CSI port */
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+	if (ret == 0 && which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		format.pad = CSI2_PAD_SINK;
 		ret = v4l2_subdev_call(input->csi_port, pad, set_fmt, NULL, &format);
 		if (ret)
 			return ret;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 268cfafbfe48..5a69580b8251 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -109,6 +109,10 @@
 #define DIV_NEAREST_STEP(n, d, step) \
 	round_down((2 * (n) + (d) * (step)) / (2 * (d)), (step))
 
+#define SENSOR_ISP_PAD_SINK		0
+#define SENSOR_ISP_PAD_SOURCE		1
+#define SENSOR_ISP_PADS_NUM		2
+
 struct atomisp_input_subdev {
 	enum atomisp_camera_port port;
 	u32 code; /* MEDIA_BUS_FMT_* */
@@ -116,7 +120,9 @@ struct atomisp_input_subdev {
 	bool crop_support;
 	bool sensor_on;
 	struct v4l2_subdev *sensor;
+	struct v4l2_subdev *sensor_isp;
 	struct v4l2_subdev *csi_port;
+	struct v4l2_subdev *csi_remote_source;
 	/* Sensor rects for sensors which support crop */
 	struct v4l2_rect native_rect;
 	struct v4l2_rect active_rect;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 269c2d5efa8c..97d99bed1560 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -945,7 +945,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	/* stream on the sensor */
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].sensor,
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].csi_remote_source,
 			       video, s_stream, 1);
 	if (ret) {
 		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
@@ -1002,7 +1002,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 
 	atomisp_subdev_cleanup_pending_events(asd);
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].sensor,
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].csi_remote_source,
 			       video, s_stream, 0);
 	if (ret)
 		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
@@ -1332,7 +1332,7 @@ static int atomisp_s_parm(struct file *file, void *fh,
 
 		fi.interval = parm->parm.capture.timeperframe;
 
-		rval = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].sensor,
+		rval = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].csi_remote_source,
 						     pad, set_frame_interval, &fi);
 		if (!rval)
 			parm->parm.capture.timeperframe = fi.interval;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index ac8fefca7922..0bd0bfded4af 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -999,8 +999,9 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
+	struct media_pad *sensor_isp_sink, *sensor_src;
 	struct atomisp_input_subdev *input;
-	int i, err;
+	int i, err, source_pad;
 
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
 		err = media_create_pad_link(&isp->csi2_port[i].subdev.entity,
@@ -1015,12 +1016,33 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 		input = &isp->inputs[isp->input_cnt];
 
 		input->port = i;
-		input->sensor = isp->sensor_subdevs[i];
 		input->csi_port = &isp->csi2_port[i].subdev;
+		input->csi_remote_source = isp->sensor_subdevs[i];
+
+		/*
+		 * Special case for sensors with a ISP in the sensor modelled
+		 * as a separate v4l2-subdev, like the mt9m114.
+		 */
+		if (isp->sensor_subdevs[i]->entity.function == MEDIA_ENT_F_PROC_VIDEO_ISP) {
+			input->sensor_isp = isp->sensor_subdevs[i];
+			source_pad = SENSOR_ISP_PAD_SOURCE;
+
+			sensor_isp_sink = &input->sensor_isp->entity.pads[SENSOR_ISP_PAD_SINK];
+			sensor_src = media_pad_remote_pad_first(sensor_isp_sink);
+			if (!sensor_src) {
+				dev_err(isp->dev, "Error could not find remote pad for sensor ISP sink\n");
+				return -ENOENT;
+			}
+
+			input->sensor = media_entity_to_v4l2_subdev(sensor_src->entity);
+		} else {
+			input->sensor = isp->sensor_subdevs[i];
+			source_pad = 0;
+		}
 
 		atomisp_init_sensor(input);
 
-		err = media_create_pad_link(&input->sensor->entity, 0,
+		err = media_create_pad_link(&isp->sensor_subdevs[i]->entity, source_pad,
 					    &isp->csi2_port[i].subdev.entity,
 					    CSI2_PAD_SINK,
 					    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
-- 
2.49.0


