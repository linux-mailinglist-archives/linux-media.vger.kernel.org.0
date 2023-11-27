Return-Path: <linux-media+bounces-1152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 315597FA74C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81D9B21842
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A073A8C1;
	Mon, 27 Nov 2023 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BQj8M/J1"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4CC271B;
	Mon, 27 Nov 2023 08:55:43 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 90AB966073FF;
	Mon, 27 Nov 2023 16:55:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104142;
	bh=Wj8OYs20xhu5X0KjHm+m9uKdirvOmODd8Mcxd+Qt7UA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQj8M/J1cYgOnIVpoxfsdFlaceRBrewTRf11KfTbkrhsvHQeB5H92rKdqg/NUrZ+Q
	 gNJNzfFnfD+h2IQXpj3PUPGZ30KORSrMSFYpnnurWe58kEnhDYcdtpfKd00j9elUpM
	 3T5rmuhyuyq+VDQG4J7q0Z8CEi3z2i8Wn3OkQz3357xg7zPqpaV6hYuHqB8u9imSj0
	 ItI2/9PtQdKLEkQ40eGJy1JWjIC4HGF5qUdG7Z55SwE7oQ5jMa9sdIYLBo/p1bNoCA
	 uYXSn9I1JyfpfZ88yW7Pys1CQDpnYacFxYmUS77kbk8g6rNwh68wB7XqJvhasI4BJN
	 WXSvoToIZbc/g==
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
Subject: [PATCH 47/55] media: pci: cx25821: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:46 +0100
Message-Id: <20231127165454.166373-48-benjamin.gaignard@collabora.com>
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

cx25821 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/cx25821/cx25821-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx25821/cx25821-video.c b/drivers/media/pci/cx25821/cx25821-video.c
index 1b80c990cb94..7283a7379ae1 100644
--- a/drivers/media/pci/cx25821/cx25821-video.c
+++ b/drivers/media/pci/cx25821/cx25821-video.c
@@ -730,7 +730,7 @@ int cx25821_video_register(struct cx25821_dev *dev)
 		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 		q->io_modes |= is_output ? VB2_WRITE : VB2_READ;
 		q->gfp_flags = GFP_DMA32;
-		q->min_buffers_needed = 2;
+		q->min_dma_buffers_needed = 2;
 		q->drv_priv = chan;
 		q->buf_struct_size = sizeof(struct cx25821_buffer);
 		q->ops = &cx25821_video_qops;
-- 
2.39.2


