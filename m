Return-Path: <linux-media+bounces-16910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F4960707
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3BB01F237A6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125E31A4F07;
	Tue, 27 Aug 2024 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2uxc6uL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3E1A2844;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753197; cv=none; b=uKXnI7JAJdl1JYm8pD7EXOL69VopBsQDAsS7CjeMvdclBGQz4mAWjDAF1+HR67Mt/SigzPvFkAuv9UwmiNdjr4xahLh4W24gxcV5+/vj4pezkqCu9xv//0vtQCHZ3mNY70Iy+k+Y02RYS7faEV4UOmE4CGaLvm1qxoneAnXoJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753197; c=relaxed/simple;
	bh=Soq+mY6Aeg5XklMm/TtlVPGJv2lXW870lFp6r7aI1bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXkICqodR5jqXcaXo46A3TfnDp8NYj+d7Oi7QUncwd7XoFUdkQkFmxOq+WZ3UPvMF1ZgcKAs2sgqdGlY716lMt8swQiEiX24ydML5/SW2XNBQC7LXNiXc8d+O8/EMDSlLlaQ5p7rQnoynBo0RqU98kVC2kmROQsV9KhVAeSt9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2uxc6uL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4AFEC4DDE7;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=Soq+mY6Aeg5XklMm/TtlVPGJv2lXW870lFp6r7aI1bM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2uxc6uLoJZy6tX3EU94FvvOxG4ZdTnOtHtDrAkWMZlRITuTjvj2Ain6/i5pkv18U
	 6WQ4X7QXjtaK7MrMSIcCETfLcClymbfBP0kAR6KMx1yCBwsF6SYbwJHv91mTqgVc0G
	 6baBoXllbr3HmsUYbq1fn/2sVdBdaTXVCpMO+Ae5Q5MCzB4CL/TYRJbQTCyMe+OoJd
	 nZgmtACKH/M9tReJ5uKc7967FjjMG1mt+WnskRi2AiWEA9l5KxPR2O/i5E/Y0T7XIp
	 yqVJWIHaJwUhluLkDmCtVJ6r/9tLXOq+nQmNBjKw+ezGhen/FVuhzAe9a6zI7E84Nb
	 VdX7zSINxJKTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87DCC54735;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:51 +0530
Subject: [PATCH v3 26/29] media: iris: add check whether the video session
 is supported or not
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-26-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=5019;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=j4ih5G3BXzUsyLq/oyA3xJ7gNC6riTH012ozApP83VA=;
 b=rJSmQ2TeLNiwhyNXJuJ59yVGLGOBqnofra9hEXjdBSjPtL5j9DNCVECKcKq75tBZN5VV90zCR
 QiMkx/I4560DJC1Kjog7e/FczsSSeyFdWZPOw/kaT0GkiWwtCxuPj32
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on the hardware capabilities, add check to restrict whether
the video session is supported or not by the hardware during
start_streaming and queue_setup.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        | 80 ++++++++++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 30bc3c0e57a2..2abc96d56a4b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -156,6 +156,7 @@ struct iris_platform_data {
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	u32 max_session_count;
+	u32 max_mbpf;
 	const u32 *input_config_params;
 	unsigned int input_config_params_size;
 	const u32 *output_config_params;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 8316f7081ce0..81f8366bcdd2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -141,6 +141,7 @@ struct iris_platform_data sm8250_data = {
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
+	.max_mbpf = (8192 * 4352) / 256,
 	.input_config_params =
 		sm8250_vdec_input_config_param,
 	.input_config_params_size =
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 3d84e1a6796c..1b7644fdd21b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -262,6 +262,7 @@ struct iris_platform_data sm8550_data = {
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
+	.max_mbpf = ((8192 * 4352) / 256) * 2,
 	.input_config_params =
 		sm8550_vdec_input_config_params,
 	.input_config_params_size =
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8bed24cf610e..9dfbd0d66b61 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -12,6 +12,78 @@
 #include "iris_vb2.h"
 #include "iris_vdec.h"
 #include "iris_vpu_buffer.h"
+
+static int iris_check_core_mbpf(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+	u32 total_mbpf = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(instance, &core->instances, list)
+		total_mbpf += iris_get_mbpf(instance);
+	mutex_unlock(&core->lock);
+
+	if (total_mbpf > core->iris_platform_data->max_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int iris_check_inst_mbpf(struct iris_inst *inst)
+{
+	u32 mbpf, max_mbpf;
+
+	max_mbpf = inst->driver_cap[MBPF].max;
+	mbpf = iris_get_mbpf(inst);
+	if (mbpf > max_mbpf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int iris_check_resolution_supported(struct iris_inst *inst)
+{
+	u32 width, height, min_width, min_height, max_width, max_height;
+
+	width = inst->fmt_src->fmt.pix_mp.width;
+	height = inst->fmt_src->fmt.pix_mp.height;
+
+	min_width = inst->driver_cap[FRAME_WIDTH].min;
+	max_width = inst->driver_cap[FRAME_WIDTH].max;
+	min_height = inst->driver_cap[FRAME_HEIGHT].min;
+	max_height = inst->driver_cap[FRAME_HEIGHT].max;
+
+	if (!(min_width <= width && width <= max_width) ||
+	    !(min_height <= height && height <= max_height))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int iris_check_session_supported(struct iris_inst *inst)
+{
+	int ret;
+
+	ret = iris_check_core_mbpf(inst);
+	if (ret)
+		goto exit;
+
+	ret = iris_check_inst_mbpf(inst);
+	if (ret)
+		goto exit;
+
+	ret = iris_check_resolution_supported(inst);
+	if (ret)
+		goto exit;
+
+	return 0;
+exit:
+	dev_err(inst->core->dev, "current session not supported(%d)\n", ret);
+
+	return ret;
+}
+
 int iris_vb2_buf_init(struct vb2_buffer *vb2)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
@@ -69,6 +141,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		goto unlock;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto unlock;
+
 	if (!inst->once_per_session_set) {
 		inst->once_per_session_set = true;
 
@@ -144,6 +220,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	ret = iris_check_session_supported(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ret = iris_vdec_streamon_input(inst);
 	else if (V4L2_TYPE_IS_CAPTURE(q->type))

-- 
2.34.1



