Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C97112228D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfLQDV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:21:27 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37568 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbfLQDV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:21:27 -0500
Received: by mail-pl1-f196.google.com with SMTP id c23so5418919plz.4
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7BgC38Q++csLgKFC6p+4OJvyrlb3C/SOyZ7s22Frw0=;
        b=D6qNRxrNiByaYF3P2krgxc9qaMsAGuWOVyPKI+3IaZScIOd1bmthdyxh6cUySj7BoJ
         Gt7WM70dDxw55NQLonwaLHDv5sAiNSlwcxBtiFYufj7u47QEpb+59IChUhHUkRgUS5ku
         +IedKtqVE5v5xywRdfu1HByIpKnlv1C6JO1ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7BgC38Q++csLgKFC6p+4OJvyrlb3C/SOyZ7s22Frw0=;
        b=ZVZ5RQEB2DrDktFBM1XLaMrB8/OeJpgZ0AY00Fx9mmrijxC3BswHkvLeExAbDcXWMJ
         Jqv1NLZ5kgaNZAlSV0cmXGvtN+PItbZ32vI420jYMEMJzWfLLvNBx6qSKThJn9M+phBV
         Ptevkt0xaJ3fVuGC50ejDsQh2MDtWBetqn5Tc5yVVgNgTCmP/o7O74GfFM1/KbeYgpn3
         ogNXbussdUs3aPcYtpbNWBPVFDt5+fdfpaZQgYODl3rDRWKZVUu2zeN3svoHDVSSjd2g
         JLC3U1PxtCQjpmms6+CKO6iSk7UvU0b3FznEwNlT31H2Q7zSXNB4RmqJTsI9RZl9yXht
         3bdQ==
X-Gm-Message-State: APjAAAXx7TwkuQ+SMqaru6FOj0Kjcc2xEopMM4W6jPjNFUsJO2O/eU0R
        P8LXuwwUol4c+KOpDYsgFDLnig==
X-Google-Smtp-Source: APXvYqzG2MAqV6YaHs0r4AKBZp8nz4G5wu16YR6deYslM0U/r044lJfXdUNlSJk7wL5nlXggt+GmlQ==
X-Received: by 2002:a17:902:b418:: with SMTP id x24mr20126099plr.85.1576552885537;
        Mon, 16 Dec 2019 19:21:25 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:21:25 -0800 (PST)
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
Subject: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks to dma-sg
Date:   Tue, 17 Dec 2019 12:20:31 +0900
Message-Id: <20191217032034.54897-13-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
callbacks for cache synchronisation on exported buffers.

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
2.24.1.735.g03f4e72817-goog

