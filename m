Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC650383C82
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbhEQSji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 14:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQSjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 14:39:37 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FECC061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:20 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id b7so3512444wmh.5
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYzxheHALR2wAy1lf1jbrDxUPl4nLVew24TkSWR6byE=;
        b=Le2MW7ThCns8XZtSFRnaVE7D1SH7IPUaszXs4w6s5fLdy9d2I4TvwfbDWbUBcwSfrk
         fpBen4y+KSUVvy+LpnVvyEQvd16EyrmrKNgOeLzwSvfIlQsKalQ65gEtbfQqFCWt0REp
         exNIIwzUguKIQ/6ndo1cKA1FkNT9OOLE1WYDd4evyRw9wwvl3VUs2ThOPICVSstzuq7c
         UxYA8f10qGU/r7otIaaAJTFHQ5Ydq6gzwwydaP6Ta57u+B1kmZlX5V9dhHQbtAXGrK5a
         qNklytGf1MWCJ3Lw0r6jC7Z7pi9WDGV9cYTlK6TLX9Nc3L9mtTS8YKIISg4xSR4XOGoM
         FiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYzxheHALR2wAy1lf1jbrDxUPl4nLVew24TkSWR6byE=;
        b=kLTh3SlpEbVnETINUxfVFJyK43cW0ZtnvWLKH7MoMbr5H7Li20YgU7WT+vB47nyDjQ
         j/30faOT7RiJusFduwq9uhtedeIp5dGmm+zpXTzUJ+pbN1aiac22ObrT8MeezUw1t90y
         WF+tPdZAutpHNljD2miZXnD4T+vCvdiPMo7XDFoHUQPaqwuMnEOw9OGvWV+0rHuW+u+B
         GrIJ9nmX/FeRvJDD1oj0yiTR5InlScJ+mbk6cp/y4ypTcAYesOQr+y/+KQnaTRU/tEKh
         uGRbktl9UTKIFTdnUm7MFQowtT04sHtHAyLWiriaZqXOiFa68qB2zEOSDtZPWP7HqgRr
         PBww==
X-Gm-Message-State: AOAM532PHhtdHF1KOmlCZMv7RroeYWtkZxNDbxmmsxZugY9Qa2gQQeQb
        52W1iMiQd9S94+Lxolu6GHY=
X-Google-Smtp-Source: ABdhPJz/1xaZrP35J2vd51xrH6ZKNVT3+O6GSzQVEQec+7I3vrSf+EA0Sud2Xi2XZD5WiXPfb9vhDw==
X-Received: by 2002:a1c:2685:: with SMTP id m127mr434924wmm.135.1621276698944;
        Mon, 17 May 2021 11:38:18 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id f3sm18076625wrp.7.2021.05.17.11.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:38:18 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 4/5] media: v4l2-mem2mem: add v4l2_m2m_buf_done trace point
Date:   Mon, 17 May 2021 19:38:00 +0100
Message-Id: <20210517183801.1255496-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Move the function out of the header, as required by the trace API and
add a tracepoint.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c |  9 ++++++
 drivers/media/v4l2-core/v4l2-trace.c   |  1 +
 include/media/v4l2-mem2mem.h           | 10 +++----
 include/trace/events/v4l2.h            | 41 ++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index bf83d1fae701..a83d3e4e7a85 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -555,6 +555,15 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 }
 EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 
+void
+v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
+{
+	// TODO: Emil move the trace after done?
+	trace_v4l2_m2m_buf_done(&buf->vb2_buf, state);
+	vb2_buffer_done(&buf->vb2_buf, state);
+}
+EXPORT_SYMBOL(v4l2_m2m_buf_done);
+
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index cde408d06fdc..b70208101f3c 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -11,6 +11,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ioctl_s_fmt);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_buf_done);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_schedule);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_schedule_failed);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_queue_job);
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 82bf54254bd8..013fd355ff82 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -229,11 +229,11 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 				      struct v4l2_m2m_ctx *m2m_ctx,
 				      enum vb2_buffer_state state);
 
-static inline void
-v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
-{
-	vb2_buffer_done(&buf->vb2_buf, state);
-}
+/**
+ * Something something
+ */
+void
+v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state);
 
 /**
  * v4l2_m2m_clear_state() - clear encoding/decoding state
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 8e382bad5f8e..a545f6a13d0a 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -56,6 +56,20 @@ SHOW_TYPE
 
 SHOW_FIELD
 
+#define show_state(state)						\
+	__print_symbolic(state, SHOW_STATE)
+
+#define SHOW_STATE							\
+	EM( VB2_BUF_STATE_DEQUEUED,	"DEQUEUED" )			\
+	EM( VB2_BUF_STATE_IN_REQUEST,	"IN_REQUEST" )			\
+	EM( VB2_BUF_STATE_PREPARING,	"PREPARING" )			\
+	EM( VB2_BUF_STATE_QUEUED,	"QUEUED" )			\
+	EM( VB2_BUF_STATE_ACTIVE,	"ACTIVE" )			\
+	EM( VB2_BUF_STATE_DONE,		"DONE" )			\
+	EMe(VB2_BUF_STATE_ERROR,	"ERROR" )
+
+SHOW_STATE
+
 #define show_reason(state)						\
 	__print_symbolic(state, SHOW_REASON)
 
@@ -282,6 +296,33 @@ DEFINE_EVENT(vb2_v4l2_event_class, vb2_v4l2_qbuf,
 	TP_ARGS(q, vb)
 );
 
+TRACE_EVENT(v4l2_m2m_buf_done,
+	TP_PROTO(struct vb2_buffer *vb, enum vb2_buffer_state state),
+	TP_ARGS(vb, state),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(struct v4l2_fh *, fh)
+		__field(s32, index)
+		__field(u32, type)
+		__field(enum vb2_buffer_state, state)
+	),
+
+	TP_fast_assign(
+		struct v4l2_fh *owner = vb->vb2_queue->owner;
+
+		__entry->minor = owner ? owner->vdev->minor : -1;
+		__entry->fh = owner;
+		__entry->index = vb->index;
+		__entry->type = vb->type;
+		__entry->state = state;
+	),
+
+	TP_printk("minor = %d, fh = %p, index = %u, type = %s, state = %s",
+		__entry->minor, __entry->fh, __entry->index,
+		show_type(__entry->type), show_state(__entry->state))
+);
+
 /*
  * v4l_m2m job tracing
  * expected order of events:
-- 
2.31.1

