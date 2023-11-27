Return-Path: <linux-media+bounces-1158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDF7FA753
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1285E1F20F46
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C96B3A8ED;
	Mon, 27 Nov 2023 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MINNiUeo"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2B430C7;
	Mon, 27 Nov 2023 08:55:49 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA5E4660742B;
	Mon, 27 Nov 2023 16:55:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104147;
	bh=yC3FV0N0XOijdcBv3yWO8BmzCgseS3Y6Nq1H8uXjYec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MINNiUeoz/GUMUqWdqXdfQ65v0Ab6vh2Hp0YWf072N/P008c+syLugxYV7eNvXefT
	 18oTjv9H7wIv3zOWAGkBSiwmn1HFWBMl5HbDwqcX5zBCfUTqx+izbQab3L6f8vOAli
	 MYW1XuK5bpjjK4wgGAO5lVPyoQY6iT2LkcBIAbRM0wmj7+MzZtZJ1yqF0F93nlGClx
	 9kX5ZUKfPeyvqmeqH5dftIOshujd1EFKrCs9p/V1lI95/hTIjrUNNNEcaaaDTsOW2W
	 Nh45ooSVSyWMEPANbvxmdkzKT2WY6luoZSeZTu3CsqVl4yg7MS/VfVFqYTcIk9Mec6
	 0mOYES0sV/9IQ==
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 54/55] media: meson: vdec: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:53 +0100
Message-Id: <20231127165454.166373-55-benjamin.gaignard@collabora.com>
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

vdec driver use a firmware and comments said that a
minimum number of buffers need to be present before
start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-amlogic@lists.infradead.org
---
 drivers/staging/media/meson/vdec/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 1e2369f104c8..6c2e3e5c6e6f 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -184,7 +184,7 @@ static void process_num_buffers(struct vb2_queue *q,
 	 * we need all of them to be queued into the driver
 	 */
 	sess->num_dst_bufs = q_num_bufs + *num_buffers;
-	q->min_buffers_needed = max(fmt_out->min_buffers, sess->num_dst_bufs);
+	q->min_dma_buffers_needed = max(fmt_out->min_buffers, sess->num_dst_bufs);
 }
 
 static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
@@ -825,7 +825,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->drv_priv = sess;
 	src_vq->buf_struct_size = sizeof(struct dummy_buf);
-	src_vq->min_buffers_needed = 1;
+	src_vq->min_dma_buffers_needed = 1;
 	src_vq->dev = sess->core->dev;
 	src_vq->lock = &sess->lock;
 	ret = vb2_queue_init(src_vq);
@@ -839,7 +839,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->drv_priv = sess;
 	dst_vq->buf_struct_size = sizeof(struct dummy_buf);
-	dst_vq->min_buffers_needed = 1;
+	dst_vq->min_dma_buffers_needed = 1;
 	dst_vq->dev = sess->core->dev;
 	dst_vq->lock = &sess->lock;
 	return vb2_queue_init(dst_vq);
-- 
2.39.2


