Return-Path: <linux-media+bounces-50524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62942D178C1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C4CA304B3FE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCE1315760;
	Tue, 13 Jan 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y2xMHsCM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A13815C5
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295281; cv=none; b=PNq9Xa+aUc1BWPbAMSwOIAxWdVCNcKqprI/XRaxju8ZfsrZuozA8RlADTgRNPryw9knrHw7EIC72HcNPJuDzgDoUSVhBhMp4WEVjTeBVRrUCFz49cloP8aN4ZDYwfu2pTSqaOzrTricay+X2Um5ZPen7JERFQrpUAs3duLFmVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295281; c=relaxed/simple;
	bh=C2D8ZrofyoQF+2NV+5i1Wn9PVdCVY7W973Seq32HEiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOt6IaLxqiIDzrFdl+iPd/hKxIh3v7m5EXJr1fMAkBdoWMNshtEUZDGeqq3vG7Hy0w2ZBg4c5vg45L3V3xq8zPvdgF/ZyiDheMbN5W26yrn+ykihVKGH0soGvXT4XiQbZ2qeILmGPsKYTVQloTV+oHW7eoV+8oXqSonFlN3hPfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y2xMHsCM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75EAA2E0;
	Tue, 13 Jan 2026 10:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295252;
	bh=C2D8ZrofyoQF+2NV+5i1Wn9PVdCVY7W973Seq32HEiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y2xMHsCMArE5DVTBfwE1/pIGK+k+oxEbghUjV0chBAsZzrslfqPuhTs2KXc+3FSWM
	 ih27eGOMKh8qwfIzUh3mqQPU2Uopp0SzDShMGiJ46UqDgCmvzgv2tgW5f+0SPTWKnz
	 LfkceRxIoUELCEgqYEDWeAw8yE6MeAPkRdUsIKhU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:25 +0530
Subject: [PATCH 05/10] media: videobuf2: Allow exporting of a struct dmabuf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-5-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3305;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=j7qzDqakzZei+9a6emX3yapjgMO8lsfF6tpVIix0pJs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtH+lptJm6nWwFPUpR8CUfI/3bGTOPtR4oEZ
 StDFij9t9OJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLRwAKCRBD3pH5JJpx
 RaGLD/9crGSKCvfjDyfQI5Lr8R8+nDa6cgUjoczSF5D/Oek+pPFraOf0Mc7AvfoWTlRiz54KlbZ
 2XZWdmbfIZ07KvYclZKAza4lx2f63bPTqXiFKZ0fUKQaESMoRrnzBbnZ3py1WNUFt8cec6Jx+VF
 J5HckusxSmPmzCYxFt0m3tGqzLVzcTJVy9GetBzy7lIkS1THm4MEXsrDOK2Q56eX96FxpmEE5Xe
 kbmopu+R37bxjxw+6Jt09TKrqJ7375nF4BfA0FD5L/3mb07d+VCh6DEHkHyP+XrAYzhrxcLriF7
 xcruGh3U0QVahh/+pqe1y6uUkYJUHVHhv7EpCIR7dtIL6GTaM8tmUzkVshA4Bba81yykmlZ0YB7
 7u0CQwfTvnyIe454uathFBgiS7771cwKrOisAAk95S0Z+QTCYY6N96dwfVvpIzEBb7TxcZ7SqyS
 Q/VBoUUflb8f2myPQkSPk0HcuXSv/wXrkeKz8/nfhrJJVqB9abq3rJEWHV/B405nD+ASWtRkAlx
 vgrZWBkqlnPF1sX0juxTCTJKdc0pNKa520C6T/3KwIg9uyVrtZSmNQWPM/RPgxYLFadCXEvTz7+
 gyNUTPpvoyXttYmWRqZcoOIyiGJeVVqwe2G5sK9ZxPzfX+m7PKOlxdf9iFiSbbty20wQl8XL+LW
 IePgYkjQKNPAZ7A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

videobuf2 only allowed exporting a dmabuf as a file descriptor,
but there are instances where having the struct dma_buf is
useful within the kernel.

Split the current implementation into two, one step which
exports a struct dma_buf, and the second which converts that
into an fd.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 21 ++++++++++++++++++---
 include/media/videobuf2-core.h                  | 15 +++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2df566f409b65eb99fa7fbe308b8e3afe1bdcbca..f316864d99fc5c5abb2e5a27779cbc371c1a211d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2431,11 +2431,11 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   struct vb2_buffer *vb, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf)
 {
 	struct vb2_plane *vb_plane;
-	int ret;
 	struct dma_buf *dbuf;
 
 	if (q->memory != VB2_MEMORY_MMAP) {
@@ -2480,6 +2480,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 		return -EINVAL;
 	}
 
+	*dmabuf = dbuf;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
+
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
+		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+{
+	struct dma_buf *dbuf;
+	int ret;
+
+	ret = vb2_core_expbuf_dmabuf(q, type, vb, plane, flags, &dbuf);
+	if (ret)
+		return ret;
+
 	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
 	if (ret < 0) {
 		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9b02aeba41089c42b552998b49f27906dc70eeae..c75b4f14581a353d8dbe68d8bedd2b2ee86934d2 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -967,6 +967,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
  */
 int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
 
+/**
+ * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
+ * @q:         videobuf2 queue
+ * @type:      buffer type
+ * @index:     id number of the buffer
+ * @plane:     index of the plane to be exported, 0 for single plane queues
+ * @flags:     flags for newly created file, currently only O_CLOEXEC is
+ *             supported, refer to manual of open syscall for more details
+ * @dmabuf:    Returns the dmabuf pointer
+ *
+ */
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   struct vb2_buffer *vb, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf);
+
 /**
  * vb2_core_expbuf() - Export a buffer as a file descriptor.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
2.52.0


