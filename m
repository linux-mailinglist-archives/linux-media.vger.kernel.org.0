Return-Path: <linux-media+bounces-39259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24AB1F6B9
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82C277B1E04
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B672D0C6E;
	Sat,  9 Aug 2025 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JuMhaOqX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A327F00F
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774348; cv=none; b=GOHLKny0H0VmMMPbbtm3aWnYSFCMj+yJ22Cf1tp/mRXOJJvwwESYN57SfLK2EEtbhmduwVtI3xxZtQiT8M/TgmsNsNqE1LOqY95v5pNq3FoDIoS5kuIXNSVf125DWYxWb+eO28Z+Sn/Ziy0ynnuC6t+hjpKb+3XgmWU2ms+T1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774348; c=relaxed/simple;
	bh=cEeaDJStdVlJpZe3gIO1XyPMCb43xHcMsYkVi/mcqBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8tpAOuL1dzJVu14FRJRZ5+IPqQpvmQxwnDN/x5uviRa9zzjwKgqIfuO+aTDjkAg2MYrMI9bSphRdBv6234vierA0tQdMZdFuDCYpdsvz0xcKMOWMFlgwlgOXTKsV9QDeaeq4aUyatFYGVQc5GQKnsfmWaiC9y4U9W18NVBkQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JuMhaOqX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 44EE2EFE;
	Sat,  9 Aug 2025 23:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774289;
	bh=cEeaDJStdVlJpZe3gIO1XyPMCb43xHcMsYkVi/mcqBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JuMhaOqX83Z06xP3o5fFA0sF/SgJJpizRMtDB6LnoaGv5PWLX/IFpPvsGRuz0a9G0
	 WTHuYAe4wuh4XpDG2n766WfRRI6J+/qC+vEsNz6ugSUCNz4ij/UCXgFQWDRBEjMoMj
	 CLUAnwAPLqVInlf8668gmPDQq8sKjWxZov/yMCjE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH v2 65/76] media: ivtv: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:42 +0300
Message-ID: <20250809211654.28887-66-laurent.pinchart@ideasonboard.com>
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

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it remove the only left user of fh2id() and remove
the macro completely.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/pci/ivtv/ivtv-driver.h  |   7 +-
 drivers/media/pci/ivtv/ivtv-fileops.c |   2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c   | 124 +++++++++++++-------------
 3 files changed, 64 insertions(+), 69 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index 3d84004d4e90..69c37f450c21 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -384,14 +384,9 @@ struct ivtv_open_id {
 	struct ivtv *itv;
 };
 
