Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785BA383C81
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235606AbhEQSjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 14:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQSjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 14:39:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64510C061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:18 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id v12so7476124wrq.6
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+nszOoD23Eg2Y7U0BVUuhhlHTsGEYFChABYmw32+P4=;
        b=NuMulHwJmu95SR3cCPgqe23DGlr3Epwp+Nq7ftrxitY55HkjZ8WvFOthgnACDBk2+5
         k2PLTb87DRpSAsLx2HJZN3PPIz2PL1AiN05osWRmUjhh/404hLmQLWSvhqnt/9CAA7hU
         AQxZ4oJ/jKtatFTHlS/QqCYlH/7rWua4j65VW+yIhUzcMOeOIfJHBaQvhWLFYrA423sO
         7pgLAJTjCAczCZwALV3kXEZEPFEressNpMERn1DrLsZcfEo54Vs6QUeMl6Zzy/7xrGBc
         aLXKZULWIKuURNb6iR320Kyq920+9SKxjZiMrO+uU4x+/r1OmdfofdfgbbvLAugFxtEK
         CEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+nszOoD23Eg2Y7U0BVUuhhlHTsGEYFChABYmw32+P4=;
        b=g43g7Afe4F35KhNMChXKLxacwBI9X4YrpJAW2hMT+kcIiHQjBEX20jc7g1sAJlUh6t
         I38tJFocmfSgb6vf+RWvL8bJ6w8gdwjqqMLfVDgrfsNoEwaACw0fv93NUmkcjRXDHchO
         vPpGyzFoIxxPooPT+b8yYLeuEOmXhVRKjTYl1RZ6C030N0Myh2D9KKVE4qe93qe2oobI
         TvTwGGBn5r3+VPV6x+7ZBmlDVSG0JGSEKowu9QicRe9klfqGJN0VyzI+ooVFuGo9X/tC
         b/2d65AL6BvFwuOx0h+QHH9sGMG0W+hRvuPCrOKiQlMmuD07C0ZTfjpGLnJp6le9VPaJ
         zjQQ==
X-Gm-Message-State: AOAM5317fDFQDPnPEuzLDw7Xqh7PJtpOL0NOqiF5z7OgppwToQXSl/DC
        9+IAEGiuQxhD6xqi/pGlF0o=
X-Google-Smtp-Source: ABdhPJyqpkdPaW7qdDDm+JfaisXzT8y3g39ZX23oSdficfjYsq0t5gdrLJuBx6leUKk1WJvtfHNphg==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr190339wro.295.1621276697146;
        Mon, 17 May 2021 11:38:17 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id f3sm18076625wrp.7.2021.05.17.11.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:38:15 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 3/5] media: v4l2-mem2mem: add job tracing
Date:   Mon, 17 May 2021 19:37:59 +0100
Message-Id: <20210517183801.1255496-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Add ftrace events to trace job submission and processing.

In particular, allow for tracking the whole job from the initial
submission/schedule stage until its completion.

Since there can be only a single job, per given file handle we use the
handle pointer as a unique identifier. This will allow us to correlate
that with the buffers used and their lifespan - coming with later
patches.

Co-authored-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---

Not 100% sold on v4l2_m2m_queue_job().

Currently we denote with src/dst the buffer index, while use use index
throughout the rest of the series. Should we suffix those with _index?

Additionally, we don't print the type - which is known albeit not
machine read-able. I'm leaning towards having making each of those
an {src,dst}_buf { .index = foo, .type = bar }.

Does that sound reasonable?


 drivers/media/v4l2-core/v4l2-mem2mem.c |  15 +++
 drivers/media/v4l2-core/v4l2-trace.c   |   7 ++
 include/media/v4l2-mem2mem.h           |  11 +++
 include/trace/events/v4l2.h            | 128 +++++++++++++++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e7f4bf5bc8dd..bf83d1fae701 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -20,6 +20,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
+#include <trace/events/v4l2.h>
 
 MODULE_DESCRIPTION("Mem to mem device framework for videobuf");
 MODULE_AUTHOR("Pawel Osciak, <pawel@osciak.com>");
@@ -281,6 +282,7 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
 	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
+	trace_v4l2_m2m_run_job(m2m_dev->curr_ctx);
 	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
 }
 
@@ -300,10 +302,12 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 	struct vb2_v4l2_buffer *dst, *src;
 
 	dprintk("Trying to schedule a job for m2m_ctx: %p\n", m2m_ctx);
