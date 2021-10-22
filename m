Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAAE437263
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 08:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhJVG6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 02:58:40 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:16518 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbhJVG63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 02:58:29 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 19M6XGn0087037;
        Fri, 22 Oct 2021 14:33:16 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 Oct
 2021 14:55:23 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/7] media: aspeed: add comments and macro
Date:   Fri, 22 Oct 2021 14:55:38 +0800
Message-ID: <20211022065539.12392-7-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022065539.12392-1-jammy_huang@aspeedtech.com>
References: <20211022065539.12392-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19M6XGn0087037
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add comments to describe video-stat and 'struct aspeed_video'.
Add macro, ASPEED_VIDEO_V4L2_MIN_BUF_REQ, to describe the buffers
needed.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 39 ++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 94d17dee6f3d..8e0c29551ffc 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -38,6 +38,8 @@
 #define V4L2_CID_ASPEED_HQ_MODE			(ASPEED_CID_CUSTOM_BASE  + 3)
 #define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(ASPEED_CID_CUSTOM_BASE  + 4)
 
+#define ASPEED_VIDEO_V4L2_MIN_BUF_REQ 3
+
 #define DEVICE_NAME			"aspeed-video"
 
 #define ASPEED_VIDEO_JPEG_NUM_QUALITIES	12
@@ -202,6 +204,15 @@
 #define VE_MEM_RESTRICT_START		0x310
 #define VE_MEM_RESTRICT_END		0x314
 
+/*
+ * @VIDEO_MODE_DETECT_DONE:	a flag raised if signal lock
+ * @VIDEO_RES_CHANGE:		a flag raised if res_change work on-going
+ * @VIDEO_RES_DETECT:		a flag raised if res. detection on-going
+ * @VIDEO_STREAMING:		a flag raised if user requires stream-on
+ * @VIDEO_FRAME_INPRG:		a flag raised if hw working on a frame
+ * @VIDEO_STOPPED:		a flag raised if device release
+ * @VIDEO_CLOCKS_ON:		a flag raised if clk is on
+ */
 enum {
 	VIDEO_MODE_DETECT_DONE,
 	VIDEO_RES_CHANGE,
@@ -234,6 +245,28 @@ struct aspeed_video_perf {
 #define to_aspeed_video_buffer(x) \
 	container_of((x), struct aspeed_video_buffer, vb)
 
+/**
+ * struct aspeed_video - driver data
+ *
+ * @flags:		holds the state of video
+ * @sequence:		holds the last number of frame completed
+ * @max_compressed_size:holds max compressed stream's size
+ * @srcs:		holds the buffer information for srcs
+ * @jpeg:		holds the buffer information for jpeg header
+ * @bcd:		holds the buffer information for bcd work
+ * @yuv420:		a flag raised if JPEG subsampling is 420
+ * @partial_jpeg:	a flag raised if JPEG supports partial capture
+ * @hq_mode:		a flag raised if HQ is enabled. Only for partial_jpeg
+ * @frame_rate:		holds the frame_rate
+ * @jpeg_quality:	holds jpeq's quality (0~11)
+ * @jpeg_hq_quality:	holds hq's quality (0~11) only if hq_mode enabled
+ * @compression_mode:	holds jpeg compression mode
+ * @frame_bottom:	end position of video data in vertical direction
+ * @frame_left:		start position of video data in horizontal direction
+ * @frame_right:	end position of video data in horizontal direction
+ * @frame_top:		start position of video data in vertical direction
+ * @perf:		holds the statistics primary for debugfs
+ */
 struct aspeed_video {
 	void __iomem *base;
 	struct clk *eclk;
@@ -1244,7 +1277,7 @@ static int aspeed_video_get_parm(struct file *file, void *fh,
 	struct aspeed_video *video = video_drvdata(file);
 
 	a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	a->parm.capture.readbuffers = 3;
+	a->parm.capture.readbuffers = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 	a->parm.capture.timeperframe.numerator = 1;
 	if (!video->frame_rate)
 		a->parm.capture.timeperframe.denominator = MAX_FRAME_RATE;
@@ -1261,7 +1294,7 @@ static int aspeed_video_set_parm(struct file *file, void *fh,
 	struct aspeed_video *video = video_drvdata(file);
 
 	a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	a->parm.capture.readbuffers = 3;
+	a->parm.capture.readbuffers = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 
 	if (a->parm.capture.timeperframe.numerator)
 		frame_rate = a->parm.capture.timeperframe.denominator /
@@ -1868,7 +1901,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	vbq->drv_priv = video;
 	vbq->buf_struct_size = sizeof(struct aspeed_video_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = 3;
+	vbq->min_buffers_needed = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-- 
2.25.1

