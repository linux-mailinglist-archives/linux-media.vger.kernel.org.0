Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0765E2F758B
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 10:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbhAOJfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 04:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbhAOJfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 04:35:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB948C061757
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 01:35:01 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l0LVU-0003Cm-DF; Fri, 15 Jan 2021 10:35:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l0LVT-009rG5-DG; Fri, 15 Jan 2021 10:34:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, mchehab@kernel.org
Subject: [PATCH v2 04/18] media: allegro: implement S_FMT for CAPTURE
Date:   Fri, 15 Jan 2021 10:34:59 +0100
Message-Id: <20210115093459.2349588-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d05eaf25-d935-d9a8-bb6e-8b2a0656fb9c@xs4all.nl>
References: <d05eaf25-d935-d9a8-bb6e-8b2a0656fb9c@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to support different codecs, the driver must support changing
the format on CAPTURE. Therefore, the driver needs to handle S_FMT on
CAPTURE.

As the driver will have a different number of formats for OUTPUT and
CAPTURE, split the check for the format index in ENUM_FMT into CAPTURE
and OUTPUT.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2:
- Add check for busy queue when setting the format

 .../media/platform/allegro-dvt/allegro-core.c | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 6b5cbee05040..fb3269cc4789 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -2503,13 +2503,15 @@ static int allegro_querycap(struct file *file, void *fh,
 static int allegro_enum_fmt_vid(struct file *file, void *fh,
 				struct v4l2_fmtdesc *f)
 {
-	if (f->index)
-		return -EINVAL;
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		if (f->index >= 1)
+			return -EINVAL;
 		f->pixelformat = V4L2_PIX_FMT_NV12;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		if (f->index >= 1)
+			return -EINVAL;
 		f->pixelformat = V4L2_PIX_FMT_H264;
 		break;
 	default:
@@ -2557,6 +2559,28 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
+static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+	struct vb2_queue *vq;
+	int err;
+
+	err = allegro_try_fmt_vid_cap(file, fh, f);
+	if (err)
+		return err;
+
+	vq = v4l2_m2m_get_vq(channel->fh.m2m_ctx, f->type);
+	if (!vq)
+		return -EINVAL;
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	channel->codec = f->fmt.pix.pixelformat;
+
+	return 0;
+}
+
 static int allegro_g_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
@@ -2769,7 +2793,7 @@ static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
 	.vidioc_enum_fmt_vid_out = allegro_enum_fmt_vid,
 	.vidioc_g_fmt_vid_cap = allegro_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap = allegro_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = allegro_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = allegro_s_fmt_vid_cap,
 	.vidioc_g_fmt_vid_out = allegro_g_fmt_vid_out,
 	.vidioc_try_fmt_vid_out = allegro_try_fmt_vid_out,
 	.vidioc_s_fmt_vid_out = allegro_s_fmt_vid_out,
-- 
2.20.1

