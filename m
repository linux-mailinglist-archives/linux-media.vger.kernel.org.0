Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07563A2A65
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhFJLiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:24 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47265 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230453AbhFJLiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz1lXjTb; Thu, 10 Jun 2021 13:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324983; bh=UWPpr148bvjhhxY0nTUxxn5XcRoR5N8SWUhjvOYIvHA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=m9PQvTIQ8pPWHeOMyhMZSKoAhy1/qneu1wTFhW2BQ+usKyWGyKwICu5cjWxehRMx2
         DxLAw+SRVj95ELc7yvr5wjmCPtipkUjXAfmgQEfVafMcx0V1wb9AoGvuo49pAwOPcY
         HFvGxeS9Qm1/d0l9zavaUTSVVIRRgVtdv29JI1rn47RZpMA5tzmnE47MGmhNCvzU6q
         zUV88pfMBxwbBEbmjUowY1BfEOqpbrKlUZ82NU02Ni0SMjQAkltxWNf3rG69uZmNJF
         iWU1+suZJVSK6wzGzofMLikuEp043PoIGqSs+tYyBrINxemqnb+JJoBgzihT7FLTbe
         5pUnEPWVHd74Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 07/11] videobuf2-v4l2.c: vb2_request_validate: support RO requests
Date:   Thu, 10 Jun 2021 13:36:11 +0200
Message-Id: <20210610113615.785359-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOQXvprzNOxv3dllV8tYfCqFEZTxHVPvxwWq5j8/dztnYXnbIicoUV+916/WWo0LY09C7617zTll/A7TMa6JUFvfEI1cabtbfthGymVXA0bj0OTVGvmw
 32gLTaZy4XaVSdDIhHJ6fkbG0mBttYK1ToKmZsQiTpwbb1XalHZWI/3X9wdNyTVrYY0q1yIwAI7Rb4+ieozrulYufEwfhUnekUPcIgNxExwxp4q3Nf2X5c42
 Leobpu8kZOX3ZFgSPlwyQnR4MT9ODGPWxWTbdyBSUfGs8zs2LXF/FtbQ+IUiyMjxY9WV/zcClPUmxYcBDI+z34stHLy+n15SyLqaZLNMQGCn+veDXqRp+Ut/
 2b7QvzCsLz/EIQObz+K1JoGhVoC7JwavZrfwg1CpwTsujvZCyWFfDfllN8TalhXPKy6EvvvF
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the vb2_queue for which the request is validated only supports
read-only requests, then check if non-buffer objects are in the
request and return -EINVAL if that is the case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index c63ee7bc3331..93897c3f32e9 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1278,12 +1278,20 @@ EXPORT_SYMBOL_GPL(vb2_ops_wait_finish);
 int vb2_request_validate(struct media_request *req)
 {
 	struct media_request_object *obj;
+	struct vb2_queue *q = NULL;
+	bool buffers_only = true;
 	int ret = 0;
 
-	if (!vb2_request_buffer_cnt(req))
-		return -ENOENT;
-
 	list_for_each_entry(obj, &req->objects, list) {
+		if (!vb2_request_object_is_buffer(obj)) {
+			buffers_only = false;
+		} else if (!q) {
+			struct vb2_buffer *vb;
+
+			vb = container_of(obj, struct vb2_buffer, req_obj);
+			q = vb->vb2_queue;
+		}
+
 		if (!obj->ops->prepare)
 			continue;
 
@@ -1292,6 +1300,11 @@ int vb2_request_validate(struct media_request *req)
 			break;
 	}
 
+	if (!q)
+		ret = -ENOENT;
+	else if (q->supports_ro_requests && !buffers_only)
+		ret = -EINVAL;
+
 	if (ret) {
 		list_for_each_entry_continue_reverse(obj, &req->objects, list)
 			if (obj->ops->unprepare)
-- 
2.30.2

