Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D495258ECB2
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 15:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbiHJNCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 09:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiHJNBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 09:01:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198C56B16E
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 06:01:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 496F8B81C54
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 13:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53571C433C1;
        Wed, 10 Aug 2022 13:01:35 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/6] media: avoid use of 'videobuf'
Date:   Wed, 10 Aug 2022 15:01:27 +0200
Message-Id: <20220810130127.2707169-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
References: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The term 'videobuf' typically refers to the old videobuf version 1
framework. Avoid using this word in drivers that are converted to
vb2.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/driver-api/media/drivers/pxa_camera.rst | 2 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c             | 2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c        | 2 +-
 drivers/media/platform/intel/pxa_camera.c             | 8 ++++----
 drivers/media/platform/marvell/mcam-core.h            | 2 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c      | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-core.h | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c      | 2 +-
 drivers/media/test-drivers/vim2m.c                    | 2 +-
 drivers/media/usb/airspy/airspy.c                     | 2 +-
 drivers/media/usb/au0828/au0828-video.c               | 4 ++--
 drivers/media/usb/cx231xx/cx231xx-vbi.c               | 2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c             | 2 +-
 drivers/media/usb/em28xx/em28xx-video.c               | 4 ++--
 drivers/media/usb/msi2500/msi2500.c                   | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c               | 2 +-
 16 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/pxa_camera.rst b/Documentation/driver-api/media/drivers/pxa_camera.rst
index ee1bd96b66dd..46919919baac 100644
--- a/Documentation/driver-api/media/drivers/pxa_camera.rst
+++ b/Documentation/driver-api/media/drivers/pxa_camera.rst
@@ -19,7 +19,7 @@ Global video workflow
 
 a) QCI stopped
    Initially, the QCI interface is stopped.
-   When a buffer is queued (pxa_videobuf_ops->buf_queue), the QCI starts.
+   When a buffer is queued, start_streaming is called and the QCI starts.
 
 b) QCI started
    More buffers can be queued while the QCI is started without halting the
diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 6a4f2997d6f5..05f71d169726 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -245,7 +245,7 @@ static void rtl2832_sdr_urb_complete(struct urb *urb)
 		if (unlikely(fbuf == NULL)) {
 			dev->vb_full++;
 			dev_notice_ratelimited(&pdev->dev,
-					       "videobuf is full, %d packets dropped\n",
+					       "video buffer is full, %d packets dropped\n",
 					       dev->vb_full);
 			goto skip;
 		}
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 80d20e2a2099..0adf3d80f248 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -1020,7 +1020,7 @@ static int solo_g_parm(struct file *file, void *priv,
 	cp->timeperframe.numerator = solo_enc->interval;
 	cp->timeperframe.denominator = solo_enc->solo_dev->fps;
 	cp->capturemode = 0;
-	/* XXX: Shouldn't we be able to get/set this from videobuf? */
+	/* XXX: Shouldn't we be able to get/set this from vb2? */
 	cp->readbuffers = 2;
 
 	return 0;
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 35145e3348f0..54270d6b6f50 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -854,7 +854,7 @@ static int pxa_init_dma_channel(struct pxa_camera_dev *pcdev,
 	return -ENOMEM;
 }
 
-static void pxa_videobuf_set_actdma(struct pxa_camera_dev *pcdev,
+static void pxa_video_buf_set_actdma(struct pxa_camera_dev *pcdev,
 				    struct pxa_buffer *buf)
 {
 	buf->active_dma = DMA_Y;
@@ -973,7 +973,7 @@ static void pxa_camera_wakeup(struct pxa_camera_dev *pcdev,
  * stopped. This means the tailed buffer would never be transferred by DMA.
  * This function restarts the capture for this corner case, where :
  *  - DADR() == DADDR_STOP
- *  - a videobuffer is queued on the pcdev->capture list
+ *  - a video buffer is queued on the pcdev->capture list
  *
  * Please check the "DMA hot chaining timeslice issue" in
  *   Documentation/driver-api/media/drivers/pxa_camera.rst
@@ -1163,7 +1163,7 @@ static void pxa_camera_eof(struct tasklet_struct *t)
 	pcdev->active = list_first_entry(&pcdev->capture,
 					 struct pxa_buffer, queue);
 	buf = pcdev->active;
-	pxa_videobuf_set_actdma(pcdev, buf);
+	pxa_video_buf_set_actdma(pcdev, buf);
 
 	pxa_dma_start_channels(pcdev);
 }
@@ -1416,7 +1416,7 @@ static int pxac_vb2_prepare(struct vb2_buffer *vb)
 	 * the actual buffer is yours
 	 */
 	buf->inwork = 0;
-	pxa_videobuf_set_actdma(pcdev, buf);
+	pxa_video_buf_set_actdma(pcdev, buf);
 
 	return ret;
 }
diff --git a/drivers/media/platform/marvell/mcam-core.h b/drivers/media/platform/marvell/mcam-core.h
index f324d808d737..51e66db45af6 100644
--- a/drivers/media/platform/marvell/mcam-core.h
+++ b/drivers/media/platform/marvell/mcam-core.h
@@ -32,7 +32,7 @@
 
 #if !defined(MCAM_MODE_VMALLOC) && !defined(MCAM_MODE_DMA_CONTIG) && \
 	!defined(MCAM_MODE_DMA_SG)
-#error One of the videobuf buffer modes must be selected in the config
+#error One of the vb2 buffer modes must be selected in the config
 #endif
 
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index e8e0ee5f2277..df1606b49d77 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -305,7 +305,7 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
  * @video: the video node
  *
  * This function completes the current buffer by filling its sequence number,
- * time stamp and payload size, and hands it back to the videobuf core.
+ * time stamp and payload size, and hands it back to the vb2 core.
  *
  * Return the next queued buffer or NULL if the queue is empty.
  */
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.h b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
index 7a058f3e6298..2b0760add092 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -215,7 +215,7 @@ struct fimc_addr {
 
 /**
  * struct fimc_vid_buffer - the driver's video buffer
- * @vb:    v4l videobuf buffer
+ * @vb:    v4l vb2 buffer
  * @list:  linked list structure for buffer queue
  * @addr: precalculated DMA address set
  * @index: buffer index for the output DMA engine
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 761341934925..219fc0235b69 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -323,7 +323,7 @@ static void s5p_mfc_handle_frame_new(struct s5p_mfc_ctx *ctx, unsigned int err)
 	}
 	ctx->sequence++;
 	/* The MFC returns address of the buffer, now we have to
-	 * check which videobuf does it correspond to */
+	 * check which vb2_buffer does it correspond to */
 	list_for_each_entry(dst_buf, &ctx->dst_queue, list) {
 		u32 addr = (u32)vb2_dma_contig_plane_dma_addr(&dst_buf->b->vb2_buf, 0);
 
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 47575490e74a..7964426bf2f7 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -2,7 +2,7 @@
 /*
  * A virtual v4l2-mem2mem example device.
  *
- * This is a virtual device driver for testing mem-to-mem videobuf framework.
+ * This is a virtual device driver for testing mem-to-mem vb2 framework.
  * It simulates a device that uses memory buffers for both source and
  * destination, processes the data and issues an "irq" (simulated by a delayed
  * workqueue).
diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 240a7cc56777..b8b88244f963 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -294,7 +294,7 @@ static void airspy_urb_complete(struct urb *urb)
 		if (unlikely(fbuf == NULL)) {
 			s->vb_full++;
 			dev_notice_ratelimited(s->dev,
-					"videobuf is full, %d packets dropped\n",
+					"video buffer is full, %d packets dropped\n",
 					s->vb_full);
 			goto skip;
 		}
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index c0f118563c7d..eb303e94cceb 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -384,7 +384,7 @@ static void au0828_copy_video(struct au0828_dev *dev,
 }
 
 /*
- * video-buf generic routine to get the next available buffer
+ * generic routine to get the next available buffer
  */
 static inline void get_next_buf(struct au0828_dmaqueue *dma_q,
 				struct au0828_buffer **buf)
@@ -459,7 +459,7 @@ static void au0828_copy_vbi(struct au0828_dev *dev,
 
 
 /*
- * video-buf generic routine to get the next available VBI buffer
+ * generic routine to get the next available VBI buffer
  */
 static inline void vbi_get_next_buf(struct au0828_dmaqueue *dma_q,
 				    struct au0828_buffer **buf)
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index fdc8b7f7b0c1..33431d9f54c2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -558,7 +558,7 @@ u32 cx231xx_copy_vbi_line(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
 }
 
 /*
- * video-buf generic routine to get the next available buffer
+ * generic routine to get the next available buffer
  */
 static inline void get_next_vbi_buf(struct cx231xx_dmaqueue *dma_q,
 				    struct cx231xx_buffer **buf)
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 425e470b0fd3..e23b8ccd79d4 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -220,7 +220,7 @@ static inline void print_err_status(struct cx231xx *dev, int packet, int status)
 }
 
 /*
- * video-buf generic routine to get the next available buffer
+ * generic routine to get the next available buffer
  */
 static inline void get_next_buf(struct cx231xx_dmaqueue *dma_q,
 				struct cx231xx_buffer **buf)
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 8181c0e6a25b..25e0620deff1 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -440,7 +440,7 @@ static inline void finish_buffer(struct em28xx *dev,
 }
 
 /*
- * Copy picture data from USB buffer to videobuf buffer
+ * Copy picture data from USB buffer to video buffer
  */
 static void em28xx_copy_video(struct em28xx *dev,
 			      struct em28xx_buffer *buf,
@@ -521,7 +521,7 @@ static void em28xx_copy_video(struct em28xx *dev,
 }
 
 /*
- * Copy VBI data from USB buffer to videobuf buffer
+ * Copy VBI data from USB buffer to video buffer
  */
 static void em28xx_copy_vbi(struct em28xx *dev,
 			    struct em28xx_buffer *buf,
diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 71de6b4c4e4c..5a1f2698efb7 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -411,7 +411,7 @@ static void msi2500_isoc_handler(struct urb *urb)
 		if (unlikely(fbuf == NULL)) {
 			dev->vb_full++;
 			dev_dbg_ratelimited(dev->dev,
-					    "videobuf is full, %d packets dropped\n",
+					    "video buffer is full, %d packets dropped\n",
 					    dev->vb_full);
 			continue;
 		}
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 6954584526a3..26811efe0fb5 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -80,7 +80,7 @@ static int pvr2_dvb_feed_func(struct pvr2_dvb_adapter *adap)
 static int pvr2_dvb_feed_thread(void *data)
 {
 	int stat = pvr2_dvb_feed_func(data);
-	/* from videobuf-dvb.c: */
+
 	while (!kthread_should_stop()) {
 		set_current_state(TASK_INTERRUPTIBLE);
 		schedule();
-- 
2.35.1

