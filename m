Return-Path: <linux-media+bounces-1131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59687FA71D
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A049328159E
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9123716C;
	Mon, 27 Nov 2023 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LdlQSF8T"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5231BF5;
	Mon, 27 Nov 2023 08:55:27 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA81A66073C8;
	Mon, 27 Nov 2023 16:55:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104126;
	bh=yTw2OYKem5rJF2Nwf34/Wc4CllCCaoPD56PNsk9nNiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LdlQSF8TUQUtEtQEX4FNz/sBA53t5NMSXGsZ7LoAxMo5zdnlfbOxs1MNTBy1JrjfA
	 xCwqsJ/8Kry0SJi3u6Dpp9FextBN6RG6fN9a32XVoqePLvzxR9KiFPS4D2pnePmpRo
	 BmypuumCDQykRPHnKSYMKZ3yvhyHoGQMsiGEODDUbc28DDz4RoK1UOiY6oftKGz6fV
	 AJv4rNy63G6mMHKUcxHfbHSVhpUYe2irMrL8EOccFCwsWd9nZOmnV3SBpgcSqaswfn
	 k7tAGqOsC14HEO1SsGqxPT6+5Tqe3lTwQccVH8KfoH9wUw2pZ/f/LQJzU41nIRDLgb
	 Vm6Zkj3oOjoKA==
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
	Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH 26/55] media: starfive: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:25 +0100
Message-Id: <20231127165454.166373-27-benjamin.gaignard@collabora.com>
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
starfive driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jack Zhu <jack.zhu@starfivetech.com>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index 0b305f21eb53..25038e37e8a6 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -513,7 +513,7 @@ int stf_video_register(struct stfcamss_video *video,
 	q->buf_struct_size = sizeof(struct stfcamss_buffer);
 	q->dev = video->stfcamss->dev;
 	q->lock = &video->q_lock;
-	q->min_buffers_needed = STFCAMSS_MIN_BUFFERS;
+	q->min_reqbufs_allocation = STFCAMSS_MIN_BUFFERS;
 	ret = vb2_queue_init(q);
 	if (ret < 0) {
 		dev_err(video->stfcamss->dev,
-- 
2.39.2


