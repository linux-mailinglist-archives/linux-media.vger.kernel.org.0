Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E6B2C2B8D
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389848AbgKXPi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389824AbgKXPix (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:38:53 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CACC0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:38:52 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id e7so5234566wrv.6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+3mkwmfTm2kr3b7c7d8P0yIXNEx9jD+OdvJJFJW+zFk=;
        b=dQ9L9ZXfFLezuzODqfyIvieZSIxqvT3n3Mvp/8WKA8otTlP/AyFHRv8qQZeG4XY/wi
         pqt9SFPvatEBcmWl1qaQF1RGMpM7ciEhWIGv246TwN8w5wkStnTf7QAwVYvVc+aVh+TH
         5UzgHpfHEi2dxqjkS5cYLdB5elWZiLM54Bfj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+3mkwmfTm2kr3b7c7d8P0yIXNEx9jD+OdvJJFJW+zFk=;
        b=eR0Ac1HbD15U25CGJueUyTpHJFPLwQ3T6JdzFGUClcTvY1kzHj20K+WxUE+xre/M/m
         3t0yoCGXatxZIVsloe/IZPxNLlGnASJKh0l+StkgMe4UQ5Mk84zrGtLFNSjHSRkydLqq
         IwYJcYMXdFc3UcnuaWOVeDgkDnmKhAqY79CJoBrX7qHU0lUcTIe6bpEluT0cMTNRCO9s
         opJtk2WFH1/wsmsU2JPJ1ye1zzp0FLPZUWba2qviolAAsqGZ8YgNL7+mXkCH/U2LydwE
         bjg3CagJRxuW+bMqNIELV0fPaoXBQ1DA1ra11aU7hIWxvxFYRMieddm6QgcQQX9SE+AM
         OYag==
X-Gm-Message-State: AOAM530ofrnOzIgnOPhC3XwRu2BrE0QmDCXh01d8UxmEaMH0UAQwilCd
        sBe0OxsghdlPcwexYJPvSBIbzQ==
X-Google-Smtp-Source: ABdhPJwAKgSjs105Q9o2qftTAAnLbbDN93Uyn630ByGqWNQWfRRNDWCrKExPjmulwnz61GEm5Mn7FA==
X-Received: by 2002:a05:6000:1006:: with SMTP id a6mr5732120wrx.367.1606232331638;
        Tue, 24 Nov 2020 07:38:51 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 25sm5814752wmk.19.2020.11.24.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:38:51 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Cc:     Shik Chen <shik@chromium.org>
Subject: [PATCH 6/6] TEST-ONLY: media: uvcvideo: Add statistics for measuring performance
Date:   Tue, 24 Nov 2020 16:38:45 +0100
Message-Id: <20201124153845.132207-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201124153845.132207-1-ribalda@chromium.org>
References: <20201124153845.132207-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shik Chen <shik@chromium.org>

Majorly based on [1], with the following tweaks:

* Use div_u64 for u64 divisions
* Calculate standard deviation
* Fix an uninitialized |min| field for header
* Apply clang-format

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?h=uvc/async-ml&id=cebbd1b629bbe5f856ec5dc7591478c003f5a944

Signed-off-by: Shik Chen <shik@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 163 +++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  21 ++++
 2 files changed, 181 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9e90b261428a..d3a515015003 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -906,12 +906,61 @@ static void uvc_video_stats_update(struct uvc_streaming *stream)
 	memset(&stream->stats.frame, 0, sizeof(stream->stats.frame));
 }
 
