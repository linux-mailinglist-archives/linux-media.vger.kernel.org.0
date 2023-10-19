Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6877CF969
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 14:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345719AbjJSMwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 08:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345649AbjJSMwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 08:52:35 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBA2112;
        Thu, 19 Oct 2023 05:52:33 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A17456607331;
        Thu, 19 Oct 2023 13:52:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697719952;
        bh=7foNNb6amO3+FMMwIl173lEOz6gYhJG/dA79F9jwpAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i9dS1+mQOAJtsUDP6CQAOSwd2HoajdX0VZDRle2Y/D6DE8GT/HTayhK8zFKqSUSzj
         L2oWPgKkGiR5NCLtcOF0ijNVgEjyrzEj3NyFuwwIOcTTd3oLAkJQ/eb+oCmF+Kg71X
         KMM72CakLpPkH7iBuXxHh50SGADIvjPApmjzkxY5wNMX15jDvTLI32Ig125izKAxHo
         ce9CvzVH/4bbjzLTxMiotzeTPkIZTF7toJAd5JR1WcXn4tj3dpFVSOjXyzBycS2N0c
         UE7W8N5FaFHugWkgXbCyMTq0EfQZtU8cbadNWdTSZJ5hm7l8nKzKgZDfzfrog2ebBb
         MxCtjFdUAV3gQ==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v13 02/56] media: videobuf2: Rework offset 'cookie' encoding pattern
Date:   Thu, 19 Oct 2023 14:51:28 +0200
Message-Id: <20231019125222.21370-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change how offset 'cookie' field value is computed to make possible
to use more buffers.
The maximum number of buffers depends of PAGE_SHIFT value and can
go up to 0x7fff when PAGE_SHIFT = 12.
With this encoding pattern we know the maximum number that a queue
could store so we can check it at  queue init time.
It also make easier and faster to find buffer and plane from using
the offset field.
Change __find_plane_by_offset() prototype to return the video buffer
itself rather than it index.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 73 +++++++++----------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a5e57affeb30..09be8e026044 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -31,6 +31,11 @@
 
 #include <trace/events/vb2.h>
 
+#define PLANE_INDEX_SHIFT	(PAGE_SHIFT + 3)
+#define PLANE_INDEX_MASK	0x7
+#define MAX_BUFFER_INDEX	BIT_MASK(30 - PLANE_INDEX_SHIFT)
+#define BUFFER_INDEX_MASK	(MAX_BUFFER_INDEX - 1)
+
 static int debug;
 module_param(debug, int, 0644);
 
@@ -358,21 +363,27 @@ static void __setup_offsets(struct vb2_buffer *vb)
 	unsigned int plane;
 	unsigned long offset = 0;
 
-	if (vb->index) {
-		struct vb2_buffer *prev = q->bufs[vb->index - 1];
-		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
-
-		offset = PAGE_ALIGN(p->m.offset + p->length);
-	}
+	/*
+	 * The offset "cookie" value has the following constraints:
+	 * - a buffer can have up to 8 planes.
+	 * - v4l2 mem2mem uses bit 30 to distinguish between
+	 *   OUTPUT (aka "source", bit 30 is 0) and
+	 *   CAPTURE (aka "destination", bit 30 is 1) buffers.
+	 * - must be page aligned
+	 * That led to this bit mapping when PAGE_SHIFT = 12:
+	 * |30                |29        15|14       12|11 0|
+	 * |DST_QUEUE_OFF_BASE|buffer index|plane index| 0  |
+	 * where there are 15 bits to store the buffer index.
+	 * Depending on PAGE_SHIFT value we can have fewer bits
+	 * to store the buffer index.
+	 */
+	offset = vb->index << PLANE_INDEX_SHIFT;
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		vb->planes[plane].m.offset = offset;
+		vb->planes[plane].m.offset = offset + (plane << PAGE_SHIFT);
 
 		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
 				vb->index, plane, offset);
-
-		offset += vb->planes[plane].length;
-		offset = PAGE_ALIGN(offset);
 	}
 }
 
@@ -2188,10 +2199,9 @@ EXPORT_SYMBOL_GPL(vb2_core_streamoff);
  * __find_plane_by_offset() - find plane associated with the given offset
  */
 static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
-			unsigned int *_buffer, unsigned int *_plane)
+			struct vb2_buffer **vb, unsigned int *plane)
 {
-	struct vb2_buffer *vb;
-	unsigned int buffer, plane;
+	unsigned int buffer;
 
 	/*
 	 * Sanity checks to ensure the lock is held, MEMORY_MMAP is
@@ -2209,24 +2219,15 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 		return -EBUSY;
 	}
 
-	/*
-	 * Go over all buffers and their planes, comparing the given offset
-	 * with an offset assigned to each plane. If a match is found,
-	 * return its buffer and plane numbers.
-	 */
-	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		vb = q->bufs[buffer];
+	/* Get buffer and plane from the offset */
+	buffer = (offset >> PLANE_INDEX_SHIFT) & BUFFER_INDEX_MASK;
+	*plane = (offset >> PAGE_SHIFT) & PLANE_INDEX_MASK;
 
-		for (plane = 0; plane < vb->num_planes; ++plane) {
-			if (vb->planes[plane].m.offset == offset) {
-				*_buffer = buffer;
-				*_plane = plane;
-				return 0;
-			}
-		}
-	}
+	if (buffer >= q->num_buffers || *plane >= q->bufs[buffer]->num_planes)
+		return -EINVAL;
 
-	return -EINVAL;
+	*vb = q->bufs[buffer];
+	return 0;
 }
 
 int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
@@ -2306,7 +2307,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 {
 	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
-	unsigned int buffer = 0, plane = 0;
+	unsigned int plane = 0;
 	int ret;
 	unsigned long length;
 
@@ -2335,12 +2336,10 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &vb, &plane);
 	if (ret)
 		goto unlock;
 
-	vb = q->bufs[buffer];
-
 	/*
 	 * MMAP requires page_aligned buffers.
 	 * The buffer length was page_aligned at __vb2_buf_mem_alloc(),
@@ -2368,7 +2367,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
-	dprintk(q, 3, "buffer %d, plane %d successfully mapped\n", buffer, plane);
+	dprintk(q, 3, "buffer %u, plane %d successfully mapped\n", vb->index, plane);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vb2_mmap);
@@ -2382,7 +2381,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 {
 	unsigned long offset = pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
-	unsigned int buffer, plane;
+	unsigned int plane;
 	void *vaddr;
 	int ret;
 
@@ -2392,12 +2391,10 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &vb, &plane);
 	if (ret)
 		goto unlock;
 
-	vb = q->bufs[buffer];
-
 	vaddr = vb2_plane_vaddr(vb, plane);
 	mutex_unlock(&q->mmap_lock);
 	return vaddr ? (unsigned long)vaddr : -EINVAL;
-- 
2.39.2

