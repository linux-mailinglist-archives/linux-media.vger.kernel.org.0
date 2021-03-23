Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71257345A91
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 10:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCWJPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 05:15:43 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43209 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229949AbhCWJPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 05:15:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Od80lvBpbUzyrOd83lOwN6; Tue, 23 Mar 2021 10:15:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616490912; bh=i21hXRRvFZWFtZI3GZ4n6BjDeSPW1DdfBTjQm/LzBFU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W9jC5LUkfLRUQ/F5syWS5skjH+8oThWyUnsh03rFpFHBeDv7cLL09zwlhjSCgKPES
         ZDlTWzKhWp6GlaJ/ddJzJQpKDEDasMNzeOwxMvhDnsykoPJVDaqb1BtxpWhl/Wo0JC
         EM1bDjNtJc3P/4lz3hXQ5MF7L/sqT4ZK23awLUqSrUNznSXwh+w/a+Gs3zy6wsaDS1
         8aVytkmTRbgntmQC+Seq4/VZQ+8qbqB5xUZoHP2KUdsYAAnWjYx29LGpw1PVGXifhY
         gu24WZuEDmHkyIFnH8fsg0RwayR9Jc2Yi5A3eqi2UiaC9ZzkTeru2svKG4h2FSUY+i
         JUSGHo1fR0Bmg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] exynos4-is: fix kernel-doc warnings
Message-ID: <3b56dd72-d04f-40ac-39b1-ebdf16aa80dd@xs4all.nl>
Date:   Tue, 23 Mar 2021 10:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOMYCdXoxN+EAPrE9WpkJqAxWjeWA4uA9GnKp22o9qiIxlnCmENVHT9qYmlWZwUwx0TuJRzk3NJ/nK941fvLtWPQRzhcuWk/dxJoalLkT40NluOn9HrS
 mTGVazqSM72yMeQCGaAr1Q519n8GYcwfkpyEucWZYvAoMtRx8VmisNVfq/6mxlfvXhI/JoCzcQdgkivomW33fvk65tGNFkOdVJO/ckleX3kfMWuAH08UQShF
 ECoClle8fk4K1lnPPsXV0I6rmp84VLzPCbkabYwQxin926LM8KQ5TwflSPYz9Xxx
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes these kernel-doc warnings:

drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 've' not described in 'fimc_is_video'
drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'buf_count' not described in 'fimc_is_video'
drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'buf_mask' not described in 'fimc_is_video'
drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'streaming' not described in 'fimc_is_video'
drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'buffers' not described in 'fimc_is_video'
drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'pixfmt' not described in 'fimc_is_video'
drivers/media/platform/exynos4-is/fimc-isp.h:176: warning: Function parameter or member 'src_fmt' not described in 'fimc_isp'
drivers/media/platform/exynos4-is/fimc-isp.h:176: warning: Function parameter or member 'sink_fmt' not described in 'fimc_isp'
drivers/media/platform/exynos4-is/fimc-isp.h:176: warning: Function parameter or member 'subdev_lock' not described in 'fimc_isp'
drivers/media/platform/exynos4-is/fimc-lite.h:178: warning: Function parameter or member 'events' not described in 'fimc_lite'
drivers/media/platform/exynos4-is/fimc-lite.h:178: warning: Function parameter or member 'streaming' not described in 'fimc_lite'
drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'wbclk' not described in 'fimc_md'
drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'fimc_lite' not described in 'fimc_md'
drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'clk_provider' not described in 'fimc_md'
drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'subdev_notifier' not described in 'fimc_md'
drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'pipelines' not described in 'fimc_md'
drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'link_setup_graph' not described in 'fimc_md'
drivers/media/platform/exynos4-is/fimc-core.h:261: warning: Function parameter or member 'alpha' not described in 'fimc_frame'
drivers/media/platform/exynos4-is/fimc-core.h:321: warning: Function parameter or member 'streaming' not described in 'fimc_vid_cap'
drivers/media/platform/exynos4-is/fimc-core.h:429: warning: Function parameter or member 'drv_data' not described in 'fimc_dev'
drivers/media/platform/exynos4-is/fimc-core.h:495: warning: Function parameter or member 'in_order_1p' not described in 'fimc_ctx'
drivers/media/platform/exynos4-is/fimc-core.h:673: warning: Function parameter or member 'vid_cap' not described in 'fimc_active_queue_add'
drivers/media/platform/exynos4-is/fimc-core.h:685: warning: Function parameter or member 'vid_cap' not described in 'fimc_active_queue_pop'
drivers/media/platform/exynos4-is/fimc-core.h:700: warning: Function parameter or member 'vid_cap' not described in 'fimc_pending_queue_add'
drivers/media/platform/exynos4-is/fimc-core.h:711: warning: Function parameter or member 'vid_cap' not described in 'fimc_pending_queue_pop'
drivers/media/platform/exynos4-is/fimc-reg.h:333: warning: Function parameter or member 'dev' not described in 'fimc_hw_set_dma_seq'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/exynos4-is/fimc-core.h b/drivers/media/platform/exynos4-is/fimc-core.h
index 24212a6bce25..7a058f3e6298 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/exynos4-is/fimc-core.h
@@ -242,6 +242,7 @@ struct fimc_vid_buffer {
  * @addr:	image frame buffer DMA addresses
  * @dma_offset:	DMA offset in bytes
  * @fmt:	fimc color format pointer
+ * @alpha:	alpha value
  */
 struct fimc_frame {
 	u32	f_width;
@@ -296,6 +297,7 @@ struct fimc_m2m_device {
  * @buf_index: index for managing the output DMA buffers
  * @frame_count: the frame counter for statistics
  * @reqbufs_count: the number of buffers requested in REQBUFS ioctl
+ * @streaming: is streaming in progress?
  * @input: capture input type, grp_id of the attached subdev
  * @user_subdev_api: true if subdevs are not configured by the host driver
  */
@@ -400,6 +402,7 @@ struct fimc_ctx;
  * @pdata:	pointer to the device platform data
  * @sysreg:	pointer to the SYSREG regmap
  * @variant:	the IP variant information
+ * @drv_data:	driver data
  * @id:		FIMC device index (0..FIMC_MAX_DEVS)
  * @clock:	clocks required for FIMC operation
  * @regs:	the mapped hardware registers
@@ -408,7 +411,6 @@ struct fimc_ctx;
  * @m2m:	memory-to-memory V4L2 device information
  * @vid_cap:	camera capture device information
  * @state:	flags used to synchronize m2m and capture mode operation
- * @pipeline:	fimc video capture pipeline data structure
  */
 struct fimc_dev {
 	spinlock_t			slock;
@@ -458,7 +460,7 @@ struct fimc_ctrls {
  * @d_frame:		destination frame properties
  * @out_order_1p:	output 1-plane YCBCR order
  * @out_order_2p:	output 2-plane YCBCR order
- * @in_order_1p		input 1-plane YCBCR order
+ * @in_order_1p:	input 1-plane YCBCR order
  * @in_order_2p:	input 2-plane YCBCR order
  * @in_path:		input mode (DMA or camera)
  * @out_path:		output mode (DMA or FIFO)
@@ -666,6 +668,7 @@ int fimc_capture_resume(struct fimc_dev *fimc);

 /**
  * fimc_active_queue_add - add buffer to the capture active buffers queue
+ * @vid_cap:	camera capture device information
  * @buf: buffer to add to the active buffers list
  */
 static inline void fimc_active_queue_add(struct fimc_vid_cap *vid_cap,
@@ -677,6 +680,7 @@ static inline void fimc_active_queue_add(struct fimc_vid_cap *vid_cap,

 /**
  * fimc_active_queue_pop - pop buffer from the capture active buffers queue
+ * @vid_cap:	camera capture device information
  *
  * The caller must assure the active_buf_q list is not empty.
  */
@@ -693,6 +697,7 @@ static inline struct fimc_vid_buffer *fimc_active_queue_pop(

 /**
  * fimc_pending_queue_add - add buffer to the capture pending buffers queue
+ * @vid_cap:	camera capture device information
  * @buf: buffer to add to the pending buffers list
  */
 static inline void fimc_pending_queue_add(struct fimc_vid_cap *vid_cap,
@@ -703,6 +708,7 @@ static inline void fimc_pending_queue_add(struct fimc_vid_cap *vid_cap,

 /**
  * fimc_pending_queue_pop - pop buffer from the capture pending buffers queue
+ * @vid_cap:	camera capture device information
  *
  * The caller must assure the pending_buf_q list is not empty.
  */
diff --git a/drivers/media/platform/exynos4-is/fimc-isp.h b/drivers/media/platform/exynos4-is/fimc-isp.h
index 161fa01a8781..12017cd924d9 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.h
+++ b/drivers/media/platform/exynos4-is/fimc-isp.h
@@ -110,16 +110,20 @@ struct isp_video_buf {

 /**
  * struct fimc_is_video - fimc-is video device structure
- * @vdev: video_device structure
+ * @ve: video_device structure and media pipeline
  * @type: video device type (CAPTURE/OUTPUT)
  * @pad: video device media (sink) pad
  * @pending_buf_q: pending buffers queue head
  * @active_buf_q: a queue head of buffers scheduled in hardware
  * @vb_queue: vb2 buffer queue
- * @active_buf_count: number of video buffers scheduled in hardware
+ * @reqbufs_count: the number of buffers requested in REQBUFS ioctl
+ * @buf_count: number of video buffers scheduled in hardware
+ * @buf_mask: bitmask of the queued video buffer indices
  * @frame_count: counter of frames dequeued to user space
- * @reqbufs_count: number of buffers requested with REQBUFS ioctl
- * @format: current pixel format
+ * @streaming: is streaming in progress?
+ * @buffers: buffer info
+ * @format: current fimc pixel format
+ * @pixfmt: current pixel format
  */
 struct fimc_is_video {
 	struct exynos_video_entity ve;
@@ -147,9 +151,12 @@ struct fimc_is_video {
  * @pdev: pointer to FIMC-IS platform device
  * @subdev: ISP v4l2_subdev
  * @subdev_pads: the ISP subdev media pads
+ * @src_fmt: source mediabus format
+ * @sink_fmt: sink mediabus format
  * @test_pattern: test pattern controls
  * @ctrls: v4l2 controls structure
- * @video_lock: mutex serializing video device and the subdev operations
+ * @video_lock: mutex serializing video device operations
+ * @subdev_lock: mutex serializing subdev operations
  * @cac_margin_x: horizontal CAC margin in pixels
  * @cac_margin_y: vertical CAC margin in pixels
  * @state: driver state flags
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.h b/drivers/media/platform/exynos4-is/fimc-lite.h
index e2d4d628b5aa..ddf29e0b5b1c 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.h
+++ b/drivers/media/platform/exynos4-is/fimc-lite.h
@@ -137,6 +137,8 @@ struct flite_buffer {
  * @active_buf_count: number of video buffers scheduled in hardware
  * @frame_count: the captured frames counter
  * @reqbufs_count: the number of buffers requested with REQBUFS ioctl
+ * @events: event info
+ * @streaming: is streaming in progress?
  */
 struct fimc_lite {
 	struct platform_device	*pdev;
diff --git a/drivers/media/platform/exynos4-is/fimc-reg.h b/drivers/media/platform/exynos4-is/fimc-reg.h
index d7a62465c14e..b9b33aa1f12f 100644
--- a/drivers/media/platform/exynos4-is/fimc-reg.h
+++ b/drivers/media/platform/exynos4-is/fimc-reg.h
@@ -324,6 +324,7 @@ void fimc_deactivate_capture(struct fimc_dev *fimc);

 /**
  * fimc_hw_set_dma_seq - configure output DMA buffer sequence
+ * @dev: fimc device
  * @mask: bitmask for the DMA output buffer registers, set to 0 to skip buffer
  * This function masks output DMA ring buffers, it allows to select which of
  * the 32 available output buffer address registers will be used by the DMA
diff --git a/drivers/media/platform/exynos4-is/media-dev.h b/drivers/media/platform/exynos4-is/media-dev.h
index a3876d668ea6..62ad5d7e035a 100644
--- a/drivers/media/platform/exynos4-is/media-dev.h
+++ b/drivers/media/platform/exynos4-is/media-dev.h
@@ -100,6 +100,8 @@ struct cam_clk {
  * @sensor: array of registered sensor subdevs
  * @num_sensors: actual number of registered sensors
  * @camclk: external sensor clock information
+ * @wbclk: external writeback clock information
+ * @fimc_lite: array of registered fimc-lite devices
  * @fimc: array of registered fimc devices
  * @fimc_is: fimc-is data structure
  * @use_isp: set to true when FIMC-IS subsystem is used
@@ -107,9 +109,12 @@ struct cam_clk {
  * @media_dev: top level media device
  * @v4l2_dev: top level v4l2_device holding up the subdevs
  * @pdev: platform device this media device is hooked up into
- * @cam_clk_provider: CAMCLK clock provider structure
+ * @clk_provider: CAMCLK clock provider structure
+ * @subdev_notifier: notifier for the subdevs
  * @user_subdev_api: true if subdevs are not configured by the host driver
  * @slock: spinlock protecting @sensor array
+ * @pipelines: list of pipelines
+ * @link_setup_graph: graph iterator
  */
 struct fimc_md {
 	struct fimc_csis_info csis[CSIS_MAX_ENTITIES];
