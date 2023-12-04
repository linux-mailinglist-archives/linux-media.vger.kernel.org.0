Return-Path: <linux-media+bounces-1589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E78034B3
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D51280F37
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602372556C;
	Mon,  4 Dec 2023 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bahKe9ZB"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447FD1BCA;
	Mon,  4 Dec 2023 05:24:29 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 673746607345;
	Mon,  4 Dec 2023 13:24:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696267;
	bh=3CZsTTbHLtC5vyOvtssRJvLsPSp78mQlLUyr4UEzOZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bahKe9ZB6a+MjhUKvq5M8odiKSSZMgqa4W9bYUCypnTmx9V69TndgKdfZ1G0jB0Gz
	 9OIkgim6c1EotYKd9dw07QHgRZJgVQIQzwNAhuF7a8R9ySNdeZdROWl4aMnNPkbGGI
	 5xoTZlk2UhA5emVLqcCmBGSewYiyk5/HnGZJDz53x+Wvn8NjSyknUl1GMrOkBgq+LQ
	 pozwHtyCImewiDt2S/k3THtEvXKx+xLNGitQcIwmzNUwL+zULO3Q44sMBkpE541vN2
	 m0CghTEtBj9XQ0K9MOEK/zVqnJyiqUwHbOAZj5d+TXVe7scrszo+MrLSz0/tVXFx82
	 5uMsbMoZcMfOg==
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
	Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 33/36] media: ti: cal: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:20 +0100
Message-Id: <20231204132323.22811-34-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
Cal driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti/cal/cal-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index e1c5e68e945b..04709dac7221 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1010,7 +1010,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &ctx->mutex;
-	q->min_buffers_needed = 3;
+	q->min_reqbufs_allocation = 3;
 	q->dev = ctx->cal->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2


