Return-Path: <linux-media+bounces-47627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A43C7E8DB
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 23:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C76213A3C2D
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 22:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17A2296BA2;
	Sun, 23 Nov 2025 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWC3WtzW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68C28726A
	for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938317; cv=none; b=i424fntKpgZ8dgOEruvmz59H3piuGnw+Hrq/5dQ0SrhdEp7Er9+g9wZ19jKdFLpuiqvyQ414gks7GaIlgk8Z2yuoVeMLt5X9ut1/W69gZACmQLvaLZ7k2LapM/qvpF3M1x46uvxs0DVqar6BVj8AYIUaZSjabilo9Q9faLtH1q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938317; c=relaxed/simple;
	bh=yxSa78i6WGSB+rLN2wnYPcV3pbfkXhbApdZHHrVnd/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnYJhq3oKheN+hsBHCyNNxn4QvLm0eub34uDqniDrKOBa1JHT4OP3LZ6EY0x52XSTTFnr1/n6D396dE1eL+dkiD1sSjNEJJdxGYIeNE33Qp2pAERlAHKoCM28MF5hnjKvkpISIGrjYHpLzm5V/nLPNG/wCP3bJelCiJw98TYAdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWC3WtzW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso2140153f8f.2
        for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 14:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763938314; x=1764543114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6XYP6M4yTt1qmMNVTJGvjFxmCyRCFcZp21DmV1BJvo=;
        b=SWC3WtzWunmIoxQcpPcBFLPUYEJWym14GO7iRr1/3Ad36ZEWp8V202BrOiW3ZOAtA5
         KF/ACbm/UiESvf5tIAV7eC+onWTD648+asz9J3Rkemi5EhydytFOTuKqqrfvQ83ejP5U
         Btu4HwACa5/mz0Bue4XOYVliW7GSFFcJh4oYeP+FNHk3rNqnrIk6gRNf7w/sgWtTk2E3
         I2c18V+67kavlYo67p746Vre5fBSG5MgrMElJ44JJfzsV1/MDhsb60CZwIrd0ksvFdVL
         2JUPt/jnoGcO9oi84wVxtL1RAgxVlVOK4WosWmrIh/zJE6wkdIgzhom/JhIed3BpmqAV
         +Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763938314; x=1764543114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6XYP6M4yTt1qmMNVTJGvjFxmCyRCFcZp21DmV1BJvo=;
        b=pBfJjqZux2+WSXp1B3UhC74QeoeIYzlQvfnaQh2XjfLj2siLLC9F5XNJIKaXsDxU9C
         d51sfVhpnn6+grkcrTbuGy6gbQxo08CFMWR52W5Xp5T1AX5ZASMGQm7W7Zh0D3ZC5PjQ
         u9c2ogHvstf/ZBRD5lldPU4K7YsYrg45T/pBP04AQegYs/UOoZH6swbthJb8q1D4mizo
         ThTmMRgibuqLSklONSt7P2Bk5JtfW7ntUkeUI8HKbYlNKpa3KrIDRxD8xk+pxHd/YhwO
         /I+D86N5PgtuStQ31b5FyF4O61XzDx7I/TjicbLA4leaDCIKzJb4kKv3BJkwF54vDFHs
         WxKw==
X-Forwarded-Encrypted: i=1; AJvYcCWeF+1ijDcjxgRzz57Ap2Y302xElfXxQneWhatqjbzLFHN5Ukbm+T6Ogml9rC2QSzn4skPoMkM9NVUlEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqVdxWPGfwaNV1pRrxwc8XVuxgUrpZ3shR5eA9SJY9LKwnKey
	h0Yr0ffiCaXuWj+GQnKX+k64GygT99jdWP00j7NnJde8LvuX5bD54fva
X-Gm-Gg: ASbGnct1jiGeqEJ+qx4bwAq/GTTLEcFDvzMLvXrOHzAO41cpZSHqApjgnBl+6kOZkHz
	Dwc0fa9HHgwWRk1BRoEH+xVbQLFlld6bDj9bZDH3r3teg8xeGKzDVJSFV5BmVVEUJSX4jaT925I
	s1nRC4VkyqoUV4bATAFVmk7oLNnjGIwEKBuBVM9ZfLBQ+EUcN8BvOmAxSLQMlRrqrrBja5VcXaX
	tB8xBNHSNzKZRjEp0v+BrTmLCPDOHstvHxubr4P0KHzAy0rshKYp26ycY84sTaMchx0vYCTEwXK
	U0f0gYsuZ5SanSkSV3IzCYnvWFTx1FYeg1m7xEK6k3zSk/oKO3PaPsXgtvR09sPuGAVIdeQOmE3
	jcNcDsUbj/snF/Pe1BqNMrmqDtxF7wdF1qvtgugO8/ylLI7gG1jvWkVnm3Po5Cm75JSTZUw4L5X
	eGuZy5M8bS6DxdcMBXkFU6c/Fr
