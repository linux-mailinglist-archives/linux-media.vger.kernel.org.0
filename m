Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F0A17528C
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgCBENP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:13:15 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38428 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbgCBENP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:13:15 -0500
Received: by mail-pj1-f68.google.com with SMTP id a16so3520292pju.3
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JCmxjKYr6h+HQkJ8I2sAt9HA3Gj5LCEzRtahfHgdo0A=;
        b=dvSjq7Zw/Qc5F8sFmiaMtJkkUXhJhepVHY2UABgyeaMKBuNgDzwVtU68FnJijUdrMQ
         WmBiIWa7qp+6yC1mTg+ZFE0LqEybSHbuC+TOmGZ83GdhiFOvOuowkiKC+eXkPH2v1zsk
         q8K9wZwejOY3M98hsOW8Y8SVJxtMyMRXvnokE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JCmxjKYr6h+HQkJ8I2sAt9HA3Gj5LCEzRtahfHgdo0A=;
        b=gONer4ecTkLexRFnlFZJTMXuC3lwpRXe7Qv0A/LeQGhpw4yxUTs+4W0QUmAINKqkwh
         Zi+WSUiT3mpcSQCDWVeolCDsHDoypUqp34Qgea0pacmzcXiRW7jciDrIYTyFeci/sya9
         IMp/unU0A9aUQtBZDJkuRtCB71sjrxP1sDYld6zKkMbVStk4MYelVzKSMgamfaAShN18
         WF+aIMdccWTKeqhT8Fbm9pGvKgbqA0L8pbxptbtCj1h+WFTSqiwpVSy87MZ3VBGS4+u/
         8hGd1svFpwBp42SlxUyMwJxyKsH5D0A+oac9ilUjr6dTzvZQeLXoa+ATFy69Fh3E9Utv
         W31w==
X-Gm-Message-State: APjAAAVfLqXZ1yJ/5VB2ZEPpq1Yqq5VjARLyhgkP8FnVrYHw2nICqTp3
        +h7SzC4vOJrnI0C+9t143jDugzUIh98=
X-Google-Smtp-Source: APXvYqy4WoGZXuS24GnnShv66EtDO3MG/qipYpf7F76NoK5QMZG39PHMDR+xMttQy4YKpzrD4GK2bQ==
X-Received: by 2002:a17:90a:c301:: with SMTP id g1mr18799146pjt.88.1583122394164;
        Sun, 01 Mar 2020 20:13:14 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:13:13 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 09/11] videobuf2: add begin/end cpu_access callbacks to dma-contig
Date:   Mon,  2 Mar 2020 13:12:11 +0900
Message-Id: <20200302041213.27662-10-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
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
2.25.0.265.gbab2e86ba0-goog