-static inline struct ivtv_open_id *fh2id(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct ivtv_open_id, fh);
-}
-
 static inline struct ivtv_open_id *file2id(struct file *filp)
 {
-	return fh2id(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct ivtv_open_id, fh);
 }
 
 struct yuv_frame_info
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index 0040a5e7f654..814fe7989cdc 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -878,7 +878,7 @@ static void ivtv_stop_decoding(struct ivtv_open_id *id, int flags, u64 pts)
 int ivtv_v4l2_close(struct file *filp)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index d888435b71fb..8077a71d4850 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -308,7 +308,7 @@ static int ivtv_video_command(struct ivtv *itv, struct ivtv_open_id *id,
 
 static int ivtv_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
 	vbifmt->reserved[0] = 0;
@@ -330,7 +330,7 @@ static int ivtv_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
 
@@ -353,7 +353,7 @@ static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_vbi_format *vbifmt = &fmt->fmt.vbi;
 
 	vbifmt->sampling_rate = 27000000;
@@ -372,7 +372,7 @@ static int ivtv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f
 static int ivtv_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	vbifmt->reserved[0] = 0;
@@ -394,7 +394,7 @@ static int ivtv_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
 
@@ -434,8 +434,8 @@ static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_g_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	struct v4l2_window *winfmt = &fmt->fmt.win;
 
 	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
@@ -461,7 +461,7 @@ static int ivtv_try_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_
 
 static int ivtv_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	int w = fmt->fmt.pix.width;
 	int h = fmt->fmt.pix.height;
@@ -490,7 +490,7 @@ static int ivtv_try_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format
 static int ivtv_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (id->type == IVTV_DEC_STREAM_TYPE_VBI)
@@ -510,7 +510,7 @@ static int ivtv_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_
 
 static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	s32 w = fmt->fmt.pix.width;
 	s32 h = fmt->fmt.pix.height;
 	int field = fmt->fmt.pix.field;
@@ -544,8 +544,8 @@ static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format
 
 static int ivtv_try_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	u32 chromakey = fmt->fmt.win.chromakey;
 	u8 global_alpha = fmt->fmt.win.global_alpha;
 
@@ -566,7 +566,7 @@ static int ivtv_s_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -597,7 +597,7 @@ static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (!ivtv_raw_vbi(itv) && atomic_read(&itv->capturing) > 0)
 		return -EBUSY;
@@ -610,7 +610,7 @@ static int ivtv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f
 static int ivtv_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	int ret = ivtv_try_fmt_sliced_vbi_cap(file, fh, fmt);
 
@@ -628,7 +628,7 @@ static int ivtv_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_s_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	int ret = ivtv_try_fmt_vid_out(file, fh, fmt);
@@ -673,7 +673,7 @@ static int ivtv_s_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_s_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	int ret = ivtv_try_fmt_vid_out_overlay(file, fh, fmt);
 
 	if (ret == 0) {
@@ -710,7 +710,7 @@ static int ivtv_itvc(struct ivtv *itv, bool get, u64 reg, u64 *val)
 
 static int ivtv_g_register(struct file *file, void *fh, struct v4l2_dbg_register *reg)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	reg->size = 4;
 	return ivtv_itvc(itv, true, reg->reg, &reg->val);
@@ -718,7 +718,7 @@ static int ivtv_g_register(struct file *file, void *fh, struct v4l2_dbg_register
 
 static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_register *reg)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	u64 val = reg->val;
 
 	return ivtv_itvc(itv, false, reg->reg, &val);
@@ -727,7 +727,7 @@ static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_re
 
 static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vcap)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	strscpy(vcap->driver, IVTV_DRIVER_NAME, sizeof(vcap->driver));
@@ -738,14 +738,14 @@ static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vc
 
 static int ivtv_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	return ivtv_get_audio_input(itv, vin->index, vin);
 }
 
 static int ivtv_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	vin->index = itv->audio_input;
 	return ivtv_get_audio_input(itv, vin->index, vin);
@@ -753,7 +753,7 @@ static int ivtv_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 
 static int ivtv_s_audio(struct file *file, void *fh, const struct v4l2_audio *vout)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (vout->index >= itv->nof_audio_inputs)
 		return -EINVAL;
