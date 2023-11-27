Return-Path: <linux-media+bounces-1135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B15337FA724
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C8A328162C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBA63DBAE;
	Mon, 27 Nov 2023 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fRzBKxgr"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75621FE1;
	Mon, 27 Nov 2023 08:55:30 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AA3E66073D3;
	Mon, 27 Nov 2023 16:55:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104128;
	bh=XHY1AINeJ9MzBkkr5zEpq1g8COVMpemGzWI4pwBIFa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fRzBKxgrAEff3sfYNfYAcyeBEFRcIZrXZKo61JA9EDYMcbJwB04bk1fuUxcfcZ5l0
	 4tKCk8SikbcntXrdTatdABcMyFpWo/AHSfOmXAPdxgmjMeMMTZ2Rd4Y39aXZUHzjFy
	 e/DkVwxYdtxfMHjP0WPzzxz9fUGk0gqJF8JKrYSG/7lNvd1ITu0XimopKmRxIKkBCB
	 AVBshSRIqHZ2eUUTKzkGEpAY+v9NSwHYdmTcVpKWTI1nxps0VGnlg0fkWaJSalskuc
	 uO5GWVmJdhhVLcCttxQ72Hq3bD1BwbKMg3Ya/9RYe6H66teaqherQjJTek9Sls/1Vl
	 gjehpR0o3Ae9w==
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
Subject: [PATCH 29/55] media: ti: am437x: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:28 +0100
Message-Id: <20231127165454.166373-30-benjamin.gaignard@collabora.com>
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
am437x driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index f18acf9286a2..c2abb7760225 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2234,7 +2234,7 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
 	q->buf_struct_size = sizeof(struct vpfe_cap_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &vpfe->lock;
-	q->min_buffers_needed = 1;
+	q->min_reqbufs_allocation = 1;
 	q->dev = vpfe->pdev;
 
 	err = vb2_queue_init(q);
-- 
2.39.2


