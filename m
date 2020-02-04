Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE76115145B
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgBDC5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:13 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50672 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbgBDC5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:12 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so688852pjb.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rSyGuFAVZnXzr+zAXWI5hLV+qnkzbpD8GsyCzJNdKrQ=;
        b=mxIQk2YLkshOw7vJ6iQvQQCce+oSmqrmG5XFCsSQJ/4BKhar12+Sifz2M/V7e8nrmr
         ISbu9DVITcNCb/Vs5/J3sDuDcHN2dg2BsZVowUuljbbW/BTmU6iPtiMCLc3Pi2eYo75S
         10iztGHMfd6G/0yJ1hFE4AmJsc9nxccT76B+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rSyGuFAVZnXzr+zAXWI5hLV+qnkzbpD8GsyCzJNdKrQ=;
        b=evo2HNivOKnCm+62BELJDojNUoip/YhgHYZoOEzIj58jM1Daeof1rUreRHYUg6Qr+K
         l74iYTWio18vPPxMZbX8XleiFASsHKmiHQi/7aiPvGCuyZbv0gWaLjJ2l9GdzepNy+z8
         iWy87AdAww26sJ7jUixfgipqhSU01eOJvNBIRABD2An+rjTZNI8iduFcLz+tGSTUim6D
         Omw6dYaO+8lhr+0UHx1qa7wLn5hV/UsPhA1BSn8WXmTDLb1ooYUyRZjTrNjirXqqg8tA
         964IhgHm0xBCV5ieGm2ALVM61o6JAq/xwFXwhlx+xmIf4BkYIK3AbRNQAJ8QHyH0auaT
         W43Q==
X-Gm-Message-State: APjAAAWqBY48Q6b+rmxxj4TGa0dp03+445ut5khkLV7wh143DtX+DKbP
        ZsCBHTCd4qbl0csP3qHxEXmZsCTdnf9nfg==
X-Google-Smtp-Source: APXvYqw44cJEolkg75aNUS+361dd/1QeuT/ek/JjyJbHVZG2AagjQmg09/xRta5P8wjnCUEBOjUvZA==
X-Received: by 2002:a17:90a:7784:: with SMTP id v4mr3136782pjk.134.1580785030594;
        Mon, 03 Feb 2020 18:57:10 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:10 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 06/12] videobuf2: factor out planes prepare/finish functions
Date:   Tue,  4 Feb 2020 11:56:35 +0900
Message-Id: <20200204025641.218376-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Factor out the code, no functional changes.

Change-Id: I47044c0ba57ccc47a5d23f36976ce9f1e3b0f67f
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 52 +++++++++++--------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 56fd17eafb6c..46be9c790ff6 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -296,6 +296,32 @@ static void __vb2_buf_dmabuf_put(struct vb2_buffer *vb)
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
 }
 
+/*
+ * __vb2_buf_mem_prepare() - call ->prepare() on buffer's private memory
+ * to sync caches
+ */
+static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
+{
+	unsigned int plane;
+
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
+	vb->synced = 1;
+}
+
+/*
+ * __vb2_buf_mem_finish() - call ->finish on buffer's private memory
+ * to sync caches
+ */
+static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
+{
+	unsigned int plane;
+
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
+	vb->synced = 0;
+}
+
 /*
  * __setup_offsets() - setup unique offsets ("cookies") for every plane in
  * the buffer.
@@ -951,7 +977,6 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 {
 	struct vb2_queue *q = vb->vb2_queue;
 	unsigned long flags;
-	unsigned int plane;
 
 	if (WARN_ON(vb->state != VB2_BUF_STATE_ACTIVE))
 		return;
@@ -971,12 +996,8 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 	dprintk(4, "done processing on buffer %d, state: %d\n",
 			vb->index, state);
 
-	if (state != VB2_BUF_STATE_QUEUED) {
-		/* sync buffers */
-		for (plane = 0; plane < vb->num_planes; ++plane)
-			call_void_memop(vb, finish, vb->planes[plane].mem_priv);
-		vb->synced = 0;
-	}
+	if (state != VB2_BUF_STATE_QUEUED)
+		__vb2_buf_mem_finish(vb);
 
 	spin_lock_irqsave(&q->done_lock, flags);
 	if (state == VB2_BUF_STATE_QUEUED) {
@@ -1301,7 +1322,6 @@ static int __buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_queue *q = vb->vb2_queue;
 	enum vb2_buffer_state orig_state = vb->state;
-	unsigned int plane;
 	int ret;
 
 	if (q->error) {
@@ -1345,11 +1365,7 @@ static int __buf_prepare(struct vb2_buffer *vb)
 		return ret;
 	}
 
-	/* sync buffers */
-	for (plane = 0; plane < vb->num_planes; ++plane)
-		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
-
-	vb->synced = 1;
+	__vb2_buf_mem_prepare(vb);
 	vb->prepared = 1;
 	vb->state = orig_state;
 
@@ -1969,14 +1985,8 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 				call_void_vb_qop(vb, buf_request_complete, vb);
 		}
 
-		if (vb->synced) {
-			unsigned int plane;
-
-			for (plane = 0; plane < vb->num_planes; ++plane)
-				call_void_memop(vb, finish,
-						vb->planes[plane].mem_priv);
-			vb->synced = 0;
-		}
+		if (vb->synced)
+			__vb2_buf_mem_finish(vb);
 
 		if (vb->prepared) {
 			call_void_vb_qop(vb, buf_finish, vb);
-- 
2.25.0.341.g760bfbb309-goog

