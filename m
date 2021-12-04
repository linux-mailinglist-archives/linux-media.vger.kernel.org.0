Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A667B4682EB
	for <lists+linux-media@lfdr.de>; Sat,  4 Dec 2021 07:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbhLDGRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 01:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbhLDGR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Dec 2021 01:17:29 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC84DC061751
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 22:14:04 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id r5so5206996pgi.6
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 22:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXKJ23XG6HZo2v4n63r8SfU6oiv9XBoodVVTDkjsICE=;
        b=UQ5TEnaEwpvvAOB3uRYoQqgRLa/QpJN7ZIPTotbiuwmsUgn4OIQjTIRdchgEpCRlve
         i1xHwMh1ZaCGdyb8Kx4nUNrhwKSG8pBbiBexD+ZnoGyGTbRPE/JQVz65/8iZw29W8aRA
         tzS4tEF7fGN/lV9iikxLmqmINtpyXn4LHD5dB1wk+wuQmIO677/6pZt93qofxd/lASyY
         IfMmr+pHm1cBFTpWI8ocHZN54sTNmjN64BMSeS/QIKILqXhlrymwxCd+m4h/rmqby6MH
         BSLx9BhUP/MTlN59cLjwmqdY2ysZx0fNpURQkPmdQUrb3s0i9fB0lWYJxCCFJxeElNpP
         cUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXKJ23XG6HZo2v4n63r8SfU6oiv9XBoodVVTDkjsICE=;
        b=XQYBhPVqhX9jOxs9DSHZxo0svco+dkO5rmF1GjJ5W6T+KbUP8rojo0WaOf3qxTPuxV
         kI1OnX+Z2virXNNJM8cRIJj/W9DSRp/SRyfMVENp6rLk4zYcyy1UwcQvMFQ5tyLOYetG
         n/hPe/4hIQbeq8FhQrTEaMi0xNOvPTCcgWqZ2w0KkbOzYlG9Ce8MdpKrNcgRN7CpC9BW
         cIlrB+7tr0wO2rXGkNGluf+NcC0ZJx2L+kbKSKVaI9A8wCe0pq3g/hhGzX9WGV2Kpa/Q
         irznk4D9W9YiQjKURHpzmb0sUFTcKga56rF58wXGWF28eEwncIbeC4AFlSraVQsdjTX9
         mnTw==
X-Gm-Message-State: AOAM532rtJ0OEyMgR2NZ+Fg4wDklTmyrGI1a1w5CaWV/21ujkUA1v8TM
        hKRpld1/woyJpVDUDUIXLT6nZ11dPODXFcE6
X-Google-Smtp-Source: ABdhPJwKjoyTn4YLGLNH2wB/uLwtgs16WXuovQmCEH4H9UD960v6HAB0Ky/oWk219xhiWE81NwQkew==
X-Received: by 2002:a63:7e42:: with SMTP id o2mr8455971pgn.296.1638598444343;
        Fri, 03 Dec 2021 22:14:04 -0800 (PST)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id m12sm5663704pfk.27.2021.12.03.22.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 22:14:03 -0800 (PST)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2] media: vivid: fix timestamp and sequence wrapping
Date:   Fri,  3 Dec 2021 22:13:51 -0800
Message-Id: <20211204061351.53611-1-deborahbrouwer3563@gmail.com>
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
index 8dc50fe22972..466f9e22083d 100644
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
+			dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
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