X-Google-Smtp-Source: AGHT+IGE0ZjscP742EdyKh9uzu23uLZ3l6gi0agALTuRuYrf+rNDfvZsYNVo2p4Uu5MAT2Id6+WoIQ==
X-Received: by 2002:a05:6000:1447:b0:3ec:dd12:54d3 with SMTP id ffacd0b85a97d-42cc1d0c37dmr9157966f8f.35.1763938313681;
        Sun, 23 Nov 2025 14:51:53 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 14:51:52 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>,
	tushar.gohad@intel.com,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
Date: Sun, 23 Nov 2025 22:51:26 +0000
Message-ID: <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement dma-token related callbacks for nvme block devices.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 95 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index e5ca8301bb8b..63e03c3dc044 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -27,6 +27,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/sed-opal.h>
+#include <linux/blk-mq-dma-token.h>
 
 #include "trace.h"
 #include "nvme.h"
@@ -482,6 +483,92 @@ static void nvme_release_descriptor_pools(struct nvme_dev *dev)
 	}
 }
 
+static void nvme_dmabuf_move_notify(struct dma_buf_attachment *attach)
+{
+	blk_mq_dma_map_move_notify(attach->importer_priv);
+}
+
+const struct dma_buf_attach_ops nvme_dmabuf_importer_ops = {
+	.move_notify = nvme_dmabuf_move_notify,
+	.allow_peer2peer = true,
+};
+
+static int nvme_init_dma_token(struct request_queue *q,
+				struct blk_mq_dma_token *token)
+{
+	struct dma_buf_attachment *attach;
+	struct nvme_ns *ns = q->queuedata;
+	struct nvme_dev *dev = to_nvme_dev(ns->ctrl);
+	struct dma_buf *dmabuf = token->dmabuf;
+
+	if (dmabuf->size % NVME_CTRL_PAGE_SIZE)
+		return -EINVAL;
+
+	attach = dma_buf_dynamic_attach(dmabuf, dev->dev,
+					&nvme_dmabuf_importer_ops, token);
+	if (IS_ERR(attach))
+		return PTR_ERR(attach);
+
+	token->private = attach;
+	return 0;
+}
+
+static void nvme_clean_dma_token(struct request_queue *q,
+				 struct blk_mq_dma_token *token)
+{
+	struct dma_buf_attachment *attach = token->private;
+
+	dma_buf_detach(token->dmabuf, attach);
+}
+
+static int nvme_dma_map(struct request_queue *q, struct blk_mq_dma_map *map)
+{
+	struct blk_mq_dma_token *token = map->token;
+	struct dma_buf_attachment *attach = token->private;
+	unsigned nr_entries;
+	unsigned long tmp, i = 0;
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	dma_addr_t *dma_list;
+
+	nr_entries = token->dmabuf->size / NVME_CTRL_PAGE_SIZE;
+	dma_list = kmalloc_array(nr_entries, sizeof(dma_list[0]), GFP_KERNEL);
+	if (!dma_list)
+		return -ENOMEM;
+
+	sgt = dma_buf_map_attachment(attach, token->dir);
+	if (IS_ERR(sgt)) {
+		kfree(dma_list);
+		return PTR_ERR(sgt);
+	}
+	map->sgt = sgt;
+
+	for_each_sgtable_dma_sg(sgt, sg, tmp) {
+		dma_addr_t dma = sg_dma_address(sg);
+		unsigned long sg_len = sg_dma_len(sg);
+
+		while (sg_len) {
+			dma_list[i++] = dma;
+			dma += NVME_CTRL_PAGE_SIZE;
+			sg_len -= NVME_CTRL_PAGE_SIZE;
+		}
+	}
+
+	map->private = dma_list;
+	return 0;
+}
+
+static void nvme_dma_unmap(struct request_queue *q, struct blk_mq_dma_map *map)
+{
+	struct blk_mq_dma_token *token = map->token;
+	struct dma_buf_attachment *attach = token->private;
+	dma_addr_t *dma_list = map->private;
+
+	dma_buf_unmap_attachment_unlocked(attach, map->sgt, token->dir);
+	map->sgt = NULL;
+	kfree(dma_list);
+}
+
 static int nvme_init_hctx_common(struct blk_mq_hw_ctx *hctx, void *data,
 		unsigned qid)
 {
@@ -1067,6 +1154,9 @@ static blk_status_t nvme_map_data(struct request *req)
 	struct blk_dma_iter iter;
 	blk_status_t ret;
 
+	if (req->bio && bio_flagged(req->bio, BIO_DMA_TOKEN))
+		return BLK_STS_RESOURCE;
+
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
 	 * significantly improves performances for small I/O sizes.
@@ -2093,6 +2183,11 @@ static const struct blk_mq_ops nvme_mq_ops = {
 	.map_queues	= nvme_pci_map_queues,
 	.timeout	= nvme_timeout,
 	.poll		= nvme_poll,
+
+	.dma_map	= nvme_dma_map,
+	.dma_unmap 	= nvme_dma_unmap,
+	.init_dma_token =  nvme_init_dma_token,
+	.clean_dma_token = nvme_clean_dma_token,
 };
 
 static void nvme_dev_remove_admin(struct nvme_dev *dev)
-- 
2.52.0


