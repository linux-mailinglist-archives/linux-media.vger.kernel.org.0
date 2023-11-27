Return-Path: <linux-media+bounces-1146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5267FA73C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89BA52818B3
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AAF3FB04;
	Mon, 27 Nov 2023 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E54Gv4X2"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6D910D4;
	Mon, 27 Nov 2023 08:55:39 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E4396607401;
	Mon, 27 Nov 2023 16:55:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104137;
	bh=VYpTZfWZN7LbMpiNcOKjYA3Gn8EBNnp4L6ZbmMp3ESA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E54Gv4X2uUv3gUKpau+ZmdPnMvd5bzU47vNGH7HkSinB+yxqdf5SmIc+iHO3GP3EZ
	 f14NOUOEEwIjeuUdXDRCzpFyC8TUnJ+P/6xK+NS2+S/HmGBxECKrBAn+ii2gskTvG+
	 mLqPI/BkB/b0NGkz2/yH2SrtBI+B2QCuFURV3hnuW2DpoEeQTuStbMdcYutrsQcnru
	 Qrdq8Z6fuVIGm/XXCiXCP6MK8qXlgCJWKpV/j8lw7Bo6CEynC9wNW01qbpZE6qzsrB
	 iQnTsXuWV0uHfWHn4li9LKZ/3B+RndNKHhffIR+8y9ZVUVoeejScIOv3iw0NyTzLta
	 On0k5W+VQExeA==
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
	Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 41/55] media: pci: intel: ipu3: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:40 +0100
Message-Id: <20231127165454.166373-42-benjamin.gaignard@collabora.com>
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

Ipu3 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Yong Zhi <yong.zhi@intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@intel.com>
CC: Dan Scally <djrscally@gmail.com>
CC: Tianshu Qiu <tian.shu.qiu@intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 5d3b0ffd3d08..3a000a682cb0 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1589,7 +1589,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	vbq->mem_ops = &vb2_dma_sg_memops;
 	vbq->buf_struct_size = sizeof(struct cio2_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = 1;
+	vbq->min_dma_buffers_needed = 1;
 	vbq->drv_priv = cio2;
 	vbq->lock = &q->lock;
 	r = vb2_queue_init(vbq);
-- 
2.39.2


