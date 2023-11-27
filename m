Return-Path: <linux-media+bounces-1138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADC7FA72A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06A641F20F22
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1091F3EA66;
	Mon, 27 Nov 2023 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bUW8uWS5"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E840210D;
	Mon, 27 Nov 2023 08:55:33 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3586B66073CA;
	Mon, 27 Nov 2023 16:55:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104131;
	bh=zWGO+xQMxELWOf7KdTdR8LG3JTriZNDDb/EP2aovBFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUW8uWS5GW0QXyBTRzhuFADv/y2EtdYvOtkMLrer7hDPeWcEz2eOSftisYiD15p3q
	 rGznA676mshUPeo1Vt77h7d8o7lH9BfYqnhBFPaUg92Fx0LtkyXgsWOxYZHfYsCG6W
	 lluewMKI+WXpr/nfDPLvWH+OvFxxSrA+su6FcnSC/xfYTSsPBEyX2xyn/+DxR3jZUx
	 rjLWHFj4/AWStGyBxF3ejvARfP/Kur946umnB7qJIXur/ca7OKbeU5boLXbyOPchaa
	 LPmgq22GT8Mg+Id+g2wryn/7gJxCz4DzYdNqEQ+rf/fwuGkQ28K07y1ZarUEfUUXgp
	 BJMwf+JBqV4LA==
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
	Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 33/55] input: touchscreen: atmel: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:32 +0100
Message-Id: <20231127165454.166373-34-benjamin.gaignard@collabora.com>
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
atmel touchscreen driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Nick Dyer <nick@shmanahar.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 20094b9899f0..47f2b3aafa4d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2546,7 +2546,7 @@ static const struct vb2_queue mxt_queue = {
 	.ops = &mxt_queue_ops,
 	.mem_ops = &vb2_vmalloc_memops,
 	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
-	.min_buffers_needed = 1,
+	.min_reqbufs_allocation = 1,
 };
 
 static int mxt_vidioc_querycap(struct file *file, void *priv,
-- 
2.39.2


