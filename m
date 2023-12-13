Return-Path: <linux-media+bounces-2098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A30180CB33
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4511C20FE2
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0453FB27;
	Mon, 11 Dec 2023 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ugB27H49"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 333 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Dec 2023 05:38:31 PST
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEE6E5;
	Mon, 11 Dec 2023 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702301579;
	bh=a0m+6H8ZiYbHPXc1Uo0vZRZp35umogH5+OxIgSWiNaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugB27H49kiM73HdHA9tRGy5D8LCebPBk66eI6npeLrDCCdZfhWAyUY3fKU9t6gpdD
	 KY5hclVccFjqOOSQnivbC8RqKDIccKMMk+TWuIW68ONqyUaWfH/FPpueNzYGMiR/sP
	 kFaQH9f2gigoAfXonJYe+7RkjTsEIdbReVzNh1YILJSB3x/Fakk7evyIbAH4FFzm46
	 XWfFeS6NOkltWBiSAWR67xNMs5yd5rFdQm84y8jP3ZVafD0uAPZWK7ocDMW8AGhXYg
	 NyqMCuONgcIoi/Py5yJtdIQjGmMzWXxkRU8H/sakWVys59Fev6ClegT4xGKOnkkXWm
	 elC8q16wB9A5Q==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 17CA7378142F;
	Mon, 11 Dec 2023 13:32:59 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 3/3] media: test-drivers: Set REQBUFS minimum number of buffers
Date: Mon, 11 Dec 2023 14:32:51 +0100
Message-Id: <20231211133251.150999-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
References: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test drivers require at least 2 buffers to be allocated when
calling REQBUFS so set queue min_reqbufs_allocation field instead
of min_queued_buffers.
While at it remane vivid_create_queue() parameter.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 2 +-
 drivers/media/test-drivers/vivid/vivid-core.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 2a2d19d23bab..97693561f1e4 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -432,7 +432,7 @@ static struct vimc_ent_device *vimc_capture_add(struct vimc_device *vimc,
 	q->mem_ops = vimc_allocator == VIMC_ALLOCATOR_DMA_CONTIG
 		   ? &vb2_dma_contig_memops : &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_queued_buffers = 2;
+	q->min_reqbufs_allocation = 2;
 	q->lock = &vcapture->lock;
 	q->dev = v4l2_dev->dev;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index b6b010deb143..11b8520d9f57 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -861,7 +861,7 @@ static const struct media_device_ops vivid_media_ops = {
 static int vivid_create_queue(struct vivid_dev *dev,
 			      struct vb2_queue *q,
 			      u32 buf_type,
-			      unsigned int min_buffers_needed,
+			      unsigned int min_reqbufs_allocation,
 			      const struct vb2_ops *ops)
 {
 	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE && dev->multiplanar)
@@ -898,7 +898,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->mem_ops = allocators[dev->inst] == 1 ? &vb2_dma_contig_memops :
 						  &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_queued_buffers = supports_requests[dev->inst] ? 0 : min_buffers_needed;
+	q->min_reqbufs_allocation = min_reqbufs_allocation;
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
 	q->supports_requests = supports_requests[dev->inst];
-- 
2.40.1


