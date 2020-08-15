Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B4E2453AF
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 00:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgHOWEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 18:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbgHOVvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:03 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917FBC08EAD3
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7FA3229A95F
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 07/14] media: staging: rkisp1: params: avoid using buffer if params is not streaming
Date:   Sat, 15 Aug 2020 12:37:27 +0200
Message-Id: <20200815103734.31153-8-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the first buffer queued in the params node is returned
immediately to userspace and a copy of it is saved in the field
'cur_params'. The copy is later used for the first configuration
when the stream is initiated by one of selfpath/mainpath capture nodes.

There are 3 problems with this implementation:
- The first params buffer is applied and returned to userspace even if
userspace never calls to streamon on the params node.
- If the first params buffer is queued after the stream started on the
params node then it will return to userspace but will never be used.
- The frame_sequence of the first buffer is set to -1 if the main/selfpath
did not start streaming.

A correct implementation is to apply the first params buffer when stream
is started from mainpath/selfpath and only if params is also streaming.

The patch adds a new function 'rkisp1_params_apply_params_cfg' which takes
a buffer from the buffers queue, apply it and returns it to userspace.
The function is called from the irq handler and when main/selfpath stream
starts - in the function 'rkisp1_params_config_parameter'

Also remove the fields 'cur_params', 'is_first_params' which are no
more needed.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  5 --
 drivers/staging/media/rkisp1/rkisp1-params.c | 49 ++++++++------------
 2 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 29eaadc58489..9b41935c6597 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -197,9 +197,6 @@ struct rkisp1_stats {
 
 /*
  * struct rkisp1_params - ISP input parameters device
- *
- * @cur_params: Current ISP parameters
- * @is_first_params: the first params should take effect immediately
  */
 struct rkisp1_params {
 	struct rkisp1_vdev_node vnode;
@@ -207,10 +204,8 @@ struct rkisp1_params {
 
 	spinlock_t config_lock;
 	struct list_head params;
-	struct rkisp1_params_cfg cur_params;
 	struct v4l2_format vdev_fmt;
 	bool is_streaming;
-	bool is_first_params;
 
 	enum v4l2_quantization quantization;
 	enum rkisp1_fmt_raw_pat_type raw_type;
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 86bbd01e18c7..134b5c9a94c1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1193,23 +1193,13 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 	}
 }
 
-void rkisp1_params_isr(struct rkisp1_device *rkisp1)
+void rkisp1_params_apply_params_cfg(struct rkisp1_params *params, unsigned int frame_sequence)
 {
-	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
-	struct rkisp1_params *params = &rkisp1->params;
 	struct rkisp1_params_cfg *new_params;
 	struct rkisp1_buffer *cur_buf = NULL;
 
-	spin_lock(&params->config_lock);
-	if (!params->is_streaming) {
-		spin_unlock(&params->config_lock);
-		return;
-	}
-
-	if (list_empty(&params->params)) {
-		spin_unlock(&params->config_lock);
+	if (list_empty(&params->params))
 		return;
-	}
 
 	cur_buf = list_first_entry(&params->params,
 				   struct rkisp1_buffer, queue);
@@ -1226,6 +1216,20 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 
 	cur_buf->vb.sequence = frame_sequence;
 	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+void rkisp1_params_isr(struct rkisp1_device *rkisp1)
+{
+	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
+	struct rkisp1_params *params = &rkisp1->params;
+
+	spin_lock(&params->config_lock);
+	if (!params->is_streaming) {
+		spin_unlock(&params->config_lock);
+		return;
+	}
+	rkisp1_params_apply_params_cfg(params, frame_sequence);
+
 	spin_unlock(&params->config_lock);
 }
 
@@ -1298,9 +1302,9 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 	else
 		rkisp1_csm_config(params, false);
 
-	/* override the default things */
-	rkisp1_isp_isr_other_config(params, &params->cur_params);
-	rkisp1_isp_isr_meas_config(params, &params->cur_params);
+	/* apply the first buffer if there is one already */
+	if (params->is_streaming)
+		rkisp1_params_apply_params_cfg(params, 0);
 
 	spin_unlock(&params->config_lock);
 }
@@ -1428,8 +1432,6 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 	sizes[0] = sizeof(struct rkisp1_params_cfg);
 
 	INIT_LIST_HEAD(&params->params);
-	params->is_first_params = true;
-
 	return 0;
 }
 
@@ -1440,20 +1442,7 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 		container_of(vbuf, struct rkisp1_buffer, vb);
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
-	struct rkisp1_params_cfg *new_params;
 	unsigned long flags;
-	unsigned int frame_sequence =
-		atomic_read(&params->rkisp1->isp.frame_sequence);
-
-	if (params->is_first_params) {
-		new_params = (struct rkisp1_params_cfg *)
-			(vb2_plane_vaddr(vb, 0));
-		vbuf->sequence = frame_sequence;
-		vb2_buffer_done(&params_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
-		params->is_first_params = false;
-		params->cur_params = *new_params;
-		return;
-	}
 
 	params_buf->vaddr[0] = vb2_plane_vaddr(vb, 0);
 	spin_lock_irqsave(&params->config_lock, flags);
-- 
2.17.1

