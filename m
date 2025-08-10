Return-Path: <linux-media+bounces-39312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE8B1F7C9
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BF2179F9B
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10B119AD48;
	Sun, 10 Aug 2025 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LI4NWyau"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4822194C86
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789549; cv=none; b=gPYBjE6+maNJgvTMltUfBJgRUdZfDFSJkMNRHaDEhM5TicMsASwoBHHwZeXbSR3YVcjPnYVRdUNGfxP29TAekF48TwzTVp2W2/HcurWcgQsy/xAdbWmFodvlGLRuqwy4P9Hi04E8TmldsfB2ZhODfopmUjoUW/j18clTfSjQSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789549; c=relaxed/simple;
	bh=yejod5cJvKEarjTqvFAPeMveE8XEd28nCJnGB2MJcKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OibQjyU1GAvqS52QtK4HJxBuJ4J+hFlBhN1TIR1Qm6sigJw1WIyDueq44d7yyUxhDwbTjBEPhjurgWRGOqhMzUBHSPk/zVHzEx42s3vehSg0Bpw6U8F6tuaEem0LLXR/pn64nDjsV/FxmzAM1kgs47QWP1hOnPDuDyAfyvWpGWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LI4NWyau; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 873422439;
	Sun, 10 Aug 2025 03:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789495;
	bh=yejod5cJvKEarjTqvFAPeMveE8XEd28nCJnGB2MJcKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LI4NWyau9rXaz13wJPFmOuI51AUWBJk82MCEkkVI462f+GxwiMod01hrfU81zkjAW
	 hN8YG1fmQlr93FjpVHemiP1VYLBTTQjjIGYzFAGLyj+NgSSuveU6XfaPzWljUTg+pj
	 RK64+5ptBF8IMV4wyAgEgS59sqsp0K71mNBjdnxA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Subject: [PATCH v3 39/76] media: wave5: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:21 +0300
Message-ID: <20250810013100.29776-40-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |  2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 18 +++++++-------
 .../chips-media/wave5/wave5-vpu-enc.c         | 24 +++++++++----------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 0bce62f0c039..f03ad9c0de22 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -142,7 +142,7 @@ int wave5_vpu_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscr
 
 int wave5_vpu_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
 
 	f->fmt.pix_mp.width = inst->src_fmt.width;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 88eb933a5144..72af0faa3ef2 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -506,7 +506,7 @@ static int wave5_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
@@ -547,7 +547,7 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i, ret;
 
 	dev_dbg(inst->dev->dev,
@@ -606,7 +606,7 @@ static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
 
 	f->fmt.pix_mp.width = inst->dst_fmt.width;
@@ -630,7 +630,7 @@ static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 
 	dev_dbg(inst->dev->dev, "%s: index: %u\n", __func__, f->index);
@@ -647,7 +647,7 @@ static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
@@ -678,7 +678,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
@@ -727,7 +727,7 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u | target: %u\n", __func__, s->type, s->target);
 
@@ -761,7 +761,7 @@ static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_se
 
 static int wave5_vpu_dec_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -872,7 +872,7 @@ static int wave5_vpu_dec_start(struct vpu_instance *inst)
 
 static int wave5_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dc)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 322c1498758a..279f23e1304a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -360,7 +360,7 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 
 static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 
 	dev_dbg(inst->dev->dev, "%s: index: %u\n", __func__, f->index);
@@ -377,7 +377,7 @@ static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
@@ -411,7 +411,7 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -445,7 +445,7 @@ static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
 
 	f->fmt.pix_mp.width = inst->dst_fmt.width;
@@ -469,7 +469,7 @@ static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 
 	dev_dbg(inst->dev->dev, "%s: index: %u\n", __func__, f->index);
@@ -486,7 +486,7 @@ static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
@@ -515,7 +515,7 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 	const struct v4l2_format_info *info;
 	int i, ret;
@@ -576,7 +576,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u | target: %u\n", __func__, s->type, s->target);
 
@@ -605,7 +605,7 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 
 static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -628,7 +628,7 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 
 static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *ec)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
@@ -661,7 +661,7 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
 
 static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, a->type);
 
@@ -681,7 +681,7 @@ static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamp
 
 static int wave5_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, a->type);
 
-- 
Regards,

Laurent Pinchart


