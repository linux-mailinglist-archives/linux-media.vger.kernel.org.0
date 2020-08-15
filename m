Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B2124538C
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 00:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgHOWCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 18:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbgHOVvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF03C08EAD4
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8AADF28D80C
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 09/14] media: staging: rkisp1: remove atomic operations for frame sequence
Date:   Sat, 15 Aug 2020 12:37:29 +0200
Message-Id: <20200815103734.31153-10-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isp.frame_sequence is now read only from the irq handlers
that are all fired from the same interrupt so there is not need
for atomic operation.
In addition the frame seq incrementation is moved from
rkisp1_isp_queue_event_sof to rkisp1_isp_isr to make the code
clearer.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
 drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 20 +++++++++----------
 drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c   |  3 +--
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index c05280950ea0..d7017afc5405 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -632,7 +632,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 	curr_buf = cap->buf.curr;
 
 	if (curr_buf) {
-		curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
+		curr_buf->vb.sequence = isp->frame_sequence;
 		curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
 		curr_buf->vb.field = V4L2_FIELD_NONE;
 		vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 9b41935c6597..79edece6ee77 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -112,7 +112,7 @@ struct rkisp1_isp {
 	const struct rkisp1_isp_mbus_info *src_fmt;
 	struct mutex ops_lock;
 	bool is_dphy_errctrl_disabled;
-	atomic_t frame_sequence;
+	__u32 frame_sequence;
 };
 
 struct rkisp1_vdev_node {
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index ad2ece78abbf..1ffe7cc7bb12 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -940,7 +940,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (rkisp1->active_sensor->mbus_type != V4L2_MBUS_CSI2_DPHY)
 		return -EINVAL;
 
-	atomic_set(&rkisp1->isp.frame_sequence, -1);
+	rkisp1->isp.frame_sequence = -1;
 	mutex_lock(&isp->ops_lock);
 	ret = rkisp1_config_cif(rkisp1);
 	if (ret)
@@ -1093,15 +1093,8 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
+	event.u.frame_sync.frame_sequence = isp->frame_sequence;
 
-	/*
-	 * Increment the frame sequence on the vsync signal.
-	 * This will allow applications to detect dropped.
-	 * Note that there is a debugfs counter for dropped
-	 * frames, but using this event is more accurate.
-	 */
-	event.u.frame_sync.frame_sequence =
-		atomic_inc_return(&isp->frame_sequence);
 	v4l2_event_queue(isp->sd.devnode, &event);
 }
 
@@ -1116,7 +1109,14 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 	rkisp1_write(rkisp1, status, RKISP1_CIF_ISP_ICR);
 
 	/* Vertical sync signal, starting generating new frame */
-	if (status & RKISP1_CIF_ISP_V_START)
+	if (status & RKISP1_CIF_ISP_V_START) {
+		/*
+		 * Increment the frame sequence on the vsync signal.
+		 * This will allow applications to detect dropped.
+		 * Note that there is a debugfs counter for dropped
+		 * frames, but using this event is more accurate.
+		 */
+		rkisp1->isp.frame_sequence++;
 		rkisp1_isp_queue_event_sof(&rkisp1->isp);
 
 	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 4b4391c0a2a0..cc242ad5106e 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1227,7 +1227,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	 * We want the vb.sequence to be the frame that the params are applied to.
 	 * So we set vb.sequence to be the isp's frame_sequence + 1
 	 */
-	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence) + 1;
+	unsigned int frame_sequence = rkisp1->isp.frame_sequence + 1;
 	struct rkisp1_params *params = &rkisp1->params;
 
 	spin_lock(&params->config_lock);
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 87e4104d20dd..52417b388854 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -307,8 +307,7 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 {
 	struct rkisp1_stat_buffer *cur_stat_buf;
 	struct rkisp1_buffer *cur_buf = NULL;
-	unsigned int frame_sequence =
-		atomic_read(&stats->rkisp1->isp.frame_sequence);
+	unsigned int frame_sequence = stats->rkisp1->isp.frame_sequence;
 	u64 timestamp = ktime_get_ns();
 
 	/* get one empty buffer */
-- 
2.17.1

