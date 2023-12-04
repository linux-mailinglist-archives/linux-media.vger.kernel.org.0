Return-Path: <linux-media+bounces-1567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E8803489
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C66280F8C
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA6625565;
	Mon,  4 Dec 2023 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N7fNBL9W"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9CFD53;
	Mon,  4 Dec 2023 05:23:58 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7D4266071EF;
	Mon,  4 Dec 2023 13:23:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696237;
	bh=Kzbu88ymNE025HOjKsO2ioiaZkYT4loaGy3sxXF5Jh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N7fNBL9W3ILAxin0faA1PBv6kx9Wrh3q/TLE4wNhnRAWPdOIovKNoyI2jhIuGe0UO
	 YLuC8F5+L3sie6Ixv/dHLKQ7sDR3v3jdAo3XWeACLcjufdTIYs6Ipz0OdqSl71VP3O
	 wa45Wm3FByeutiCzCvLMbm0QRzbjcTefLTkTg3mdRJe8ZSPqbjl7jqb4Cnvjaj1kex
	 vi16BwcafFI0QdSjLXA0KwPqXoqy4r+VIdVo+UjVd4FNnbo5hDx3sI6OIqpJh2etrE
	 i1FRvrN2NJrxcytzbWsv0LpoTPU8cJAeP/SGewepKSzxQyMOMp+vgtj19VoxhwTClr
	 T3+BmWWdU0DeQ==
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
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v2 11/36] media: ti: davinci: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:58 +0100
Message-Id: <20231204132323.22811-12-benjamin.gaignard@collabora.com>
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

This driver uses min_buffers_needed which vb2 uses to ensure
start_streaming is called when at least 'min_buffers_needed'
buffers are queued. However, this driver doesn't need this,
it can stream fine without any buffers queued.
Just drop this unnecessary restriction.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/davinci/vpif_capture.c | 1 -
 drivers/media/platform/ti/davinci/vpif_display.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index fc42b4bc37e6..300c3cb5cbed 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1429,7 +1429,6 @@ static int vpif_probe_complete(void)
 		q->mem_ops = &vb2_dma_contig_memops;
 		q->buf_struct_size = sizeof(struct vpif_cap_buffer);
 		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 1;
 		q->lock = &common->lock;
 		q->dev = vpif_dev;
 
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index 9dbab1003c1d..d45391a4d8f2 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -1169,7 +1169,6 @@ static int vpif_probe_complete(void)
 		q->mem_ops = &vb2_dma_contig_memops;
 		q->buf_struct_size = sizeof(struct vpif_disp_buffer);
 		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 1;
 		q->lock = &common->lock;
 		q->dev = vpif_dev;
 		err = vb2_queue_init(q);
-- 
2.39.2


