Return-Path: <linux-media+bounces-39200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F061BB1F658
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C137E3B9B9D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F1827CCEE;
	Sat,  9 Aug 2025 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="THSis8Px"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFBE23ED6A
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774252; cv=none; b=FzPjHjo/MFy8J+0e2vHbhoDabVqYrxqXqC4EddnBLgSTWAV8gqyaceGAJi0uFyY+MC3y5MpkcxEN6FYf4GtsbVEpqmTxD5Um2v1i3WeLKLugYomN7xfdYV3MjBMKkrOL47R3TdFVh+BFGxKuXwLb7MHTf+qZY+H7dXr0LRUUQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774252; c=relaxed/simple;
	bh=kDxEjB2elCvrGbx+UYHwSZNwzWioWPnY6AXpPui603c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdP/lUORhgpQduKic/XJr1+8/UrNdBVWXuOZAFIUCoXTTJpSfQUAYLJ0JRY9Jr7F+JawZbd+kFsOkIFnIUEuLzQ6M108BwOaGPdfxJORdFtMPtaEvYD6mWSq8VOTUQXNnuLmTdvjK1C9y/oy/Hw8cBGOCyV1ESdQd+sacB53qBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=THSis8Px; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EC964156F;
	Sat,  9 Aug 2025 23:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774188;
	bh=kDxEjB2elCvrGbx+UYHwSZNwzWioWPnY6AXpPui603c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=THSis8PxOdVa1OMgVkde8MUflk5NK99dxx1ZSkCGlFxRHQXqgvYc5/iC46YT3VyKU
	 MYm/raOlN9ko/JKXGu2Hy6OLgH9JWWfMTUXVBjK88cv6tYyhC04SCBFUysbJqTiFI3
	 AnTZBxAmOPJN4zT1n8JlkPrwatVrZ00xIYi4llFc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mike Isely <isely@pobox.com>
Subject: [PATCH v2 05/76] media: usb: pvrusb2: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 00:15:42 +0300
Message-ID: <20250809211654.28887-6-laurent.pinchart@ideasonboard.com>
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

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
pvrusb2 driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

