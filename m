Return-Path: <linux-media+bounces-39219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D0B1F67D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 784AB4E04D7
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB2A2C0303;
	Sat,  9 Aug 2025 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ePVhXJrg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91727AC3A;
	Sat,  9 Aug 2025 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774284; cv=none; b=j7nDF6tZssAk6nj1Nh8Fdc7k3NRZxDV2gsSHVcJwh1nO/uuWDZlkaiP3Tc9UkljfEeRzVhulhVgMZ4NOR5nBWdcDQvliv71FGLVLK0JkNya+rIfkOgqL1MGT4LWPyv15IyE0scAV/gAGmlUlLgL7+zOk0mvurUycIGDcyo5fxhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774284; c=relaxed/simple;
	bh=mIoH835221ymtG/sNbj/OAdbtxFT0IlmQSgBdFfFBLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7VQ4iGMmEH8e96mvPs0POM6W8NSXRgkXE01MyWGd+iUxywIsiLE4cyOvUkEowjPkj1e/QjQ4+3co0XPqEJp1n5TYbTwSWlKxKVLpHWcwjMc+vRSIOmdedM0Y8cdI8uYbgZb9bK329qS5VdL2FW2OQ0meDPU3LYYzhd86r0JNQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ePVhXJrg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 40B30156F;
	Sat,  9 Aug 2025 23:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774218;
	bh=mIoH835221ymtG/sNbj/OAdbtxFT0IlmQSgBdFfFBLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ePVhXJrgbEkg6nQLbtZFgvphpJI2UCuYAVrRjfSpTEqK5/8IHURfXtbQo8tou+89X
	 I6NnZRVmJlze1QrBasrga6eU4Lm10GyRJrJnhOVLihAuo+0/HJk7F85C31HC/1fK1r
	 PN0ic2iv0l5Or6uIHhMu+/Gv6N1fi0TelnGMt3e8=
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
Subject: [PATCH v2 24/76] media: qcom: iris: Drop unused argument to iris_get_inst()
Date: Sun, 10 Aug 2025 00:16:01 +0300
Message-ID: <20250809211654.28887-25-laurent.pinchart@ideasonboard.com>
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

The second argument to the iris_get_inst() function is never used. Drop
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 73c96498759c..64ebec2ca6b3 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -69,7 +69,7 @@ static void iris_remove_session(struct iris_inst *inst)
 	mutex_unlock(&core->lock);
 }
 
-static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
+static inline struct iris_inst *iris_get_inst(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct iris_inst, fh);
 }
@@ -251,7 +251,7 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 
 int iris_close(struct file *filp)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
@@ -276,14 +276,14 @@ int iris_close(struct file *filp)
 
 static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 
 	return iris_vdec_enum_fmt(inst, f);
 }
 
 static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 	int ret;
 
 	mutex_lock(&inst->lock);
@@ -295,7 +295,7 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
 
 static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 	int ret;
 
 	mutex_lock(&inst->lock);
@@ -307,7 +307,7 @@ static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 
 static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 	int ret = 0;
 
 	mutex_lock(&inst->lock);
@@ -326,7 +326,7 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 static int iris_enum_framesizes(struct file *filp, void *fh,
 				struct v4l2_frmsizeenum *fsize)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 	struct platform_inst_caps *caps;
 
 	if (fsize->index)
@@ -359,7 +359,7 @@ static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *ca
 
 static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -394,7 +394,7 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 static int iris_dec_cmd(struct file *filp, void *fh,
 			struct v4l2_decoder_cmd *dec)
 {
-	struct iris_inst *inst = iris_get_inst(filp, NULL);
+	struct iris_inst *inst = iris_get_inst(filp);
 	int ret = 0;
 
 	mutex_lock(&inst->lock);
-- 
Regards,

Laurent Pinchart


