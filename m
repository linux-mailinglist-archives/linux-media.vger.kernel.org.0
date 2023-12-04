Return-Path: <linux-media+bounces-1571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A07FB803492
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 583581F21118
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F203D2574B;
	Mon,  4 Dec 2023 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ScY/owUY"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C1418F;
	Mon,  4 Dec 2023 05:24:04 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B79946607090;
	Mon,  4 Dec 2023 13:24:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696243;
	bh=hw+EcJmQWwZPR1A5B99ReLj35TY7AMeTL9JoTuzkKAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScY/owUYVMArpLwsZLqwD8BURKTytyZwaGhIdZHnATD5V85sPJdmyfgFtfJ3W58n1
	 AzJOV3V9/JsgScBZdgNAdJY9+25vMZ5RiDFw9inseTsVPtLLrZ+jueagxnryoW3wk0
	 3Krn8WecTG7xtTt3bIhU/cwVFCTe7JG7YYmjkJLgi3dkMOw9vVOqt5Puo4w3vwMvrr
	 dTxcbbpDVNka5SRJH3yZagQbR3c96AdjTNGETYIVjf1cQvRFDZkUEKXg9qT7b7CTe3
	 aFnm2Cg6rjBUGVDvm5fxjhAtsj/PK3ikUklYREsbhNeyZD/tQpaFVkqWXKI5TmAM1r
	 GaIgzX1iEKCzw==
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
	Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH v2 15/36] media: pci: intel: ipu3: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:23:02 +0100
Message-Id: <20231204132323.22811-16-benjamin.gaignard@collabora.com>
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
CC: Yong Zhi <yong.zhi@intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@intel.com>
CC: Dan Scally <djrscally@gmail.com>
CC: Tianshu Qiu <tian.shu.qiu@intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 5d3b0ffd3d08..7f72be686981 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1589,7 +1589,6 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	vbq->mem_ops = &vb2_dma_sg_memops;
 	vbq->buf_struct_size = sizeof(struct cio2_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = 1;
 	vbq->drv_priv = cio2;
 	vbq->lock = &q->lock;
 	r = vb2_queue_init(vbq);
-- 
2.39.2