While at it, drop unneeded structure forward declarations.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 65 +++++++++++++-----------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index ad38e1240541..7dc7c90ebf62 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -21,8 +21,6 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 
-struct pvr2_v4l2_dev;
-struct pvr2_v4l2_fh;
 struct pvr2_v4l2;
 
 struct pvr2_v4l2_dev {
@@ -48,6 +46,11 @@ struct pvr2_v4l2_fh {
 	unsigned int input_cnt;
 };
 
+static inline struct pvr2_v4l2_fh *to_pvr2_v4l2_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct pvr2_v4l2_fh, fh);
+}
+
 struct pvr2_v4l2 {
 	struct pvr2_channel channel;
 
@@ -108,7 +111,7 @@ static struct v4l2_format pvr_format [] = {
  */
 static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	strscpy(cap->driver, "pvrusb2", sizeof(cap->driver));
@@ -123,7 +126,7 @@ static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *
 
 static int pvr2_g_std(struct file *file, void *priv, v4l2_std_id *std)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val = 0;
 	int ret;
@@ -136,7 +139,7 @@ static int pvr2_g_std(struct file *file, void *priv, v4l2_std_id *std)
 
 static int pvr2_s_std(struct file *file, void *priv, v4l2_std_id std)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -148,7 +151,7 @@ static int pvr2_s_std(struct file *file, void *priv, v4l2_std_id std)
 
 static int pvr2_querystd(struct file *file, void *priv, v4l2_std_id *std)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val = 0;
 	int ret;
@@ -161,7 +164,7 @@ static int pvr2_querystd(struct file *file, void *priv, v4l2_std_id *std)
 
 static int pvr2_enum_input(struct file *file, void *priv, struct v4l2_input *vi)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *cptr;
 	struct v4l2_input tmp;
@@ -209,7 +212,7 @@ static int pvr2_enum_input(struct file *file, void *priv, struct v4l2_input *vi)
 
 static int pvr2_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	unsigned int idx;
 	struct pvr2_ctrl *cptr;
@@ -231,7 +234,7 @@ static int pvr2_g_input(struct file *file, void *priv, unsigned int *i)
 
 static int pvr2_s_input(struct file *file, void *priv, unsigned int inp)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -286,7 +289,7 @@ static int pvr2_s_audio(struct file *file, void *priv, const struct v4l2_audio *
 
 static int pvr2_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	if (vt->index != 0)
@@ -298,7 +301,7 @@ static int pvr2_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 
 static int pvr2_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -314,7 +317,7 @@ static int pvr2_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *
 
 static int pvr2_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	unsigned long fv;
 	struct v4l2_tuner vt;
@@ -349,7 +352,7 @@ static int pvr2_s_frequency(struct file *file, void *priv, const struct v4l2_fre
 
 static int pvr2_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val = 0;
 	int cur_input;
@@ -391,7 +394,7 @@ static int pvr2_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtd
 
 static int pvr2_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val;
 
@@ -411,7 +414,7 @@ static int pvr2_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format
 
 static int pvr2_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int lmin, lmax, ldef;
 	struct pvr2_ctrl *hcp, *vcp;
@@ -449,7 +452,7 @@ static int pvr2_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_forma
 
 static int pvr2_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *hcp, *vcp;
 	int ret = pvr2_try_fmt_vid_cap(file, fh, vf);
@@ -466,7 +469,7 @@ static int pvr2_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format
 
 static int pvr2_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_v4l2_dev *pdi = fh->pdi;
 	int ret;
@@ -485,7 +488,7 @@ static int pvr2_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 
 static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	if (!fh->pdi->stream) {
@@ -500,7 +503,7 @@ static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 static int pvr2_query_ext_ctrl(struct file *file, void *priv,
 			       struct v4l2_query_ext_ctrl *vc)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *cptr;
 	int val;
@@ -561,7 +564,7 @@ static int pvr2_query_ext_ctrl(struct file *file, void *priv,
 
 static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *vm)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	unsigned int cnt = 0;
 	int ret;
@@ -577,7 +580,7 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_ext_control *ctrl;
 	struct pvr2_ctrl *cptr;
@@ -612,7 +615,7 @@ static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 		struct v4l2_ext_controls *ctls)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_ext_control *ctrl;
 	unsigned int idx;
@@ -637,7 +640,7 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 static int pvr2_try_ext_ctrls(struct file *file, void *priv,
 		struct v4l2_ext_controls *ctls)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_ext_control *ctrl;
 	struct pvr2_ctrl *pctl;
@@ -659,7 +662,7 @@ static int pvr2_try_ext_ctrls(struct file *file, void *priv,
 static int pvr2_g_pixelaspect(struct file *file, void *priv,
 			      int type, struct v4l2_fract *f)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_cropcap cap = { .type = type };
 	int ret;
@@ -675,7 +678,7 @@ static int pvr2_g_pixelaspect(struct file *file, void *priv,
 static int pvr2_g_selection(struct file *file, void *priv,
 			    struct v4l2_selection *sel)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_cropcap cap;
 	int val = 0;
@@ -726,7 +729,7 @@ static int pvr2_g_selection(struct file *file, void *priv,
 static int pvr2_s_selection(struct file *file, void *priv,
 			    struct v4l2_selection *sel)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -758,7 +761,7 @@ static int pvr2_s_selection(struct file *file, void *priv,
 
 static int pvr2_log_status(struct file *file, void *priv)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	pvr2_hdw_trigger_module_log(hdw);
@@ -882,7 +885,7 @@ static void pvr2_v4l2_internal_check(struct pvr2_channel *chp)
 
 static int pvr2_v4l2_release(struct file *file)
 {
-	struct pvr2_v4l2_fh *fhp = file->private_data;
+	struct pvr2_v4l2_fh *fhp = to_pvr2_v4l2_fh(file);
 	struct pvr2_v4l2 *vp = fhp->pdi->v4lp;
 	struct pvr2_hdw *hdw = fhp->channel.mc_head->hdw;
 
@@ -1000,7 +1003,7 @@ static int pvr2_v4l2_open(struct file *file)
 	}
 
 	fhp->file = file;
-	file->private_data = fhp;
+	file->private_data = &fhp->fh;
 
 	fhp->fw_mode_flag = pvr2_hdw_cpufw_get_enabled(hdw);
 	v4l2_fh_add(&fhp->fh);
@@ -1055,7 +1058,7 @@ static int pvr2_v4l2_iosetup(struct pvr2_v4l2_fh *fh)
 static ssize_t pvr2_v4l2_read(struct file *file,
 			      char __user *buff, size_t count, loff_t *ppos)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	int ret;
 
 	if (fh->fw_mode_flag) {
@@ -1117,7 +1120,7 @@ static ssize_t pvr2_v4l2_read(struct file *file,
 static __poll_t pvr2_v4l2_poll(struct file *file, poll_table *wait)
 {
 	__poll_t mask = 0;
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	int ret;
 
 	if (fh->fw_mode_flag) {
-- 
Regards,

Laurent Pinchart


