Return-Path: <linux-media+bounces-1130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D1E7FA71A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFEB91C20B3C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EC73DB80;
	Mon, 27 Nov 2023 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X46/hfSc"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2F71BEE;
	Mon, 27 Nov 2023 08:55:26 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D177E66071EF;
	Mon, 27 Nov 2023 16:55:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104125;
	bh=6fLuB21NqZHQ9MYfFVjrs/3zUstZGwJ8LCc0NS9LFcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X46/hfSczoQezSpEDoB4gMCxWcrCu/PmrdfIbxsUqXyLgcUdVBnZCapFmnqB78f/N
	 Rkq0xLW3LBtfKdyUICWd/b22L5v1j8lzrc8Y5msfSqTshXC+m7zfUGixwUhDoCz7wh
	 wtJi0FY7JsF8dAf6NKcZYSliw+At0lUQSi71uRC9PhERPgdTULw3A3YvhiXSWBliUU
	 gA0Fvzm0vNwLT70tWOxUAbChhbJnIzkp/Rp1vwpHGUnJ6zDMzRdOtc1O1ObkkQzdVi
	 NxoaXijoa0y2AxYoW/ASXNaHfye9kIX7lSDtOKvdorglQxUxcxLoXJVbTkboPYDrtS
	 azWDc8ZE0l/Rg==
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 25/55] media: ipu3: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:24 +0100
Message-Id: <20231127165454.166373-26-benjamin.gaignard@collabora.com>
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
ipu3 driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@intel.com>
CC: Tianshu Qiu <tian.shu.qiu@intel.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 0fe2b858da83..197326fbcc2c 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1198,7 +1198,7 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	vbq->buf_struct_size = imgu->buf_struct_size;
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	/* can streamon w/o buffers */
-	vbq->min_buffers_needed = 0;
+	vbq->min_reqbufs_allocation = 0;
 	vbq->drv_priv = imgu;
 	vbq->lock = &node->lock;
 	r = vb2_queue_init(vbq);
-- 
2.39.2


