Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145764588A6
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 05:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbhKVEhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 23:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhKVEhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 23:37:14 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2E8C061574
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 20:34:08 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id np3so12746657pjb.4
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 20:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ppYdtmpfj+QWemhAygi+bjKq27+9FP3QGlrA4DsRo5c=;
        b=D9jq/ReJxPGDiHPoW4yKn1mVg7VW/c65cGa+iA1P8x7Gjf6qMAfvMey3xLap7QIdjW
         Udf76mZAeSxh0a07Ph0umFq3E3CWqvjwaZ3Az/Q2nQ4TpjKpp1SJuYTAGmAhhtCeFMZd
         lIxDsAeyQelDcCjPW0be7KgH6IbfgPGN50oXu1mKfQzEdNHE2STpJuckPegxWBLMaN93
         aYtwhEZ0UOaKqOROZcZmtDSVTTwbHxVoKadMR8iiIYbl70HYicrhLgYDZtdHoIFugwl9
         GveaffFeq/xJu5vuT2ICHXtZ8voXGoj3KsgSw1SGTECN+MIhkbElMoSEVkoDp+n3yZBU
         z46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ppYdtmpfj+QWemhAygi+bjKq27+9FP3QGlrA4DsRo5c=;
        b=nhCvcL5t2aEiYVgHcrPSkwTNQuIGkmsU/p+gEeKFMqjZ2Oe1irWpkEafC2vYCZM5Lm
         PM0ezLq3WFNnLT+V/PoNsRi3n5JL922PqDtllVNb93BIDKyhdp7nePNa0YuK5+MF8IYa
         RMhqJkXWPwuUoM0He+41cH0h9bopSsRoKsL9MvGe51zpyV6lhAX9CTXEuRzD7QWBAJtC
         1YUP75iIQUnyo9nq1nSThbqPE7p5Zja1KrvHeEPlLNZt6tzGettVcfwOeGACmLvjxmEC
         br0ZUTPw0+XefDtZbyJAYrWJ12wk9DIneHOXRhYXc6v9klDqHfqsmUBpApYTAA7XzRKa
         sXtg==
X-Gm-Message-State: AOAM532XDEFfDx4QiUJ4z7G9Vl2QcgutAePSYLLsMjGA6/6Nk1frx5d2
        1FHu/M+ZX0U8pM2fnl8XRa2kdjMJKxoy+4Dk
X-Google-Smtp-Source: ABdhPJxwzdnR+TWOqjA6AgGpxRdot2/MQ4beHjPDvXLbB8W+DdsjqaMSXpxO7xWYhKTiX7Ld97BVog==
X-Received: by 2002:a17:90b:3b8c:: with SMTP id pc12mr27265514pjb.9.1637555647716;
        Sun, 21 Nov 2021 20:34:07 -0800 (PST)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id w1sm6854044pfg.11.2021.11.21.20.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 20:34:07 -0800 (PST)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] media: vivid: fix timestamp and sequence wrapping
Date:   Sun, 21 Nov 2021 20:33:55 -0800
Message-Id: <20211122043355.61573-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error injection controls that test wrap-around sequence and
timestamp counters were partially broken. Add a menu option to wrap
the timestamp at either 64 or 32 bits because previously it was not
wrapping for 64 bits. Get the current time when streaming starts
instead of when the control is set because otherwise the time may
wrap around before the device can be tested.  Remove the sequence
count from the timestamp calculation so that sequence wrapping does
not interfere with the timestamp.  Add consistent time and sequence
wrapping to sdr and touch devices.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
How I set the controls:
v4l2-ctl -d <dev> -c wrap_sequence_number=1
v4l2-ctl -d <dev> -c wrap_timestamp=1
v4l2-ctl -d <dev> -c wrap_timestamp=2

How I tested:
v4l2-ctl -d <dev> --stream-mmap --verbose 
v4l2-ctl -d <dev> --stream-out-mmap --verbose 
v4l2-ctl-32 -d <dev> --stream-mmap --verbose
v4l2-ctl-32 -d <dev> --stream-out-mmap --verbose