+size_t uvc_video_dump_time_stats(char *buf, size_t size,
+				 struct uvc_stats_time *stat, const char *pfx)
+{
+	unsigned int avg = 0;
+	unsigned int std = 0;
+
+	if (stat->qty) {
+		avg = div_u64(stat->duration, stat->qty);
+		std = int_sqrt64(div_u64(stat->duration2, stat->qty) -
+				 avg * avg);
+	}
+
+	/* Stat durations are in nanoseconds, we present in micro-seconds */
+	return scnprintf(
+		buf, size,
+		"%s: %llu/%u uS/qty: %u.%03u avg %u.%03u std %u.%03u min %u.%03u max (uS)\n",
+		pfx, div_u64(stat->duration, 1000), stat->qty, avg / 1000,
+		avg % 1000, std / 1000, std % 1000, stat->min / 1000,
+		stat->min % 1000, stat->max / 1000, stat->max % 1000);
+}
+
+size_t uvc_video_dump_speed(char *buf, size_t size, const char *pfx, u64 bytes,
+			    u64 milliseconds)
+{
+	unsigned int rate = 0;
+	bool gbit = false;
+
+	if (milliseconds)
+		rate = div_u64(bytes * 8, milliseconds);
+
+	if (rate >= 1000000) {
+		gbit = true;
+		rate /= 1000;
+	}
+
+	/*
+	 * bits/milliseconds == kilobits/seconds,
+	 * presented here as Mbits/s (or Gbit/s) with 3 decimal places
+	 */
+	return scnprintf(buf, size, "%s: %d.%03d %sbits/s\n", pfx, rate / 1000,
+			 rate % 1000, gbit ? "G" : "M");
+}
+
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size)
 {
+	u64 bytes = stream->stats.stream.bytes; /* Single sample */
+	unsigned int empty_ratio = 0;
 	unsigned int scr_sof_freq;
 	unsigned int duration;
+	unsigned int fps = 0;
 	size_t count = 0;
+	u64 cpu = 0;
+	u64 cpu_q = 0;
+	u32 cpu_r = 0;
 
 	/* Compute the SCR.SOF frequency estimate. At the nominal 1kHz SOF
 	 * frequency this will not overflow before more than 1h.
@@ -924,12 +973,19 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 	else
 		scr_sof_freq = 0;
 
+	if (stream->stats.stream.nb_packets)
+		empty_ratio = stream->stats.stream.nb_empty * 100 /
+			      stream->stats.stream.nb_packets;
+
 	count += scnprintf(buf + count, size - count,
-			   "frames:  %u\npackets: %u\nempty:   %u\n"
-			   "errors:  %u\ninvalid: %u\n",
+			   "frames:  %u\n"
+			   "packets: %u\n"
+			   "empty:   %u (%u %%)\n"
+			   "errors:  %u\n"
+			   "invalid: %u\n",
 			   stream->stats.stream.nb_frames,
 			   stream->stats.stream.nb_packets,
-			   stream->stats.stream.nb_empty,
+			   stream->stats.stream.nb_empty, empty_ratio,
 			   stream->stats.stream.nb_errors,
 			   stream->stats.stream.nb_invalid);
 	count += scnprintf(buf + count, size - count,
@@ -946,6 +1002,55 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			   stream->stats.stream.min_sof,
 			   stream->stats.stream.max_sof,
 			   scr_sof_freq / 1000, scr_sof_freq % 1000);
+	count += scnprintf(buf + count, size - count,
+			   "bytes %lld : duration %d\n", bytes, duration);
+
+	if (duration != 0) {
+		/* Duration is in milliseconds, * 100 to gain 2 dp precision */
+		fps = stream->stats.stream.nb_frames * 1000 * 100 / duration;
+		/* CPU usage as a % with 6 decimal places */
+		cpu = div_u64(stream->stats.urbstat.decode.duration, duration) *
+		      100;
+	}
+
+	count += scnprintf(buf + count, size - count, "FPS: %u.%02u\n",
+			   fps / 100, fps % 100);
+
+	/* Processing Times */
+
+	count += uvc_video_dump_time_stats(buf + count, size - count,
+					   &stream->stats.urbstat.urb, "URB");
+	count += uvc_video_dump_time_stats(buf + count, size - count,
+					   &stream->stats.urbstat.header,
+					   "header");
+	count += uvc_video_dump_time_stats(buf + count, size - count,
+					   &stream->stats.urbstat.latency,
+					   "latency");
+	count += uvc_video_dump_time_stats(buf + count, size - count,
+					   &stream->stats.urbstat.decode,
+					   "decode");
+
+	/* Processing Speeds */
+
+	/* This should be representative of the memory bus / cpu speed */
+	count += uvc_video_dump_speed(
+		buf + count, size - count, "raw decode speed", bytes,
+		div_u64(stream->stats.urbstat.decode.duration, 1000000));
+
+	/* Raw bus speed - scheduling latencies */
+	count += uvc_video_dump_speed(
+		buf + count, size - count, "raw URB handling speed", bytes,
+		div_u64(stream->stats.urbstat.urb.duration, 1000000));
+
+	/* Throughput against wall clock time, stream duration is in millis*/
+	count += uvc_video_dump_speed(buf + count, size - count, "throughput",
+				      bytes, duration);
+
+	cpu_q = div_u64_rem(cpu, 1000000, &cpu_r);
+
+	/* Determine the 'CPU Usage' of our URB processing */
+	count += scnprintf(buf + count, size - count,
+			   "URB decode CPU usage %llu.%06u %%\n", cpu_q, cpu_r);
 
 	return count;
 }
@@ -954,6 +1059,11 @@ static void uvc_video_stats_start(struct uvc_streaming *stream)
 {
 	memset(&stream->stats, 0, sizeof(stream->stats));
 	stream->stats.stream.min_sof = 2048;
+
+	stream->stats.urbstat.header.min = -1;
+	stream->stats.urbstat.latency.min = -1;
+	stream->stats.urbstat.decode.min = -1;
+	stream->stats.urbstat.urb.min = -1;
 }
 
 static void uvc_video_stats_stop(struct uvc_streaming *stream)
@@ -961,6 +1071,28 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
 	stream->stats.stream.stop_ts = ktime_get();
 }
 
