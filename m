Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B30646C96A
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 01:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhLHAoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 19:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhLHAoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 19:44:25 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE8EC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 16:40:54 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id o14so421368plg.5
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 16:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AATQQH0+rpWo4fZkNKnhqu4NVviJRRg3zcMsP/nyO8Q=;
        b=b0mm6SkGjI0N8ZUQDzPYph+Y2QLZR3lfM/LwzlbvObMJJuC/z1LXhNRCoJ/237qn22
         wTd/8siYzxx+84M3cDsTrpsr7nUAw4OjYbcdwP5jOogKv98bAfgDe9HT1li4xFIqyCzR
         4gxmqzCZNGvZtMPBdJ0eBgvfSck6JlxCzkat6prz4LwhFQTY8jqWeJ+OsEiEtvqJ19tT
         /XiRSiSIj2JtD/3O5Y9lnQpEqZTFm0dLMkEfKpmZ3knW/BLUesiybcCKbA+cIh4146/V
         0FB2UgN4FQ9F2Z4Wm7G3SQiErPy/QoAMNEkb/NfgmwFWLGrJrAd4TKX4Y9vKi7mRnaqo
         0ZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AATQQH0+rpWo4fZkNKnhqu4NVviJRRg3zcMsP/nyO8Q=;
        b=aSGsF+ACG+5Mj9Cu4SpaZEP+x9v2gsFfiL8JzjKMPZ6AL1ivmglE9IDJYQE50YM0rf
         PgSFZxKOPkta1QaANgb08vhy7oBjp5U5XuBEdd4nFSpbas3N3xUwS9Jeqd9S5Q3ACy9z
         wS73LWGfu2emIrkUMHWQqxMkjA7wYAOCJIJpPZwSJ7SNAI7SCQnPnvRiCPRmQN1iIAUm
         ZPP1uZh9Cx35iPZCaDLfJz7Zi1GPxuM8eHHMzxdxEZEiHuy/AOO0Rkwkykd3ak7G1ott
         zEMtPw8m4GOAgR0RAhoLjtzVldOM/N+t28Gz/RpQH1Mx9gesFVTJTMRjIP8x9bzQUOoS
         wgrw==
X-Gm-Message-State: AOAM531Lc/quAv9bJAQxpSs3Gtoc5U1lrrWzr2E6hTq+9X8zWCGk2k1i
        AludiohE8cbeUfewELkrP1aWWSbyE4hwBSdu
X-Google-Smtp-Source: ABdhPJxaSjRosxWTaXFEN5UwLO143qwhKWymogMc+xkTJdQgNSbyAw76N24y2b1J6vUhMGNWoLgh6w==
X-Received: by 2002:a17:90a:be0f:: with SMTP id a15mr2985785pjs.243.1638924053847;
        Tue, 07 Dec 2021 16:40:53 -0800 (PST)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id g20sm1016378pfj.12.2021.12.07.16.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 16:40:53 -0800 (PST)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3] media: vivid: fix timestamp and sequence wrapping
Date:   Tue,  7 Dec 2021 16:40:42 -0800
Message-Id: <20211208004042.13939-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error injection controls that test wrap-around sequence and timestamp
counters were partially broken. Add a menu option for 64 or 32 bit signed
timestamp wrapping. Prevent the timestamp from wrapping around before the
device can be tested.  Remove the sequence count from the timestamp
calculation so that sequence wrapping does not interfere with the
timestamp.  Add consistent time and sequence wrapping to sdr and touch
devices.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
Changes since v2:
- fix overflow warning for 32 bit systems by adding ULL to
  constant before multiplying by NSEC_PER_SEC

Changes since v1:
- wrap timestamp at signed rather than unsigned values
- simplify time_wrap_offset calculation

How I set the controls:
v4l2-ctl -d <dev> -c wrap_sequence_number=1
v4l2-ctl -d <dev> -c wrap_timestamp=1
v4l2-ctl -d <dev> -c wrap_timestamp=2

How I tested:
v4l2-ctl -d <dev> --stream-mmap --verbose 
v4l2-ctl -d <dev> --stream-out-mmap --verbose 
v4l2-ctl-32 -d <dev> --stream-mmap --verbose
v4l2-ctl-32 -d <dev> --stream-out-mmap --verbose

