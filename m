Return-Path: <linux-media+bounces-1559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDB803479
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B7C280F9F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665A8250EA;
	Mon,  4 Dec 2023 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c8OUxYNU"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09020AC;
	Mon,  4 Dec 2023 05:23:41 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 29BB566071EF;
	Mon,  4 Dec 2023 13:23:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696220;
	bh=K4kc6aE30aNr8fEMgPpgyQo0QhobUXDuFfbQVHAZRG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8OUxYNUoNxpwYJm3Jv1Eccbec9duUXulRVJcZPfah9Ps5AxoQrGTqY9Nv/rDIkZd
	 h62H0JaJhtnjssg41JXC9W5DGjCMj5BWY5sTBh92Kxnf/sG7jvw7G1D01v5iRYpRmN
	 WO0axwUsNrncXkx+FahUSDNjJwJZAB9tU6slULf7AkaH68Vrpk/6c7Ex54bQIp1WUl
	 byfVGg/mOmQDngw1WY0Vv2857SGk0e4dvCarAKy2h9qn9Y8HkKjrvN8AJj7KLwcqjr
	 HluZdiPgsWptSJVBwv7eDhx6XB3H7nY2DlEwiy/w48o+9fnOc2O+zgD7lC9Vu3JnH8
	 JCCiULoihos1Q==
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
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 03/36] media: microchip: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:50 +0100
Message-Id: <20231204132323.22811-4-benjamin.gaignard@collabora.com>
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
CC: Eugen Hristev <eugen.hristev@collabora.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 3fba0e2844b6..63c39981f47a 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1821,7 +1821,6 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	q->mem_ops		= &vb2_dma_contig_memops;
 	q->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock			= &isc->lock;
-	q->min_buffers_needed	= 1;
 	q->dev			= isc->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.2


