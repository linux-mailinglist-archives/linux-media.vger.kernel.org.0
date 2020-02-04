Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34787151465
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgBDC51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:27 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36844 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbgBDC5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:25 -0500
Received: by mail-pl1-f195.google.com with SMTP id a6so6651134plm.3
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QggxwG9xXj9/Y8aTLUoH0ga4g8iQi+a/2zxkwKUkbVk=;
        b=XVafVv2FGd5SwvcOmpasGzgMAcJ0QWnLsWBGTqB9pizESHAispXx4sC7Jb10NDMUYo
         H2OK7XfQiWozQxXr5Ewhm3UycEJTq0kdAH2QB+8JHzciaEJTVx/sS21Pag1mdLwtNKD0
         8z4VHvNvtsFWkqfB5taldMN3QBu50CAZzJQZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QggxwG9xXj9/Y8aTLUoH0ga4g8iQi+a/2zxkwKUkbVk=;
        b=Ax+BHAJt1RCWRThrj/6GU1XEFQsSAsa8BKkD7wm7quOmRZSocl9z3e9l4Pp/THn9LL
         BZ+S5Xt8/yKULTNnkEDU4S6bNYwtUO4JZKeTDA4thcL593fkg8kB8OFLzB+ralMvCPPR
         ATtwysszX33erUu92wUqWC39jJNiIxHYIVNwdEd+yTiajlak6SAVSadU8+OChn2UiQqO
         nvJGTYMW7C/MhJuLsrEzVDRM+1YgM0xw7FxvvUhpDDW6kN4TJEBGFa7WHpl3qs8o3vG3
         hYwssvFg+MR2YhiGMtjLJK+75Fp0onB97q2iYMKXYB7a20feKRur/zou7sDMA44MziiO
         /27g==
X-Gm-Message-State: APjAAAV09Q3iWexenkCr4iWjvmBai14SbG/0uL+NnPJKk+v0YhnEq4va
        tHuEOsYYiNiMlo2Q46WFDQspag==
X-Google-Smtp-Source: APXvYqw4EPSp/jHl1ZP1MjHFiCpedVdzBc7i6MSfYRUBK4L0qMuQu2sYSCzXYdECmOkCL1RgPljgCA==
X-Received: by 2002:a17:902:8d94:: with SMTP id v20mr17785871plo.259.1580785044745;
        Mon, 03 Feb 2020 18:57:24 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:24 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 10/12] videobuf2: add begin/end cpu_access callbacks to dma-contig
Date:   Tue,  4 Feb 2020 11:56:39 +0900
Message-Id: <20200204025641.218376-11-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide begin_cpu_access() and end_cpu_access() callbacks for
cache synchronisation on exported buffers.

The patch also adds a new helper function - vb2_dc_buffer_consistent(),
which returns true is if the buffer is consistent (DMA_ATTR_NON_CONSISTENT
bit cleared), so then we don't need to sync anything.

Change-Id: I653ee20302014920b4705f3eba27c0b1232ab89d
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index d0c9dffe49e5..a387260fb321 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -42,6 +42,11 @@ struct vb2_dc_buf {
 	struct dma_buf_attachment	*db_attach;
 };
 
+static inline bool vb2_dc_buffer_consistent(unsigned long attr)
+{
+	return !(attr & DMA_ATTR_NON_CONSISTENT);
+}
+
 /*********************************************/
 /*        scatterlist table functions        */
 /*********************************************/
@@ -335,6 +340,32 @@ static void vb2_dc_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dc_put(dbuf->priv);
 }
 
+static int vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
+					      enum dma_data_direction direction)
+{
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (vb2_dc_buffer_consistent(buf->attrs))
+		return 0;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
+static int vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
+					    enum dma_data_direction direction)
+{
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (vb2_dc_buffer_consistent(buf->attrs))
+		return 0;
+
+	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
 static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_dc_buf *buf = dbuf->priv;
@@ -353,6 +384,8 @@ static const struct dma_buf_ops vb2_dc_dmabuf_ops = {
 	.detach = vb2_dc_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dc_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dc_dmabuf_ops_unmap,
+	.begin_cpu_access = vb2_dc_dmabuf_ops_begin_cpu_access,
+	.end_cpu_access = vb2_dc_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dc_dmabuf_ops_vmap,
 	.mmap = vb2_dc_dmabuf_ops_mmap,
 	.release = vb2_dc_dmabuf_ops_release,
-- 
2.25.0.341.g760bfbb309-goog

