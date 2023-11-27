Return-Path: <linux-media+bounces-1156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4D7FA750
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DEAA28162C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593333A8E2;
	Mon, 27 Nov 2023 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UOQJzgrW"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F0F2D65;
	Mon, 27 Nov 2023 08:55:47 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 347576607424;
	Mon, 27 Nov 2023 16:55:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104145;
	bh=yBTcY/czjMNBp1trwVXXouYWoMuVcN590O1KG93acxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOQJzgrWxwOp2sA7iCF9XxZJq7N4qsbIqJgtBVRCKuSPh1OE50mJTPPDxhGrydikf
	 FVleabN0drV801aIkvUbtkOPgQq7uf/pkN15a57SUTqLoK+DBlpFM/TuG2aTYbj2xU
	 Bvtve6HF3qVwu/VINhnqzHZdv7Lugq/X497ztVoEXSZcCxIla8Hi0qNdPjkCDbRfxp
	 3qqpAb8DYCF3RWXO3IX5Vzq2OePF18K7FX9em/JKY44U7NDYWdi9iuTIRPfxo+mQX3
	 8rtiaC6AKCuQ1AchXUGqH6HGGn0ygk0F88LSMKGIPSdj/cxwEEhGp+S1yQEGqRDRck
	 072VCRCO/IUtA==
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
	Corentin Labbe <clabbe@baylibre.com>,
	mjpeg-users@lists.sourceforge.net
Subject: [PATCH 52/55] media: pci: zoran: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:51 +0100
Message-Id: <20231127165454.166373-53-benjamin.gaignard@collabora.com>
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

zoran driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Corentin Labbe <clabbe@baylibre.com>
CC: mjpeg-users@lists.sourceforge.net
---
 drivers/media/pci/zoran/zoran_driver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index fa672cc8bc67..23ed1fdc03df 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -749,9 +749,6 @@ static int zr_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers, unsi
 
 	zr->buf_in_reserve = 0;
 
-	if (*nbuffers < vq->min_buffers_needed)
-		*nbuffers = vq->min_buffers_needed;
-
 	if (*nplanes) {
 		if (sizes[0] < size)
 			return -EINVAL;
@@ -971,7 +968,7 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir)
 	vq->mem_ops = &vb2_dma_contig_memops;
 	vq->gfp_flags = GFP_DMA32;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vq->min_buffers_needed = 9;
+	vq->min_dma_buffers_needed = 9;
 	vq->lock = &zr->lock;
 	err = vb2_queue_init(vq);
 	if (err)
-- 
2.39.2


