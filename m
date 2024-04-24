Return-Path: <linux-media+bounces-10066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED228B0F55
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 18:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84F861F22C88
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 16:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BE81607A2;
	Wed, 24 Apr 2024 16:03:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23B715EFAC
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713974605; cv=none; b=IC2wXZqHQsFFhdMoJm3dlTQ8Ex1yIlepgWg1XnWSyPVsUCHhQRC03fDo6nFdbHr+2PyXDQhp+JFg7xrs+BfQN6/U3gDKmWhnM11YoqEFMLFRZVE2nHCmmLRQZTk5aCvuoNrpYNJIqxjykrdY6KH+RiKE/OLtjP1+s9n7+2PQ2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713974605; c=relaxed/simple;
	bh=RwQ7J0P0uGCe2JXsapX6Sgzcjhnqf6EyapoUkeQNSO4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=QRaPaNGFvs8MLW4Ltc42kwlk07K24Js6oSaG3R8aT9KJi7o8w1diAwXcnKJGETR8ERoLYj+SAK65RrbUWXBPK4VNwKiENN1ZYzURDs+jZNwfnqa0EvTGopFpGP1CdHgEpESxJx/r1GLcQgx7FVGer759rwfkn6vGafeHbOvzbYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB2BC113CD;
	Wed, 24 Apr 2024 16:03:23 +0000 (UTC)
Message-ID: <11f1f7fc-13ba-4be0-924c-ded60a5ca18f@xs4all.nl>
Date: Wed, 24 Apr 2024 18:03:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: vivid: make the timestamps/seq numbers reliable
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The sequence counters could skip due to bad time calculations.
In addition, the timestamps were very jittery as well.

This caused random warnings in v4l2-compliance when streaming because
the sequence numbers were not what was expected.

Adjust the code to be more precise. This affected video capture,
output, v4l-touch and sdr capture since all had the same bad
calculations.

