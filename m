Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44B242D134
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 05:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhJNDv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 23:51:28 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:17083 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbhJNDvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 23:51:06 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 19E3Qci7006362;
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
Subject: [PATCH 2/6] media: aspeed: add dprintk for more detailed log control
Date:   Thu, 14 Oct 2021 11:48:15 +0800
Message-ID: <20211014034819.2283-3-jammy_huang@aspeedtech.com>
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
X-MAIL: twspam01.aspeedtech.com 19E3Qci7006362
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add dprintk to categorize the log into NOTICE/INFO/TRACE/IRQ/REG.
The on/off is controlled by module_param, debug.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 73 ++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 6259cf17a7cc..7b8129b0ca5f 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -31,6 +31,19 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 
+
+#define LOG_REG		BIT(4)
+#define LOG_DEBUG	BIT(3)
+#define LOG_TRACE	BIT(2)
+#define LOG_INFO	BIT(1)
+#define LOG_NOTICE	BIT(0)
+
+#define dprintk(level, fmt, arg...) do {					\
+	if (debug & level)							\
+		pr_debug(pr_fmt("[%s]: " fmt), DEVICE_NAME, ##arg);		\
+} while (0)
+
+
 #define DEVICE_NAME			"aspeed-video"
 
 #define ASPEED_VIDEO_JPEG_NUM_QUALITIES	12
@@ -390,6 +403,8 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
 	},
 };
 
+static unsigned int debug;
+
 static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
 {
 	int i;
@@ -437,7 +452,7 @@ static void aspeed_video_update(struct aspeed_video *video, u32 reg, u32 clear,
 	t &= ~clear;
 	t |= bits;
 	writel(t, video->base + reg);
-	dev_dbg(video->dev, "update %03x[%08x -> %08x]\n", reg, before,
+	dprintk(LOG_REG, "update %03x[%08x -> %08x]\n", reg, before,
 		readl(video->base + reg));
 }
 
@@ -445,14 +460,14 @@ static u32 aspeed_video_read(struct aspeed_video *video, u32 reg)
 {
 	u32 t = readl(video->base + reg);
 
-	dev_dbg(video->dev, "read %03x[%08x]\n", reg, t);
+	dprintk(LOG_REG, "read %03x[%08x]\n", reg, t);
 	return t;
 }
 
 static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
 {
 	writel(val, video->base + reg);
-	dev_dbg(video->dev, "write %03x[%08x]\n", reg,
+	dprintk(LOG_REG, "write %03x[%08x]\n", reg,
 		readl(video->base + reg));
 }
 
@@ -474,13 +489,13 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
 
 	if (video->v4l2_input_status) {
-		dev_dbg(video->dev, "No signal; don't start frame\n");
+		dprintk(LOG_NOTICE, "No signal; don't start frame\n");
 		return 0;
 	}
 
 	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
 	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
-		dev_dbg(video->dev, "Engine busy; don't start frame\n");
+		dprintk(LOG_NOTICE, "Engine busy; don't start frame\n");
 		return -EBUSY;
 	}
 
@@ -489,7 +504,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 				       struct aspeed_video_buffer, link);
 	if (!buf) {
 		spin_unlock_irqrestore(&video->lock, flags);
-		dev_dbg(video->dev, "No buffers; don't start frame\n");
+		dprintk(LOG_NOTICE, "No buffers; don't start frame\n");
 		return -EPROTO;
 	}
 
@@ -565,7 +580,7 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
 
 static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 {
-	dev_dbg(video->dev, "Resolution changed; resetting\n");
+	dprintk(LOG_INFO, "Resolution changed; resetting\n");
 
 	set_bit(VIDEO_RES_CHANGE, &video->flags);
 	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
@@ -590,6 +605,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
 
+	dprintk(LOG_DEBUG, "irq sts=%#x %s%s%s%s\n", sts,
+		sts & VE_INTERRUPT_MODE_DETECT_WD ? ", unlock" : "",
+		sts & VE_INTERRUPT_MODE_DETECT ? ", lock" : "",
+		sts & VE_INTERRUPT_CAPTURE_COMPLETE ? ", capture-done" : "",
+		sts & VE_INTERRUPT_COMP_COMPLETE ? ", comp-done" : "");
+
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
 	 * re-initialize
@@ -766,7 +787,7 @@ static void aspeed_video_calc_compressed_size(struct aspeed_video *video,
 	aspeed_video_write(video, VE_STREAM_BUF_SIZE,
 			   compression_buffer_size_reg);
 
-	dev_dbg(video->dev, "Max compressed size: %x\n",
+	dprintk(LOG_INFO, "Max compressed size: %#x\n",
 		video->max_compressed_size);
 }
 
@@ -804,7 +825,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						      res_check(video),
 						      MODE_DETECT_TIMEOUT);
 		if (!rc) {
-			dev_dbg(video->dev, "Timed out; first mode detect\n");
+			dprintk(LOG_INFO, "Timed out; first mode detect\n");
 			clear_bit(VIDEO_RES_DETECT, &video->flags);
 			return;
 		}
@@ -822,7 +843,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						      MODE_DETECT_TIMEOUT);
 		clear_bit(VIDEO_RES_DETECT, &video->flags);
 		if (!rc) {
-			dev_dbg(video->dev, "Timed out; second mode detect\n");
+			dprintk(LOG_INFO, "Timed out; second mode detect\n");
 			return;
 		}
 
@@ -856,7 +877,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
 
 	if (invalid_resolution) {
-		dev_dbg(video->dev, "Invalid resolution detected\n");
+		dprintk(LOG_NOTICE, "Invalid resolution detected\n");
 		return;
 	}
 
@@ -873,7 +894,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	aspeed_video_update(video, VE_SEQ_CTRL, 0,
 			    VE_SEQ_CTRL_AUTO_COMP | VE_SEQ_CTRL_EN_WATCHDOG);
 
-	dev_dbg(video->dev, "Got resolution: %dx%d\n", det->width,
+	dprintk(LOG_INFO, "Got resolution: %dx%d\n", det->width,
 		det->height);
 }
 
@@ -907,6 +928,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
 	if (size < DIRECT_FETCH_THRESHOLD) {
+		dprintk(LOG_INFO, "Capture: Sync Mode\n");
 		aspeed_video_write(video, VE_TGS_0,
 				   FIELD_PREP(VE_TGS_FIRST,
 					      video->frame_left - 1) |
@@ -918,6 +940,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 					      video->frame_bottom + 1));
 		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
 	} else {
+		dprintk(LOG_INFO, "Capture: Direct Mode\n");
 		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
 	}
 
