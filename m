Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF3297C6CB2
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 13:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378297AbjJLLqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 07:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343858AbjJLLqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 07:46:53 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88FF0A9;
        Thu, 12 Oct 2023 04:46:51 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C82406607346;
        Thu, 12 Oct 2023 12:46:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697111210;
        bh=cMzVFA9/TUVo9VWr/5JcyqG4OOKgwWqTUUieq9IONwI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d5VYelndvKS9apDVWUIKnJDTC/LhhIBeTGDA9MCyEcBjx8JxmZG44Z+KRW1iKezgx
         hT+0k31ZtmSB4GRp4XSVomidcSrV7svZFsWD9NWOU4WBgCJWkYaiy8d8flhPlgcfnD
         lpZKNSO0qxOfHGdufAUHhmQ2jIA+62ZbInopNcSyJVVSGWAov6DU/W2UZrBJsKn5Zb
         eQJ4sfBNWXAUzGS4gGpxnlFXBQC6f8ePTaDhghtE6sCwOB7nafEcvKftOkLoLaMv7H
         OKGeCmxpiwDqKmiR1+UvwPu3ZgIgIIQyfwJnD7Gmb4V4/1pyx5HJqa+WBBaNy0zRWA
         VeRQ5lAdZU/hA==
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
Subject: [PATCH v11 01/56] media: videobuf2: Rename offset parameter
Date:   Thu, 12 Oct 2023 13:45:47 +0200
Message-Id: <20231012114642.19040-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename 'off' parameter to 'offset' to clarify the code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 27aee92f3eea..a5e57affeb30 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -356,23 +356,23 @@ static void __setup_offsets(struct vb2_buffer *vb)
 {
 	struct vb2_queue *q = vb->vb2_queue;
 	unsigned int plane;
-	unsigned long off = 0;
+	unsigned long offset = 0;
 
 	if (vb->index) {
 		struct vb2_buffer *prev = q->bufs[vb->index - 1];
 		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
 
-		off = PAGE_ALIGN(p->m.offset + p->length);
+		offset = PAGE_ALIGN(p->m.offset + p->length);
 	}
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		vb->planes[plane].m.offset = off;
+		vb->planes[plane].m.offset = offset;
 
 		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
-				vb->index, plane, off);
+				vb->index, plane, offset);
 
-		off += vb->planes[plane].length;
-		off = PAGE_ALIGN(off);
+		offset += vb->planes[plane].length;
+		offset = PAGE_ALIGN(offset);
 	}
 }
 
@@ -2185,9 +2185,9 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
 EXPORT_SYMBOL_GPL(vb2_core_streamoff);
 
 /*
- * __find_plane_by_offset() - find plane associated with the given offset off
+ * __find_plane_by_offset() - find plane associated with the given offset
  */
-static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
+static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 			unsigned int *_buffer, unsigned int *_plane)
 {
 	struct vb2_buffer *vb;
@@ -2218,7 +2218,7 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
 		vb = q->bufs[buffer];
 
 		for (plane = 0; plane < vb->num_planes; ++plane) {
-			if (vb->planes[plane].m.offset == off) {
+			if (vb->planes[plane].m.offset == offset) {
 				*_buffer = buffer;
 				*_plane = plane;
 				return 0;
@@ -2304,7 +2304,7 @@ EXPORT_SYMBOL_GPL(vb2_core_expbuf);
 
 int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 {
-	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
+	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
 	unsigned int buffer = 0, plane = 0;
 	int ret;
@@ -2335,7 +2335,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, off, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
 	if (ret)
 		goto unlock;
 
@@ -2380,7 +2380,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 				    unsigned long pgoff,
 				    unsigned long flags)
 {
-	unsigned long off = pgoff << PAGE_SHIFT;
+	unsigned long offset = pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
 	unsigned int buffer, plane;
 	void *vaddr;
@@ -2392,7 +2392,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, off, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
 	if (ret)
 		goto unlock;
 
-- 
2.39.2

