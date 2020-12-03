Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4162CD439
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388840AbgLCLEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387738AbgLCLEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE9EC08E861
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:54 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Kq-50; Thu, 03 Dec 2020 12:02:53 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhe-RW; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:52 +0100
Message-Id: <20201203110106.2939463-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 04/18] media: allegro: implement S_FMT for CAPTURE
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
 .../media/platform/allegro-dvt/allegro-core.c | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 6b5cbee05040..a733049c8727 100644
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
@@ -2557,6 +2559,21 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
+static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+	int err;
+
+	err = allegro_try_fmt_vid_cap(file, fh, f);
+	if (err)
+		return err;
+
+	channel->codec = f->fmt.pix.pixelformat;
+
+	return 0;
+}
+
 static int allegro_g_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
@@ -2769,7 +2786,7 @@ static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
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