+	trace_v4l2_m2m_schedule(m2m_ctx);
 
 	if (!m2m_ctx->out_q_ctx.q.streaming
 	    || !m2m_ctx->cap_q_ctx.q.streaming) {
 		dprintk("Streaming needs to be on for both queues\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_NOT_STREAMING);
 		return;
 	}
 
@@ -312,11 +316,13 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 	/* If the context is aborted then don't schedule it */
 	if (m2m_ctx->job_flags & TRANS_ABORT) {
 		dprintk("Aborted context\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_ABORTED);
 		goto job_unlock;
 	}
 
 	if (m2m_ctx->job_flags & TRANS_QUEUED) {
 		dprintk("On job queue already\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_ALREADY_QUEUED);
 		goto job_unlock;
 	}
 
@@ -324,10 +330,12 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 	dst = v4l2_m2m_next_dst_buf(m2m_ctx);
 	if (!src && !m2m_ctx->out_q_ctx.buffered) {
 		dprintk("No input buffers available\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_NO_SRC);
 		goto job_unlock;
 	}
 	if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
 		dprintk("No output buffers available\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_NO_DST);
 		goto job_unlock;
 	}
 
@@ -343,6 +351,7 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 
 		if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
 			dprintk("No output buffers available after returning held buffer\n");
+			trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_NO_DST_POST_HELD);
 			goto job_unlock;
 		}
 	}
@@ -354,17 +363,20 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 
 	if (m2m_ctx->has_stopped) {
 		dprintk("Device has stopped\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_DEV_STOPPED);
 		goto job_unlock;
 	}
 
 	if (m2m_dev->m2m_ops->job_ready
 		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
 		dprintk("Driver not ready\n");
+		trace_v4l2_m2m_schedule_failed(m2m_ctx, V4L2_M2M_DRV_NOT_READY);
 		goto job_unlock;
 	}
 
 	list_add_tail(&m2m_ctx->queue, &m2m_dev->job_queue);
 	m2m_ctx->job_flags |= TRANS_QUEUED;
+	trace_v4l2_m2m_queue_job(m2m_ctx, src ? &src->vb2_buf : NULL, dst ? &dst->vb2_buf : NULL);
 
 job_unlock:
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
@@ -426,6 +438,7 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 		if (m2m_dev->m2m_ops->job_abort)
 			m2m_dev->m2m_ops->job_abort(m2m_ctx->priv);
 		dprintk("m2m_ctx %p running, will wait to complete\n", m2m_ctx);
+		trace_v4l2_m2m_cancel_job_wait(m2m_ctx);
 		wait_event(m2m_ctx->finished,
 				!(m2m_ctx->job_flags & TRANS_RUNNING));
 	} else if (m2m_ctx->job_flags & TRANS_QUEUED) {
@@ -438,6 +451,7 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 		/* Do nothing, was not on queue/running */
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 	}
+	trace_v4l2_m2m_cancel_job(m2m_ctx);
 }
 
 /*
@@ -477,6 +491,7 @@ static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
 	wake_up(&m2m_dev->curr_ctx->finished);
 	m2m_dev->curr_ctx = NULL;
+	trace_v4l2_m2m_finish_job(m2m_ctx);
 	return true;
 }
 
diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index 6df26fc7c39c..cde408d06fdc 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -11,3 +11,10 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ioctl_s_fmt);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_schedule);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_schedule_failed);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_queue_job);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_run_job);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_cancel_job_wait);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_cancel_job);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_finish_job);
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 5a91b548ecc0..82bf54254bd8 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -15,6 +15,17 @@
 
 #include <media/videobuf2-v4l2.h>
 
+enum v4l2_m2m_state {
+	V4L2_M2M_NOT_STREAMING,
+	V4L2_M2M_ABORTED,
+	V4L2_M2M_ALREADY_QUEUED,
+	V4L2_M2M_NO_SRC,
+	V4L2_M2M_NO_DST,
+	V4L2_M2M_NO_DST_POST_HELD,
+	V4L2_M2M_DEV_STOPPED,
+	V4L2_M2M_DRV_NOT_READY
+};
+
 /**
  * struct v4l2_m2m_ops - mem-to-mem device driver callbacks
  * @device_run:	required. Begin the actual job (transaction) inside this
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index d11e38676e48..8e382bad5f8e 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -10,6 +10,7 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 
 /* Enums require being exported to userspace, for user tool parsing */
 #undef EM
@@ -55,6 +56,21 @@ SHOW_TYPE
 
 SHOW_FIELD
 
