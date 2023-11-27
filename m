Return-Path: <linux-media+bounces-1118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3A7FA703
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1D0B2819AB
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479C4381B9;
	Mon, 27 Nov 2023 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b8B91Hpy"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD99A10CB;
	Mon, 27 Nov 2023 08:55:17 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0568C66022D7;
	Mon, 27 Nov 2023 16:55:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104116;
	bh=0IW6KaZQ66ctszxERd9LJZiesOlWHkv1oaN5vdBxTOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8B91HpyP1Sf3w26/2U8ec9vYjPCdDWxjffLbFaIVAf32m07JWcjIgLw5l3GAN7zo
	 dP6Tb/ovpk5XARCckipAA4Kq1UAslwqwcatQs8OsqO1RRZGaLMtjtO6ivnn4lVEZXg
	 i6zDH8ehUe5HYPKQO7UVM78gtz9SE7IelAHYX5xM81s2CeV/KKghxucusWIH1VoW1x
	 fW3Q14aGoqr1bj5JRO1WL75XK2MBkQ0qZxCPVXSd/tPpxa5jmYj7C8INRJn6KPJ8/y
	 J5pj6QCauCj68sOV9mhlXmlnst2Q01bVkOCxkTj1nMdoc3GTnUo8j6oD+U0TAu2osD
	 pATGmFRvNPJog==
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
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH 14/55] media: microchip: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:13 +0100
Message-Id: <20231127165454.166373-15-benjamin.gaignard@collabora.com>
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
microchip driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Eugen Hristev <eugen.hristev@collabora.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 3fba0e2844b6..9bed33aaf36f 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1821,7 +1821,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	q->mem_ops		= &vb2_dma_contig_memops;
 	q->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock			= &isc->lock;
-	q->min_buffers_needed	= 1;
+	q->min_reqbufs_allocation = 1;
 	q->dev			= isc->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2


