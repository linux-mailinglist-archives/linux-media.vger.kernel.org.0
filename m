Return-Path: <linux-media+bounces-39262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28746B1F6BC
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595943B7C07
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BBD2D0C83;
	Sat,  9 Aug 2025 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gUBjkw4I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3DA2D0C72
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774352; cv=none; b=B2kYdj2YgI7oDqpC+MTz1WrnxPf1d6TRq80UqC+ehIoZ78DoUbujsnqzb7fPPOqWbsYzjfpPpTC0tZCWeRy7oLrGVfAFBBMuANx5fG5UFkkTNdhkJ9anVpRTums+TFRAFXwei5S6D/jrZ7XMqJDpwSqZpeFOAiPBHpmJabbmcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774352; c=relaxed/simple;
	bh=qTpIyOLjMXpQqOrT1b6kUfRAG0V7fT4QZQA/3Jn59GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqAqYmudaqZkPZnVOehl+Ab+6oqgbRd6gjqnD/TvGYskLHwvMhe/+5GM1qUICpps6OHw3YTprwqJPaVtYtUZ0ubJeOyEfH/4VNmFNtb3RnQsY5/N1jU1c9P8ME6wLJOIckGBGsOoQXnMXgHwePgId+kqw3SDTIgYIQbqR4zKTsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gUBjkw4I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 899F015B5;
	Sat,  9 Aug 2025 23:18:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774292;
	bh=qTpIyOLjMXpQqOrT1b6kUfRAG0V7fT4QZQA/3Jn59GE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUBjkw4IVgwGKEkU//gN1IEoR65G7OPxbN2coZ4dveea1N7lXyxK0VP6Z2YQnd11+
	 JSByGM2vp60rei82b1jcssBhjJgiU0FTviNQjrnej+GrZ4qQwycMEeNLu5mc5B7LCH
	 NbP2YzdKg/zMBhSYst0DePZ6+ytwH/rRfW3nTm7c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 67/76] media: usb: uvc: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:44 +0300
Message-ID: <20250809211654.28887-68-laurent.pinchart@ideasonboard.com>
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
 drivers/media/usb/uvc/uvc_v4l2.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 09677ed639ae..10196d62f287 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -391,7 +391,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 			   struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format;
 	const struct uvc_frame *frame;
@@ -427,7 +427,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 			   struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	const struct uvc_format *format;
@@ -460,7 +460,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
 	u32 numerator, denominator;
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	if (parm->type != stream->type)
@@ -496,7 +496,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 static int uvc_ioctl_s_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	struct v4l2_fract timeperframe;
@@ -641,7 +641,7 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
 static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 			      struct v4l2_fmtdesc *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	enum v4l2_buf_type type = fmt->type;
 	const struct uvc_format *format;
@@ -665,7 +665,7 @@ static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 			     struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 
@@ -675,7 +675,7 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
@@ -717,7 +717,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 
 static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
 	int ret;
@@ -745,7 +745,7 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 
 static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
@@ -780,7 +780,7 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 				    struct v4l2_query_ext_ctrl *qec)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	return uvc_query_v4l2_ctrl(chain, qec);
@@ -808,7 +808,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
@@ -892,7 +892,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
 }
@@ -900,7 +900,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 				   struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
 }
@@ -908,7 +908,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 static int uvc_ioctl_querymenu(struct file *file, void *fh,
 			       struct v4l2_querymenu *qm)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	return uvc_query_v4l2_menu(chain, qm);
@@ -917,7 +917,7 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
 static int uvc_ioctl_g_selection(struct file *file, void *fh,
 				 struct v4l2_selection *sel)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	if (sel->type != stream->type)
@@ -951,7 +951,7 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -991,7 +991,7 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 					 struct v4l2_frmivalenum *fival)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -1063,7 +1063,7 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
 static long uvc_ioctl_default(struct file *file, void *fh, bool valid_prio,
 			      unsigned int cmd, void *arg)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	switch (cmd) {
-- 
Regards,

Laurent Pinchart


