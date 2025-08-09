Return-Path: <linux-media+bounces-39267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473EB1F6C2
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F046189C0E9
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F67299929;
	Sat,  9 Aug 2025 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MKPg9W86"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7D2C08C8
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774362; cv=none; b=m50rxRJxN0wn9P9BWdacSoA9FryX57RxMLg15fkhuMCogPNI47YDfBTEYJg+Q0DqC32nYtBddjHxuji2+UEuFJ5S4ZAv62zCZMODVAr6WA64POHmuNidv6rb3IAp6BGGNaqmKNpZvZIF10R+VsdWN2wuxrAn6TFvvCCfGPMfD2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774362; c=relaxed/simple;
	bh=M0Upkx0UJPBH+RdUpUOHWCKv4Z0Kb/8hhXFjp39gYGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIHlnXxFjpfL42tBrvN8DVsws9qApTZCxzhid32p+3OZBLU2CGjLGFgE/CcvdpUSVepk7L8qdzataDn3MxxCVSY+ivprMRvdhG/EwsuryINCmT787QojE48ugwpE0llnO4MTr00Q0aw0yY1fYl55Sg1e2NcDOunQ3VNzFMsDeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MKPg9W86; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 43B8B1FD3;
	Sat,  9 Aug 2025 23:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774301;
	bh=M0Upkx0UJPBH+RdUpUOHWCKv4Z0Kb/8hhXFjp39gYGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKPg9W86FFyBRu8cyd8rOPxn5wpnATxu3ma0JEGOF+EPHeShmmRKTmfJLHq0hXcMU
	 ti7ANssIY3Q5qSCdO1ZAk1Mu/4F5nulFUd1IWVRSOW+wl/7SL0LlD+u+bAlJQraHJd
	 CeW0VY2TLsRNB5k8KseQB5AP5mPx0HF/puu1Xn5E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 72/76] media: uvcvideo: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 00:16:49 +0300
Message-ID: <20250809211654.28887-73-laurent.pinchart@ideasonboard.com>
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

The second argument to the ioctl handlers is not a file handle any more.
Rename it from 'void *fh' to 'void *priv', to avoid misconceptions. This
is particularly important in the uvcvideo driver, as it is widely used
and can be taken as an example for new drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_metadata.c | 12 ++++-----
 drivers/media/usb/uvc/uvc_v4l2.c     | 38 ++++++++++++++--------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 4cbf6ce314fd..3b0b39289511 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -23,7 +23,7 @@
  * V4L2 ioctls
  */
 
-static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
+static int uvc_meta_v4l2_querycap(struct file *file, void *priv,
 				  struct v4l2_capability *cap)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -39,7 +39,7 @@ static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
+static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -57,7 +57,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
+static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -83,7 +83,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
+static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -91,7 +91,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	int ret;
 
-	ret = uvc_meta_v4l2_try_format(file, fh, format);
+	ret = uvc_meta_v4l2_try_format(file, priv, format);
 	if (ret < 0)
 		return ret;
 
@@ -112,7 +112,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	return ret;
 }
 
-static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
+static int uvc_meta_v4l2_enum_formats(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fdesc)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 10196d62f287..f6e065f36ce0 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -388,7 +388,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	return ret;
 }
 
-static int uvc_ioctl_g_fmt(struct file *file, void *fh,
+static int uvc_ioctl_g_fmt(struct file *file, void *priv,
 			   struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -424,7 +424,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 	return ret;
 }
 
-static int uvc_ioctl_s_fmt(struct file *file, void *fh,
+static int uvc_ioctl_s_fmt(struct file *file, void *priv,
 			   struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -456,7 +456,7 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 	return ret;
 }
 
-static int uvc_ioctl_g_parm(struct file *file, void *fh,
+static int uvc_ioctl_g_parm(struct file *file, void *priv,
 			    struct v4l2_streamparm *parm)
 {
 	u32 numerator, denominator;
@@ -493,7 +493,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_s_parm(struct file *file, void *fh,
+static int uvc_ioctl_s_parm(struct file *file, void *priv,
 			    struct v4l2_streamparm *parm)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -622,7 +622,7 @@ static int uvc_v4l2_release(struct file *file)
 	return 0;
 }
 
-static int uvc_ioctl_querycap(struct file *file, void *fh,
+static int uvc_ioctl_querycap(struct file *file, void *priv,
 			      struct v4l2_capability *cap)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -638,7 +638,7 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
+static int uvc_ioctl_enum_fmt(struct file *file, void *priv,
 			      struct v4l2_fmtdesc *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -662,7 +662,7 @@ static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_try_fmt(struct file *file, void *fh,
+static int uvc_ioctl_try_fmt(struct file *file, void *priv,
 			     struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -672,7 +672,7 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
 }
 
-static int uvc_ioctl_enum_input(struct file *file, void *fh,
+static int uvc_ioctl_enum_input(struct file *file, void *priv,
 				struct v4l2_input *input)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -715,7 +715,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
+static int uvc_ioctl_g_input(struct file *file, void *priv, unsigned int *input)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
@@ -743,7 +743,7 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 	return ret;
 }
 
-static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
+static int uvc_ioctl_s_input(struct file *file, void *priv, unsigned int input)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
@@ -777,7 +777,7 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
-static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
+static int uvc_ioctl_query_ext_ctrl(struct file *file, void *priv,
 				    struct v4l2_query_ext_ctrl *qec)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -805,7 +805,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	return ret;
 }
 
-static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
+static int uvc_ioctl_g_ext_ctrls(struct file *file, void *priv,
 				 struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -889,7 +889,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 		return uvc_ctrl_rollback(handle);
 }
 
-static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
+static int uvc_ioctl_s_ext_ctrls(struct file *file, void *priv,
 				 struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -897,7 +897,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
 }
 
-static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
+static int uvc_ioctl_try_ext_ctrls(struct file *file, void *priv,
 				   struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -905,7 +905,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
 }
 
-static int uvc_ioctl_querymenu(struct file *file, void *fh,
+static int uvc_ioctl_querymenu(struct file *file, void *priv,
 			       struct v4l2_querymenu *qm)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -914,7 +914,7 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
 	return uvc_query_v4l2_menu(chain, qm);
 }
 
-static int uvc_ioctl_g_selection(struct file *file, void *fh,
+static int uvc_ioctl_g_selection(struct file *file, void *priv,
 				 struct v4l2_selection *sel)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -948,7 +948,7 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
+static int uvc_ioctl_enum_framesizes(struct file *file, void *priv,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -988,7 +988,7 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
+static int uvc_ioctl_enum_frameintervals(struct file *file, void *priv,
 					 struct v4l2_frmivalenum *fival)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -1060,7 +1060,7 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
 	}
 }
 
-static long uvc_ioctl_default(struct file *file, void *fh, bool valid_prio,
+static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
 			      unsigned int cmd, void *arg)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
-- 
Regards,

Laurent Pinchart