+#define show_reason(state)						\
+	__print_symbolic(state, SHOW_REASON)
+
+#define SHOW_REASON							\
+	EM( V4L2_M2M_NOT_STREAMING,	"NOT_STREAMING" )		\
+	EM( V4L2_M2M_ABORTED,		"ABORTED" )			\
+	EM( V4L2_M2M_ALREADY_QUEUED,	"ALREADY_QUEUED" )		\
+	EM( V4L2_M2M_NO_SRC,		"NO_SRC" )			\
+	EM( V4L2_M2M_NO_DST,		"NO_DST" )			\
+	EM( V4L2_M2M_NO_DST_POST_HELD,	"NO_DST_POST_HELD" )		\
+	EM( V4L2_M2M_DEV_STOPPED,	"DEV_STOPPED" )			\
+	EMe(V4L2_M2M_DRV_NOT_READY,	"DRV_NOT_READY" )
+
+SHOW_REASON
+
 /*
  * Now redefine the EM() and EMe() macros to map the enums to the strings
  * that will be printed in the output.
@@ -266,6 +282,118 @@ DEFINE_EVENT(vb2_v4l2_event_class, vb2_v4l2_qbuf,
 	TP_ARGS(q, vb)
 );
 
+/*
+ * v4l_m2m job tracing
+ * expected order of events:
+ * 	v4l2_m2m_schedule 		<= start of a job trace
+ * 	[v4l2_m2m_schedule_failed*]
+ *	v4l2_m2m_queue_job		<= job queued on list of ready jobs
+ *	v4l2_m2m_run_job 		<= driver told to run the job
+ *	[v4l2_m2m_cancel_job_wait]	<= job cancelled, but waiting for completion as it is already running
+ *	[v4l2_m2m_cancel_job*]		<= job cancelled
+ *	v4l2_m2m_finish_job		<= job finished, end of trace
+ *
+ *	events in [] indicate optional events, that may appear, but usually would not be expected
+ *	events with * indicate terminal events that end a trace early
+ *
+ *	A typical job timeline would be a 3 segment period:
+ *	[ scheduled | queued | running ]
+ *	^           ^        ^         ^
+ *	|-----------|--------|---------|-- v4l2_m2m_schedule
+ *	            |--------|---------|-- v4l2_m2m_queue_job
+ *	                     |---------|-- v4l2_m2m_run_job
+ *	                               |-- v4l2_m2m_finish_job
+ */
+DECLARE_EVENT_CLASS(v4l2_m2m_event_class,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx),
+	TP_ARGS(ctx),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
+	),
+
+	TP_fast_assign(
+		struct v4l2_fh *owner = ctx->cap_q_ctx.q.owner;
+
+		__entry->minor = owner ? owner->vdev->minor : -1;
+		__entry->fh = owner;
+	),
+
+	TP_printk("minor = %d, fh = %p",
+		__entry->minor, __entry->fh)
+)
+
+DEFINE_EVENT(v4l2_m2m_event_class, v4l2_m2m_schedule,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
+TRACE_EVENT(v4l2_m2m_schedule_failed,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx, enum v4l2_m2m_state reason),
+	TP_ARGS(ctx, reason),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
+		__field(enum v4l2_m2m_state, reason)
+	),
+
+	TP_fast_assign(
+		struct v4l2_fh *owner = ctx->cap_q_ctx.q.owner;
+
+		__entry->minor = owner ? owner->vdev->minor : -1;
+		__entry->fh = owner;
+		__entry->reason = reason;
+	),
+
+	TP_printk("minor = %d, fh = %p, reason = %s",
+		__entry->minor, __entry->fh, show_reason(__entry->reason))
+)
+
+TRACE_EVENT(v4l2_m2m_queue_job,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx, struct vb2_buffer *src, struct vb2_buffer *dst),
+	TP_ARGS(ctx, src, dst),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
+		__field(s32, src)
+		__field(s32, dst)
+	),
+
+	TP_fast_assign(
+		struct v4l2_fh *owner = ctx->cap_q_ctx.q.owner;
+
+		__entry->minor = owner ? owner->vdev->minor : -1;
+		__entry->fh = owner;
+		__entry->src = src ? (s32)src->index : -1;
+		__entry->dst = dst ? (s32)dst->index : -1;
+	),
+	TP_printk("minor = %d, fh = %p, src = %d, dst = %d",
+		__entry->minor, __entry->fh, __entry->src, __entry->dst)
+);
+
+DEFINE_EVENT(v4l2_m2m_event_class, v4l2_m2m_run_job,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
+DEFINE_EVENT(v4l2_m2m_event_class, v4l2_m2m_cancel_job_wait,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
+DEFINE_EVENT(v4l2_m2m_event_class, v4l2_m2m_cancel_job,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
+DEFINE_EVENT(v4l2_m2m_event_class, v4l2_m2m_finish_job,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx),
+	TP_ARGS(ctx)
+);
+
 #ifdef CREATE_TRACE_POINTS
 #define __trace_array_name(a, arr, num) (((unsigned)(a)) < num ? arr[a] : "unknown")
 static inline void __trace_sprint_v4l2_format(char *str, size_t size, struct v4l2_format *p)
-- 
2.31.1

