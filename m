Return-Path: <linux-media+bounces-45059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B11BF2BA8
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 724054F71D6
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 17:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF6B331A44;
	Mon, 20 Oct 2025 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AKd49trd"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533B1A76DE;
	Mon, 20 Oct 2025 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981645; cv=none; b=f6Feg0eugCF/+qynIkUsSKLKaNysc+twm9umpm6kxeGepd4U71jpEpFQbutFraVLlR7Tv5VYZk14nkk/5aALRuq0duxWog01374TTKSaUZ2XXtJ/wupTiqFtllwjeX537t2YWKDS07K9AU0rdYllC1/QmoV/OdYgG2MDCKaGpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981645; c=relaxed/simple;
	bh=WrcLLsevre49EQ0btGi5c5kmIsNinR52iJvOFiiE/y8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q9V0b//EMhGUYX+E9JHcXRuK8fkZB0qD3Ve99n2B2iwevQ9MaHeIufKtIynkYxUqktMIfEbLcxxDaZ0fT1qJ9FzIarITgxlMIK3ECmU6RKQE8o6ckbFGsqQ9sGL/N8zinT+BFSyo7aPVYiWrbRgsUS1Q1wUyIc0XwvAsFrQHPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AKd49trd; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KHXgEs956103;
	Mon, 20 Oct 2025 12:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760981622;
	bh=rLjE0Z9lF6b5OCry45qjoNtx5ZnUiLXTvbwpxFFdjmQ=;
	h=From:To:CC:Subject:Date;
	b=AKd49trduT2UvETQByjuow2qwQpcETk92d8wHq+6Ps+1mK6qVB5sUpvhEyeCPgtt0
	 QolJOMJVzTfCoXiO8MFPtRacK0DZueys5a1xFakMAM0LybfmYciat6hLVZbptm+TP7
	 iRsVDSM65jiW3M+V/a1HO+PlgavrhYcOS0FiKRns=
Received: from DLEE206.ent.ti.com (dlee206.ent.ti.com [157.170.170.90])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KHXgAH958244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 12:33:42 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 12:33:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 12:33:42 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KHXgp92350546;
	Mon, 20 Oct 2025 12:33:42 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee
	<jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nicolas
 Dufresne <nicolas.dufresne@collabora.com>
CC: Darren Etheridge <detheridge@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH] media: chips-media: wave5: Fix Hang in Encoder
Date: Mon, 20 Oct 2025 12:33:32 -0500
Message-ID: <20251020173332.2271145-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Wave5 encoder driver only changed states to PIC_RUN in start streaming by
making the assumption that VIDIOC STREAMON call has already been called.
In frameworks like FFMPEG, this condition has not been met when in the
start streaming function resulting in the application hanging. Therefore,
job_ready and device_run need to be extended to have support for this case.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 74 +++++++++++++------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a02853d42d61..3a3b585ceb8e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -705,6 +705,11 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
 
 		m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
 		m2m_ctx->is_draining = true;
+
+		if (v4l2_m2m_num_dst_bufs_ready(m2m_ctx) > 0) {
+			dev_dbg(inst->dev->dev, "Forcing job run for draining\n");
+			v4l2_m2m_try_schedule(m2m_ctx);
+		}
 		break;
 	case V4L2_ENC_CMD_START:
 		break;
@@ -1411,6 +1416,34 @@ static int prepare_fb(struct vpu_instance *inst)
 	return ret;
 }
 
+static int wave5_vpu_enc_prepare_cap_seq(struct vpu_instance *inst)
+{
+	int ret = 0;
+
+	ret = initialize_sequence(inst);
+	if (ret) {
+		dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
+		return ret;
+	}
+	ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+	if (ret)
+		return ret;
+
+	/*
+	 * The sequence must be analyzed first to calculate the proper
+	 * size of the auxiliary buffers.
+	 */
+	ret = prepare_fb(inst);
+	if (ret) {
+		dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+		return ret;
+	}
+
+	ret = switch_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	return ret;
+}
+
 static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
@@ -1453,27 +1486,8 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto return_buffers;
 	}
-	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming) {
-		ret = initialize_sequence(inst);
-		if (ret) {
-			dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
-			goto return_buffers;
-		}
-		ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
-		if (ret)
-			goto return_buffers;
-		/*
-		 * The sequence must be analyzed first to calculate the proper
-		 * size of the auxiliary buffers.
-		 */
-		ret = prepare_fb(inst);
-		if (ret) {
-			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
-			goto return_buffers;
-		}
-
-		ret = switch_state(inst, VPU_INST_STATE_PIC_RUN);
-	}
+	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming)
+		ret = wave5_vpu_enc_prepare_cap_seq(inst);
 	if (ret)
 		goto return_buffers;
 
@@ -1598,6 +1612,14 @@ static void wave5_vpu_enc_device_run(void *priv)
 
 	pm_runtime_resume_and_get(inst->dev->dev);
 	switch (inst->state) {
+	case VPU_INST_STATE_OPEN:
+		ret = wave5_vpu_enc_prepare_cap_seq(inst);
+		if (ret) {
+			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			switch_state(inst, VPU_INST_STATE_STOP);
+			break;
+		}
+		fallthrough;
 	case VPU_INST_STATE_PIC_RUN:
 		ret = start_encode(inst, &fail_res);
 		if (ret) {
@@ -1633,6 +1655,12 @@ static int wave5_vpu_enc_job_ready(void *priv)
 	case VPU_INST_STATE_NONE:
 		dev_dbg(inst->dev->dev, "Encoder must be open to start queueing M2M jobs!\n");
 		return false;
+	case VPU_INST_STATE_OPEN:
+		if (wave5_vpu_both_queues_are_streaming(inst)) {
+			dev_dbg(inst->dev->dev, "Both queues have been turned on now, M2M job can occur\n");
+			return true;
+		}
+		return false;
 	case VPU_INST_STATE_PIC_RUN:
 		if (m2m_ctx->is_draining || v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
 			dev_dbg(inst->dev->dev, "Encoder ready for a job, state: %s\n",
@@ -1642,9 +1670,9 @@ static int wave5_vpu_enc_job_ready(void *priv)
 		fallthrough;
 	default:
 		dev_dbg(inst->dev->dev,
-			"Encoder not ready for a job, state: %s, %s draining, %d src bufs ready\n",
+			"Encoder not ready for a job, state: %s, %s draining, %d src bufs ready, %d dst bufs ready\n",
 			state_to_str(inst->state), m2m_ctx->is_draining ? "is" : "is not",
-			v4l2_m2m_num_src_bufs_ready(m2m_ctx));
+			v4l2_m2m_num_src_bufs_ready(m2m_ctx), v4l2_m2m_num_dst_bufs_ready(m2m_ctx));
 		break;
 	}
 	return false;
-- 
2.34.1


