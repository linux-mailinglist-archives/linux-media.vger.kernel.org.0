Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EEC3D9FA3
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 10:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbhG2Ifj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 04:35:39 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42203 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234256AbhG2Ifj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 04:35:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 91VtmPug3XTlc91VvmVy2p; Thu, 29 Jul 2021 10:35:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627547735; bh=Ue1zopA3Q7nEEmULQEYDioU4bsdTS8KlTMMNlq+oS+0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZWHLisgI1lIT2nskJig8IL5xx8EmN3EXFvusOvE/g/7PheFlJpnx4P/s+vXOyh2Mp
         JVl0X9DTsv3DQ53J0n8sYiAypyN3ynYA/Y1bLZE4LP0A/vgbTMU2Xu6FWZWRaeHqwe
         k96MPZYGBGltquQJs4yeCFbAlRHBvJyATjoPJfEA6oV3UEU6FknQadXaPC5vIzPeWJ
         JwJBLctC2YnvlU58NArpNhhmFL8+SkzSr2kMOuFG17A7T0vO240wRpas/XYTxVAS82
         Pfvl5iPZQ3nE9iMqNb940pgMP9l/9Gj4M7QLEsksB0EFHMPEA7bq2PTM/lHgXtNtx/
         6PD7yLa3r1tSg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.14] videobuf2-core: dequeue if start_streaming fails
Message-ID: <542319b4-387b-6e29-db72-998de02ae4b4@xs4all.nl>
Date:   Thu, 29 Jul 2021 10:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBVbGcNXRjC8U7YFq1gq4leS7HR39JwioZsvJ8v4cEUfbUG00NCO95cDTw0myJ3mPxP1vu3f0kjaX486dDKNCEw1LVrdnw2wwYaBuHY1PJzTWjgai3LZ
 ktxyzPdqvvwbnBTS7qaiA+3syRIG9Tnzi9lPOfOL7kgNx+29lyckTgC3noIVbZm3PIHXD5M5DMR4uKY6tJFNmNCaa7rkEFKcuEJI1VuAtg+2iVdkz+zEhk2I
 v3ciW3LdEWRkvrcRAtNCGaNuLWgjlK/OwKZWmFOmhibI9VteAM3A9pvKs17AvgIjaIQmoO0g4q6VEyJemT8NZPPHxGbNT2tMqkj3hV2oMNomvSNTyhhESxBI
 21Wr9hXTLgqT0nazSZzWLxeutwpQT37e+sVQfoCzqJNXidsvhrU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a vb2_queue sets q->min_buffers_needed then if the number of
queued buffers reaches that number vb2_core_qbuf() will call
the start_streaming() callback. If that returns an error, then that
was just returned, but that left the buffer still queued. But userspace
expects that if VIDIOC_QBUF fails, the buffer wasn't queued.

So if start_streaming() fails, then remove the buffer from the queue,
thus avoiding this unwanted side-effect.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Fixes: b3379c6201bb ("[media] vb2: only call start_streaming if sufficient buffers are queued")
---
 drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 02281d13505f..508ac295eb06 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1573,6 +1573,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 		  struct media_request *req)
 {
 	struct vb2_buffer *vb;
+	enum vb2_buffer_state orig_state;
 	int ret;

 	if (q->error) {
@@ -1673,6 +1674,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 	 * Add to the queued buffers list, a buffer will stay on it until
 	 * dequeued in dqbuf.
 	 */
+	orig_state = vb->state;
 	list_add_tail(&vb->queued_entry, &q->queued_list);
 	q->queued_count++;
 	q->waiting_for_buffers = false;
@@ -1703,8 +1705,17 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 	if (q->streaming && !q->start_streaming_called &&
 	    q->queued_count >= q->min_buffers_needed) {
 		ret = vb2_start_streaming(q);
-		if (ret)
+		if (ret) {
+			/*
+			 * Since vb2_core_qbuf will return with an error,
+			 * we should return it to state DEQUEUED since
+			 * the error indicates that the buffer wasn't queued.
+			 */
+			list_del(&vb->queued_entry);
+			q->queued_count--;
+			vb->state = orig_state;
 			return ret;
+		}
 	}

 	dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);
-- 
2.30.2

