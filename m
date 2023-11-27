Return-Path: <linux-media+bounces-1123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BB7FA70A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BE7C281731
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F1B3BB55;
	Mon, 27 Nov 2023 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XBGt7xdM"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED6619B3;
	Mon, 27 Nov 2023 08:55:21 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D86466072C1;
	Mon, 27 Nov 2023 16:55:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104120;
	bh=QToV8lElzrqp6zWG2/Ij9Fy7YYCaGPBAPbmtKiSOV+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XBGt7xdMVEDvZuVk9Ad14jb83KoEdPpGetmdJSap2lBA2z5MJ403Xorerc4Bnbt1J
	 fMUQrg/YddUn0oxlaDoWJ8uL25YiWdqYKXzah8zc76vIuqATvru2IgmKIz3v4O/GE8
	 md/ixY3FvptKrTjOwT0L6St5UlZvDV4DWTKm6ZOPPpwrEprsmKVRAnQBjz4wtiaNSp
	 U1QUNctewxrMvCLj7IzvCbP3+xTxNvobqU3TZAnO9VZr5HD77oypyU6GEzcibztO5b
	 p4Cat7dlxH/Sx+i9JGbFd3+rIlZJTGjE8ouelk/vcaO0fw0hSNhicljgodjU1Bw+x5
	 uBbSq6hrdGDEw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 19/55] media: sun8i-rotate: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:18 +0100
Message-Id: <20231127165454.166373-20-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
sun8i-rotate driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Samuel Holland <samuel@sholland.org>
---
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 0b025ec91826..14cd0afd7c6a 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -536,7 +536,7 @@ static int rotate_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
-	src_vq->min_buffers_needed = 1;
+	src_vq->min_reqbufs_allocation = 1;
 	src_vq->ops = &rotate_qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
@@ -551,7 +551,7 @@ static int rotate_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
-	dst_vq->min_buffers_needed = 2;
+	dst_vq->min_reqbufs_allocation = 2;
 	dst_vq->ops = &rotate_qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
-- 
2.39.2


