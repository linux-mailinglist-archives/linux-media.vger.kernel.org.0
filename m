Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C085C383C83
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbhEQSjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 14:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235655AbhEQSji (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 14:39:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF65CC061756
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:21 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so104773wmf.5
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1j+gTiuTI/Oc9/gjCOyXowKZQPwbNlwNIgJl2Ell+c=;
        b=U7xC3U69zLf/Rzt39qi+60qZkr1dS+7CsKi/2Nc9C8ETxTVQfADnpOtEFQ9s2/dZVc
         bTX6JwwCiW9npbWaYUg8R42vVyVo14umzrJwsSaytZN+YddWJGum+jh1AD3IpRsEc879
         cCVxzivetDxLdACL3/5X2xxVdMKhiRsUhxPT19J9l5JdW8+HXD4NfnCjJqTPVt8qzwqu
         rdVkAUGb6bFXXQ0+M2WYadaMp6iJhPMvATqLJN8fo3eHdqXFFEB/5fbh7dFk6ODSuaxi
         WhvCk7BYbZJyscTteCUeKkrlUcqJdEB0sGfgqlRsc9nUeSRsHXuhOLgBKXPiLWitRopK
         EbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1j+gTiuTI/Oc9/gjCOyXowKZQPwbNlwNIgJl2Ell+c=;
        b=rb8QDu7EADhEauSodYKxPEMXf6VVKo/5k+gFnCDGqAnFU49++hrB9zgxT5jaTUcMGu
         cWnYhQmSjEJVvbZtoSWD0QV4Uc3QoQlp22g/AP2RS87Zzmkl2QFhYfCa21s9Dp4Oyth+
         B9UYu/D1QPFlSiIWhI/7zXB5lKBKTqIvrp9RCp97VEPdg9bC6gpau/PIandGA2J2LioH
         N+yT7ZLUQd2steDJLphnlT9AZA3JzrrQO+VK+kT4YT+dXOv10ixlhZez6sN0IOpbD8CV
         3z00TJeHeTk4/emzQ939HLi94cLACMq8VELIUuHkiMx3iNUpBMg3kyRFc8H45IXs3lRo
         51tQ==
X-Gm-Message-State: AOAM5304x8AKxYnFKQQVCfNw3jEQ1ZaPfSwz2sMNoL2g/B1J6Q5njWAd
        e1wJ06ML7bjOQJee51/gr8o=
X-Google-Smtp-Source: ABdhPJxaPhi43STP9/d23C7/2lGJGpeTIyhuouOqmbxLXKxBHXZ11P87OSZhZ0j3b31lADx6/12UsQ==
X-Received: by 2002:a1c:9d02:: with SMTP id g2mr417016wme.119.1621276700451;
        Mon, 17 May 2021 11:38:20 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id f3sm18076625wrp.7.2021.05.17.11.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:38:19 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 5/5] media: v4l2-mem2mem: add v4l2_m2m_stream_on/off tracepoints
Date:   Mon, 17 May 2021 19:38:01 +0100
Message-Id: <20210517183801.1255496-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

v4l2_m2m_stream_on/off are essentially the start/end points in between
which jobs can be scheduled. Userspace can easily request a stream_off,
while the last job is being processed - we might want to indicate that
in the traces.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c |  2 ++
 drivers/media/v4l2-core/v4l2-trace.c   |  2 ++
 include/trace/events/v4l2.h            | 34 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a83d3e4e7a85..6aa4ecafac6b 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -852,6 +852,7 @@ int v4l2_m2m_streamon(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	int ret;
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, type);
+	trace_v4l2_m2m_stream_on(m2m_ctx, vq);
 	ret = vb2_streamon(vq, type);
 	if (!ret)
 		v4l2_m2m_try_schedule(m2m_ctx);
@@ -895,6 +896,7 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		wake_up(&m2m_ctx->finished);
 	}
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
+	trace_v4l2_m2m_stream_off(m2m_ctx, &q_ctx->q);
 
 	return 0;
 }
diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index b70208101f3c..ce9d393eb69e 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -19,3 +19,5 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_run_job);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_cancel_job_wait);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_cancel_job);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_finish_job);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_stream_on);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_stream_off);
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index a545f6a13d0a..a48a8859a4ef 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -326,6 +326,7 @@ TRACE_EVENT(v4l2_m2m_buf_done,
 /*
  * v4l_m2m job tracing
  * expected order of events:
+ *	v4l2_m2m_stream_on		<= userspace request to start stream processing
  * 	v4l2_m2m_schedule 		<= start of a job trace
  * 	[v4l2_m2m_schedule_failed*]
  *	v4l2_m2m_queue_job		<= job queued on list of ready jobs
@@ -333,6 +334,7 @@ TRACE_EVENT(v4l2_m2m_buf_done,
  *	[v4l2_m2m_cancel_job_wait]	<= job cancelled, but waiting for completion as it is already running
  *	[v4l2_m2m_cancel_job*]		<= job cancelled
  *	v4l2_m2m_finish_job		<= job finished, end of trace
+ *	v4l2_m2m_stream_off		<= userspace request to stop stream processing
  *
  *	events in [] indicate optional events, that may appear, but usually would not be expected
  *	events with * indicate terminal events that end a trace early
@@ -435,6 +437,38 @@ DEFINE_EVENT(v4l2_m2m_event_class, v4l2_m2m_finish_job,
 	TP_ARGS(ctx)
 );
 
+DECLARE_EVENT_CLASS(v4l2_m2m_streaming_class,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx, struct vb2_queue *queue),
+	TP_ARGS(ctx, queue),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
+		__field(u32, type)
+	),
+
+	TP_fast_assign(
+		struct v4l2_fh *owner = ctx->cap_q_ctx.q.owner;
+
+		__entry->minor = owner ? owner->vdev->minor : -1;
+		__entry->fh = owner;
+		__entry->type = queue->type;
+
+	),
+	TP_printk("minor = %d, fh = %p, type = %p",
+		__entry->minor, __entry->fh, show_type(__entry->type))
+)
+
+DEFINE_EVENT(v4l2_m2m_streaming_class, v4l2_m2m_stream_on,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx, struct vb2_queue *queue),
+	TP_ARGS(ctx, queue)
+);
+
+DEFINE_EVENT(v4l2_m2m_streaming_class, v4l2_m2m_stream_off,
+	TP_PROTO(struct v4l2_m2m_ctx *ctx, struct vb2_queue *queue),
+	TP_ARGS(ctx, queue)
+);
+
 #ifdef CREATE_TRACE_POINTS
 #define __trace_array_name(a, arr, num) (((unsigned)(a)) < num ? arr[a] : "unknown")
 static inline void __trace_sprint_v4l2_format(char *str, size_t size, struct v4l2_format *p)
-- 
2.31.1

