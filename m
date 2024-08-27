Return-Path: <linux-media+bounces-16912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3F960708
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F34D61C228C1
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2567F1A4F15;
	Tue, 27 Aug 2024 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajXxJoOw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C561A2C20;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753197; cv=none; b=U7wnLadU650RtPwAbCJe/62ZSRV5uFKZdP670M/rMFKdth6PDBOPGfeS+pnDYA9+N8c1URV/JCLMMUORTgbhOPvnqjOZNN49pVJTkBzp14RsAHrxGj53O50So1FA3HqcMxe0ALAJiSZIJWDyaI2KiRmCwiF9iTeOKSg2vgCSs+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753197; c=relaxed/simple;
	bh=GoMTyeXcFceWMyNEb7SzalKpYrXcDS9NOTzgihbf2BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGs/tcq2z6j6HlqbN8vd5YlxxXP5fjjh4UVA21LwxU9jDK5A/XIThHBQ6EiRr9utSR1stCIZPbwpX5nCUKCzJ6gTdGiMa0w8Uiu6WK3GcAXG85KmDWpvThdZZuxAXXtPV08ocxtxOw4lXjms7UR/Ww0xpkc5nyjgMcMUDbg2D3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajXxJoOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C6CC4DDEB;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753197;
	bh=GoMTyeXcFceWMyNEb7SzalKpYrXcDS9NOTzgihbf2BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ajXxJoOwqplTxWHR7Vd/EO32CVpTdJM1QtX0F6tfxULo8//MPLU/K3QjyPX/3vRFw
	 4TJAo/GlEXyNCfnD5ucN1cRmNKBRWMo5pNdcoeP8A8V4ikxMm5s/1xtQ5dfttfSSBy
	 Jb26fZuQyoqgJF2P7fAr+2IrUDh/7KTOUqi3R1yZf7GEPFtr0e60JSOVVZ8D7Y8ZRf
	 GocXIzJOsLGkEzGLffOscvDeUBTV23owU6wK1F+OzEsNFhbSpbeoYYH4nbtcLHeSyi
	 33w8cRQw3a0KsdmJDFEUhhpoxONaq+BQC/H4NYlTgxj12rzXOH/SFwaMKSluv+V9yt
	 W4hH5xyFSQaDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE724C54739;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:53 +0530
Subject: [PATCH v3 28/29] media: iris: add allow checks for v4l2 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-28-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753191; l=8955;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=mbg1x1FKjtUUbKPnVop/IotY6F1Q5WWGZ5Q6GZ+U/H4=;
 b=x9ID+lTi2aLIf+hkvK5acH//RdXm0jMkr2fOcFFEe37OitKmzB/C4Xd7qFiE6E/PWeV/KsiCK
 MXqSDRYjbSKCHrejtoawLNGEsXWEWemi9CSYn1kW1+sezuOodr6/x7u
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on instance state machine, add allow checks
for all the v4l2 and vb2 ops.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c |  3 +
 drivers/media/platform/qcom/iris/iris_state.c | 80 +++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_state.h | 10 ++++
 drivers/media/platform/qcom/iris/iris_vb2.c   | 14 +++++
 drivers/media/platform/qcom/iris/iris_vdec.c  |  5 ++
 drivers/media/platform/qcom/iris/iris_vidc.c  | 15 +++++
 6 files changed, 127 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 64b2f19c2b03..5aeb48a8ccb6 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -81,6 +81,9 @@ static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	if (!iris_valid_cap_id(cap_id))
 		return -EINVAL;
 
+	if (!iris_allow_s_ctrl(inst, cap_id))
+		return -EBUSY;
+
 	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
 
 	inst->fw_cap[cap_id].value = ctrl->val;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d37f99d72491..1c7437bc808b 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -77,6 +77,56 @@ int iris_inst_change_state(struct iris_inst *inst,
 	return 0;
 }
 