Devices I tested:
vivid-000-vid-cap, inputs: webcam, TV, S-Video, HDMI
vivid-000-vid-out, outputs: S-Video, HDMI
vivid-000-touch-cap
vivid-000-sdr-cap
vivid-000-vbi-out
vivid-000-meta-cap
vivid-000-meta-out

 drivers/media/test-drivers/vivid/vivid-core.h |  5 ++-
 .../media/test-drivers/vivid/vivid-ctrls.c    | 32 ++++++++-----------
 .../test-drivers/vivid/vivid-kthread-cap.c    |  9 ++++--
 .../test-drivers/vivid/vivid-kthread-out.c    | 11 ++++---
 .../test-drivers/vivid/vivid-kthread-touch.c  | 10 ++++++
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 16 +++++++---
 .../test-drivers/vivid/vivid-touch-cap.c      |  2 +-
 7 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 45f96706edde..176b72cb143b 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -307,7 +307,7 @@ struct vivid_dev {
 	bool				dqbuf_error;
 	bool				req_validate_error;
 	bool				seq_wrap;
-	bool				time_wrap;
+	u64				time_wrap;
 	u64				time_wrap_offset;
 	unsigned			perc_dropped_buffers;
 	enum vivid_signal_mode		std_signal_mode[MAX_INPUTS];
@@ -437,6 +437,7 @@ struct vivid_dev {
 	bool				touch_cap_seq_resync;
 	u32				touch_cap_seq_start;
 	u32				touch_cap_seq_count;
+	u32				touch_cap_with_seq_wrap_count;
 	bool				touch_cap_streaming;
 	struct v4l2_fract		timeperframe_tch_cap;
 	struct v4l2_pix_format		tch_format;
@@ -524,7 +525,9 @@ struct vivid_dev {
 	struct task_struct		*kthread_sdr_cap;
 	unsigned long			jiffies_sdr_cap;
 	u32				sdr_cap_seq_offset;
+	u32				sdr_cap_seq_start;
 	u32				sdr_cap_seq_count;
+	u32				sdr_cap_with_seq_wrap_count;
 	bool				sdr_cap_seq_resync;
 
 	/* RDS generator */
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8dc50fe22972..ef2899b7df4e 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -1084,7 +1084,6 @@ static const struct v4l2_ctrl_config vivid_ctrl_display_present = {
 static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_streaming);
-	u64 rem;
 
 	switch (ctrl->id) {
 	case VIVID_CID_DQBUF_ERROR:
@@ -1122,20 +1121,10 @@ static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case VIVID_CID_TIME_WRAP:
 		dev->time_wrap = ctrl->val;
-		if (ctrl->val == 0) {
-			dev->time_wrap_offset = 0;
-			break;
-		}
-		/*
-		 * We want to set the time 16 seconds before the 32 bit tv_sec
-		 * value of struct timeval would wrap around. So first we
-		 * calculate ktime_get_ns() % ((1 << 32) * NSEC_PER_SEC), and
-		 * then we set the offset to ((1 << 32) - 16) * NSEC_PER_SEC).
-		 */
-		div64_u64_rem(ktime_get_ns(),
-			0x100000000ULL * NSEC_PER_SEC, &rem);
-		dev->time_wrap_offset =
-			(0x100000000ULL - 16) * NSEC_PER_SEC - rem;
+		if (dev->time_wrap == 1)
+			dev->time_wrap = 0xFFFFFFFFFFFFFFF0ULL * NSEC_PER_SEC;
+		if (dev->time_wrap == 2)
+			dev->time_wrap = 0xFFFFFFF0ULL * NSEC_PER_SEC;
 		break;
 	}
 	return 0;
@@ -1208,13 +1197,20 @@ static const struct v4l2_ctrl_config vivid_ctrl_seq_wrap = {
 	.step = 1,
 };
 
+static const char * const vivid_ctrl_time_wrap_strings[] = {
+	"None",
+	"64 Bit",
+	"32 Bit",
+	NULL,
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_time_wrap = {
 	.ops = &vivid_streaming_ctrl_ops,
 	.id = VIVID_CID_TIME_WRAP,
 	.name = "Wrap Timestamp",
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.max = 1,
-	.step = 1,
+	.type = V4L2_CTRL_TYPE_MENU,
+	.max = ARRAY_SIZE(vivid_ctrl_time_wrap_strings) - 2,
+	.qmenu = vivid_ctrl_time_wrap_strings,
 };
 
 
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 9da730ccfa94..78e2ae8f1bb7 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -719,8 +719,7 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 	if (!vid_cap_buf && !vbi_cap_buf && !meta_cap_buf)
 		goto update_mv;
 
-	f_time = dev->cap_frame_period * dev->vid_cap_seq_count +
-		 dev->cap_stream_start + dev->time_wrap_offset;
+	f_time = ktime_get_ns() + dev->time_wrap_offset;
 
 	if (vid_cap_buf) {
 		v4l2_ctrl_request_setup(vid_cap_buf->vb.vb2_buf.req_obj.req,
@@ -802,6 +801,7 @@ static int vivid_thread_vid_cap(void *data)
 	unsigned numerator;
 	unsigned denominator;
 	int dropped_bufs;
+	u64 rem;
 
 	dprintk(dev, 1, "Video Capture Thread Start\n");
 
@@ -812,6 +812,10 @@ static int vivid_thread_vid_cap(void *data)
 	dev->cap_seq_count = 0;
 	dev->cap_seq_resync = false;
 	dev->jiffies_vid_cap = jiffies;
+	if (dev->time_wrap) {
+		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
+		dev->time_wrap_offset = dev->time_wrap - rem;
+	}
 	dev->cap_stream_start = ktime_get_ns();
 	vivid_cap_update_frame_period(dev);
 
@@ -928,6 +932,7 @@ int vivid_start_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
 	dev->vid_cap_seq_start = dev->seq_wrap * 128;
 	dev->vbi_cap_seq_start = dev->seq_wrap * 128;
 	dev->meta_cap_seq_start = dev->seq_wrap * 128;
+	dev->time_wrap_offset = 0;
 
 	dev->kthread_vid_cap = kthread_run(vivid_thread_vid_cap, dev,
 			"%s-vid-cap", dev->v4l2_dev.name);
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index 79c57d14ac4e..8a4164a45316 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -147,6 +147,7 @@ static int vivid_thread_vid_out(void *data)
 	unsigned wait_jiffies;
 	unsigned numerator;
 	unsigned denominator;
+	u64 rem;
 
 	dprintk(dev, 1, "Video Output Thread Start\n");
 
@@ -154,12 +155,13 @@ static int vivid_thread_vid_out(void *data)
 
 	/* Resets frame counters */
 	dev->out_seq_offset = 0;
-	if (dev->seq_wrap)
-		dev->out_seq_count = 0xffffff80U;
+	dev->out_seq_count = 0;
 	dev->jiffies_vid_out = jiffies;
-	dev->vid_out_seq_start = dev->vbi_out_seq_start = 0;
-	dev->meta_out_seq_start = 0;
 	dev->out_seq_resync = false;
+	if (dev->time_wrap) {
+		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
+		dev->time_wrap_offset = dev->time_wrap - rem;
+	}
 
 	for (;;) {
 		try_to_freeze();
@@ -272,6 +274,7 @@ int vivid_start_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
 	dev->vid_out_seq_start = dev->seq_wrap * 128;
 	dev->vbi_out_seq_start = dev->seq_wrap * 128;
 	dev->meta_out_seq_start = dev->seq_wrap * 128;
+	dev->time_wrap_offset = 0;
 
 	dev->kthread_vid_out = kthread_run(vivid_thread_vid_out, dev,
 			"%s-vid-out", dev->v4l2_dev.name);
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
index 38fdfee79498..cb4e5c5a4c2a 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
@@ -52,6 +52,7 @@ static int vivid_thread_touch_cap(void *data)
 	unsigned int numerator;
 	unsigned int denominator;
 	int dropped_bufs;
+	u64 rem;
 
 	dprintk(dev, 1, "Touch Capture Thread Start\n");
 
@@ -62,6 +63,10 @@ static int vivid_thread_touch_cap(void *data)
 	dev->touch_cap_seq_count = 0;
 	dev->touch_cap_seq_resync = false;
 	dev->jiffies_touch_cap = jiffies;
+	if (dev->time_wrap) {
+		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
+		dev->time_wrap_offset = dev->time_wrap - rem;
+	}
 
 	for (;;) {
 		try_to_freeze();
@@ -102,6 +107,8 @@ static int vivid_thread_touch_cap(void *data)
 		}
 		dropped_bufs = buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
 		dev->touch_cap_seq_count = buffers_since_start + dev->touch_cap_seq_offset;
+		dev->touch_cap_with_seq_wrap_count =
+			dev->touch_cap_seq_count - dev->touch_cap_seq_start;
 
 		vivid_thread_tch_cap_tick(dev, dropped_bufs);
 
@@ -143,6 +150,9 @@ int vivid_start_generating_touch_cap(struct vivid_dev *dev)
 		return 0;
 	}
 
+	dev->touch_cap_seq_start = dev->seq_wrap * 128;
+	dev->time_wrap_offset = 0;
+
 	dev->kthread_touch_cap = kthread_run(vivid_thread_touch_cap, dev,
 					     "%s-tch-cap", dev->v4l2_dev.name);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 265db2114671..42e045329a76 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -101,7 +101,7 @@ static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
 	spin_unlock(&dev->slock);
 
 	if (sdr_cap_buf) {
-		sdr_cap_buf->vb.sequence = dev->sdr_cap_seq_count;
+		sdr_cap_buf->vb.sequence = dev->sdr_cap_with_seq_wrap_count;
 		v4l2_ctrl_request_setup(sdr_cap_buf->vb.vb2_buf.req_obj.req,
 					&dev->ctrl_hdl_sdr_cap);
 		v4l2_ctrl_request_complete(sdr_cap_buf->vb.vb2_buf.req_obj.req,
@@ -124,6 +124,7 @@ static int vivid_thread_sdr_cap(void *data)
 	unsigned long jiffies_since_start;
 	unsigned long cur_jiffies;
 	unsigned wait_jiffies;
+	u64 rem;
 
 	dprintk(dev, 1, "SDR Capture Thread Start\n");
 
@@ -131,10 +132,13 @@ static int vivid_thread_sdr_cap(void *data)
 
 	/* Resets frame counters */
 	dev->sdr_cap_seq_offset = 0;
-	if (dev->seq_wrap)
-		dev->sdr_cap_seq_offset = 0xffffff80U;
+	dev->sdr_cap_seq_count = 0;
 	dev->jiffies_sdr_cap = jiffies;
 	dev->sdr_cap_seq_resync = false;
+	if (dev->time_wrap) {
+		div64_u64_rem(ktime_get_ns(), dev->time_wrap, &rem);
+		dev->time_wrap_offset = dev->time_wrap - rem;
+	}
 
 	for (;;) {
 		try_to_freeze();
@@ -174,6 +178,7 @@ static int vivid_thread_sdr_cap(void *data)
 		}
 		dev->sdr_cap_seq_count =
 			buffers_since_start + dev->sdr_cap_seq_offset;
+		dev->sdr_cap_with_seq_wrap_count = dev->sdr_cap_seq_count - dev->sdr_cap_seq_start;
 
 		vivid_thread_sdr_cap_tick(dev);
 		mutex_unlock(&dev->mutex);
@@ -263,7 +268,10 @@ static int sdr_cap_start_streaming(struct vb2_queue *vq, unsigned count)
 	int err = 0;
 
 	dprintk(dev, 1, "%s\n", __func__);
-	dev->sdr_cap_seq_count = 0;
+
+	dev->sdr_cap_seq_start = dev->seq_wrap * 128;
+	dev->time_wrap_offset = 0;
+
 	if (dev->start_streaming_error) {
 		dev->start_streaming_error = false;
 		err = -EINVAL;
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index ebb00b128030..64e3e4cb30c2 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -262,7 +262,7 @@ void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
 
 	__s16 *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 
-	buf->vb.sequence = dev->touch_cap_seq_count;
+	buf->vb.sequence = dev->touch_cap_with_seq_wrap_count;
 	test_pattern = (buf->vb.sequence / TCH_SEQ_COUNT) % TEST_CASE_MAX;
 	test_pat_idx = buf->vb.sequence % TCH_SEQ_COUNT;
 
-- 
2.20.1

