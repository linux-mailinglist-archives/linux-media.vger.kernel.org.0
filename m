Return-Path: <linux-media+bounces-1160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 263687FA759
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F4F1F20F61
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5784B3715D;
	Mon, 27 Nov 2023 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bWEody9R"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2122D4F;
	Mon, 27 Nov 2023 08:55:46 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 817EA6607347;
	Mon, 27 Nov 2023 16:55:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104145;
	bh=l0yA+tkYAIYjSficENb2r/EZg/4Zvfn7jPg69IDt+aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWEody9REaxKp+AZdERITTmjwYiVD1Ytqd62b9M8v/RhCAaSJVc6iwbWgDcDoLPBb
	 lcQ3tFAzSdXrsLYlrSUiNTo4XH3cIefIEKLJZHMlnuLzT0dwsU8Vmgmipy/ubVVsWX
	 f4k6jJ5uZfoH60dUcT4Sz7MvwWZiVHQkUsfY+lPznBquUBUAq8kEKsJZyPoG5OguTd
	 bcQA7VIhiku8qWd3MIJGCRRp/lQa493PRxsmtx4VQrMe9BR42iyWG1XxpFX65q+D0H
	 +kUkB1q1EbSiMvmsCH8Kjr1gFeJ9bY7Xrz+ShVx+tWvZKYCODlc7j0xIMOE+qlSMuk
	 b+gg4DqkqqRQQ==
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
Subject: [PATCH 51/55] media: pci: cx23885: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:50 +0100
Message-Id: <20231127165454.166373-52-benjamin.gaignard@collabora.com>
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

cx23885 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/cx23885/cx23885-417.c   | 2 +-
 drivers/media/pci/cx23885/cx23885-dvb.c   | 2 +-
 drivers/media/pci/cx23885/cx23885-video.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 434677bd4ad1..44c93484d42c 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1525,7 +1525,7 @@ int cx23885_417_register(struct cx23885_dev *dev)
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 	q->gfp_flags = GFP_DMA32;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx23885_buffer);
 	q->ops = &cx23885_qops;
diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index 7551ca4a322a..7509fbda4e18 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2667,7 +2667,7 @@ int cx23885_dvb_register(struct cx23885_tsport *port)
 		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 		q->gfp_flags = GFP_DMA32;
-		q->min_buffers_needed = 2;
+		q->min_dma_buffers_needed = 2;
 		q->drv_priv = port;
 		q->buf_struct_size = sizeof(struct cx23885_buffer);
 		q->ops = &dvb_qops;
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 9af2c5596121..13c5812a8833 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -1321,7 +1321,7 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 	q->gfp_flags = GFP_DMA32;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx23885_buffer);
 	q->ops = &cx23885_video_qops;
@@ -1338,7 +1338,7 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
 	q->gfp_flags = GFP_DMA32;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx23885_buffer);
 	q->ops = &cx23885_vbi_qops;
-- 
2.39.2


