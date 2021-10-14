Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B97742D133
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 05:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhJNDv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 23:51:27 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:17049 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhJNDvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 23:51:06 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 19E3Qci8006362;
        Thu, 14 Oct 2021 11:26:38 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Oct
 2021 11:48:16 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/6] media: aspeed: refine to centerize format/compress settings
Date:   Thu, 14 Oct 2021 11:48:16 +0800
Message-ID: <20211014034819.2283-4-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19E3Qci8006362
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add API, aspeed_video_update_regs(), to centerize format/compress settings
which are controlled by user.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 68 +++++++++++++--------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7b8129b0ca5f..3b5a3935325d 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -974,20 +974,41 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		aspeed_video_free_buf(video, &video->srcs[0]);
 }
 
-static void aspeed_video_init_regs(struct aspeed_video *video)
+static void aspeed_video_update_regs(struct aspeed_video *video)
 {
 	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
 		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
 		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
-	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
+	u32 ctrl = 0;
 	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
 
+	dprintk(LOG_INFO, "framerate(%d)\n", video->frame_rate);
+	dprintk(LOG_INFO, "subsample(%s)\n",
+		video->yuv420 ? "420" : "444");
+	dprintk(LOG_INFO, "compression quality(%d)\n",
+		video->jpeg_quality);
+
 	if (video->frame_rate)
 		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
 
 	if (video->yuv420)
 		seq_ctrl |= VE_SEQ_CTRL_YUV420;
 
+	if (video->jpeg.virt)
+		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
+
+	/* Set control registers */
+	aspeed_video_update(video, VE_SEQ_CTRL,
+			    VE_SEQ_CTRL_JPEG_MODE | VE_SEQ_CTRL_YUV420,
+			    seq_ctrl);
+	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
+	aspeed_video_update(video, VE_COMP_CTRL,
+			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
+			    comp_ctrl);
+}
+
+static void aspeed_video_init_regs(struct aspeed_video *video)
+{
 	/* Unlock VE registers */
 	aspeed_video_write(video, VE_PROTECTION_KEY, VE_PROTECTION_KEY_UNLOCK);
 
@@ -1002,9 +1023,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
 
 	/* Set control registers */
-	aspeed_video_write(video, VE_SEQ_CTRL, seq_ctrl);
-	aspeed_video_write(video, VE_CTRL, ctrl);
-	aspeed_video_write(video, VE_COMP_CTRL, comp_ctrl);
+	aspeed_video_write(video, VE_CTRL, VE_CTRL_AUTO_OR_CURSOR);
+	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
 
 	/* Don't downscale */
 	aspeed_video_write(video, VE_SCALING_FACTOR, 0x10001000);
@@ -1335,27 +1355,6 @@ static const struct v4l2_ioctl_ops aspeed_video_ioctl_ops = {
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 };
 
-static void aspeed_video_update_jpeg_quality(struct aspeed_video *video)
-{
-	u32 comp_ctrl = FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
-		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
-
-	aspeed_video_update(video, VE_COMP_CTRL,
-			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
-			    comp_ctrl);
-}
-
-static void aspeed_video_update_subsampling(struct aspeed_video *video)
-{
-	if (video->jpeg.virt)
-		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
-
-	if (video->yuv420)
-		aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_YUV420);
-	else
-		aspeed_video_update(video, VE_SEQ_CTRL, VE_SEQ_CTRL_YUV420, 0);
-}
-
 static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct aspeed_video *video = container_of(ctrl->handler,
@@ -1365,16 +1364,13 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
 		video->jpeg_quality = ctrl->val;
-		aspeed_video_update_jpeg_quality(video);
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
 		break;
 	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
-		if (ctrl->val == V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
-			video->yuv420 = true;
-			aspeed_video_update_subsampling(video);
-		} else {
-			video->yuv420 = false;
-			aspeed_video_update_subsampling(video);
-		}
+		video->yuv420 = (ctrl->val == V4L2_JPEG_CHROMA_SUBSAMPLING_420);
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
 		break;
 	default:
 		return -EINVAL;
@@ -1404,6 +1400,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 
 	aspeed_video_init_regs(video);
 
+	aspeed_video_update_regs(video);
+
 	aspeed_video_get_resolution(video);
 
 	if (video->detected_timings.width != video->active_timings.width ||
@@ -1518,6 +1516,8 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
 	video->perf.duration_max = 0;
 	video->perf.duration_min = 0xffffffff;
 
+	aspeed_video_update_regs(video);
+
 	rc = aspeed_video_start_frame(video);
 	if (rc) {
 		aspeed_video_bufs_done(video, VB2_BUF_STATE_QUEUED);
-- 
2.25.1

