Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39ECBD2A7E
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388058AbfJJNL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44391 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388036AbfJJNL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:56 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYEViU37R; Thu, 10 Oct 2019 15:11:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 5/8] v4l2-mem2mem: add new_frame detection
Date:   Thu, 10 Oct 2019 15:11:49 +0200
Message-Id: <20191010131152.68984-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNehpzSLnwlvZCmgg+1Ed3QLNwLhTgLyDEARzq26bl01ROW8oYfQHHZ8iaPuJ+C4VvD8UsQDPTP2OcGQcAjep1uSm2rhnnnyWj7aCfT41PisMe6yi5zC
 jFpxptS8fR0CFoPZ752VdOautT6W1W6gW5bwyjrecdsx7WAoJs0JFx8GHQMJOgE36du63az8K4GLmowr0/tPp3YW+O1TaJAsyvKpt7Cn8o9JS0Q3lOTj8VK4
 hqBn6LE51yvKPcDe0aXTkwU512mAtM8u5hnIS7X5+Wp9H1SE8spYhqmcjYp1J2v75kw5nWM3w0Q57JKq+sNaO6O3D0PxiNKJK11380XoGPDlGN6sVidhpaeV
 biFASR6JUdRJnsFaP8eXo0AS2bhQiXamfkDsHiM9Kg19fMnPVKeqr1CrdrE6yiEdM4Rax9Rr9m6xz9ccjsot0k25uQxeT2PmNgN1yDST68yCXZe9myZvysxN
 Wdm3BtkEK2M7RygO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers that support VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
typically want to know if a new frame is started (i.e. the first
slice is about to be processed). Add a new_frame bool to v4l2_m2m_ctx
and set it accordingly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 11 +++++++++--
 include/media/v4l2-mem2mem.h           |  7 +++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 5cad205eed08..55205c1563d7 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -319,8 +319,10 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 		goto job_unlock;
 	}
 
-	if (src && dst &&
-	    dst->is_held && dst->vb2_buf.copied_timestamp &&
+	m2m_ctx->new_frame = true;
+
+	if (src && dst && dst->is_held &&
+	    dst->vb2_buf.copied_timestamp &&
 	    dst->vb2_buf.timestamp != src->vb2_buf.timestamp) {
 		dst->is_held = false;
 		v4l2_m2m_dst_buf_remove(m2m_ctx);
@@ -333,6 +335,11 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 		}
 	}
 
+	if (src && dst && (m2m_ctx->cap_q_ctx.q.subsystem_flags &
+			   VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
+		m2m_ctx->new_frame = !dst->vb2_buf.copied_timestamp ||
+			dst->vb2_buf.timestamp != src->vb2_buf.timestamp;
+
 	if (m2m_dev->m2m_ops->job_ready
 		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
 		dprintk("Driver not ready\n");
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 3d9e48ed8817..1d85e24791e4 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -75,6 +75,11 @@ struct v4l2_m2m_queue_ctx {
  * struct v4l2_m2m_ctx - Memory to memory context structure
  *
  * @q_lock: struct &mutex lock
+ * @new_frame: valid in the device_run callback: if true, then this
+ *		starts a new frame; if false, then this is a new slice
+ *		for an existing frame. This is always true unless
+ *		V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF is set, which
+ *		indicates slicing support.
  * @m2m_dev: opaque pointer to the internal data to handle M2M context
  * @cap_q_ctx: Capture (output to memory) queue context
  * @out_q_ctx: Output (input from memory) queue context
@@ -91,6 +96,8 @@ struct v4l2_m2m_ctx {
 	/* optional cap/out vb2 queues lock */
 	struct mutex			*q_lock;
 
+	bool				new_frame;
+
 	/* internal use only */
 	struct v4l2_m2m_dev		*m2m_dev;
 
-- 
2.23.0

