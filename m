Return-Path: <linux-media+bounces-20868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E59BC75B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEFC0282AE8
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFDF1FEFD3;
	Tue,  5 Nov 2024 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KoLzlDxq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C61FDFA0;
	Tue,  5 Nov 2024 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793121; cv=none; b=nTt+aPkGPlI3YT4jL4QlQGOwieZGoUXC8hHGF75Ybg3uOV4qCZnybfhcIRRh7y/SZ3zOpiqlCNAytgkuaGMwCdWTXTuXVt1UuRw2L6j9uLmBEhiHHeD1J2DH9/iFrFLl6cPeSIdaZPSuLwahheQVQyAgyu5jBHBxpjTkQEaNqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793121; c=relaxed/simple;
	bh=iwMMj6hFeKCXUBKnWgk+dNDNW1m0V5G2ddgEDKZdbpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LYaVbdUQiAAZVeJudTCcqtNmzE4O6729BY8rVyArvtO7OW8fNChYWkWGLARRa5bz9ZBgkgijjAL1skf7Po0woKzfbxyW0ys4ShDegvjle0WCnpbP+1gNPNubkzFhW1W7huiozUtT725leEKJa9cRwrWoflhz3NbL9kUAohpydxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KoLzlDxq; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A53Dbis018217;
	Tue, 5 Nov 2024 08:51:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	K2o8RWIwZHcDnCoRZbJ0AgekAHRjrD6szKnoYOlNjHE=; b=KoLzlDxqv9DVPeHW
	vdjtmD/HREZkk34tSTtB5S9Bcp3srGYR3QkOgCkgWRZGQHuM5zuVT6j315plNGC4
	LkknNEt4dgWCQOIcYrTMByuSViQlS+zzut8FBd9FbjLFR3/SD8uXNFvjk3+FRm3l
	1YRU4NFRvBFscBwHsKP1F9FP2v4sGZiS89iQOxpiCs4NKy1GPp5wLb27dz+5wmZb
	WaGPyhYMs79ZzT/YSJ56jOdzHiB9X6WWtAfAPWLsWflS7PTXUcgldOxfGZJDRqTH
	typXjkSbqGuupaZ2PE4VvS0Z8ff2Z2gCCU4HJg9vlUWKU6OaR5V3NVJgWvTslfic
	eRc5mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtu7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:51:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 822A24004B;
	Tue,  5 Nov 2024 08:50:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 965DD25051F;
	Tue,  5 Nov 2024 08:49:31 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:08 +0100
Subject: [PATCH v2 05/15] media: stm32: dcmipp: replace s_stream with
 enable/disable_streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-5-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
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
index 0f6918f4db383f4e0762030218101f759f375e95..48596592bfd517b9d46946d27f154f0d17ebed78 100644
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
index 50500112eab9a7b10a0c5e29773e31ded1a66628..a19c8235af565fb5f673ba90b37ebfcadf03d72e 100644
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
index 05e8897ae37a4b6c8e16c066e83ff5b1d1e07635..823c9da336a7fc63dca2aeeb2ac9377821bf6371 100644
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
2.25.1


