Return-Path: <linux-media+bounces-1155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB18A7FA74F
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F551B21C77
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB623A8D9;
	Mon, 27 Nov 2023 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J5d5ZjFG"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10862D46;
	Mon, 27 Nov 2023 08:55:45 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CBA5C660741E;
	Mon, 27 Nov 2023 16:55:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104144;
	bh=bl7A7cze/Fs4UDnfd9OCkp+Gbfc6kPJk9SWpxLmJ3Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5d5ZjFGg4ROA1NRrXHHuUPO7jXzI0XIeWXJhwb2b+gH6Ie1Qxt2e3cJo0VlSR1oA
	 cX060uC1AeqYvjTfDc1ieeV+yDijP3RktQDbBInFHfANjb+aM8AdPJE/Dd9g+0HEM6
	 mMRjAQxqxdLd3YyVh0SaD1BZKIzlr/K6tLHlBlRomaMva0rQxESVJROaAZBANZ1A4F
	 xA48dVXi6GRSNdytMp2iMl3m4mN2bl9R7Hpq8kJhaevWRUu4GQnaVbflt/lK4H9ICD
	 fTuMCFhpgt0/vuHOdH17FpoqbwyeG2Q7x2qbUsnzVOuxxPmf15c4iqjC7P8z8f79FA
	 MRRtrxBQM2vrw==
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
Subject: [PATCH 50/55] media: pci: cx88: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:49 +0100
Message-Id: <20231127165454.166373-51-benjamin.gaignard@collabora.com>
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

cx88 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/cx88/cx88-blackbird.c | 2 +-
 drivers/media/pci/cx88/cx88-dvb.c       | 2 +-
 drivers/media/pci/cx88/cx88-video.c     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index c1b41a9283c1..9cb14d661eec 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -1195,7 +1195,7 @@ static int cx8802_blackbird_probe(struct cx8802_driver *drv)
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 	q->gfp_flags = GFP_DMA32;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx88_buffer);
 	q->ops = &blackbird_qops;
diff --git a/drivers/media/pci/cx88/cx88-dvb.c b/drivers/media/pci/cx88/cx88-dvb.c
index 2087f2491c42..3473e1e93a24 100644
--- a/drivers/media/pci/cx88/cx88-dvb.c
+++ b/drivers/media/pci/cx88/cx88-dvb.c
@@ -1776,7 +1776,7 @@ static int cx8802_dvb_probe(struct cx8802_driver *drv)
 		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 		q->gfp_flags = GFP_DMA32;
-		q->min_buffers_needed = 2;
+		q->min_dma_buffers_needed = 2;
 		q->drv_priv = dev;
 		q->buf_struct_size = sizeof(struct cx88_buffer);
 		q->ops = &dvb_qops;
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index c0ef03ed74f9..31eb79bfa547 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1411,7 +1411,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 	q->gfp_flags = GFP_DMA32;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx88_buffer);
 	q->ops = &cx8800_video_qops;
@@ -1428,7 +1428,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 	q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 	q->gfp_flags = GFP_DMA32;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx88_buffer);
 	q->ops = &cx8800_vbi_qops;
-- 
2.39.2


