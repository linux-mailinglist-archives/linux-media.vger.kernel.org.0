Return-Path: <linux-media+bounces-1578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB378034A1
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 493BB1F210C8
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3540F28380;
	Mon,  4 Dec 2023 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jHh7yxhr"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC801103;
	Mon,  4 Dec 2023 05:24:14 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA691660715D;
	Mon,  4 Dec 2023 13:24:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696253;
	bh=ayBhyvSUe+u4AtwC/rm89lTriRSE3ewHkfysyr3gsEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHh7yxhrTOed0YJHpL+E4A6fJlIVw0a6JFHHV6uSNJqC09iqvj8joJHefNA4ayG2S
	 kLatJQCfnpDaRXBM3agihjPTM7S4hw02WFF62F7Zxcbxn/SlhPvKzYkUBrXPTPJgwM
	 k0Nxg/v8UyXQ3APyWJHuLRxbwXQChDXS1jmY4v/xRBSTWY2gK5c5X5iR14beAIlpCU
	 en1CbluLf+7j7WtS5HJG0LsC7LrKIK3crTmd3HcOUgN9544FHjTM01OP4BpYbWWXBh
	 1mQcmTjDEuymy3YrQncMjtQ8kt/JHBCzm7OuizEv9yhOIDChiu6rVH0dn4fyJr2zQC
	 NqSOIWfnFWeYQ==
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
	Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 22/36] media: nuvoton: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:09 +0100
Message-Id: <20231204132323.22811-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
nuvoton driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Joseph Liu <kwliu@nuvoton.com>
CC: Marvin Lin <kflin@nuvoton.com>
CC: openbmc@lists.ozlabs.org
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 267e301f2b26..6c122508be1d 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1612,7 +1612,7 @@ static int npcm_video_setup_video(struct npcm_video *video)
 	vbq->drv_priv = video;
 	vbq->buf_struct_size = sizeof(struct npcm_video_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = 3;
+	vbq->min_reqbufs_allocation = 3;
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-- 
2.39.2


