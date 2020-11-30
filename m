Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136B62C828F
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgK3KtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbgK3Ks7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:48:59 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C99C061A4B
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:47:44 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id z7so15499848wrn.3
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PTJMoIvPd6jSsV+7XYsBHIndvfoL9mqScQeYrToAx5o=;
        b=U9hQeiB1zb9MuagHpTmgDPRCZf1H/wNFD+mFX3/p2QQRac62VMnNebHGcbujuyFiXv
         kUihP7fnjOyI6W/rZctC8rYIzpWdTCop9f9RiEYMfn+jskRQhKo2Q8wl7pI3bf3mhJaQ
         MfyCEf/j8ryzmfnJL7jbMhzdKFxM9wsN16iV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PTJMoIvPd6jSsV+7XYsBHIndvfoL9mqScQeYrToAx5o=;
        b=h/CPyX5zOgaNjXhuSnHY+E2bQqPRWDBHU2sEqDUYA4AdSu5dWqesG6iLbE0AB+rnIF
         WI6SQKX88nrFxcDtRWgVZoJ04Mj/HXgQECxTAvwqG6s4WBJpX6bV8ZvyCp7rYOYODiSE
         5AifTraNPCO4dhIGvVlg8CTOUKN7eToGGYRIKZQlxvh3jBzs3IHfIU1xYXf05rdEuGX6
         EZQSxPNISqv+P7S4PQNb917w82S2pT3W9m2+/b6TKE7GL4Ef4ydcU0cpxP7wVyk0IN5q
         G5VYtxpWOuveot6TNE6WWf6W0i8wdoc+hZ47h+kzoGM7a/COxhj/QXzbG5ZzTsUAheQ/
         +QJg==
X-Gm-Message-State: AOAM532joCJCMLyYCuUsMUJ0SUUjcaSYeQvw4xBX35wBZqiSGGe/Tjae
        MQyCbuURo7MgGxKqwjevtzVq6Q==
X-Google-Smtp-Source: ABdhPJwWGYD+vOq3570Z3xLySd1Yu92CXMkP/I122gIL6Twv+KqpDoSbqG0EH0OkpV905ZkzPAKAYw==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr27412992wrc.17.1606733262958;
        Mon, 30 Nov 2020 02:47:42 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id x9sm19719853wru.55.2020.11.30.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 02:47:42 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Cc:     Shik Chen <shik@chromium.org>
Subject: [PATCH v4 4/4] TEST-ONLY: media: uvcvideo: Add statistics for measuring performance
Date:   Mon, 30 Nov 2020 11:47:30 +0100
Message-Id: <20201130104730.27655-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201130104730.27655-1-ribalda@chromium.org>
References: <20201130104730.27655-1-ribalda@chromium.org>
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
index 59ade244abfb..34a27191ef0d 100644
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
@@ -1111,18 +1246,34 @@ static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
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
 	if (uvc_urb->pages)
 		dma_sync_sgtable_for_device(stream_to_dmadev(uvc_urb->stream),
 					    &uvc_urb->sgt, DMA_FROM_DEVICE);
@@ -1510,6 +1661,9 @@ static void uvc_video_complete(struct urb *urb)
 	unsigned long flags;
 	int ret;
 
+	/* Track URB processing performance */
+	uvc_urb->received = ktime_get();
+
 	switch (urb->status) {
 	case 0:
 		break;
@@ -1567,6 +1721,9 @@ static void uvc_video_complete(struct urb *urb)
 	}
 
 	queue_work(stream->async_wq, &uvc_urb->work);
+
+	uvc_stats_add(&uvc_urb->stream->stats.urbstat.header, uvc_urb->received,
+		      ktime_get());
 }
 
 /*
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3e6618a2ac82..e77fa2253526 100644
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
@@ -538,6 +550,9 @@ struct uvc_urb {
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
 	struct work_struct work;
+
+	ktime_t received;
+	ktime_t decode_start;
 };
 
 struct uvc_streaming {
@@ -600,6 +615,12 @@ struct uvc_streaming {
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

