Return-Path: <linux-media+bounces-1142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C87FA735
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1052819F0
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A23EA87;
	Mon, 27 Nov 2023 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jmgsIweR"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD0D213B;
	Mon, 27 Nov 2023 08:55:36 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E67166073ED;
	Mon, 27 Nov 2023 16:55:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104134;
	bh=oeU9+ujofjCPuqpbBJhFmasSXcVk3Te+UZBalP9S6o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jmgsIweRenNoGVU5GQtYm6oRnhpXyUT2dFbt+4WgsQcG69mIJXDiSPgb+VIkZGjza
	 JYJ8g7H5cb1iQEnpOF5S4ikoZ5Sa7hWLa44WS2yAWMdryATzyynpQif+YODa3yT7g2
	 SZK+FzrT+YrUHmL88C023KqIE+d5k8n6p/kg2nUs7oKLpWiBIEhuCADx4B6hUDiQ5I
	 iUavy+1FeS4FcYhvE8YKYCCHw6gG3QOkvElrDuc+iJ9uqhvLbLrQY7fBScKV2DxRQr
	 Dn9u7W9zHKOt8LqYzi6JRbYGpX9asUCO1yzbmnAJm6UAFRDPIV0MAC6NOS/8Ljdunc
	 c0W+tU8jQKy4w==
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 37/55] media: renesas: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:36 +0100
Message-Id: <20231127165454.166373-38-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

renesas drivers use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
CC: Jacopo Mondi <jacopo@jmondi.org>
CC: linux-renesas-soc@vger.kernel.org
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c     | 2 +-
 drivers/media/platform/renesas/renesas-ceu.c           | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 drivers/media/platform/renesas/sh_vou.c                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 2a77353f10b5..b467e7a7d0dc 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1559,7 +1559,7 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
 	q->ops = &rvin_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 4;
+	q->min_dma_buffers_needed = 4;
 	q->dev = vin->dev;
 
 	ret = vb2_queue_init(q);
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 2562b30acfb9..e2aef002bca9 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1399,7 +1399,7 @@ static int ceu_notify_complete(struct v4l2_async_notifier *notifier)
 	q->mem_ops		= &vb2_dma_contig_memops;
 	q->buf_struct_size	= sizeof(struct ceu_buffer);
 	q->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed	= 2;
+	q->min_dma_buffers_needed = 2;
 	q->lock			= &ceudev->mlock;
 	q->dev			= ceudev->v4l2_dev.dev;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index e6eedd65b71d..df1ab9beea6e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -767,7 +767,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 	q->ops = &rzg2l_cru_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 4;
+	q->min_dma_buffers_needed = 4;
 	q->dev = cru->dev;
 
 	ret = vb2_queue_init(q);
diff --git a/drivers/media/platform/renesas/sh_vou.c b/drivers/media/platform/renesas/sh_vou.c
index f792aedc9d82..c2ac340a9da8 100644
--- a/drivers/media/platform/renesas/sh_vou.c
+++ b/drivers/media/platform/renesas/sh_vou.c
@@ -1297,7 +1297,7 @@ static int sh_vou_probe(struct platform_device *pdev)
 	q->ops = &sh_vou_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->lock = &vou_dev->fop_lock;
 	q->dev = &pdev->dev;
 	ret = vb2_queue_init(q);
-- 
2.39.2