+static s64 uvc_stats_add(struct uvc_stats_time *s, const ktime_t a,
+			 const ktime_t b)
+{
+	ktime_t delta;
+	u64 duration;
+
+	delta = ktime_sub(b, a);
+	duration = ktime_to_ns(delta);
+
+	s->qty++;
+	s->duration += duration;
+	s->duration2 += duration * duration;
+
+	if (duration < s->min)
+		s->min = duration;
+
+	if (duration > s->max)
+		s->max = duration;
+
+	return duration;
+}
+
 /* ------------------------------------------------------------------------
  * Video codecs
  */
@@ -1024,6 +1156,9 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		stream->sequence++;
 		if (stream->sequence)
 			uvc_video_stats_update(stream);
+
+		/* Update the stream timer each frame */
+		stream->stats.stream.stop_ts = ktime_get();
 	}
 
 	uvc_video_clock_decode(stream, buf, data, len);
@@ -1106,18 +1241,34 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 static void uvc_video_copy_data_work(struct work_struct *work)
 {
 	struct uvc_urb *uvc_urb = container_of(work, struct uvc_urb, work);
+	ktime_t now;
 	unsigned int i;
 	int ret;
 
+	/* Measure decode performance */
+	uvc_urb->decode_start = ktime_get();
+	/* Measure scheduling latency */
+	uvc_stats_add(&uvc_urb->stream->stats.urbstat.latency,
+		      uvc_urb->received, uvc_urb->decode_start);
+
 	for (i = 0; i < uvc_urb->async_operations; i++) {
 		struct uvc_copy_op *op = &uvc_urb->copy_operations[i];
 
 		memcpy(op->dst, op->src, op->len);
+		uvc_urb->stream->stats.stream.bytes += op->len;
 
 		/* Release reference taken on this buffer. */
 		uvc_queue_buffer_release(op->buf);
 	}
 
+	now = ktime_get();
+	/* measure 'memcpy time' */
+	uvc_stats_add(&uvc_urb->stream->stats.urbstat.decode,
+		      uvc_urb->decode_start, now);
+	/* measure 'full urb processing time' */
+	uvc_stats_add(&uvc_urb->stream->stats.urbstat.urb, uvc_urb->received,
+		      now);
+
 	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
@@ -1507,6 +1658,9 @@ static void uvc_video_complete(struct urb *urb)
 	unsigned long flags;
 	int ret;
 
+	/* Track URB processing performance */
+	uvc_urb->received = ktime_get();
+
 	switch (urb->status) {
 	case 0:
 		break;
@@ -1562,6 +1716,9 @@ static void uvc_video_complete(struct urb *urb)
 	}
 
 	queue_work(stream->async_wq, &uvc_urb->work);
+
+	uvc_stats_add(&uvc_urb->stream->stats.urbstat.header, uvc_urb->received,
+		      ktime_get());
 }
 
 /*
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3e3ef1f1daa5..80eeeaf3cd06 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -475,6 +475,14 @@ struct uvc_stats_frame {
 	u32 scr_stc;			/* SCR.STC of the last packet */
 };
 
+struct uvc_stats_time {
+	u64 duration;			/* Cumulative total duration between two events */
+	u64 duration2;			/* Cumulative total duration^2 between two events */
+	unsigned int qty;		/* Number of events represented in the total */
+	unsigned int min;		/* Shortest duration */
+	unsigned int max;		/* Longest duration */
+};
+
 struct uvc_stats_stream {
 	ktime_t start_ts;		/* Stream start timestamp */
 	ktime_t stop_ts;		/* Stream stop timestamp */
@@ -496,6 +504,8 @@ struct uvc_stats_stream {
 	unsigned int scr_sof;		/* STC.SOF of the last packet */
 	unsigned int min_sof;		/* Minimum STC.SOF value */
 	unsigned int max_sof;		/* Maximum STC.SOF value */
+
+	unsigned long bytes;		/* Successfully transferred bytes */
 };
 
 #define UVC_METADATA_BUF_SIZE 1024
@@ -525,6 +535,8 @@ struct uvc_copy_op {
  * @async_operations: counter to indicate the number of copy operations
  * @copy_operations: work descriptors for asynchronous copy operations
  * @work: work queue entry for asynchronous decode
+ * @received: URB interrupt time stamp
+ * @decode_start: URB processing start time stamp
  */
 struct uvc_urb {
 	struct urb *urb;
@@ -537,6 +549,9 @@ struct uvc_urb {
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
 	struct work_struct work;
+
+	ktime_t received;
+	ktime_t decode_start;
 };
 
 struct uvc_streaming {
@@ -599,6 +614,12 @@ struct uvc_streaming {
 	struct {
 		struct uvc_stats_frame frame;
 		struct uvc_stats_stream stream;
+		struct uvc_stats_urb {
+			struct uvc_stats_time header;
+			struct uvc_stats_time latency;
+			struct uvc_stats_time decode;
+			struct uvc_stats_time urb;
+		} urbstat;
 	} stats;
 
 	/* Timestamps support. */
-- 
2.29.2.454.gaff20da3a2-goog

