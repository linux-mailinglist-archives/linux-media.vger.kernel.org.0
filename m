Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76F0D3C60
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfJKJcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:32:50 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42969 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727646AbfJKJct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:32:49 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IrHxixmWhjZ8vIrHziRKk3; Fri, 11 Oct 2019 11:32:47 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 5/6] v4l2-mem2mem: add new_frame detection
Date:   Fri, 11 Oct 2019 11:32:44 +0200
Message-Id: <20191011093245.33366-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
References: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFv/7qNpfmVbnIJ/xmr9gUdIdi33yDJQ9mfG03ySrqcndY7GpTCgB697IjgR55ob4jHfPPDO4c9aONuhGHEiQ7rnoWv/4S4l8pcVM924VrlxEGQ+L3dy
 qnbf4xhH17soiy8VW29pfyad9zvbR0J3fbb9jtxuoQdRYonjlnmay+mx33L/H3gv5xCmWj5c4h1k41m2Tsigb40BP5Vg78WSoP7419I/qum8VgjJhuKPQjRi
 jwuq5xlDzGP+BM9B2lFR3cZE6NA2IQtS1GX+QOdViC1TzYluBVjwU6JQa2eY3wumNYT/FhTdc4OFhz1P35hC5TIthxgB0Q047qfUteJJ+dDhIokqxyzKH1uB
 ndrhrBUeNslspSbo2b6tWOJ0rQbNLLJLDwdgau6m6Ihy6NUZUZFHTUToMscci/8ahnir24A3QRc94tQQvXroC+NA2K4/DyS806T881DbD+r2BVp0vjmHrP3x
 LaIs/YVYpO95jPGC
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
index b46d2c388349..db07ef3bf3d0 100644
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