@@ -766,7 +766,7 @@ static int ivtv_s_audio(struct file *file, void *fh, const struct v4l2_audio *vo
 
 static int ivtv_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	/* set it to defaults from our table */
 	return ivtv_get_audio_output(itv, vin->index, vin);
@@ -774,7 +774,7 @@ static int ivtv_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vi
 
 static int ivtv_g_audout(struct file *file, void *fh, struct v4l2_audioout *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	vin->index = 0;
 	return ivtv_get_audio_output(itv, vin->index, vin);
@@ -782,7 +782,7 @@ static int ivtv_g_audout(struct file *file, void *fh, struct v4l2_audioout *vin)
 
 static int ivtv_s_audout(struct file *file, void *fh, const struct v4l2_audioout *vout)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (itv->card->video_outputs == NULL || vout->index != 0)
 		return -EINVAL;
@@ -791,7 +791,7 @@ static int ivtv_s_audout(struct file *file, void *fh, const struct v4l2_audioout
 
 static int ivtv_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	/* set it to defaults from our table */
 	return ivtv_get_input(itv, vin->index, vin);
@@ -799,7 +799,7 @@ static int ivtv_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 
 static int ivtv_enum_output(struct file *file, void *fh, struct v4l2_output *vout)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	return ivtv_get_output(itv, vout->index, vout);
 }
@@ -807,7 +807,7 @@ static int ivtv_enum_output(struct file *file, void *fh, struct v4l2_output *vou
 static int ivtv_g_pixelaspect(struct file *file, void *fh,
 			      int type, struct v4l2_fract *f)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -825,7 +825,7 @@ static int ivtv_g_pixelaspect(struct file *file, void *fh,
 static int ivtv_s_selection(struct file *file, void *fh,
 			    struct v4l2_selection *sel)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	struct v4l2_rect r = { 0, 0, 720, 0 };
@@ -868,7 +868,7 @@ static int ivtv_s_selection(struct file *file, void *fh,
 static int ivtv_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *sel)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	struct v4l2_rect r = { 0, 0, 720, 0 };
@@ -924,8 +924,8 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
 		.description = "MPEG",
 		.pixelformat = V4L2_PIX_FMT_MPEG,
 	};
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (fmt->index)
 		return -EINVAL;
@@ -951,8 +951,8 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 		.description = "MPEG",
 		.pixelformat = V4L2_PIX_FMT_MPEG,
 	};
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (fmt->index)
 		return -EINVAL;
@@ -967,7 +967,7 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 
 static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	*i = itv->active_input;
 
@@ -976,7 +976,7 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 
 int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	v4l2_std_id std;
 	int i;
 
@@ -1019,7 +1019,7 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 
 static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
 		return -EINVAL;
@@ -1031,7 +1031,7 @@ static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 
 static int ivtv_s_output(struct file *file, void *fh, unsigned int outp)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (outp >= itv->card->nof_outputs)
 		return -EINVAL;
@@ -1053,8 +1053,8 @@ static int ivtv_s_output(struct file *file, void *fh, unsigned int outp)
 
 static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (s->vdev.vfl_dir)
 		return -ENOTTY;
@@ -1067,8 +1067,8 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
 
 int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (s->vdev.vfl_dir)
 		return -ENOTTY;
@@ -1084,7 +1084,7 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 
 static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	*std = itv->std;
 	return 0;
@@ -1157,7 +1157,7 @@ void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std)
 
 static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if ((std & V4L2_STD_ALL) == 0)
 		return -EINVAL;
@@ -1185,7 +1185,7 @@ static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
 
 static int ivtv_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (vt->index != 0)
@@ -1198,7 +1198,7 @@ static int ivtv_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 
 static int ivtv_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (vt->index != 0)
 		return -EINVAL;
@@ -1214,7 +1214,7 @@ static int ivtv_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 
 static int ivtv_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced_vbi_cap *cap)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	int set = itv->is_50hz ? V4L2_SLICED_VBI_625 : V4L2_SLICED_VBI_525;
 	int f, l;
 
@@ -1249,7 +1249,7 @@ static int ivtv_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced
 
 static int ivtv_g_enc_index(struct file *file, void *fh, struct v4l2_enc_idx *idx)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_enc_idx_entry *e = idx->entry;
 	int entries;
 	int i;
@@ -1275,7 +1275,7 @@ static int ivtv_g_enc_index(struct file *file, void *fh, struct v4l2_enc_idx *id
 
 static int ivtv_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *enc)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 
@@ -1327,7 +1327,7 @@ static int ivtv_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd
 
 static int ivtv_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *enc)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	switch (enc->cmd) {
 	case V4L2_ENC_CMD_START:
@@ -1357,8 +1357,8 @@ static int ivtv_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder
 
 static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	u32 data[CX2341X_MBOX_MAX_DATA];
 	struct yuv_playback_info *yi = &itv->yuv_info;
 
@@ -1444,9 +1444,9 @@ static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
 
 static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *fb)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	struct yuv_playback_info *yi = &itv->yuv_info;
 
 	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
@@ -1465,9 +1465,9 @@ static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffe
 
 static int ivtv_overlay(struct file *file, void *fh, unsigned int on)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -ENOTTY;
@@ -1492,7 +1492,7 @@ static int ivtv_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 
 static int ivtv_log_status(struct file *file, void *fh)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	u32 data[CX2341X_MBOX_MAX_DATA];
 
 	int has_output = itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT;
@@ -1584,7 +1584,7 @@ static int ivtv_log_status(struct file *file, void *fh)
 
 static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	IVTV_DEBUG_IOCTL("VIDIOC_DECODER_CMD %d\n", dec->cmd);
@@ -1593,7 +1593,7 @@ static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 
 static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	IVTV_DEBUG_IOCTL("VIDIOC_TRY_DECODER_CMD %d\n", dec->cmd);
@@ -1602,7 +1602,7 @@ static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder
 
 static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(filp));
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 
@@ -1645,7 +1645,7 @@ static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
 static long ivtv_default(struct file *file, void *fh, bool valid_prio,
 			 unsigned int cmd, void *arg)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (!valid_prio) {
 		switch (cmd) {
-- 
Regards,

Laurent Pinchart


