Return-Path: <linux-media+bounces-1119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F967FA702
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FBBD280CC4
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277C0381D3;
	Mon, 27 Nov 2023 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aK5Jnza1"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1975610C3;
	Mon, 27 Nov 2023 08:55:17 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F6F46602F16;
	Mon, 27 Nov 2023 16:55:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104115;
	bh=aaWCiqdk39sHKKb5QCMsk+ktnGuP0FZaTGK54tWrHxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aK5Jnza1wx5sBNowajBeB5DX02ljyxjC4c27B+SImhywaxDxh9iCWLMyGA6/UTFrH
	 HBZ4/iQONttHOownb4AKM+IHPs/4xfuQxikg3zgIwYVlxg04TAra+pMkvVpzbKpNWR
	 iqxH2MQ7+vOr67hiT9DknWQebgDsWq6NEk9vRDN4zSygZkXgQThE1ES8F32RI4TScb
	 4NiwI1BHAodRWKJmi8XWytuFZ6QVBJUsYU64tamXX/goCVjX19CYKQGlXiav+HheR0
	 MxlIiIo1fwqnPjis8aD9W9KSfAUC8QxT+f4twZUoucK4OU9AzD2xVEQCvwk62b4+8A
	 b7e83ngdHNcvg==
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
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH 13/55] media: aspeed: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:12 +0100
Message-Id: <20231127165454.166373-14-benjamin.gaignard@collabora.com>
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
aspeed doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Eddie James <eajames@linux.ibm.com> (maintainer:ASPEED VIDEO ENGINE DRIVER)
CC: Joel Stanley <joel@jms.id.au> (supporter:ARM/ASPEED MACHINE SUPPORT)
CC: Andrew Jeffery <andrew@codeconstruct.com.au> (reviewer:ARM/ASPEED MACHINE SUPPORT)
CC: openbmc@lists.ozlabs.org (moderated list:ASPEED VIDEO ENGINE DRIVER)
CC: linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
---
 drivers/media/platform/aspeed/aspeed-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index d08aa7f73d4f..c28b10808cda 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2034,7 +2034,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	vbq->drv_priv = video;
 	vbq->buf_struct_size = sizeof(struct aspeed_video_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
+	vbq->min_reqbufs_allocation = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-- 
2.39.2


