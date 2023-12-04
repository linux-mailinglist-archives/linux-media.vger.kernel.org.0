Return-Path: <linux-media+bounces-1579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9638034A4
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D604DB20E3E
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EAD28684;
	Mon,  4 Dec 2023 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d+ot2jI0"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00410D8;
	Mon,  4 Dec 2023 05:24:15 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 50E6B66072A4;
	Mon,  4 Dec 2023 13:24:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696254;
	bh=q+PBOieh7TUOZfOTD/eax3kPGizf1naDWVCgdVzk/Rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d+ot2jI04YYP3nNR4UaNzhMsi2OZw+QIwwxMc1qtNVNr2FZVmsM8qk2SnXAwymoiy
	 YHFHpH26jUSYcsTSJc6NDNnWsNSvL/vEirCI4D7Vyi4u2d/Mi5y92f3c+qQ0toA4rF
	 iaZp4BOWgLaUUYk+DCauT/jaJJc8KTNzBQIfo1XNVjDHfLMkQWDiEV7uXyllW1Pu8S
	 F/OQ7P/8s2+syp5bL39Sggb3KDBEcVSC1896Y2CSbVC0VeO8EEaDiFyJ9ETdYGq/ij
	 7Zz8sIdixI6XoEX5+pC6Z1c4z2Uh8wMmDQKSoMl2flZjeu0owqGUSp4AOPKQsb2kfy
	 6lWfp2P42sW5g==
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
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
Subject: [PATCH v2 23/36] media: sti: hva: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:10 +0100
Message-Id: <20231204132323.22811-24-benjamin.gaignard@collabora.com>
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
hva driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index cfe83e9dc01b..d7bc25b0d69e 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1142,7 +1142,7 @@ static int hva_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
 	src_vq->buf_struct_size = sizeof(struct hva_frame);
-	src_vq->min_buffers_needed = MIN_FRAMES;
+	src_vq->min_reqbufs_allocation = MIN_FRAMES;
 	src_vq->dev = ctx->hva_dev->dev;
 
 	ret = queue_init(ctx, src_vq);
@@ -1151,7 +1151,7 @@ static int hva_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	dst_vq->buf_struct_size = sizeof(struct hva_stream);
-	dst_vq->min_buffers_needed = MIN_STREAMS;
+	dst_vq->min_reqbufs_allocation = MIN_STREAMS;
 	dst_vq->dev = ctx->hva_dev->dev;
 
 	return queue_init(ctx, dst_vq);
-- 
2.39.2


