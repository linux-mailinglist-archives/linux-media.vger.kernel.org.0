Return-Path: <linux-media+bounces-1148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD707FA743
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4511F20F1C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C6F39FCB;
	Mon, 27 Nov 2023 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q/wvnA4g"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C7E26B1;
	Mon, 27 Nov 2023 08:55:40 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C478E6607405;
	Mon, 27 Nov 2023 16:55:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104139;
	bh=O6QoqjhfTjZ8fxwdlWAH4p8qUAwUTkwY0GJ5W4xynQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/wvnA4g8SOzv8+U7u+BimIdh8r0Q9ehMJ/zalV3OCNZ0eaUROvDxJLFCFy/iDvXx
	 Aufoa9+saUnjG8XLitslPMAYIso9fXHIFqY9qXuEp6L3AU6nXoc8V8VVSqW+qGiJ7f
	 AVuaudIEtx/IOqstj9+2TRxrs0edqDy8pC3Ie1Ex6AFoL0gpwGAVhypbUGGLMmpsXA
	 f918axMhhez2P9p5jagX3maoc5/ojg/0wWafSFQBuG0YTAguWtP8LJ/iAagHnFmFTU
	 KWVFZEVzJmWgJPa0ulOFGYGRz0Bw5PpWea7HVF5gobwiSSfP0p/4najE11F6WnBoN/
	 1vRO9rY11s7WA==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 43/55] media: pci: bt8xx: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:42 +0100
Message-Id: <20231127165454.166373-44-benjamin.gaignard@collabora.com>
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

bt8xx driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 09a193bb87df..8a3fb30e73f6 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -3094,7 +3094,7 @@ static int vdev_init(struct bttv *btv, struct video_device *vfd,
 	q->gfp_flags = __GFP_DMA32;
 	q->buf_struct_size = sizeof(struct bttv_buffer);
 	q->lock = &btv->lock;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->dev = &btv->c.pci->dev;
 	err = vb2_queue_init(q);
 	if (err)
-- 
2.39.2


