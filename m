Return-Path: <linux-media+bounces-23272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7649EE2B7
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6DB281212
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB7B212FBB;
	Thu, 12 Dec 2024 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="he9OaoDM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA82116EF;
	Thu, 12 Dec 2024 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995238; cv=none; b=dzw/dFg64THVMbuK6adtzNyRJxfUHWtIQwtRGu2mQjZXy/3ox7J24k4auEjhEJ6YW5YX9f/0vxAMAjii2VgV/iEh/LQIrmXVKuf7tz/BYcYOcOYqI/qyPk71ROJ0DDRGU6XR35QN1Em/2SFpH1PiwgfCs8JiTGw61DixOwJi9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995238; c=relaxed/simple;
	bh=2MYLk4Gv0oxdoA0R6BeDtkXe+XWGqU7QU0Owhsvn9kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=F1xexVYkjnZimTbYcSMeKRn+CkPEIISn8eiSw5T6Ak6JtY/IOod72P6qo+zKhz1kJBpDQwvdaxlX7AMP/zo7KtnpyBlom//zuEeKKKlPod2D48PaMo1FVg4kQEUl4oF0uPFnf0I2p+czPJqIePt+KOf+7xrPQaVBm7cv1jWhXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=he9OaoDM; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC5E2mT011970;
	Thu, 12 Dec 2024 10:20:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9djGQt/1vPS7xqyyt+IwfE4aekLbd3VrWSgbmovZwzc=; b=he9OaoDM7gatbRC0
	mr9QW6QpgEN9h9ZDW7yGyo9BsyGPQvMOFTAAXFL+xaxVJirVPm57X00xiN0Szhvy
	aqS0BYO9kiQ0pZwOtjAqd3IGN4PBGB7YuKLNTat+cG1aVtBBkpDSDu2zQsTgST69
	ly45gQxYiWMwNwtaPxFcEfCOthBh2zDRAmE1gDOKt5CZZwWluiSo+odTN12vHVnk
	ZpfbZBbEx5r2nFEFwozgTH2uNePmayKtQNkYF4En97ITSB+JlkOLgCQb7v3aSjPi
	UfUlPVyE/lXwKsi9HT5IhYgYrgHZeSJXR7IZpxvEM4pp0JerrQtGwzm2CmNlw9q5
	eHmwiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9x8vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B27944004A;
	Thu, 12 Dec 2024 10:18:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D81A255297;
	Thu, 12 Dec 2024 10:18:06 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:05 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:29 +0100
Subject: [PATCH v4 05/15] media: stm32: dcmipp: replace s_stream with
 enable/disable_streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-5-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Replace s_stream ops with enable_streams and disable_streams.
