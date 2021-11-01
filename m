Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33272441CE7
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhKAO4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45917 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232066AbhKAO4i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 10:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635778445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7ISs7EefDF5uiagq0aKtXfCNxbviccDhG5YZZxCAiEQ=;
        b=JiTOi5mFEZ0N5HbeYvVlRfEK9DiwapJBJxPBIzKYOhV4tbroGXOViMxg/vTdsOn2fYpzrm
        fHNydGHegHz5MZl1XDDG0Nz0C/DiOgK0yk9Na4o9B1l0SJ3PuR2UV3TVGhIb3rk5cgf1kb
        fRoFHor1heYGdQGkFLgTvkir/H+XfZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-JjKey9Q7OaS3E2lB6WRRkA-1; Mon, 01 Nov 2021 10:54:00 -0400
X-MC-Unique: JjKey9Q7OaS3E2lB6WRRkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A70071006AA8;
        Mon,  1 Nov 2021 14:53:58 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.151])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9514E69C9E;
        Mon,  1 Nov 2021 14:53:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH media-staging regression fix] media: videobuf2-dma-sg: Fix buf->vb NULL pointer dereference
Date:   Mon,  1 Nov 2021 15:53:55 +0100
Message-Id: <20211101145355.533704-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
added a new vb member to struct vb2_dma_sg_buf, but it only added
code setting this to the vb2_dma_sg_alloc() function and not to the
vb2_dma_sg_get_userptr() and vb2_dma_sg_attach_dmabuf() which also
create vb2_dma_sg_buf objects.

This is causing a crash due to a NULL pointer deref when using
libcamera on devices with an Intel IPU3 (qcam app).

Fix these crashes by assigning buf->vb in the other 2 functions too,
note libcamera tests the vb2_dma_sg_get_userptr() path, the change
to the vb2_dma_sg_attach_dmabuf() path is untested.

Fixes: a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 33ee63a99139..0452ed9fac95 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -241,6 +241,7 @@ static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
 	buf->offset = vaddr & ~PAGE_MASK;
 	buf->size = size;
 	buf->dma_sgt = &buf->sg_table;
+	buf->vb = vb;
 	vec = vb2_create_framevec(vaddr, size);
 	if (IS_ERR(vec))
 		goto userptr_fail_pfnvec;
@@ -642,6 +643,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->size = size;
 	buf->db_attach = dba;
+	buf->vb = vb;
 
 	return buf;
 }
-- 
2.31.1

