Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C72810224E
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfKSKvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:51:23 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59563 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727352AbfKSKvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X16MiClSQcs92X16OiynY0; Tue, 19 Nov 2019 11:51:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574160680; bh=pA7d9ibcyBpo76n2ZOdiJPdSt0mQ/nhmdI3YFOC70Xg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=tJ7nEy3zE76pr6Rt+V9Ed0FxGOltJwrr01u5MbWEOD796wPZwDYoch272LFpPhxQE
         lSBFeC9a70qKU2NDWtTGebPC04rfeWcgv3fY+7iNyuoPgAphcfak+0dxdVqtNYpAsw
         pe1atAk4ztzygxel4gTB4rVp3rbvPG7lTGUA1M6ms7s7BXHTFMDNjqlWDUYD+yMFDg
         SWKfj++XUMfTnFpYKyS6lbgwv3l6Uj2939i8men0VsG61O/DWbGqD5vBPDQBJxGdlS
         AnxtTl3wZDWXpNrgm1eVO4R8n6VJuaeSKRZWPheTZi0EaQ9VHoMtUYmY8DZyY5tEb9
         eNhzDfaX0hPNA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/5] input/rmi4/rmi_f54: fix various V4L2 compliance problems
Date:   Tue, 19 Nov 2019 11:51:15 +0100
Message-Id: <20191119105118.54285-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITl6e8i82InOTHwXM3kdwYO2AxR8EsKQ3NIN50rAHb0nE7+NpDfx3mE0aarPKfcSasr0Ef93osdW5It+tibHUdNgekdaia7RnK1JLNhQe9ASaSRaj5Y
 01ScKcty+LNeFJk7S1KoU3uHCHNR/+GdaMmzWBexrnJQPZUBleqd1VFwyAiHcrwbjijryb0SIzJh+/W2xGnIofAyh8nccKoptJ2IxRw+4eHaVoINciU5/fmh
 uQYCUsTe1oqd//1y1LMgbJZpGVxy/vx86+7G1kdQdSKiTkDO09acp4XttZL7PEBZSHHh/y2lgAWQWtk1xlr2rXqF1UXKshBJgGpyjlzb0etJDqBE0XPFq7y+
 tUhSg0KxnAq6nkJf2uQFDKq+b2McMvnzVWvHUFmD+tVqsN7xzqyGGlKKlH+6JsKJXhVQ9hpSAkrXbw+FAUBtInmWE7pekAYhRS/+AbkWgAIru+kBPUm5qThf
 olwcCYk9h6xgzTBzYbBaB+ImNTreFf8npd3UDT5T+dh67J53wJ2Cu5wS9q4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2-compliance utility reported several V4L2 API compliance
issues:

- the sequence counter wasn't filled in
- the sequence counter wasn't reset to 0 at the start of streaming
- the returned field value wasn't set to V4L2_FIELD_NONE
- the timestamp wasn't set
- the payload size was undefined if an error was returned
- min_buffers_needed doesn't need to be initialized

Fix these issues.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/input/rmi4/rmi_f54.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 710b02595486..ebccab7a4834 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -116,6 +116,7 @@ struct f54_data {
 	struct video_device vdev;
 	struct vb2_queue queue;
 	struct mutex lock;
+	u32 sequence;
 	int input;
 	enum rmi_f54_report_type inputs[F54_MAX_REPORT_TYPE];
 };
@@ -290,6 +291,7 @@ static int rmi_f54_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 
 static void rmi_f54_buffer_queue(struct vb2_buffer *vb)
 {
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct f54_data *f54 = vb2_get_drv_priv(vb->vb2_queue);
 	u16 *ptr;
 	enum vb2_buffer_state state;
@@ -298,6 +300,7 @@ static void rmi_f54_buffer_queue(struct vb2_buffer *vb)
 
 	mutex_lock(&f54->status_mutex);
 
+	vb2_set_plane_payload(vb, 0, 0);
 	reptype = rmi_f54_get_reptype(f54, f54->input);
 	if (reptype == F54_REPORT_NONE) {
 		state = VB2_BUF_STATE_ERROR;
@@ -344,14 +347,25 @@ static void rmi_f54_buffer_queue(struct vb2_buffer *vb)
 data_done:
 	mutex_unlock(&f54->data_mutex);
 done:
+	vb->timestamp = ktime_get_ns();
+	vbuf->field = V4L2_FIELD_NONE;
+	vbuf->sequence = f54->sequence++;
 	vb2_buffer_done(vb, state);
 	mutex_unlock(&f54->status_mutex);
 }
 
+static void rmi_f54_stop_streaming(struct vb2_queue *q)
+{
+	struct f54_data *f54 = vb2_get_drv_priv(q);
+
+	f54->sequence = 0;
+}
+
 /* V4L2 structures */
 static const struct vb2_ops rmi_f54_queue_ops = {
 	.queue_setup            = rmi_f54_queue_setup,
 	.buf_queue              = rmi_f54_buffer_queue,
+	.stop_streaming		= rmi_f54_stop_streaming,
 	.wait_prepare           = vb2_ops_wait_prepare,
 	.wait_finish            = vb2_ops_wait_finish,
 };
@@ -363,7 +377,6 @@ static const struct vb2_queue rmi_f54_queue = {
 	.ops = &rmi_f54_queue_ops,
 	.mem_ops = &vb2_vmalloc_memops,
 	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
-	.min_buffers_needed = 1,
 };
 
 static int rmi_f54_vidioc_querycap(struct file *file, void *priv,
-- 
2.23.0

