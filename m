Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929483DA46B
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbhG2Ngh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:36:37 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57879 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237569AbhG2Ngf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:36:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 96D5mV4p4XTlc96D6mWuNO; Thu, 29 Jul 2021 15:36:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627565788; bh=zONAtePxRAqoT/SF1ePsWsWoQYDFACX6TfzVmWlASF4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=oeDWfabecqVZ+crZPoiHyDpsqo37WoRcnzvU03uNiS3yAr73uiZj1Hdl5rMosKCt3
         3rJjADbRfarBi+QCg2DqM7ltZ+QenzhLLN4yMtf2/gN3pxagIrG6GoSYy/yxsoclY+
         QPaktgQtT2FVueh3U8iK3qLHgAmIHZ2eCgnoiONqNsGNxsRMHdyLtA7oEHDGivUOiD
         5R2BXngGHzFa9ubTeC0LDasJ2MlkBNtpxRPSXDJZBlZn3QnBWfibiUDYUI2L0snwN5
         DXN5mbeJ3pnF8lFXIPGmWxs6ZuXJ9WmRjJkodj/pu9MyiTvGh3mSrNZtD4P8EueW9z
         Zg10O1pirQNhg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 3/3] videobuf2-core: sanity checks for requests and qbuf
Date:   Thu, 29 Jul 2021 15:36:27 +0200
Message-Id: <20210729133627.1592672-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
References: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGO50jq3zq15EklNILRdBPqiw3bRBKS+KTHcK5dj5eI2gxDuY+hjCkw5SSO5mN490Q939bLx8p8FD5SUNfS8NVrDTi2JiqDDJMYKH1QZ+VTOXGbILlq8
 RG4j1C/sA6iK2rsLmCsjMWxHRRLpMtyE00+TFKsoDpregSTXXCdpw+aGQJHDIapUHDo/x2XM1cNrKlrNXWAzbWeP0aEjHW5uxjNA8166MZRcqMHJ4jBgdgqj
 D3/wq0A+nSevuypcSzy1syzmPcZSyY0FP1MG+rTt6xLV/el6Tv/gLVGbQCq3UGDVW83NWK7mIzxLjguJZk1U4wuAOWswDo6OyM3Wfl7hv8jRPRQB64SdkjCW
 irUDwhZrTlG1zdljlkHnv1aNkPzQDQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of supports_requests == 1 and min_buffers_needed > 0
is not allowed, WARN on that and return an error.

Also check that if vb2_core_qbuf() is called from req_queue, that it
doesn't return an error, unless it is -EIO.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 02281d13505f..3f0e816472d8 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1421,9 +1421,19 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 static void vb2_req_queue(struct media_request_object *obj)
 {
 	struct vb2_buffer *vb = container_of(obj, struct vb2_buffer, req_obj);
+	int err;
 
 	mutex_lock(vb->vb2_queue->lock);
-	vb2_core_qbuf(vb->vb2_queue, vb->index, NULL, NULL);
+	/*
+	 * There is no method to propagate an error from vb2_core_qbuf(),
+	 * so if this returns a non-0 value, then WARN.
+	 *
+	 * The only exception is -EIO which is returned if q->error is
+	 * set. We just ignore that, and expect this will be caught the
+	 * next time vb2_req_prepare() is called.
+	 */
+	err = vb2_core_qbuf(vb->vb2_queue, vb->index, NULL, NULL);
+	WARN_ON_ONCE(err && err != -EIO);
 	mutex_unlock(vb->vb2_queue->lock);
 }
 
@@ -2331,6 +2341,17 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->requires_requests && !q->supports_requests))
 		return -EINVAL;
 
+	/*
+	 * This combination is not allowed since a non-zero value of
+	 * q->min_buffers_needed can cause vb2_core_qbuf() to fail if
+	 * it has to call start_streaming(), and the Request API expects
+	 * that queueing a request (and thus queueing a buffer contained
+	 * in that request) will always succeed. There is no method of
+	 * propagating an error back to userspace.
+	 */
+	if (WARN_ON(q->supports_requests && q->min_buffers_needed))
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
 	spin_lock_init(&q->done_lock);
-- 
2.30.2

