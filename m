Return-Path: <linux-media+bounces-1141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 467367FA732
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01A80281034
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF093EA7F;
	Mon, 27 Nov 2023 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SYacJ+X5"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA73212C;
	Mon, 27 Nov 2023 08:55:35 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 75AB7660737B;
	Mon, 27 Nov 2023 16:55:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104134;
	bh=X02tzOo2kO6Xf8Mm3XO+fdYdi1NrT5mrpTJUnhqGe4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SYacJ+X5qY1brq6yAX2v6Zh8vkADiRh6fL5ssu4J7Myr/+F2ok5EzyvDWTgMHHjXP
	 5zzfGnbfATjw9t+mQdXymhiV3mymtoeLiX65T3m8+Ae4xllQeIw6OFIgIeSqC1NSzn
	 dbhT00XGtQ+nld5mStG1N0pyys73Mse09oS0sERTP7WakGbDOcD4bjJEPnjWZ/NJ7y
	 Gor0tI48ojqW9MVdR4Al0vXf/6SiknsCV8AFr179BFApBGgQUjqxKUFHRGZtC/PScq
	 9FbmTemR64ciabk44Ke+awxocJzpI59XYNQVsAv4rhwe4vkrNSdaZJSSvCkpQR6meB
	 0UY/Dv//MyFIQ==
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
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 36/55] media: stm32: stm32-dcmi: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:35 +0100
Message-Id: <20231127165454.166373-37-benjamin.gaignard@collabora.com>
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

smt32-dcmi driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 48140fdf40bb..a267fdcbe886 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2031,7 +2031,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	q->ops = &dcmi_video_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->allow_cache_hints = 1;
 	q->dev = &pdev->dev;
 
-- 
2.39.2


