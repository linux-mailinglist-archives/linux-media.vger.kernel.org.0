Return-Path: <linux-media+bounces-1560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1980347B
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23F961C20AAF
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0443250EE;
	Mon,  4 Dec 2023 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YPPjIMOu"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1FDF3;
	Mon,  4 Dec 2023 05:23:43 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A05C66071CC;
	Mon,  4 Dec 2023 13:23:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696222;
	bh=vUKzmdehCfLCcwbM7gaKkVboVYXsxqKFA6kaBbI0L2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPPjIMOunjZNuH8fAjPP3b4mSMCV/NHPckS3LjK+bXSYdCykIk5tD/FGV9U+H/5BR
	 m01dBoNIjvgtGuQ3gycq515tlISsPaWjtLe1l1HCvCUuzbKHYMfRmzn1Yqf2oUMFFo
	 UnOxQa3CzjSVhOlkDrK40q/eNTj9/3QcyAcxPhfgEdavnwo7rrJTEAPLUdGnN5gnbG
	 ia8NC9nuPQbrn98fm+9YJKNZrlzbyIh+IT2bAQClJ7hgJqqvN08+t5efAoom6JLvXd
	 0Vog+unbItWp5hnYhKxsWoojzQY0GHbQ2HcPaVEYfjhxYGUM/gMewLLC0a6GDP+R3m
	 Tq0BN32TcXvRg==
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
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>
Subject: [PATCH v2 04/36] media: amphion: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:51 +0100
Message-Id: <20231204132323.22811-5-benjamin.gaignard@collabora.com>
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

This driver uses min_buffers_needed which vb2 uses to ensure
start_streaming is called when at least 'min_buffers_needed'
buffers are queued. However, this driver doesn't need this,
it can stream fine without any buffers queued.
Just drop this unnecessary restriction.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Ming Qian <ming.qian@nxp.com>
CC: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 87afb4a18d5d..a80c5f28c659 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -649,7 +649,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 		src_vq->mem_ops = &vb2_vmalloc_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
-	src_vq->min_buffers_needed = 1;
 	src_vq->dev = inst->vpu->dev;
 	src_vq->lock = &inst->lock;
 	ret = vb2_queue_init(src_vq);
@@ -666,7 +665,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 		dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
-	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = inst->vpu->dev;
 	dst_vq->lock = &inst->lock;
 	ret = vb2_queue_init(dst_vq);
-- 
2.39.2


