Return-Path: <linux-media+bounces-16896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494F9606E0
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8BA3B203AB
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CDB1A08CA;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1mJU63/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63A819F499;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=tQoNyaaS8a8XLCPjAroMHitfJNBQ/t2hoxEHrq5l/faNxaGbTQSjv8Ml9xro7H8mhPB6xw5TxtSHg8YEyLqrOMQzcC1h8/q9nL57b9up0cU59apGzF1BArQS/nXA1zF5sC8NnFSbyq7HsLbK3bNE6qG/MOjNLqtsUOIg6exjg3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=x7sN4vAGNoMnwJ1OWB1fVULGlt5glIJiJZmZWurTS3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHe08o3hc/n/67kDUSiIDVFMcyed1SptKcl8zFC/f0ev6pdf+SGpXFTSwxK3Z/BwIN+VBXmURsBsbfK5BlZDmK+ASxWrp64B9JiH4GSXXKfJwJ3yVrR3mTLYCe2FwANttwgIMWeab3RjINGRt+KJTOnVS7sOzysWMFH8dKyNDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1mJU63/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B8E1C4DE1E;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=x7sN4vAGNoMnwJ1OWB1fVULGlt5glIJiJZmZWurTS3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e1mJU63/r4tThYvq6Q/0DdYx+O4c5fQj2YUoI7Py2Il+9oIWoeoN6pgY3sKlFGcKA
	 l5SyYBqM6W5RMDunJ3etAetmEfEAXsU2SogdWjMfnGddp60MmEw9ugXA0i7QsxfYHG
	 czyIXPLsz64Ypc8ZZwVRF3Z2yMYdlCXoINaTIdIoWqYeHhup0FH4956HNx+0Q0mrHV
	 zLx5Cjo3U/p5cD3OUo4UA/EZxiGKwkblycqKtke6kzEk1qamKuvGyyLFGpadzzNTsz
	 EKlFuht+bFb1zhZtz9znoEfM3M1AfuYFF6NW8GhM9RC+PaiEfMSRGcGLwFaRfQ27xn
	 QeWh7+QBAbetw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7141AC54734;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:39 +0530
Subject: [PATCH v3 14/29] media: iris: implement enum_fmt and
 enum_frameintervals ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-14-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=5098;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=QCr6J53yyQB3qsIP/vgwzzl2dZykbmOi6iYbyLA24lI=;
 b=TM067bJniiwaBsNPc31rJbmpH4nB/LQsof15R0x7qq8i+yTXWjXGv6TSDB0ToyTSXfy+qkF3W
 uYUS1WzehRKDywV3eTS2T3GoIRoF4gBOmO7UR3J4AcUSENsDOZTIgDj
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Implement enum_fmt and enum_frameintervals ioctls in the
driver with necessary hooks.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 22 +++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c | 57 ++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index fd04f56b405d..a38903eefa1c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -60,6 +60,28 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
+int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		f->pixelformat = V4L2_PIX_FMT_H264;
+		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
+		strscpy(f->description, "codec", sizeof(f->description));
+	} else if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		strscpy(f->description, "colorformat", sizeof(f->description));
+	}
+
+	if (!f->pixelformat)
+		return -EINVAL;
+
+	memset(f->reserved, 0, sizeof(f->reserved));
+
+	return 0;
+}
+
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 4f2557d15ca2..eb8a1121ae92 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -10,6 +10,7 @@ struct iris_inst;
 
 void iris_vdec_inst_init(struct iris_inst *inst);
 void iris_vdec_inst_deinit(struct iris_inst *inst);
+int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index e09c0a156387..488be6afd999 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -15,6 +15,10 @@
 
 #define IRIS_DRV_NAME "iris_driver"
 #define IRIS_BUS_NAME "platform:iris_icc"
+#define MIN_FRAME_WIDTH 128
+#define MAX_FRAME_WIDTH 8192
+#define MIN_FRAME_HEIGHT 128
+#define MAX_FRAME_HEIGHT 8192
 #define STEP_WIDTH 1
 #define STEP_HEIGHT 1
 
@@ -255,6 +259,22 @@ int iris_close(struct file *filp)
 	return 0;
 }
 
+static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct iris_inst *inst;
+	int ret;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	ret = iris_vdec_enum_fmt(inst, f);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
 	struct iris_inst *inst;
@@ -309,6 +329,40 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	return ret;
 }
 
+static int iris_enum_framesizes(struct file *filp, void *fh,
+				struct v4l2_frmsizeenum *fsize)
+{
+	struct iris_inst *inst;
+	int ret = 0;
+
+	inst = iris_get_inst(filp, fh);
+	if (!inst || !fsize)
+		return -EINVAL;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
+	    fsize->pixel_format != V4L2_PIX_FMT_NV12) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = MIN_FRAME_WIDTH;
+	fsize->stepwise.max_width = MAX_FRAME_WIDTH;
+	fsize->stepwise.step_width = STEP_WIDTH;
+	fsize->stepwise.min_height = MIN_FRAME_HEIGHT;
+	fsize->stepwise.max_height = MAX_FRAME_HEIGHT;
+	fsize->stepwise.step_height = STEP_HEIGHT;
+
+unlock:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
 {
 	struct iris_inst *inst;
@@ -362,12 +416,15 @@ static const struct vb2_ops iris_vb2_ops = {
 };
 
 static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
+	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
+	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
 	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
 	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
 	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
+	.vidioc_enum_framesizes         = iris_enum_framesizes,
 	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
 	.vidioc_g_selection             = iris_g_selection,
 };

-- 
2.34.1



