Return-Path: <linux-media+bounces-1581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A79738034A8
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503BC1F210C8
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB7728385;
	Mon,  4 Dec 2023 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aVDiumS+"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3481736;
	Mon,  4 Dec 2023 05:24:18 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ED1646607295;
	Mon,  4 Dec 2023 13:24:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696257;
	bh=AW4MiQtO7r6ySDJZcj9g+R3UOrOpuuzpH/3N4dqRqdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVDiumS+7Hpbvv34UKnXzYkoHyqH89/rANrJsiNmeivGeqLC6oykhygzavaE1PwlN
	 LAhT0KTDSQ8/jXa7SQy+c0+gRpYO3UnWqb62UMTo+9fatf+99bCTPXb+goI7DTXGM8
	 zCdPxN+nEMMtS25qQ9jYdpywtyWicrAkBdtpK1+t4SXfsdhoEN5J7WvwvvPI558q/3
	 EeR5v/ZtI+cjA6lGn7q2vyYC/zaMNhlzLkFs0Lt4aRO+SaosJsqCjIHuU+2M6jkvtT
	 wT9c/5c2uA/9JP0YkHx5mfS9GcTR69Cc6Rl36GlAEJIYkuQwOoL9NH5sqGYFjXLC8b
	 CBA9pQbGUvW7Q==
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
Subject: [PATCH v2 25/36] media: aspeed: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:12 +0100
Message-Id: <20231204132323.22811-26-benjamin.gaignard@collabora.com>
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
aspeed doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
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


