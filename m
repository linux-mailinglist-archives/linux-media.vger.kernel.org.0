Return-Path: <linux-media+bounces-39309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A16B1F7C6
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981B0189E2E0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F84119CC11;
	Sun, 10 Aug 2025 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="riy6MxvI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E83419AD48
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789545; cv=none; b=f7i3Sz3brpmoZxUdGnOTDNBbYG2YoRubdo5bAVwYxXVyvA5YnBPXTsYKNzf9+JpNbh2C7h3g3HX+AruyVSqZ4sh8DPBz5443e9a3OxGVZgXZcxVtkghz6BKwk5PhUDisR5lRlM1l6tfLlgi2g+FKDr9IPQY1UaHJmf6UWZcKz58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789545; c=relaxed/simple;
	bh=LyApBwP8iu9HM7o+rRN6lzNhAEGg3thmbWLCtmu7LcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXWjp9ArlJElGHyrHUFtW0OZUyeOhQ92o8bDC1jJbv1vviM3cy1vv27x0DQ9vyC9KgSuA1i/S7oX3v6M2lFDwI7y+E1RET2/NqZOseU1rjgZALXRlqTmVsJ1wY1YUuxHqNNN4Jz2QmIp02wzOJBErDtqr1RwCwzIj+nmSkFlBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=riy6MxvI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 95EF31D7F;
	Sun, 10 Aug 2025 03:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789489;
	bh=LyApBwP8iu9HM7o+rRN6lzNhAEGg3thmbWLCtmu7LcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=riy6MxvIy2lPdyPE8jzGIfNyhkcondKx2dIbDl5Jpby4bVorKzz2NgBGQwFH8Ir/H
	 IHSx4SRlUYAFPq+FTjU0qy8ff0Cv1fSJdoUPkM1ChoZzSe5Cd36V1ls+7b2Usizsc1
	 wVmNLNduKbugPAzIgGqPNSjr/E6AIkCHfzBfep8g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 36/76] media: allegro: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:18 +0300
Message-ID: <20250810013100.29776-37-laurent.pinchart+renesas@ideasonboard.com>
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

While at it remove the only left user of fh_to_channel() and remove
the macro completely.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Use channel->fh.m2m_ctx in allegro_ioctl_streamon()
---
 .../media/platform/allegro-dvt/allegro-core.c | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 5e3b1f5d7206..510c3c9661d9 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -197,8 +197,6 @@ static const struct regmap_config allegro_sram_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-#define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
-
 struct allegro_channel {
 	struct allegro_dev *dev;
 	struct v4l2_fh fh;
@@ -3284,7 +3282,7 @@ static int allegro_enum_fmt_vid(struct file *file, void *fh,
 static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 	f->fmt.pix.width = channel->width;
@@ -3326,7 +3324,7 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
 static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	struct vb2_queue *vq;
 	int err;
 
@@ -3350,7 +3348,7 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 static int allegro_g_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 
@@ -3397,7 +3395,7 @@ static int allegro_try_fmt_vid_out(struct file *file, void *fh,
 static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
 	err = allegro_try_fmt_vid_out(file, fh, f);
@@ -3438,7 +3436,7 @@ static int allegro_channel_cmd_start(struct allegro_channel *channel)
 static int allegro_encoder_cmd(struct file *file, void *fh,
 			       struct v4l2_encoder_cmd *cmd)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
 	err = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
@@ -3487,8 +3485,7 @@ static int allegro_enum_framesizes(struct file *file, void *fh,
 static int allegro_ioctl_streamon(struct file *file, void *priv,
 				  enum v4l2_buf_type type)
 {
-	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
 	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -3497,13 +3494,13 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
 			return err;
 	}
 
-	return v4l2_m2m_streamon(file, fh->m2m_ctx, type);
+	return v4l2_m2m_streamon(file, channel->fh.m2m_ctx, type);
 }
 
 static int allegro_g_parm(struct file *file, void *fh,
 			  struct v4l2_streamparm *a)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	struct v4l2_fract *timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -3520,7 +3517,7 @@ static int allegro_g_parm(struct file *file, void *fh,
 static int allegro_s_parm(struct file *file, void *fh,
 			  struct v4l2_streamparm *a)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	struct v4l2_fract *timeperframe;
 	int div;
 
-- 
Regards,

Laurent Pinchart


