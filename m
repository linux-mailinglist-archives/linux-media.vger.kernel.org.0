Return-Path: <linux-media+bounces-1580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A76398034A6
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38254B20B4A
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA191286AC;
	Mon,  4 Dec 2023 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LXMQ8D4U"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB341726;
	Mon,  4 Dec 2023 05:24:17 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CA70660711D;
	Mon,  4 Dec 2023 13:24:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696256;
	bh=TyWnSNSrmM8e46vPb9QIHFcmc4e6SFgOyK7FFQxtbXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LXMQ8D4U/gijOA+nUY9rm3gjiwOc0G6dc8hMd3HlJtRWwSaCNyLJ+aJM3LN4QrieH
	 dRtj3lkOPuToKcN3biJUAeBcxH40CwA7vdpXA8arNS5MDdQAfOnlZfDTW45RWrHDC4
	 74ZeWIiRTkviXGAT+G1Pk3q3hHsxYizqv/TOX9T7KjUeywIRMzex3TTvlNe48J2cJY
	 sO3NE/qODXyrU88wuAu6vlwJyfjujx5M/UDRQL4/f6hPwVH5LWhq4Z2QaXaKRIbZ84
	 UyOzZvkdTRTuN4lAAHwEMPWe8/eGNvGptxbKKjBiy/3sUwnDkRpW2WQ/BNP2RpHLNa
	 EJdQuawBQH2QA==
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
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 24/36] media: rockchip: rkisp1: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:11 +0100
Message-Id: <20231204132323.22811-25-benjamin.gaignard@collabora.com>
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
rkisp1 driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Dafna Hirschfeld <dafna@fastmail.com> (maintainer:ROCKCHIP ISP V1 DRIVER)
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (maintainer:ROCKCHIP ISP V1 DRIVER)
CC: linux-rockchip@lists.infradead.org (open list:ROCKCHIP ISP V1 DRIVER)
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index c6d7e01c8949..de3d89b1fac7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1431,7 +1431,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	q->ops = &rkisp1_vb2_ops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct rkisp1_buffer);
-	q->min_buffers_needed = RKISP1_MIN_BUFFERS_NEEDED;
+	q->min_reqbufs_allocation = RKISP1_MIN_BUFFERS_NEEDED;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 	q->dev = cap->rkisp1->dev;
-- 
2.39.2


