Return-Path: <linux-media+bounces-1117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C52427FA701
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64C54B2158E
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DBE3A8C3;
	Mon, 27 Nov 2023 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EJ2rDmOH"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB93D5B;
	Mon, 27 Nov 2023 08:55:15 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AD836607323;
	Mon, 27 Nov 2023 16:55:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104114;
	bh=q+PBOieh7TUOZfOTD/eax3kPGizf1naDWVCgdVzk/Rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJ2rDmOHuYC+RuIZhYXo8DzC0Rkky/qSkpSFNsGMMVKLXohgncgJ1VcjJ74ikJGtf
	 pY+o9OAvZ02fx9XYYChpfQcBnLpuhwM0fXK8/MYElMkedofzaOuGcYCgGIGgD9L3/t
	 Qfqaciz57Axsq9LOu5/sBoxUQbbYMlFof/CVjj1OHKZnXjIhLO2lhxnpDDLE9KhY1q
	 rCMIlMoSpiJy5nHB+B5Qpfv51KH3hA8Y28gS7RQFBGvGvtaHEvY8HKUFMR2m21KaLd
	 qDYw4OTcBnjIUkRd6LlPfmV7RjT1KDoCeaKCHbUzFubxnZFKp5UK+/Ug0zAxL588t3
	 o9asdDeXrRa9A==
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
Subject: [PATCH 11/55] media: sti: hva: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:10 +0100
Message-Id: <20231127165454.166373-12-benjamin.gaignard@collabora.com>
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


