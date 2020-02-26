Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210DE16FD26
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgBZLQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:16:22 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54293 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgBZLQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:16:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id dw13so1124139pjb.4
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JCmxjKYr6h+HQkJ8I2sAt9HA3Gj5LCEzRtahfHgdo0A=;
        b=lw0yY2Qor//ZEUu1GpyfA2emUMnuSoecVy9q8cJzKNy2GUuZwK16AIKpL4A5Czlo90
         KeHG1xGlmhagCJhp6nThjt3QE0uu83oA5EekEoMuVn+WeSzaM64/yGzyiw5/oVt0UVhC
         2f4qYBy8qEx4Cw7EN8DVkuIpdeoeJl5mmmcm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JCmxjKYr6h+HQkJ8I2sAt9HA3Gj5LCEzRtahfHgdo0A=;
        b=IUhELBnClSawZWftoK93LbkinBQg/eHoaIKJNIr16ABTaVXBc/CuZMU/PIpPsMynf8
         kLDOAXIG5DJqWnCeCKk7k8hwYUL4rOMvDGjN6AcuiBguZNZHzv4lAnUKdAu8ln4tOt7T
         79BsXOMWaDKLW7ZBwR62hovhS0tI4sEqT3VhQPcD14PFkp/IUt4U+fy52c4MF44DTaK0
         cx9iNMp/gFx+8wNZQRfsnlyiddiO6mPLszALVTm/5ZmeFZbh3Q7/FI+pVVWscOWfdEYp
         Z30KpJxFplDcZMFlOyoTihyUp3p+lGKdHsnzy86FKXCjSKc7l2asbP7x3wHapFJw9v3y
         lxlg==
X-Gm-Message-State: APjAAAVFw8cn0KrecOtcrP3e1XbNKQjZtQ/sVfGbk+qjA5Cz2W7x+piJ
        RLCbKo8pRKmsCwuSP+bL0tNN8Q==
X-Google-Smtp-Source: APXvYqxtS5WDiX+fS/IvZhS9qTmEMxpoSGMWZO9YA9VURvHi53gevzaMm9d7V9HHbkgzuOKa50WCUw==
X-Received: by 2002:a17:90a:178f:: with SMTP id q15mr4767582pja.132.1582715779415;
        Wed, 26 Feb 2020 03:16:19 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:16:18 -0800 (PST)
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
Subject: [PATCHv3 09/11] videobuf2: add begin/end cpu_access callbacks to dma-contig
Date:   Wed, 26 Feb 2020 20:15:27 +0900
Message-Id: <20200226111529.180197-10-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
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

