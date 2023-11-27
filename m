Return-Path: <linux-media+bounces-1133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9D7FA721
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DF628184A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E2C3DB9E;
	Mon, 27 Nov 2023 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k3YZYXRH"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6151FCE;
	Mon, 27 Nov 2023 08:55:29 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FE7666073CD;
	Mon, 27 Nov 2023 16:55:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104128;
	bh=PJOb0upzYk5sy+kA9Qk465u2DFL4NHA2Gb2jqg1/r/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3YZYXRHqyULkbuXDy3Xg/N7u6yLlC9ch+gaajxQbo5EMxlKvmHEEU6TlyVFoYK/e
	 tVgdrrRXlnj7YYHNo7+/hTVR6g8ifxG86PJXCsiOuQdYLloUVPh4pVrK/kr55HaXLa
	 fZsUIMUastnZ2yqudoE2JxwbB1LQyDR3Qs749Y3OxoTuh+eS2k/Ci0JHpyPdISDPkr
	 UV+sXv1ei8pw5aasuxbLqsi7898BCZJHC5C0E7cFIFLX998z42g5qaF43w1NMv4X+A
	 l/52MGE0X34FEhPsa5u5g6W7EIgN7YW7DmwZicDihlQclalSrEGYQfpcvwuvWzFmQ4
	 /o9PEMC6M/zrQ==
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
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 28/55] media: tegra-video: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:27 +0100
Message-Id: <20231127165454.166373-29-benjamin.gaignard@collabora.com>
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
tegra-video driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: Sowjanya Komatineni <skomatineni@nvidia.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: linux-tegra@vger.kernel.org
---
 drivers/staging/media/tegra-video/vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index e0bb59ee3c09..b8242c8c0497 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1174,7 +1174,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->queue.ops = &tegra_channel_queue_qops;
 	chan->queue.mem_ops = &vb2_dma_contig_memops;
 	chan->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	chan->queue.min_buffers_needed = 2;
+	chan->queue.min_reqbufs_allocation = 2;
 	chan->queue.dev = vi->dev;
 	ret = vb2_queue_init(&chan->queue);
 	if (ret < 0) {
-- 
2.39.2


