Return-Path: <linux-media+bounces-1157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4A7FA751
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9EEF1C20C5A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC17446B8;
	Mon, 27 Nov 2023 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CudTVH0G"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643F02D78;
	Mon, 27 Nov 2023 08:55:48 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 024756607427;
	Mon, 27 Nov 2023 16:55:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104146;
	bh=F5H/xy1t7xG2JnVZwoCdxqoIZwKLuviOUA/LItWXlFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CudTVH0GFVAKjdGuqqvwAJQo6DmaDPbWDIhBKTvy06O6+ZaBHxeVOOtmtNh1Tmoce
	 pArKAwpVjiXPzhu12+CZStv9JKm+zQFThaHzQEwSHyd2VwWb/OPMUOLXtI44geV2nr
	 lXV3xD9cB9VNaerWjiM8bC+RSlX7G0f8nSWn9HB+73763w4mtZZ8k8z7Nqivgf9z3j
	 GVRS9rjsScq1g9+Exg6mQlQpH6olubrhR407oukK8/wk0S0+nLFJweoE++qIdqQ/5+
	 W6ImZWVz0Vsw5SKHVMspeXI+bKdMGSdhMSe0GdWUXOosAIgF3b0CnY9IBykMOvlPi+
	 oLBpGHFFim9EQ==
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
Subject: [PATCH 53/55] media: pci: cobalt: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:52 +0100
Message-Id: <20231127165454.166373-54-benjamin.gaignard@collabora.com>
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

cobalt driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/cobalt/cobalt-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 26bf58d17a3d..9e99820f58d4 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -1260,7 +1260,7 @@ static int cobalt_node_register(struct cobalt *cobalt, int node)
 	q->ops = &cobalt_qops;
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->lock = &s->lock;
 	q->dev = &cobalt->pci_dev->dev;
 	vdev->queue = q;
-- 
2.39.2


