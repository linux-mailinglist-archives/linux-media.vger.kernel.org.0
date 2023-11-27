Return-Path: <linux-media+bounces-1149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C427FA745
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617A128196E
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB2F3FE30;
	Mon, 27 Nov 2023 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ci+CoOpm"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5950C2702;
	Mon, 27 Nov 2023 08:55:41 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7586966073F5;
	Mon, 27 Nov 2023 16:55:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104140;
	bh=h2KeYZ0zs78nj7d0vzmwSoQJ8cIKIqcfLHmNlVHLLY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ci+CoOpm89HWTnsAVdvkdX99vxMpyqKLn94+lpKM7gMzxF+SPJS3WqYKv/mZU2TVq
	 O9W4L0gGC4BRpAXaTknEUGyNPNEeI43f1YP8AppYo85mEwBLKtk2mwnUKL+9zifDo/
	 SjANBlpRlZonOp6q1IvOws+sP+bv10Bq0kT353Sr61+DuCmfyTwleJuj6BYg1Kz/qE
	 rIBIuASI0gi6/dOyaesXFMG5+U7XiucqF1LuAAQ7eSgvtlTxiuPd/wFaeVAb0mjfml
	 n3RoOQDHBebGIYvnxa/q2uFwhwPMikEsdl9q++bhIt0fkQXvt585Qxz6aGckbZA8h1
	 McmAdpU0W5BVw==
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
	Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH 44/55] media: pci: cx18: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:43 +0100
Message-Id: <20231127165454.166373-45-benjamin.gaignard@collabora.com>
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

cx18 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Andy Walls <awalls@md.metrocast.net>
---
 drivers/media/pci/cx18/cx18-streams.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index cfbc4a907802..1b66a70c6d6e 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -287,7 +287,7 @@ static int cx18_stream_init(struct cx18 *cx, int type)
 		s->vidq.ops = &cx18_vb2_qops;
 		s->vidq.mem_ops = &vb2_vmalloc_memops;
 		s->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		s->vidq.min_buffers_needed = 2;
+		s->vidq.min_dma_buffers_needed = 2;
 		s->vidq.gfp_flags = GFP_DMA32;
 		s->vidq.dev = &cx->pci_dev->dev;
 		s->vidq.lock = &cx->serialize_lock;
-- 
2.39.2


