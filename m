Return-Path: <linux-media+bounces-1115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B97FA6FE
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D951C20BDC
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3285E374F2;
	Mon, 27 Nov 2023 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ahoEW6BE"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCE4D41;
	Mon, 27 Nov 2023 08:55:14 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B752566072B4;
	Mon, 27 Nov 2023 16:55:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104113;
	bh=ayBhyvSUe+u4AtwC/rm89lTriRSE3ewHkfysyr3gsEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ahoEW6BEFCLYt8ukZWa9VOHDQ1+NdpPPSgLK/sNTfG2PMP2G6oYMPBqKgQF+emRS5
	 GQz5tkAX7r0tWaK9EFKT0dulFvaBrfAivz2AArXK6KnOYQ9TIC2l/Rz5pYtuYULIDi
	 dTyOz9lX6ZJOQLNtvEdtnjAnm57y/J8N+W5kGGZRGAoq6KIMxbAipc8cW0UVMQF49g
	 InY0zhL9GBg2M23GKowCPIUkCVUCLAvZW8G351rowpgw17YEnCQt1PBGYf2Jlg78/V
	 vN8+WHGycSA/NUCvj/mBuLNCSe4h7+4d8ZyhXnxOhqHTVvJlZ935py1NV8Z+cxg0ap
	 N2HnPImvB+bGA==
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
Subject: [PATCH 10/55] media: nuvoton: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:09 +0100
Message-Id: <20231127165454.166373-11-benjamin.gaignard@collabora.com>
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


