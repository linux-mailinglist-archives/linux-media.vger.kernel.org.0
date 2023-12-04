Return-Path: <linux-media+bounces-1582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD48034A9
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C6D280F14
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABB5286B6;
	Mon,  4 Dec 2023 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bsemf9sM"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C2B1981;
	Mon,  4 Dec 2023 05:24:20 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6121066072A4;
	Mon,  4 Dec 2023 13:24:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696259;
	bh=nJOkOwWG7HAPg6iANkaE4/DJj5MpFIvKCNqxFpSa5Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bsemf9sMBDox41v7pChvajWkARkXsziAH64yIkLruyeXdNhLanAXUykBK0iYk6LqM
	 P5B52tdP2M6EOzsi85N6KnczR+8NwAr6ESG3bmgM2Q+TnNJLDIKVr8j13XqYF7/8vb
	 r9h7ay6XTl2zDTa8+kE5YjXRO2IdNmfICN26EU7AQRH+h4gnULKBCO1VyLT3TNVVCQ
	 4N3+xpjLOQ5Qy/v578gl8HNP/wy2jEtJIY4wF2J5IQIrn6dvpV/Y6TvnynTnpoSRsp
	 5cF8p6BstrnU7dk8eDwXMnPASKfPQfplh/RZtZpuUdZOWrrt85YEX6vOe8y5TXi7By
	 pUPCc7WS/vXZg==
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
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 26/36] media: sun4i-csi: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:13 +0100
Message-Id: <20231204132323.22811-27-benjamin.gaignard@collabora.com>
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
sun4i-csi driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index 95b5633b7914..8f071cba2d25 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -411,7 +411,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 	for (i = 0; i < CSI_MAX_BUFFER; i++)
 		csi->current_buf[i] = NULL;
 
-	q->min_buffers_needed = 3;
+	q->min_reqbufs_allocation = 3;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->lock = &csi->lock;
-- 
2.39.2


