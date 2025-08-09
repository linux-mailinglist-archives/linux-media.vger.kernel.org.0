Return-Path: <linux-media+bounces-39260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B2B1F6BA
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CF651718A8
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0877A2D0C7B;
	Sat,  9 Aug 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PKxKrnep"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F02D0C66
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774349; cv=none; b=uxOlOPeu5y2TfIDpe3C62+Wuxih5skWOz+w3DhvhnqGcRwrRUYQ1Z+lGKpWldfd/iT+EwGTTiGzWhadRui50qAG1VupATWe+hWmrf+mQW1f+GOklSbjIg3bstlcp+EtSZDv+rYivUodMu8BI49lOtXPs7DFE9HnrFE0BUzq82hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774349; c=relaxed/simple;
	bh=QxT4yUDqzrxVJTnOHadtvrkPr0s5hM4t0eGwTSgUCOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdCF1yBj253l2Dy/qOuD2kxlIMoIN/SGzQCfIBxqtCCra11s6LFyDW5dFB1wHV4vxSkdW9Mlv1I13/+N8yslDbgA+BjiFJ5DQJBbsIYqjCAoZsmCUMufe4Npl4prKWbMaFvxY82I129t9CvyOSp8hKL31nkHlV914nlih2nVCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PKxKrnep; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 913191440;
	Sat,  9 Aug 2025 23:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774287;
	bh=QxT4yUDqzrxVJTnOHadtvrkPr0s5hM4t0eGwTSgUCOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKxKrnepuFbFMCLtx8aCHBQh6p5tIomD0vdht02daadjr25X7JdDaO0jPKQeGOwSO
	 GxxaPBwcUaH1VoctT9POPacYz2t5wAgNQfvYcNwnWfghw+U9tcRkg8pY5E8Pkaceed
	 WCBC5QlkhKBEW2WrLk8P3Nn181D+RWpXZFF1yQYs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH v2 64/76] media: cx18: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:41 +0300
Message-ID: <20250809211654.28887-65-laurent.pinchart@ideasonboard.com>
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 64 ++++++++++++++---------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 9a1512b1ccaa..bf16d36448f8 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -52,7 +52,7 @@ static const struct v4l2_fmtdesc cx18_formats_mpeg[] = {
 static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
 			      struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	struct cx18_stream *s = &cx->streams[id->type];
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
@@ -76,7 +76,7 @@ static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
 static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
 	int w = pixfmt->width;
@@ -121,7 +121,7 @@ static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 			      struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -261,7 +261,7 @@ u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt)
 static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_vbi_format *vbifmt = &fmt->fmt.vbi;
 
 	vbifmt->sampling_rate = 27000000;
@@ -280,7 +280,7 @@ static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 static int cx18_g_fmt_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_format *fmt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
 	/* sane, V4L2 spec compliant, defaults */
