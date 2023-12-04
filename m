Return-Path: <linux-media+bounces-1591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB69F8034B6
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A60F9280FA4
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBDE28DD4;
	Mon,  4 Dec 2023 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="es63y+ws"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52361BF7;
	Mon,  4 Dec 2023 05:24:31 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C82BF660739A;
	Mon,  4 Dec 2023 13:24:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696270;
	bh=2gAqxxEJ2KqwbPuMzplAmWNudI3ZJjJVcvYYervFwW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=es63y+wsk9NKG3N9BfzW7OCQ50+rqsy6ihBjbe9zjdwDiu3CBBKh/qkdxbd6heTM4
	 vefSwEUytpO5F+pQSjdFUOT99RlbDTSBk8QkBnhfqfi75GSCLM72yBLX/1/CJ2wTI/
	 JSTttSE1HP0oo31PiqCfbKl1vQKsXjtWq0OoqQFDjfPXX/oUHVXG2cTxtwpalWKrhz
	 A2Ie6leRnNjvtLFCER+hiY200xUyhOu+6mWhy/vEFBzkXIQhAn/QobIw8c6swWT0zg
	 WeFQNxVW7qpVQKpiRhERnu8mCEMR/eNgnaQJZ3CaBlz0yL7XvMF2bhEM5+W3nqgPMv
	 BlJQZGE2Vc3jQ==
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2 35/36] input: touchscreen: sur40: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:22 +0100
Message-Id: <20231204132323.22811-36-benjamin.gaignard@collabora.com>
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
sur40 touchscreen driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/sur40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index e7d2a52169a0..4da3063c352e 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -1124,7 +1124,7 @@ static const struct vb2_queue sur40_queue = {
 	.ops = &sur40_queue_ops,
 	.mem_ops = &vb2_dma_sg_memops,
 	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
-	.min_buffers_needed = 3,
+	.min_reqbufs_allocation = 3,
 };
 
 static const struct v4l2_file_operations sur40_video_fops = {
-- 
2.39.2


