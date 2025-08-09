Return-Path: <linux-media+bounces-39217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A11B1F678
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1555E3BA322
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBC32BF012;
	Sat,  9 Aug 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KTpDvZ22"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF19E27875C;
	Sat,  9 Aug 2025 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774281; cv=none; b=lKB/wAWY56v8pYctmc3ozsycUYU28grnFmSuuN3uWpeA1UW2MSyCgYwJbRz1vwZGCJ4GIpjkA3bEbfMA3AV6SVativKrvPcZQbnEmXTL+Xsg/IrzEgNzIuWdGeXZFz/VvUxgMxSScSl1ZDuBO65waqIL+J4yWWovDenDj0ezXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774281; c=relaxed/simple;
	bh=ymrGHo3Nl5pn7FNzlwdKTnnz0XIAFEqNYfoXnOoPrCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I08XQ5nbqItGLlh+qjbaK8+/qIiC1V/ALKSikriz10YkdGUy5ui/gX6JLGpX6FUIOUDenw2OA7Nlch+IbjC21bQ9AQj2If05mHum9E/F+Zl3yUduWKZn3cwbXatR8v5wpEBZAk4zV34mA9bXfUdwsIctIwVeeewZAZq77+fBQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KTpDvZ22; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D9DD9337C;
	Sat,  9 Aug 2025 23:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774215;
	bh=ymrGHo3Nl5pn7FNzlwdKTnnz0XIAFEqNYfoXnOoPrCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KTpDvZ22CC0APYO3PHLvU8eG2eQdXbTwlo9G92fCFI5S+zxYqGx3eWv9DMbNIgkjv
	 Kf8li7q7CCShtMeDElsGrFXKA1sgc8NM+jtEPMc2cNx+vYwiFZx+G2g5rkHrAFSy4m
	 FodpyQGKP6UMaFip6y3BVE/YCmWJ4081jcTiyoBE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 22/76] media: qcom: iris: Pass file pointer to iris_v4l2_fh_(de)init()
Date: Sun, 10 Aug 2025 00:15:59 +0300
Message-ID: <20250809211654.28887-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

In preparation for a tree-wide rework automated with coccinelle that
will need to access a struct file pointer in the iris_v4l2_fh_init() and
iris_v4l2_fh_deinit() functions, pass it from the callers. There is not
functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 0c3b47b9958a..d5f99519def4 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -21,14 +21,14 @@
 #define STEP_WIDTH 1
 #define STEP_HEIGHT 1
 
-static void iris_v4l2_fh_init(struct iris_inst *inst)
+static void iris_v4l2_fh_init(struct iris_inst *inst, struct file *filp)
 {
 	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 }
 
-static void iris_v4l2_fh_deinit(struct iris_inst *inst)
+static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 {
 	v4l2_fh_del(&inst->fh);
 	inst->fh.ctrl_handler = NULL;
@@ -164,7 +164,7 @@ int iris_open(struct file *filp)
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
-	iris_v4l2_fh_init(inst);
+	iris_v4l2_fh_init(inst, filp);
 
 	inst->m2m_dev = v4l2_m2m_init(&iris_m2m_ops);
 	if (IS_ERR_OR_NULL(inst->m2m_dev)) {
@@ -194,7 +194,7 @@ int iris_open(struct file *filp)
 fail_m2m_release:
 	v4l2_m2m_release(inst->m2m_dev);
 fail_v4l2_fh_deinit:
-	iris_v4l2_fh_deinit(inst);
+	iris_v4l2_fh_deinit(inst, filp);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
 	kfree(inst);
@@ -259,7 +259,7 @@ int iris_close(struct file *filp)
 	iris_vdec_inst_deinit(inst);
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
-	iris_v4l2_fh_deinit(inst);
+	iris_v4l2_fh_deinit(inst, filp);
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-- 
Regards,

Laurent Pinchart


