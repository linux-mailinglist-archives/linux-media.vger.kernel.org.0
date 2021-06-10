Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346CC3A2A64
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhFJLiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:24 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56353 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230450AbhFJLiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz1lXjTL; Thu, 10 Jun 2021 13:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324983; bh=IQA0zSZGm4wQ6dZbo5ivFXUk/IFeej2CpRbZMp/0/KI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=gcxbq4YFgtTcdvxd63u5VdJYnB39DDDlh4uoXQKQWhJZ/+LSe5NHeAUWl7VguIfoY
         ABjqS8zDjwsXZeCL/2ohWCwAIV6CsGY7A9mf+x/oOgWAwLeuwchlb7Gvpxtz8kPbYD
         PiouYx/X2pNaYY/8Zr+cYLV6fFMEJeptZmbjdEgwWIJdORFR6hlf+X4GLFOWYOc0am
         O3NvpnJo2hhAgFgc++as4yOhSvUIZTGk0qPEXaQdJ3oJ5n6rtMwoGYGvw9/JaSP1lh
         iuCuB6KUo3NDyK1D7q5+wPHMXRDk8NU8QCc1H1h7Zn0h8wT6PAZ783v0GCax14zH0s
         2lF2D37oqvKPw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 06/11] videobuf2-core: add vb2_request_buffer_first()
Date:   Thu, 10 Jun 2021 13:36:10 +0200
Message-Id: <20210610113615.785359-7-hverkuil-cisco@xs4all.nl>
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

Add the vb2_request_buffer_first() helper function to obtain the
first vb2 buffer in the request.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-core.c   | 19 +++++++++++++++++++
 include/media/videobuf2-core.h                |  7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 10c552638878..3157fefe6500 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1477,6 +1477,25 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
 }
 EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
 
+struct vb2_buffer *vb2_request_buffer_first(struct media_request *req)
+{
+	struct media_request_object *obj;
+	struct vb2_buffer *vb = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&req->lock, flags);
+	list_for_each_entry(obj, &req->objects, list) {
+		if (vb2_request_object_is_buffer(obj)) {
+			vb = container_of(obj, struct vb2_buffer, req_obj);
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&req->lock, flags);
+
+	return vb;
+}
+EXPORT_SYMBOL_GPL(vb2_request_buffer_first);
+
 int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
 {
 	struct vb2_buffer *vb;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 0760f967365a..f508ce6b3152 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1258,4 +1258,11 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
  */
 unsigned int vb2_request_buffer_cnt(struct media_request *req);
 
+/**
+ * vb2_request_buffer_first() - return the first buffer in the request
+ *
+ * @req:	the request.
+ */
+struct vb2_buffer *vb2_request_buffer_first(struct media_request *req);
+
 #endif /* _MEDIA_VIDEOBUF2_CORE_H */
-- 
2.30.2