+bool iris_allow_s_fmt(struct iris_inst *inst, u32 type)
+{
+	return (inst->state == IRIS_INST_DEINIT) ||
+		(inst->state == IRIS_INST_INIT) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_INPUT_STREAMING) ||
+		(V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_OUTPUT_STREAMING);
+}
+
+bool iris_allow_reqbufs(struct iris_inst *inst, u32 type)
+{
+	return (inst->state == IRIS_INST_DEINIT) ||
+		(inst->state == IRIS_INST_INIT) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_INPUT_STREAMING) ||
+		(V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_OUTPUT_STREAMING);
+}
+
+bool iris_allow_qbuf(struct iris_inst *inst, u32 type)
+{
+	return (V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_INPUT_STREAMING) ||
+		(V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_STREAMING) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_OUTPUT_STREAMING) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_STREAMING);
+}
+
+bool iris_allow_streamon(struct iris_inst *inst, u32 type)
+{
+	return (V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_INIT) ||
+		(V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_OUTPUT_STREAMING) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_INIT) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_INPUT_STREAMING);
+}
+
+bool iris_allow_streamoff(struct iris_inst *inst, u32 type)
+{
+	return (V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_INPUT_STREAMING) ||
+		(V4L2_TYPE_IS_OUTPUT(type) && inst->state == IRIS_INST_STREAMING) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_OUTPUT_STREAMING) ||
+		(V4L2_TYPE_IS_CAPTURE(type) && inst->state == IRIS_INST_STREAMING) ||
+		inst->state == IRIS_INST_ERROR;
+}
+
+bool iris_allow_s_ctrl(struct iris_inst *inst, u32 cap_id)
+{
+	return ((inst->state == IRIS_INST_DEINIT) ||
+		(inst->state == IRIS_INST_INIT) ||
+		((inst->fw_cap[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED) &&
+		(inst->state == IRIS_INST_INPUT_STREAMING ||
+		inst->state == IRIS_INST_STREAMING)));
+}
+
 int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane)
 {
 	enum iris_inst_state new_state = IRIS_INST_ERROR;
@@ -214,3 +264,33 @@ int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
 
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
+
+static inline bool iris_drc_pending(struct iris_inst *inst)
+{
+	return inst->sub_state & IRIS_INST_SUB_DRC &&
+		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
+}
+
+static inline bool iris_drain_pending(struct iris_inst *inst)
+{
+	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
+		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
+}
+
+bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
+{
+	if (cmd == V4L2_DEC_CMD_START) {
+		if (inst->state == IRIS_INST_INPUT_STREAMING ||
+		    inst->state == IRIS_INST_OUTPUT_STREAMING ||
+		    inst->state == IRIS_INST_STREAMING)
+			if (iris_drc_pending(inst) || iris_drain_pending(inst))
+				return true;
+	} else if (cmd == V4L2_DEC_CMD_STOP) {
+		if (inst->state == IRIS_INST_INPUT_STREAMING ||
+		    inst->state == IRIS_INST_STREAMING)
+			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+				return true;
+	}
+
+	return false;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index a01037918a9c..9516425fcfa7 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -133,10 +133,20 @@ int iris_inst_change_state(struct iris_inst *inst,
 int iris_inst_change_sub_state(struct iris_inst *inst,
 			       enum iris_inst_sub_state clear_sub_state,
 			       enum iris_inst_sub_state set_sub_state);
+
+bool iris_allow_s_fmt(struct iris_inst *inst, u32 type);
+bool iris_allow_reqbufs(struct iris_inst *inst, u32 type);
+bool iris_allow_qbuf(struct iris_inst *inst, u32 type);
+bool iris_allow_streamon(struct iris_inst *inst, u32 type);
+bool iris_allow_streamoff(struct iris_inst *inst, u32 type);
+bool iris_allow_s_ctrl(struct iris_inst *inst, u32 cap_id);
+
 int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
 int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
 int iris_inst_sub_state_change_drc(struct iris_inst *inst);
 int iris_inst_sub_state_change_drain_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
+bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 974fce49d8fb..73c274844788 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -120,6 +120,11 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		goto unlock;
 	}
 
+	if (!iris_allow_reqbufs(inst, q->type)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	core = inst->core;
 	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
 
@@ -215,6 +220,11 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 	}
 
+	if (!iris_allow_streamon(inst, q->type)) {
+		ret = -EBUSY;
+		goto error;
+	}
+
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type)) {
 		ret = -EINVAL;
@@ -269,6 +279,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
+	if (!iris_allow_streamoff(inst, q->type)) {
+		ret = -EBUSY;
+		goto exit;
+	}
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4b8670612dab..dfe7fedc234f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -603,6 +603,11 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	if (ret)
 		return ret;
 
+	if (!iris_allow_qbuf(inst, vb2->type)) {
+		buf->attr |= BUF_ATTR_DEFERRED;
+		return 0;
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 07eb276472f6..a22b4c1226df 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -316,6 +316,11 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
 		goto unlock;
 	}
 
+	if (!iris_allow_s_fmt(inst, f->type)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = iris_vdec_try_fmt(inst, f);
 
 unlock:
@@ -339,6 +344,11 @@ static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 		goto unlock;
 	}
 
+	if (!iris_allow_s_fmt(inst, f->type)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	ret = iris_vdec_s_fmt(inst, f);
 
 unlock:
@@ -624,6 +634,11 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;
 
+	if (!iris_allow_cmd(inst, dec->cmd)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
 	if (dec->cmd == V4L2_DEC_CMD_START)
 		ret = iris_vdec_start_cmd(inst);
 	else if (dec->cmd == V4L2_DEC_CMD_STOP)

-- 
2.34.1