At the same time, use v4l2_subdev_enable_streams and
v4l2_subdev_disable_streams functions instead of
direct s_stream calls.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2: add missing state argument within dcmipp_par_configure call
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  49 ++++------
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  98 +++++++++++--------
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        | 107 ++++++++++++---------
 3 files changed, 139 insertions(+), 115 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 7f9fa79402df..209693e8296e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -112,6 +112,7 @@ struct dcmipp_bytecap_device {
 	u32 sequence;
 	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
+	u32 s_subdev_pad_nb;
 
 	enum dcmipp_state state;
 
@@ -337,33 +338,6 @@ static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static int dcmipp_pipeline_s_stream(struct dcmipp_bytecap_device *vcap,
-				    int state)
-{
-	struct media_pad *pad;
-	int ret;
-
-	/*
-	 * Get source subdev - since link is IMMUTABLE, pointer is cached
-	 * within the dcmipp_bytecap_device structure
-	 */
-	if (!vcap->s_subdev) {
-		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			return -EINVAL;
-		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
-	}
-
-	ret = v4l2_subdev_call(vcap->s_subdev, video, s_stream, state);
-	if (ret < 0) {
-		dev_err(vcap->dev, "failed to %s streaming (%d)\n",
-			state ? "start" : "stop", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 				 struct dcmipp_buf *buf)
 {
@@ -395,11 +369,24 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
 	struct dcmipp_buf *buf;
+	struct media_pad *pad;
 	int ret;
 
 	vcap->sequence = 0;
 	memset(&vcap->count, 0, sizeof(vcap->count));
 
+	/*
+	 * Get source subdev - since link is IMMUTABLE, pointer is cached
+	 * within the dcmipp_bytecap_device structure
+	 */
+	if (!vcap->s_subdev) {
+		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			return -EINVAL;
+		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
+		vcap->s_subdev_pad_nb = pad->index;
+	}
+
 	ret = pm_runtime_resume_and_get(vcap->dev);
 	if (ret < 0) {
 		dev_err(vcap->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
@@ -414,7 +401,8 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_pm_put;
 	}
 
-	ret = dcmipp_pipeline_s_stream(vcap, 1);
+	ret = v4l2_subdev_enable_streams(vcap->s_subdev,
+					 vcap->s_subdev_pad_nb, BIT_ULL(0));
 	if (ret)
 		goto err_media_pipeline_stop;
 
@@ -482,7 +470,10 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	int ret;
 	u32 status;
 
-	dcmipp_pipeline_s_stream(vcap, 0);
+	ret = v4l2_subdev_disable_streams(vcap->s_subdev,
+					  vcap->s_subdev_pad_nb, BIT_ULL(0));
+	if (ret)
+		dev_warn(vcap->dev, "Failed to disable stream\n");
 
 	/* Stop the media pipeline */
 	media_pipeline_stop(vcap->vdev.entity.pads);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 50500112eab9..a19c8235af56 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -380,30 +380,19 @@ static int dcmipp_byteproc_set_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_pad_ops dcmipp_byteproc_pad_ops = {
-	.enum_mbus_code		= dcmipp_byteproc_enum_mbus_code,
-	.enum_frame_size	= dcmipp_byteproc_enum_frame_size,
-	.get_fmt		= v4l2_subdev_get_fmt,
-	.set_fmt		= dcmipp_byteproc_set_fmt,
-	.get_selection		= dcmipp_byteproc_get_selection,
-	.set_selection		= dcmipp_byteproc_set_selection,
-};
-
 static int dcmipp_byteproc_configure_scale_crop
-			(struct dcmipp_byteproc_device *byteproc)
+			(struct dcmipp_byteproc_device *byteproc,
+			 struct v4l2_subdev_state *state)
 {
 	const struct dcmipp_byteproc_pix_map *vpix;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	u32 hprediv, vprediv;
 	struct v4l2_rect *compose, *crop;
 	u32 val = 0;
 
-	state = v4l2_subdev_lock_and_get_active_state(&byteproc->sd);
 	sink_fmt = v4l2_subdev_state_get_format(state, 0);
 	compose = v4l2_subdev_state_get_compose(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 1);
-	v4l2_subdev_unlock_state(state);
 
 	/* find output format bpp */
 	vpix = dcmipp_byteproc_pix_map_by_code(sink_fmt->code);
@@ -458,46 +447,73 @@ static int dcmipp_byteproc_configure_scale_crop
 	return 0;
 }
 
-static int dcmipp_byteproc_s_stream(struct v4l2_subdev *sd, int enable)
+static int dcmipp_byteproc_enable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
 {
 	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev *s_subdev;
-	struct media_pad *pad;
-	int ret = 0;
+	struct media_pad *s_pad;
+	int ret;
 
 	/* Get source subdev */
-	pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
 		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(pad->entity);
-
-	if (enable) {
-		ret = dcmipp_byteproc_configure_scale_crop(byteproc);
-		if (ret)
-			return ret;
-
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(byteproc->dev,
-				"failed to start source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
-	} else {
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(byteproc->dev,
-				"failed to stop source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = dcmipp_byteproc_configure_scale_crop(byteproc, state);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(byteproc->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
 	}
 
 	return 0;
 }
 
+static int dcmipp_byteproc_disable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(byteproc->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_byteproc_pad_ops = {
+	.enum_mbus_code		= dcmipp_byteproc_enum_mbus_code,
+	.enum_frame_size	= dcmipp_byteproc_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_byteproc_set_fmt,
+	.get_selection		= dcmipp_byteproc_get_selection,
+	.set_selection		= dcmipp_byteproc_set_selection,
+	.enable_streams		= dcmipp_byteproc_enable_streams,
+	.disable_streams	= dcmipp_byteproc_disable_streams,
+};
+
 static const struct v4l2_subdev_video_ops dcmipp_byteproc_video_ops = {
-	.s_stream = dcmipp_byteproc_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_ops dcmipp_byteproc_ops = {
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
index 05e8897ae37a..823c9da336a7 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
@@ -260,18 +260,11 @@ static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
-	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
-	.enum_frame_size	= dcmipp_par_enum_frame_size,
-	.get_fmt		= v4l2_subdev_get_fmt,
-	.set_fmt		= dcmipp_par_set_fmt,
-};
-
-static int dcmipp_par_configure(struct dcmipp_par_device *par)
+static int dcmipp_par_configure(struct dcmipp_par_device *par,
+				struct v4l2_subdev_state *state)
 {
 	u32 val = 0;
 	const struct dcmipp_par_pix_map *vpix;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_mbus_framefmt *src_fmt;
 
@@ -305,10 +298,8 @@ static int dcmipp_par_configure(struct dcmipp_par_device *par)
 	}
 
 	/* Set format */
-	state = v4l2_subdev_lock_and_get_active_state(&par->sd);
 	sink_fmt = v4l2_subdev_state_get_format(state, 0);
 	src_fmt = v4l2_subdev_state_get_format(state, 1);
-	v4l2_subdev_unlock_state(state);
 
 	vpix = dcmipp_par_pix_map_by_code(sink_fmt->code, src_fmt->code);
 	if (!vpix) {
@@ -327,53 +318,79 @@ static int dcmipp_par_configure(struct dcmipp_par_device *par)
 	return 0;
 }
 
-static int dcmipp_par_s_stream(struct v4l2_subdev *sd, int enable)
+static int dcmipp_par_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
 {
 	struct dcmipp_par_device *par =
 				container_of(sd, struct dcmipp_par_device, sd);
 	struct v4l2_subdev *s_subdev;
-	struct media_pad *pad;
-	int ret = 0;
+	struct media_pad *s_pad;
+	int ret;
 
 	/* Get source subdev */
-	pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
 		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(pad->entity);
-
-	if (enable) {
-		ret = dcmipp_par_configure(par);
-		if (ret)
-			return ret;
-
-		/* Enable parallel interface */
-		reg_set(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
-
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(par->dev,
-				"failed to start source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
-	} else {
-		ret = v4l2_subdev_call(s_subdev, video, s_stream, enable);
-		if (ret < 0) {
-			dev_err(par->dev,
-				"failed to stop source subdev streaming (%d)\n",
-				ret);
-			return ret;
-		}
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = dcmipp_par_configure(par, state);
+	if (ret)
+		return ret;
+
+	/* Enable parallel interface */
+	reg_set(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
 
-		/* Disable parallel interface */
-		reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(par->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
+static int dcmipp_par_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct dcmipp_par_device *par =
+				container_of(sd, struct dcmipp_par_device, sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(par->dev,
+			"failed to stop source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	/* Disable parallel interface */
+	reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
+	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
+	.enum_frame_size	= dcmipp_par_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_par_set_fmt,
+	.enable_streams		= dcmipp_par_enable_streams,
+	.disable_streams	= dcmipp_par_disable_streams,
+};
+
 static const struct v4l2_subdev_video_ops dcmipp_par_video_ops = {
-	.s_stream = dcmipp_par_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_ops dcmipp_par_ops = {

-- 
2.34.1


