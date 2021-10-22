Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8081A437265
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 08:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhJVG6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 02:58:47 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:45008 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbhJVG6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 02:58:43 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 19M6XGMS087035;
        Fri, 22 Oct 2021 14:33:16 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 Oct
 2021 14:55:22 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/7] media: aspeed: add more debug log messages
Date:   Fri, 22 Oct 2021 14:55:35 +0800
Message-ID: <20211022065539.12392-4-jammy_huang@aspeedtech.com>
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
X-MAIL: twspam01.aspeedtech.com 19M6XGMS087035
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new messages are listed as below:
1. jpeg header and capture buffer information
2. information for each irq
3. current capture mode, sync or direct-fetch
4. time consumed for each frame
5. input timing changed information

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 789adc86d1af..328f3ec125e2 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -461,12 +461,17 @@ static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
 
 static void update_perf(struct aspeed_video_perf *p)
 {
+	struct aspeed_video *v = container_of(p, struct aspeed_video,
+					      perf);
+
 	p->duration =
 		ktime_to_ms(ktime_sub(ktime_get(),  p->last_sample));
 	p->totaltime += p->duration;
 
 	p->duration_max = max(p->duration, p->duration_max);
 	p->duration_min = min(p->duration, p->duration_min);
+	v4l2_dbg(2, debug, &v->v4l2_dev, "time consumed: %d ms\n",
+		 p->duration);
 }
 
 static int aspeed_video_start_frame(struct aspeed_video *video)
@@ -593,6 +598,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
 
+	v4l2_dbg(1, debug, &video->v4l2_dev, "irq sts=%#x %s%s%s%s\n", sts,
+		 sts & VE_INTERRUPT_MODE_DETECT_WD ? ", unlock" : "",
+		 sts & VE_INTERRUPT_MODE_DETECT ? ", lock" : "",
+		 sts & VE_INTERRUPT_CAPTURE_COMPLETE ? ", capture-done" : "",
+		 sts & VE_INTERRUPT_COMP_COMPLETE ? ", comp-done" : "");
+
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
 	 * re-initialize
@@ -910,6 +921,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
 	if (size < DIRECT_FETCH_THRESHOLD) {
+		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
 		aspeed_video_write(video, VE_TGS_0,
 				   FIELD_PREP(VE_TGS_FIRST,
 					      video->frame_left - 1) |
@@ -921,6 +933,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 					      video->frame_bottom + 1));
 		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
 	} else {
+		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
 		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
 	}
 
@@ -937,6 +950,10 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
 			goto err_mem;
 
+		v4l2_dbg(1, debug, &video->v4l2_dev, "src buf0 addr(%#x) size(%d)\n",
+			 video->srcs[0].dma, video->srcs[0].size);
+		v4l2_dbg(1, debug, &video->v4l2_dev, "src buf1 addr(%#x) size(%d)\n",
+			 video->srcs[1].dma, video->srcs[1].size);
 		aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
 		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
 	}
@@ -1201,6 +1218,9 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
 
 	timings->type = V4L2_DV_BT_656_1120;
 
+	v4l2_dbg(1, debug, &video->v4l2_dev, "set new timings(%dx%d)\n",
+		 timings->bt.width, timings->bt.height);
+
 	return 0;
 }
 
@@ -1383,6 +1403,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
 		};
 
+		v4l2_dbg(1, debug, &video->v4l2_dev, "fire source change event\n");
 		v4l2_event_queue(&video->vdev, &ev);
 	} else if (test_bit(VIDEO_STREAMING, &video->flags)) {
 		/* No resolution change so just restart streaming */
@@ -1718,6 +1739,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 		dev_err(dev, "Unable to request IRQ %d\n", irq);
 		return rc;
 	}
+	dev_info(video->dev, "irq %d\n", irq);
 
 	video->eclk = devm_clk_get(dev, "eclk");
 	if (IS_ERR(video->eclk)) {
@@ -1754,6 +1776,8 @@ static int aspeed_video_init(struct aspeed_video *video)
 		rc = -ENOMEM;
 		goto err_release_reserved_mem;
 	}
+	dev_info(video->dev, "alloc mem size(%d) at %#x for jpeg header\n",
+		 VE_JPEG_HEADER_SIZE, video->jpeg.dma);
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
-- 
2.25.1

