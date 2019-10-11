Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF87D3C69
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbfJKJds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:33:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJKJds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:33:48 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AAF2D290D6A;
        Fri, 11 Oct 2019 10:33:46 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RESEND PATCH v2 1/4] media: vb2: Add a helper to get the vb2 buffer attached to a request
Date:   Fri, 11 Oct 2019 11:33:39 +0200
Message-Id: <20191011093342.3471-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011093342.3471-1-boris.brezillon@collabora.com>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vb2_request_get_buf() returns the N-th buffer attached to a media
request.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* Adjust the kernel doc as suggested by Hans
---
 .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++++++++
 include/media/videobuf2-core.h                | 11 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..c4c7980dcb0d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1416,6 +1416,29 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
 }
 EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
 
+struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
+				       unsigned int n)
+{
+	struct media_request_object *obj;
+	struct vb2_buffer *buf = NULL;
+	unsigned int nbufs = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&req->lock, flags);
+	list_for_each_entry(obj, &req->objects, list) {
+		if (!vb2_request_object_is_buffer(obj) ||
+		    nbufs++ < n)
+			continue;
+
+		buf = container_of(obj, struct vb2_buffer, req_obj);
+		break;
+	}
+	spin_unlock_irqrestore(&req->lock, flags);
+
+	return buf;
+}
+EXPORT_SYMBOL_GPL(vb2_request_get_buf);
+
 int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
 {
 	struct vb2_buffer *vb;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 640aabe69450..d363476712dd 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1222,4 +1222,15 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
  */
 unsigned int vb2_request_buffer_cnt(struct media_request *req);
 
+/**
+ * vb2_request_get_buf() - return the buffer at index @idx
+ *
+ * @req:	the request.
+ * @n:		search for the Nth buffer in the req object list
+ *
+ * Return a vb2 buffer or NULL if there's no buffer at the specified position
+ */
+struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
+				       unsigned int n);
+
 #endif /* _MEDIA_VIDEOBUF2_CORE_H */
-- 
2.21.0

