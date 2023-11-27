Return-Path: <linux-media+bounces-1127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 983537FA70E
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F921C20C1B
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885A83BB43;
	Mon, 27 Nov 2023 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VwQOmNRl"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E951BCF;
	Mon, 27 Nov 2023 08:55:24 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C8D666073A4;
	Mon, 27 Nov 2023 16:55:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104122;
	bh=GzHBqgRhyPfMPwV2bftblzOdfFiQq/5ns8Cr3Xl9iGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VwQOmNRlKbCStX02pa30QUDD67AudKdZI1SlNcUxNJACh3pt3K0319v5P/3pqBJ+/
	 rOCaSGAvVwD1fDvqioLcIjTLJkZzAHKeVHXXJyBQQ+acixMmcN2zWoKhK3ze/3YaaT
	 ctl4B2rNH1jl1ZopwYPGmVbMGwhwZaWRwO7ywUPYTCm5+rmIek9NI7ghu3msn+HGIf
	 hubiyhwkLYrFJ6hq7gZg2fxIjJ04DvQQvKVdbPfHdjVV7/zXBpGIxen5JDtlnvC9dt
	 /r36BuglfcX64lvC9WyeGYXHvcM6LG77JbN1NiM0EvlKQKCyMP0MnsbTA6jjVX5Ciz
	 1NtkKacnCdDnA==
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
Subject: [PATCH 22/55] media: dvb-core: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:21 +0100
Message-Id: <20231127165454.166373-23-benjamin.gaignard@collabora.com>
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
dvb_vb2 doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/dvb-core/dvb_vb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 167ff82a6fed..e6253cc41ae3 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -171,7 +171,7 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
 	q->io_modes = VB2_MMAP;
 	q->drv_priv = ctx;
 	q->buf_struct_size = sizeof(struct dvb_buffer);
-	q->min_buffers_needed = 1;
+	q->min_reqbufs_allocation = 1;
 	q->ops = &dvb_vb2_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->buf_ops = &dvb_vb2_buf_ops;
-- 
2.39.2


