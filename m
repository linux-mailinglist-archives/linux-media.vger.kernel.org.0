Return-Path: <linux-media+bounces-1562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0300803481
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55610B20B08
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9AE24B5B;
	Mon,  4 Dec 2023 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DRrAzwNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A92D2;
	Mon,  4 Dec 2023 05:23:48 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 275526602020;
	Mon,  4 Dec 2023 13:23:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696227;
	bh=jON8BOdCAHEK/Xd0Dl3W1Jb3UXgsTiGXSbXsYdLJdIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DRrAzwNQiG4aTqwGt24i0ROd0oGyvYIvQoLFxdhV2VVgvYsljYfEhYcQkBslVXJig
	 ZSEOGDiKkbaKKqcfCpQsALuYmKrRM6y9U9ZTrKCpTvLi+/vIBEdDcE3xTiRvzTO/Lh
	 d7Ngg6cYlsOqWbNqxL0N4oxbdBCnE68dzmZkAWfewpr22zpU9Z2K5jAuajOlnyj5ZS
	 bNHQuVPYCMi1o16ue5fP/0IY9xUdvQIEmC0C2WTNaGdkeNDB9nL12p5D15uE/ixo2i
	 vwbFEwI5bya62nzVGDU1WcTBJo2a+38rG0nvQUeCy9MEyQ76ao8B2lIuN88juzYftp
	 WglNxhx/vKSbw==
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
Subject: [PATCH v2 06/36] media: i2c: video-i2c: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:53 +0100
Message-Id: <20231204132323.22811-7-benjamin.gaignard@collabora.com>
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
---
 drivers/media/i2c/video-i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index ebf2ac98a068..8d7f01b50aa7 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -795,7 +795,6 @@ static int video_i2c_probe(struct i2c_client *client)
 	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	queue->drv_priv = data;
 	queue->buf_struct_size = sizeof(struct video_i2c_buffer);
-	queue->min_buffers_needed = 1;
 	queue->ops = &video_i2c_video_qops;
 	queue->mem_ops = &vb2_vmalloc_memops;
 
-- 
2.39.2


