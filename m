Return-Path: <linux-media+bounces-1132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C69567FA720
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57BF5B2183C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8B3DB8F;
	Mon, 27 Nov 2023 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AiG+Ejb2"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9F91BFE;
	Mon, 27 Nov 2023 08:55:28 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 75A956607286;
	Mon, 27 Nov 2023 16:55:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104127;
	bh=YIgkAExbbbECDPnkaD6N0lG+VUJuWN8PC9JRmzX9TCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AiG+Ejb2+mNZ23dQ58fH8HeFPy3hJ02mlj2Hi6rxIeY+Gy1a8/QIAfOk23U/takDW
	 v6q5IkEXN2y6tQf+omLSLpcCgvsdNkad61xg1wUI87O6gd/fMVHJPt7beMBJxoFrzv
	 o3zi6w3FT8MG0PcMXFjmkzio7deWNDtDOAOgQxgjwDHJYjxGTvkbAVGKotPtggFhjH
	 nEwfKFLrFCHpdhjTGSVVIYW9HnpEUsKJSQJhbxaToNiZ+59Uk/fYnCZBuMuMOIXmHs
	 95pGFhjthjI/q+XLSrPOYxKfQ89KGXqn3gvvCg3f+9+VRpC04Qij8+Svm2OuMVLuVw
	 WvZajJW/poNYw==
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
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 27/55] media: sun6i-isp: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:26 +0100
Message-Id: <20231127165454.166373-28-benjamin.gaignard@collabora.com>
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
sun6i-isp driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: linux-sunxi@lists.linux.dev
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 2 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 1595a9607775..f47f9946c19f 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -660,7 +660,7 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *isp_dev)
 	queue->buf_struct_size = sizeof(struct sun6i_isp_buffer);
 	queue->ops = &sun6i_isp_capture_queue_ops;
 	queue->mem_ops = &vb2_dma_contig_memops;
-	queue->min_buffers_needed = 2;
+	queue->min_reqbufs_allocation = 2;
 	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	queue->lock = &capture->lock;
 	queue->dev = isp_dev->dev;
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index e28be895b486..259f6bfcb620 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -489,7 +489,7 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 	queue->buf_struct_size = sizeof(struct sun6i_isp_buffer);
 	queue->ops = &sun6i_isp_params_queue_ops;
 	queue->mem_ops = &vb2_vmalloc_memops;
-	queue->min_buffers_needed = 1;
+	queue->min_reqbufs_allocation = 1;
 	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	queue->lock = &params->lock;
 	queue->dev = isp_dev->dev;
-- 
2.39.2