@@ -934,6 +957,10 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
 			goto err_mem;
 
+		dprintk(LOG_INFO, "src buf0 addr(%#x) size(%d)\n",
+			video->srcs[0].dma, video->srcs[0].size);
+		dprintk(LOG_INFO, "src buf1 addr(%#x) size(%d)\n",
+			video->srcs[1].dma, video->srcs[1].size);
 		aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
 		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
 	}
@@ -1010,6 +1037,8 @@ static void aspeed_video_start(struct aspeed_video *video)
 
 static void aspeed_video_stop(struct aspeed_video *video)
 {
+	dprintk(LOG_TRACE, "%s\n", __func__);
+
 	set_bit(VIDEO_STOPPED, &video->flags);
 	cancel_delayed_work_sync(&video->res_work);
 
@@ -1198,6 +1227,9 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
 
 	timings->type = V4L2_DV_BT_656_1120;
 
+	dprintk(LOG_INFO, "set new timings(%dx%d)\n", timings->bt.width,
+		timings->bt.height);
+
 	return 0;
 }
 
@@ -1362,6 +1394,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 						  res_work);
 	u32 input_status = video->v4l2_input_status;
 
+	dprintk(LOG_TRACE, "%s+\n", __func__);
+
 	aspeed_video_on(video);
 
 	/* Exit early in case no clients remain */
@@ -1380,6 +1414,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
 		};
 
+		dprintk(LOG_INFO, "fire source change event\n");
 		v4l2_event_queue(&video->vdev, &ev);
 	} else if (test_bit(VIDEO_STREAMING, &video->flags)) {
 		/* No resolution change so just restart streaming */
@@ -1389,6 +1424,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 done:
 	clear_bit(VIDEO_RES_CHANGE, &video->flags);
 	wake_up_interruptible_all(&video->wait);
+
+	dprintk(LOG_TRACE, "%s-\n", __func__);
 }
 
 static int aspeed_video_open(struct file *file)
@@ -1476,6 +1513,7 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
 	int rc;
 	struct aspeed_video *video = vb2_get_drv_priv(q);
 
+	dprintk(LOG_TRACE, "%s\n", __func__);
 	video->sequence = 0;
 	video->perf.duration_max = 0;
 	video->perf.duration_min = 0xffffffff;
@@ -1495,13 +1533,15 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 	int rc;
 	struct aspeed_video *video = vb2_get_drv_priv(q);
 
+	dprintk(LOG_TRACE, "%s+\n", __func__);
+
 	clear_bit(VIDEO_STREAMING, &video->flags);
 
 	rc = wait_event_timeout(video->wait,
 				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
 				STOP_TIMEOUT);
 	if (!rc) {
-		dev_dbg(video->dev, "Timed out when stopping streaming\n");
+		dprintk(LOG_NOTICE, "Timed out when stopping streaming\n");
 
 		/*
 		 * Need to force stop any DMA and try and get HW into a good
@@ -1516,6 +1556,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 	}
 
 	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
+	dprintk(LOG_TRACE, "%s-\n", __func__);
 }
 
 static void aspeed_video_buf_queue(struct vb2_buffer *vb)
@@ -1715,6 +1756,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 		dev_err(dev, "Unable to request IRQ %d\n", irq);
 		return rc;
 	}
+	dev_info(video->dev, "irq %d\n", irq);
 
 	video->eclk = devm_clk_get(dev, "eclk");
 	if (IS_ERR(video->eclk)) {
@@ -1751,6 +1793,8 @@ static int aspeed_video_init(struct aspeed_video *video)
 		rc = -ENOMEM;
 		goto err_release_reserved_mem;
 	}
+	dev_info(video->dev, "alloc mem size(%d) at %#x for jpeg header\n",
+		 VE_JPEG_HEADER_SIZE, video->jpeg.dma);
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
@@ -1856,6 +1900,9 @@ static struct platform_driver aspeed_video_driver = {
 
 module_platform_driver(aspeed_video_driver);
 
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "set debugging level (0=reg,2=irq,4=trace,8=info(|-able)).");
+
 MODULE_DESCRIPTION("ASPEED Video Engine Driver");
 MODULE_AUTHOR("Eddie James");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

