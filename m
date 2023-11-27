Return-Path: <linux-media+bounces-1129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E07487FA714
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5A41C20B4B
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DBA3D38C;
	Mon, 27 Nov 2023 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q/A0oatc"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFC41BE2;
	Mon, 27 Nov 2023 08:55:25 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06FA466073C1;
	Mon, 27 Nov 2023 16:55:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104124;
	bh=cnLy0TbF/AfysmCQDbLYpAUN3cPkSiq05OZ3x+S4YnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/A0oatc8YQfUvE4g3WNR5Iwa75SEj9b1Z75m/AmFMsMVVf6lGEeItRKQ7yjbPJ5b
	 JvtkRawLZ08cpIxRcnJqyYtSInPApW54sNBQRPDN//py4BFi4Cpt2GOGI8qKbXpUjX
	 wXz5IEFgS+NMHvE99jV6OGzbkAQvJ9XGYxiBEGKBavIU2CUDjtN98+bQ1z2xIesq4p
	 /j/nZGg4ysEhLjc1pE3f0sAaYLJfhJHi56DGddzeSWPwwjkv6GNk9qFQjy+e4A4yJd
	 PRzqqFMTTjTseaIiorvCOUx+bHBye7+QiVw7uJ8jRbCOag7gQw+hekNAoy9sRqFwDO
	 MzDjSBSwDfEog==
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
	Eugen Hristev <eugen.hristev@collabora.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 24/55] media: atmel: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:23 +0100
Message-Id: <20231127165454.166373-25-benjamin.gaignard@collabora.com>
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
atmel-isc drivers don't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Eugen Hristev <eugen.hristev@collabora.com>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/staging/media/deprecated/atmel/atmel-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index 468568b5bb7a..dbe611d03018 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -1871,7 +1871,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	q->mem_ops		= &vb2_dma_contig_memops;
 	q->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock			= &isc->lock;
-	q->min_buffers_needed	= 1;
+	q->min_reqbufs_allocation = 1;
 	q->dev			= isc->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2