@@ -311,7 +311,7 @@ static int cx18_try_fmt_vbi_cap(struct file *file, void *fh,
 static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_format *fmt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
 	vbifmt->io_size = sizeof(struct v4l2_sliced_vbi_data) * 36;
@@ -330,7 +330,7 @@ static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
 static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	int ret;
 
@@ -360,7 +360,7 @@ static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
 static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_format *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	int ret;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
@@ -392,7 +392,7 @@ static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
 static int cx18_g_register(struct file *file, void *fh,
 				struct v4l2_dbg_register *reg)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (reg->reg & 0x3)
 		return -EINVAL;
@@ -406,7 +406,7 @@ static int cx18_g_register(struct file *file, void *fh,
 static int cx18_s_register(struct file *file, void *fh,
 				const struct v4l2_dbg_register *reg)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (reg->reg & 0x3)
 		return -EINVAL;
@@ -420,7 +420,7 @@ static int cx18_s_register(struct file *file, void *fh,
 static int cx18_querycap(struct file *file, void *fh,
 				struct v4l2_capability *vcap)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	strscpy(vcap->driver, CX18_DRIVER_NAME, sizeof(vcap->driver));
@@ -431,14 +431,14 @@ static int cx18_querycap(struct file *file, void *fh,
 
 static int cx18_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	return cx18_get_audio_input(cx, vin->index, vin);
 }
 
 static int cx18_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	vin->index = cx->audio_input;
 	return cx18_get_audio_input(cx, vin->index, vin);
@@ -446,7 +446,7 @@ static int cx18_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 
 static int cx18_s_audio(struct file *file, void *fh, const struct v4l2_audio *vout)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (vout->index >= cx->nof_audio_inputs)
 		return -EINVAL;
@@ -457,7 +457,7 @@ static int cx18_s_audio(struct file *file, void *fh, const struct v4l2_audio *vo
 
 static int cx18_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	/* set it to defaults from our table */
 	return cx18_get_input(cx, vin->index, vin);
@@ -466,7 +466,7 @@ static int cx18_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 static int cx18_g_pixelaspect(struct file *file, void *fh,
 			      int type, struct v4l2_fract *f)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -479,7 +479,7 @@ static int cx18_g_pixelaspect(struct file *file, void *fh,
 static int cx18_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *sel)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -499,7 +499,7 @@ static int cx18_g_selection(struct file *file, void *fh,
 static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 					struct v4l2_fmtdesc *fmt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 
 	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
 		if (fmt->index >= ARRAY_SIZE(cx18_formats_yuv))
@@ -515,7 +515,7 @@ static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 
 static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	*i = cx->active_input;
 	return 0;
@@ -523,7 +523,7 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 
 int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	v4l2_std_id std = V4L2_STD_ALL;
 	const struct cx18_card_video_input *card_input =
@@ -561,7 +561,7 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 static int cx18_g_frequency(struct file *file, void *fh,
 				struct v4l2_frequency *vf)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (vf->tuner != 0)
 		return -EINVAL;
@@ -572,7 +572,7 @@ static int cx18_g_frequency(struct file *file, void *fh,
 
 int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if (vf->tuner != 0)
@@ -587,7 +587,7 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 
 static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	*std = cx->std;
 	return 0;
@@ -595,7 +595,7 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 
 int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if ((std & V4L2_STD_ALL) == 0)
@@ -644,7 +644,7 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 
 static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if (vt->index != 0)
@@ -656,7 +656,7 @@ static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 
 static int cx18_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	if (vt->index != 0)
 		return -EINVAL;
@@ -673,7 +673,7 @@ static int cx18_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 static int cx18_g_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_sliced_vbi_cap *cap)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	int set = cx->is_50hz ? V4L2_SLICED_VBI_625 : V4L2_SLICED_VBI_525;
 	int f, l;
 
@@ -794,7 +794,7 @@ static int cx18_process_idx_data(struct cx18_stream *s, struct cx18_mdl *mdl,
 static int cx18_g_enc_index(struct file *file, void *fh,
 				struct v4l2_enc_idx *idx)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct cx18_stream *s = &cx->streams[CX18_ENC_STREAM_TYPE_IDX];
 	s32 tmp;
 	struct cx18_mdl *mdl;
@@ -841,7 +841,7 @@ static int cx18_g_enc_index(struct file *file, void *fh,
 static int cx18_encoder_cmd(struct file *file, void *fh,
 				struct v4l2_encoder_cmd *enc)
 {
-	struct cx18_open_id *id = fh2id(fh);
+	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	u32 h;
 
@@ -900,7 +900,7 @@ static int cx18_encoder_cmd(struct file *file, void *fh,
 static int cx18_try_encoder_cmd(struct file *file, void *fh,
 				struct v4l2_encoder_cmd *enc)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	switch (enc->cmd) {
 	case V4L2_ENC_CMD_START:
@@ -932,7 +932,7 @@ static int cx18_try_encoder_cmd(struct file *file, void *fh,
 
 static int cx18_log_status(struct file *file, void *fh)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_input vidin;
 	struct v4l2_audio audin;
 	int i;
@@ -976,7 +976,7 @@ static int cx18_log_status(struct file *file, void *fh)
 static long cx18_default(struct file *file, void *fh, bool valid_prio,
 			 unsigned int cmd, void *arg)
 {
-	struct cx18 *cx = fh2id(fh)->cx;
+	struct cx18 *cx = file2id(file)->cx;
 
 	switch (cmd) {
 	case VIDIOC_INT_RESET: {
-- 
Regards,

Laurent Pinchart