Devices I tested:c
vivid-000-vid-cap, inputs: webcam, TV, S-Video, HDMI
vivid-000-vid-out, outputs: S-Video, HDMI
vivid-000-touch-cap
vivid-000-sdr-cap
vivid-000-vbi-out

 drivers/media/test-drivers/vivid/vivid-core.h |  5 ++-
 .../media/test-drivers/vivid/vivid-ctrls.c    | 32 ++++++++-----------
 .../test-drivers/vivid/vivid-kthread-cap.c    |  7 ++--
 .../test-drivers/vivid/vivid-kthread-out.c    |  9 +++---
 .../test-drivers/vivid/vivid-kthread-touch.c  |  7 ++++
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 12 ++++---
 .../test-drivers/vivid/vivid-touch-cap.c      |  2 +-
 7 files changed, 44 insertions(+), 30 deletions(-)

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
index 8dc50fe22972..e7516dc1227b 100644
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
+			dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16ULL;
+		else if (dev->time_wrap == 2)
+			dev->time_wrap = ((1ULL << 31) - 16) * NSEC_PER_SEC;
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
index 9da730ccfa94..6baa046c1ae3 100644
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
@@ -813,6 +812,10 @@ static int vivid_thread_vid_cap(void *data)
 	dev->cap_seq_resync = false;
 	dev->jiffies_vid_cap = jiffies;
 	dev->cap_stream_start = ktime_get_ns();
+	if (dev->time_wrap)
+		dev->time_wrap_offset = dev->time_wrap - dev->cap_stream_start;
+	else
+		dev->time_wrap_offset = 0;
 	vivid_cap_update_frame_period(dev);
 
 	for (;;) {
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index 79c57d14ac4e..b6d43169e970 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -154,12 +154,13 @@ static int vivid_thread_vid_out(void *data)
 
 	/* Resets frame counters */
 	dev->out_seq_offset = 0;
-	if (dev->seq_wrap)
-		dev->out_seq_count = 0xffffff80U;
+	dev->out_seq_count = 0;
 	dev->jiffies_vid_out = jiffies;
-	dev->vid_out_seq_start = dev->vbi_out_seq_start = 0;
-	dev->meta_out_seq_start = 0;
 	dev->out_seq_resync = false;
+	if (dev->time_wrap)
+		dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
+	else
+		dev->time_wrap_offset = 0;
 
 	for (;;) {
 		try_to_freeze();
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
index 38fdfee79498..f065faae4988 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
@@ -62,6 +62,10 @@ static int vivid_thread_touch_cap(void *data)
 	dev->touch_cap_seq_count = 0;
 	dev->touch_cap_seq_resync = false;
 	dev->jiffies_touch_cap = jiffies;
+	if (dev->time_wrap)
+		dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
+	else
+		dev->time_wrap_offset = 0;
 
 	for (;;) {
 		try_to_freeze();
@@ -102,6 +106,8 @@ static int vivid_thread_touch_cap(void *data)
 		}
 		dropped_bufs = buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
 		dev->touch_cap_seq_count = buffers_since_start + dev->touch_cap_seq_offset;
+		dev->touch_cap_with_seq_wrap_count =
+			dev->touch_cap_seq_count - dev->touch_cap_seq_start;
 
 		vivid_thread_tch_cap_tick(dev, dropped_bufs);
 
@@ -143,6 +149,7 @@ int vivid_start_generating_touch_cap(struct vivid_dev *dev)
 		return 0;
 	}
 
+	dev->touch_cap_seq_start = dev->seq_wrap * 128;
 	dev->kthread_touch_cap = kthread_run(vivid_thread_touch_cap, dev,
 					     "%s-tch-cap", dev->v4l2_dev.name);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 265db2114671..59fd508e27c8 100644
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
@@ -131,10 +131,13 @@ static int vivid_thread_sdr_cap(void *data)
 
 	/* Resets frame counters */
 	dev->sdr_cap_seq_offset = 0;
-	if (dev->seq_wrap)
-		dev->sdr_cap_seq_offset = 0xffffff80U;
+	dev->sdr_cap_seq_count = 0;
 	dev->jiffies_sdr_cap = jiffies;
 	dev->sdr_cap_seq_resync = false;
+	if (dev->time_wrap)
+		dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
+	else
+		dev->time_wrap_offset = 0;
 
 	for (;;) {
 		try_to_freeze();
@@ -174,6 +177,7 @@ static int vivid_thread_sdr_cap(void *data)
 		}
 		dev->sdr_cap_seq_count =
 			buffers_since_start + dev->sdr_cap_seq_offset;
+		dev->sdr_cap_with_seq_wrap_count = dev->sdr_cap_seq_count - dev->sdr_cap_seq_start;
 
 		vivid_thread_sdr_cap_tick(dev);
 		mutex_unlock(&dev->mutex);
@@ -263,7 +267,7 @@ static int sdr_cap_start_streaming(struct vb2_queue *vq, unsigned count)
 	int err = 0;
 
 	dprintk(dev, 1, "%s\n", __func__);
-	dev->sdr_cap_seq_count = 0;
+	dev->sdr_cap_seq_start = dev->seq_wrap * 128;
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