There is one problem remaining: if CONFIG_HZ is set to 100, then with
framerates > 100 you will get dropped frames. This code really
should switch to timers to handle this more accurately.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.h |  8 ---
 .../test-drivers/vivid/vivid-kthread-cap.c    | 54 +++++++--------
 .../test-drivers/vivid/vivid-kthread-out.c    | 65 ++++++++-----------
 .../test-drivers/vivid/vivid-kthread-touch.c  | 59 ++++++++---------
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 21 +++---
 5 files changed, 87 insertions(+), 120 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index cfb8e66083f6..0f854aaddbf0 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -399,10 +399,8 @@ struct vivid_dev {
 	/* thread for generating video capture stream */
 	struct task_struct		*kthread_vid_cap;
 	unsigned long			jiffies_vid_cap;
-	u64				cap_stream_start;
 	u64				cap_frame_period;
 	u64				cap_frame_eof_offset;
-	u32				cap_seq_offset;
 	u32				cap_seq_count;
 	bool				cap_seq_resync;
 	u32				vid_cap_seq_start;
@@ -418,9 +416,6 @@ struct vivid_dev {
 	/* Touch capture */
 	struct task_struct		*kthread_touch_cap;
 	unsigned long			jiffies_touch_cap;
-	u64				touch_cap_stream_start;
-	u32				touch_cap_seq_offset;
-	bool				touch_cap_seq_resync;
 	u32				touch_cap_seq_start;
 	u32				touch_cap_seq_count;
 	u32				touch_cap_with_seq_wrap_count;
@@ -474,9 +469,7 @@ struct vivid_dev {
 	/* thread for generating video output stream */
 	struct task_struct		*kthread_vid_out;
 	unsigned long			jiffies_vid_out;
-	u32				out_seq_offset;
 	u32				out_seq_count;
-	bool				out_seq_resync;
 	u32				vid_out_seq_start;
 	u32				vid_out_seq_count;
 	bool				vid_out_streaming;
@@ -510,7 +503,6 @@ struct vivid_dev {
 	/* thread for generating SDR stream */
 	struct task_struct		*kthread_sdr_cap;
 	unsigned long			jiffies_sdr_cap;
-	u32				sdr_cap_seq_offset;
 	u32				sdr_cap_seq_start;
 	u32				sdr_cap_seq_count;
 	u32				sdr_cap_with_seq_wrap_count;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 42048727d7ff..d8bb5b1fc1ed 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -553,12 +553,11 @@ static void vivid_cap_update_frame_period(struct vivid_dev *dev)
 }

 static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
-							 int dropped_bufs)
+							 int dropped_bufs, u64 f_time)
 {
 	struct vivid_buffer *vid_cap_buf = NULL;
 	struct vivid_buffer *vbi_cap_buf = NULL;
 	struct vivid_buffer *meta_cap_buf = NULL;
-	u64 f_time = 0;

 	dprintk(dev, 1, "Video Capture Thread Tick\n");

@@ -596,8 +595,6 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 	if (!vid_cap_buf && !vbi_cap_buf && !meta_cap_buf)
 		goto update_mv;

-	f_time = ktime_get_ns() + dev->time_wrap_offset;
-
 	if (vid_cap_buf) {
 		v4l2_ctrl_request_setup(vid_cap_buf->vb.vb2_buf.req_obj.req,
 					&dev->ctrl_hdl_vid_cap);
@@ -664,12 +661,14 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 static int vivid_thread_vid_cap(void *data)
 {
 	struct vivid_dev *dev = data;
+	u64 start_time;
 	u64 numerators_since_start;
 	u64 buffers_since_start;
-	u64 next_jiffies_since_start;
+	u64 f_time;
+	u32 seq_offset = 0;
+	unsigned long next_jiffies;
 	unsigned long jiffies_since_start;
 	unsigned long cur_jiffies;
-	unsigned wait_jiffies;
 	unsigned numerator;
 	unsigned denominator;
 	int dropped_bufs;
@@ -679,13 +678,12 @@ static int vivid_thread_vid_cap(void *data)
 	set_freezable();

 	/* Resets frame counters */
-	dev->cap_seq_offset = 0;
 	dev->cap_seq_count = 0;
 	dev->cap_seq_resync = false;
 	dev->jiffies_vid_cap = jiffies;
-	dev->cap_stream_start = ktime_get_ns();
+	start_time = ktime_get_ns();
 	if (dev->time_wrap)
-		dev->time_wrap_offset = dev->time_wrap - dev->cap_stream_start;
+		dev->time_wrap_offset = dev->time_wrap - start_time;
 	else
 		dev->time_wrap_offset = 0;
 	vivid_cap_update_frame_period(dev);
@@ -703,10 +701,9 @@ static int vivid_thread_vid_cap(void *data)
 		cur_jiffies = jiffies;
 		if (dev->cap_seq_resync) {
 			dev->jiffies_vid_cap = cur_jiffies;
-			dev->cap_seq_offset = dev->cap_seq_count + 1;
+			seq_offset = dev->cap_seq_count + 1;
 			dev->cap_seq_count = 0;
-			dev->cap_stream_start += dev->cap_frame_period *
-						 dev->cap_seq_offset;
+			start_time += dev->cap_frame_period * seq_offset;
 			vivid_cap_update_frame_period(dev);
 			dev->cap_seq_resync = false;
 		}
@@ -719,9 +716,10 @@ static int vivid_thread_vid_cap(void *data)
 		/* Calculate the number of jiffies since we started streaming */
 		jiffies_since_start = cur_jiffies - dev->jiffies_vid_cap;
 		/* Get the number of buffers streamed since the start */
-		buffers_since_start = (u64)jiffies_since_start * denominator +
-				      (HZ * numerator) / 2;
+		buffers_since_start = (u64)jiffies_since_start * denominator;
 		do_div(buffers_since_start, HZ * numerator);
+		f_time = start_time + dev->time_wrap_offset +
+			buffers_since_start * dev->cap_frame_period;

 		/*
 		 * After more than 0xf0000000 (rounded down to a multiple of
@@ -731,16 +729,17 @@ static int vivid_thread_vid_cap(void *data)
 		 */
 		if (jiffies_since_start > JIFFIES_RESYNC) {
 			dev->jiffies_vid_cap = cur_jiffies;
-			dev->cap_seq_offset = buffers_since_start;
+			seq_offset = buffers_since_start;
 			buffers_since_start = 0;
 		}
-		dropped_bufs = buffers_since_start + dev->cap_seq_offset - dev->cap_seq_count;
-		dev->cap_seq_count = buffers_since_start + dev->cap_seq_offset;
+		dropped_bufs = buffers_since_start + seq_offset - dev->cap_seq_count;
+		dev->cap_seq_count = buffers_since_start + seq_offset;
 		dev->vid_cap_seq_count = dev->cap_seq_count - dev->vid_cap_seq_start;
 		dev->vbi_cap_seq_count = dev->cap_seq_count - dev->vbi_cap_seq_start;
 		dev->meta_cap_seq_count = dev->cap_seq_count - dev->meta_cap_seq_start;

-		vivid_thread_vid_cap_tick(dev, dropped_bufs);
+		vivid_thread_vid_cap_tick(dev, dropped_bufs, f_time);
+		mutex_unlock(&dev->mutex);

 		/*
 		 * Calculate the number of 'numerators' streamed since we started,
@@ -748,24 +747,15 @@ static int vivid_thread_vid_cap(void *data)
 		 */
 		numerators_since_start = ++buffers_since_start * numerator;

-		/* And the number of jiffies since we started */
-		jiffies_since_start = jiffies - dev->jiffies_vid_cap;
-
-		mutex_unlock(&dev->mutex);
-
 		/*
 		 * Calculate when that next buffer is supposed to start
 		 * in jiffies since we started streaming.
 		 */
-		next_jiffies_since_start = numerators_since_start * HZ +
-					   denominator / 2;
-		do_div(next_jiffies_since_start, denominator);
-		/* If it is in the past, then just schedule asap */
-		if (next_jiffies_since_start < jiffies_since_start)
-			next_jiffies_since_start = jiffies_since_start;
-
-		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
+		next_jiffies = numerators_since_start * HZ + denominator - 1;
+		do_div(next_jiffies, denominator);
+		next_jiffies += dev->jiffies_vid_cap;
+
+		while (time_is_after_jiffies(next_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index fac6208b51da..536688c7f503 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -41,7 +41,7 @@
 #include "vivid-kthread-out.h"
 #include "vivid-meta-out.h"

-static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
+static void vivid_thread_vid_out_tick(struct vivid_dev *dev, u64 f_time)
 {
 	struct vivid_buffer *vid_out_buf = NULL;
 	struct vivid_buffer *vbi_out_buf = NULL;
@@ -95,8 +95,7 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
 			 */
 			vid_out_buf->vb.sequence /= 2;
 		}
-		vid_out_buf->vb.vb2_buf.timestamp =
-			ktime_get_ns() + dev->time_wrap_offset;
+		vid_out_buf->vb.vb2_buf.timestamp = f_time;
 		vb2_buffer_done(&vid_out_buf->vb.vb2_buf, dev->dqbuf_error ?
 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		dprintk(dev, 2, "vid_out buffer %d done\n",
@@ -112,8 +111,7 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
 			vivid_sliced_vbi_out_process(dev, vbi_out_buf);

 		vbi_out_buf->vb.sequence = dev->vbi_out_seq_count;
-		vbi_out_buf->vb.vb2_buf.timestamp =
-			ktime_get_ns() + dev->time_wrap_offset;
+		vbi_out_buf->vb.vb2_buf.timestamp = f_time;
 		vb2_buffer_done(&vbi_out_buf->vb.vb2_buf, dev->dqbuf_error ?
 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		dprintk(dev, 2, "vbi_out buffer %d done\n",
@@ -126,8 +124,7 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
 					   &dev->ctrl_hdl_meta_out);
 		vivid_meta_out_process(dev, meta_out_buf);
 		meta_out_buf->vb.sequence = dev->meta_out_seq_count;
-		meta_out_buf->vb.vb2_buf.timestamp =
-			ktime_get_ns() + dev->time_wrap_offset;
+		meta_out_buf->vb.vb2_buf.timestamp = f_time;
 		vb2_buffer_done(&meta_out_buf->vb.vb2_buf, dev->dqbuf_error ?
 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		dprintk(dev, 2, "meta_out buffer %d done\n",
@@ -140,12 +137,14 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
 static int vivid_thread_vid_out(void *data)
 {
 	struct vivid_dev *dev = data;
+	u64 start_time;
 	u64 numerators_since_start;
 	u64 buffers_since_start;
-	u64 next_jiffies_since_start;
+	u64 f_time, f_period;
+	u32 seq_offset = 0;
+	unsigned long next_jiffies;
 	unsigned long jiffies_since_start;
 	unsigned long cur_jiffies;
-	unsigned wait_jiffies;
 	unsigned numerator;
 	unsigned denominator;

@@ -154,15 +153,19 @@ static int vivid_thread_vid_out(void *data)
 	set_freezable();

 	/* Resets frame counters */
-	dev->out_seq_offset = 0;
 	dev->out_seq_count = 0;
 	dev->jiffies_vid_out = jiffies;
-	dev->out_seq_resync = false;
+	start_time = ktime_get_ns();
 	if (dev->time_wrap)
-		dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
+		dev->time_wrap_offset = dev->time_wrap - start_time;
 	else
 		dev->time_wrap_offset = 0;

+	f_period = (u64)dev->timeperframe_vid_out.numerator * 1000000000;
+	if (WARN_ON(dev->timeperframe_vid_out.denominator == 0))
+		dev->timeperframe_vid_out.denominator = 1;
+	do_div(f_period, dev->timeperframe_vid_out.denominator);
+
 	for (;;) {
 		try_to_freeze();
 		if (kthread_should_stop())
@@ -174,12 +177,6 @@ static int vivid_thread_vid_out(void *data)
 		}

 		cur_jiffies = jiffies;
-		if (dev->out_seq_resync) {
-			dev->jiffies_vid_out = cur_jiffies;
-			dev->out_seq_offset = dev->out_seq_count + 1;
-			dev->out_seq_count = 0;
-			dev->out_seq_resync = false;
-		}
 		numerator = dev->timeperframe_vid_out.numerator;
 		denominator = dev->timeperframe_vid_out.denominator;

@@ -189,9 +186,10 @@ static int vivid_thread_vid_out(void *data)
 		/* Calculate the number of jiffies since we started streaming */
 		jiffies_since_start = cur_jiffies - dev->jiffies_vid_out;
 		/* Get the number of buffers streamed since the start */
-		buffers_since_start = (u64)jiffies_since_start * denominator +
-				      (HZ * numerator) / 2;
+		buffers_since_start = (u64)jiffies_since_start * denominator;
 		do_div(buffers_since_start, HZ * numerator);
+		f_time = start_time + dev->time_wrap_offset +
+			buffers_since_start * f_period;

 		/*
 		 * After more than 0xf0000000 (rounded down to a multiple of
@@ -201,41 +199,32 @@ static int vivid_thread_vid_out(void *data)
 		 */
 		if (jiffies_since_start > JIFFIES_RESYNC) {
 			dev->jiffies_vid_out = cur_jiffies;
-			dev->out_seq_offset = buffers_since_start;
+			seq_offset = buffers_since_start;
 			buffers_since_start = 0;
 		}
-		dev->out_seq_count = buffers_since_start + dev->out_seq_offset;
+		dev->out_seq_count = buffers_since_start + seq_offset;
 		dev->vid_out_seq_count = dev->out_seq_count - dev->vid_out_seq_start;
 		dev->vbi_out_seq_count = dev->out_seq_count - dev->vbi_out_seq_start;
 		dev->meta_out_seq_count = dev->out_seq_count - dev->meta_out_seq_start;

-		vivid_thread_vid_out_tick(dev);
+		vivid_thread_vid_out_tick(dev, f_time);
 		mutex_unlock(&dev->mutex);

 		/*
 		 * Calculate the number of 'numerators' streamed since we started,
 		 * not including the current buffer.
 		 */
-		numerators_since_start = buffers_since_start * numerator;
+		numerators_since_start = ++buffers_since_start * numerator;

-		/* And the number of jiffies since we started */
-		jiffies_since_start = jiffies - dev->jiffies_vid_out;
-
-		/* Increase by the 'numerator' of one buffer */
-		numerators_since_start += numerator;
 		/*
 		 * Calculate when that next buffer is supposed to start
 		 * in jiffies since we started streaming.
 		 */
-		next_jiffies_since_start = numerators_since_start * HZ +
-					   denominator / 2;
-		do_div(next_jiffies_since_start, denominator);
-		/* If it is in the past, then just schedule asap */
-		if (next_jiffies_since_start < jiffies_since_start)
-			next_jiffies_since_start = jiffies_since_start;
-
-		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
+		next_jiffies = numerators_since_start * HZ + denominator - 1;
+		do_div(next_jiffies, denominator);
+		next_jiffies += dev->jiffies_vid_out;
+
+		while (time_is_after_jiffies(next_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
index fa711ee36a3f..cd0c3938b6a1 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
@@ -11,7 +11,7 @@
 #include "vivid-touch-cap.h"

 static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_dev *dev,
-							 int dropped_bufs)
+							 int dropped_bufs, u64 f_time)
 {
 	struct vivid_buffer *tch_cap_buf = NULL;

@@ -36,7 +36,7 @@ static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_dev *dev,
 		dprintk(dev, 2, "touch_cap buffer %d done\n",
 			tch_cap_buf->vb.vb2_buf.index);

-		tch_cap_buf->vb.vb2_buf.timestamp = ktime_get_ns() + dev->time_wrap_offset;
+		tch_cap_buf->vb.vb2_buf.timestamp = f_time;
 	}
 	dev->dqbuf_error = false;
 }
@@ -44,12 +44,14 @@ static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_dev *dev,
 static int vivid_thread_touch_cap(void *data)
 {
 	struct vivid_dev *dev = data;
+	u64 start_time;
 	u64 numerators_since_start;
 	u64 buffers_since_start;
-	u64 next_jiffies_since_start;
+	u64 f_time, f_period;
+	u32 seq_offset = 0;
+	unsigned long next_jiffies;
 	unsigned long jiffies_since_start;
 	unsigned long cur_jiffies;
-	unsigned int wait_jiffies;
 	unsigned int numerator;
 	unsigned int denominator;
 	int dropped_bufs;
@@ -59,15 +61,19 @@ static int vivid_thread_touch_cap(void *data)
 	set_freezable();

 	/* Resets frame counters */
-	dev->touch_cap_seq_offset = 0;
 	dev->touch_cap_seq_count = 0;
-	dev->touch_cap_seq_resync = false;
 	dev->jiffies_touch_cap = jiffies;
+	start_time = ktime_get_ns();
 	if (dev->time_wrap)
-		dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
+		dev->time_wrap_offset = dev->time_wrap - start_time;
 	else
 		dev->time_wrap_offset = 0;

+	f_period = (u64)dev->timeperframe_tch_cap.numerator * 1000000000;
+	if (WARN_ON(dev->timeperframe_tch_cap.denominator == 0))
+		dev->timeperframe_tch_cap.denominator = 1;
+	do_div(f_period, dev->timeperframe_tch_cap.denominator);
+
 	for (;;) {
 		try_to_freeze();
 		if (kthread_should_stop())
@@ -78,21 +84,16 @@ static int vivid_thread_touch_cap(void *data)
 			continue;
 		}
 		cur_jiffies = jiffies;
-		if (dev->touch_cap_seq_resync) {
-			dev->jiffies_touch_cap = cur_jiffies;
-			dev->touch_cap_seq_offset = dev->touch_cap_seq_count + 1;
-			dev->touch_cap_seq_count = 0;
-			dev->cap_seq_resync = false;
-		}
 		denominator = dev->timeperframe_tch_cap.denominator;
 		numerator = dev->timeperframe_tch_cap.numerator;

 		/* Calculate the number of jiffies since we started streaming */
 		jiffies_since_start = cur_jiffies - dev->jiffies_touch_cap;
 		/* Get the number of buffers streamed since the start */
-		buffers_since_start = (u64)jiffies_since_start * denominator +
-				      (HZ * numerator) / 2;
+		buffers_since_start = (u64)jiffies_since_start * denominator;
 		do_div(buffers_since_start, HZ * numerator);
+		f_time = start_time + dev->time_wrap_offset +
+			buffers_since_start * f_period;

 		/*
 		 * After more than 0xf0000000 (rounded down to a multiple of
@@ -102,15 +103,16 @@ static int vivid_thread_touch_cap(void *data)
 		 */
 		if (jiffies_since_start > JIFFIES_RESYNC) {
 			dev->jiffies_touch_cap = cur_jiffies;
-			dev->cap_seq_offset = buffers_since_start;
+			seq_offset = buffers_since_start;
 			buffers_since_start = 0;
 		}
-		dropped_bufs = buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
-		dev->touch_cap_seq_count = buffers_since_start + dev->touch_cap_seq_offset;
+		dropped_bufs = buffers_since_start + seq_offset - dev->touch_cap_seq_count;
+		dev->touch_cap_seq_count = buffers_since_start + seq_offset;
 		dev->touch_cap_with_seq_wrap_count =
 			dev->touch_cap_seq_count - dev->touch_cap_seq_start;

-		vivid_thread_tch_cap_tick(dev, dropped_bufs);
+		vivid_thread_tch_cap_tick(dev, dropped_bufs, f_time);
+		mutex_unlock(&dev->mutex);

 		/*
 		 * Calculate the number of 'numerators' streamed
@@ -118,24 +120,15 @@ static int vivid_thread_touch_cap(void *data)
 		 */
 		numerators_since_start = ++buffers_since_start * numerator;

-		/* And the number of jiffies since we started */
-		jiffies_since_start = jiffies - dev->jiffies_touch_cap;
-
-		mutex_unlock(&dev->mutex);
-
 		/*
 		 * Calculate when that next buffer is supposed to start
 		 * in jiffies since we started streaming.
 		 */
-		next_jiffies_since_start = numerators_since_start * HZ +
-					   denominator / 2;
-		do_div(next_jiffies_since_start, denominator);
-		/* If it is in the past, then just schedule asap */
-		if (next_jiffies_since_start < jiffies_since_start)
-			next_jiffies_since_start = jiffies_since_start;
-
-		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
+		next_jiffies = numerators_since_start * HZ + denominator - 1;
+		do_div(next_jiffies, denominator);
+		next_jiffies += dev->jiffies_touch_cap;
+
+		while (time_is_after_jiffies(next_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index a81f26b76988..e0d4deb4b1a5 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -82,7 +82,7 @@ static const struct v4l2_frequency_band bands_fm[] = {
 	},
 };

-static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
+static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev, u64 f_time)
 {
 	struct vivid_buffer *sdr_cap_buf = NULL;

@@ -108,8 +108,7 @@ static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
 		v4l2_ctrl_request_complete(sdr_cap_buf->vb.vb2_buf.req_obj.req,
 					   &dev->ctrl_hdl_sdr_cap);
 		vivid_sdr_cap_process(dev, sdr_cap_buf);
-		sdr_cap_buf->vb.vb2_buf.timestamp =
-			ktime_get_ns() + dev->time_wrap_offset;
+		sdr_cap_buf->vb.vb2_buf.timestamp = f_time;
 		vb2_buffer_done(&sdr_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		dev->dqbuf_error = false;
@@ -119,9 +118,12 @@ static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
 static int vivid_thread_sdr_cap(void *data)
 {
 	struct vivid_dev *dev = data;
+	u64 start_time;
+	u64 f_time;
 	u64 samples_since_start;
 	u64 buffers_since_start;
 	u64 next_jiffies_since_start;
+	u32 seq_offset = 0;
 	unsigned long jiffies_since_start;
 	unsigned long cur_jiffies;
 	unsigned wait_jiffies;
@@ -131,12 +133,12 @@ static int vivid_thread_sdr_cap(void *data)
 	set_freezable();

 	/* Resets frame counters */
-	dev->sdr_cap_seq_offset = 0;
 	dev->sdr_cap_seq_count = 0;
 	dev->jiffies_sdr_cap = jiffies;
 	dev->sdr_cap_seq_resync = false;
+	start_time = ktime_get_ns();
 	if (dev->time_wrap)
-		dev->time_wrap_offset = dev->time_wrap - ktime_get_ns();
+		dev->time_wrap_offset = dev->time_wrap - start_time;
 	else
 		dev->time_wrap_offset = 0;

@@ -153,7 +155,7 @@ static int vivid_thread_sdr_cap(void *data)
 		cur_jiffies = jiffies;
 		if (dev->sdr_cap_seq_resync) {
 			dev->jiffies_sdr_cap = cur_jiffies;
-			dev->sdr_cap_seq_offset = dev->sdr_cap_seq_count + 1;
+			seq_offset = dev->sdr_cap_seq_count + 1;
 			dev->sdr_cap_seq_count = 0;
 			dev->sdr_cap_seq_resync = false;
 		}
@@ -173,14 +175,15 @@ static int vivid_thread_sdr_cap(void *data)
 		 */
 		if (jiffies_since_start > JIFFIES_RESYNC) {
 			dev->jiffies_sdr_cap = cur_jiffies;
-			dev->sdr_cap_seq_offset = buffers_since_start;
+			seq_offset = buffers_since_start;
 			buffers_since_start = 0;
 		}
 		dev->sdr_cap_seq_count =
-			buffers_since_start + dev->sdr_cap_seq_offset;
+			buffers_since_start + seq_offset;
 		dev->sdr_cap_with_seq_wrap_count = dev->sdr_cap_seq_count - dev->sdr_cap_seq_start;
+		f_time = start_time + dev->time_wrap_offset;

-		vivid_thread_sdr_cap_tick(dev);
+		vivid_thread_sdr_cap_tick(dev, f_time);
 		mutex_unlock(&dev->mutex);

 		/*
-- 
2.40.1


