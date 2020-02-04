Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321AC151467
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgBDC53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:29 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34730 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbgBDC53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:29 -0500
Received: by mail-pf1-f194.google.com with SMTP id i6so8690717pfc.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8h+I8oxNIcMrbLvsm+8Df46AS8oNWipq59orM6/5OoQ=;
        b=Qb+Op0063itwM7zF2RFmjrsNv3YJmj5LgRFLABUotYSOIhCarSuW8fKd+TFe9XAhyi
         y1ZRx1+0rv6FfLP0lVijNYckb3zEXXivjrOQaNC4SBXY5Dv0OvJxacxjg90Y2rMqYSk4
         JfoBGGHHMGDkDOmZFLdXGlhmgp73izBpnIVP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8h+I8oxNIcMrbLvsm+8Df46AS8oNWipq59orM6/5OoQ=;
        b=rHT2y3SHU6i7wfQIJvIhwHy2GtFEVb8GJxGpwDZGTAIkDPq4y5IQcUSV3kbGx0ZFhH
         YKDPMIZC2kEJZfXxyajXGTgxac5ELvuez0TnuA4V1dChckm4L8scu7JF2fQxdRDYA7dL
         7sPJZ4VUH5ci6ujRL1HIhVWvOn9daF1Pc01NSv0K3G3hopak92UUmPLlc/qIxAg86ZB5
         IicA/n2bpl4mFX8q25kzdpKzn4QsjdfRxotgmQ+aXsUZ0ZqtwJCqJ7VBd3Wt5/Dnq1Dm
         uuPrbQV2pWYHY3k4I5jHEo8HP2lNmndfMJHrv79DMpYxkUoJu2vx3JbcRv7EGiF/CGYy
         ZHBg==
X-Gm-Message-State: APjAAAXoZym67yX3eUEQ5z7bWfQnET0w3LWNaFy0H7+lGmOscEsFnkZm
        dbxaDZxo+qj11U8Oa3sFyT4lFA==
X-Google-Smtp-Source: APXvYqxu/ATw/8OV8+fM2uhq19GOMnYoGMlei5elIfGBc5xRNveJHWeIEJNo6C01L8N+dDLi+C7fvw==
X-Received: by 2002:a63:f57:: with SMTP id 23mr18739474pgp.46.1580785048241;
        Mon, 03 Feb 2020 18:57:28 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:27 -0800 (PST)
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
Subject: [RFC][PATCHv2 11/12] videobuf2: add begin/end cpu_access callbacks to dma-sg
Date:   Tue,  4 Feb 2020 11:56:40 +0900
Message-Id: <20200204025641.218376-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
callbacks for cache synchronisation on exported buffers.

V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
dma-sg allocates memory using the page allocator directly, so
there is no memory consistency guarantee.

Change-Id: Ia0d9d72a8c2a9fe3264ac148f59201573289ed2c
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 6db60e9d5183..bfc99a0cb7b9 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dma_sg_put(dbuf->priv);
 }
 
+static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
+					enum dma_data_direction direction)
+{
+	struct vb2_dma_sg_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
+static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
+					enum dma_data_direction direction)
+{
+	struct vb2_dma_sg_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
 static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
@@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.detach = vb2_dma_sg_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
+	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
+	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
-- 
2.25.0.341.g760bfbb309-goog

