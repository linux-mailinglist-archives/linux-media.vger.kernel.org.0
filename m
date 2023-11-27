Return-Path: <linux-media+bounces-1111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911E7FA6F9
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79312818D0
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D85734CDE;
	Mon, 27 Nov 2023 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vpjk+xeW"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FA6198;
	Mon, 27 Nov 2023 08:55:10 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 237A166072A7;
	Mon, 27 Nov 2023 16:55:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104109;
	bh=CXOqINnxnCzQ6XOL+VA2AacFLu6JKWe+Zb7RZAzp+MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vpjk+xeWjjWP+R3N2SKM7woEQxBddVhXmlMwS3d0XkmMR9tHChI6HMPtT76eZVEGq
	 KJjCRoykTj4IatyWsm9Z9aUQE4UWPj2h8ain2VdzOA7oHZMmej8UFS0YQuBTSvNial
	 2YdTFMo+0i2XSDZeogZXKs9/sVscCNm4SEmrQgNui+yp3QTAgFroSE73sHIg1TKVf/
	 NOzPbr8by7halFECH/emHR+T8pNaqeXCWfxrxXrlS3RPnPfAqHmv1vBUNl9VCrDXXV
	 Vr1LE52EG94i4bmz9DywsOdMD45T5Sb53ELbT7JavhlUajhQimVCpnVLEkgfM5jLOr
	 UjnbE5+ZuJxjg==
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
Subject: [PATCH 06/55] media: atmel: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:05 +0100
Message-Id: <20231127165454.166373-7-benjamin.gaignard@collabora.com>
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
atmel-isi driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Eugen Hristev <eugen.hristev@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/media/platform/atmel/atmel-isi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index da58f33b6b0a..9c156771568a 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1244,7 +1244,7 @@ static int atmel_isi_probe(struct platform_device *pdev)
 	q->ops = &isi_video_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_reqbufs_allocation = 2;
 	q->dev = &pdev->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2


