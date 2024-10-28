Return-Path: <linux-media+bounces-20424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D499C9B33AD
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EF2AB2233E
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 14:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3E71DDC3C;
	Mon, 28 Oct 2024 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ldDufEew"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89471DD864
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126174; cv=none; b=VvpzCMt8xT1pGQaAVjNqS7c8SwAioO/YGG0vwg8M8N4K0T4Q71CSoXqWAK8pQGsCHQ4xQ2zZGOM2Qcr9pOHHWaIQo9d1YP30sRzhfnQMlN5CVRNQMRhIGSRcHg6Sej5UAN6GNwPnll3w26ioNwUP4TG56xJW4NLXp41KFPFJN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126174; c=relaxed/simple;
	bh=HPD8ZRLLtnHVf726wKWAdK5FV3gLOLtXJ8mQomeHB0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnQWZVqJGK1kWhQKX8erhNmJM4Xd8doKQ9sGeIiV0YPJLE6lRoYizjy8vCe70gTT6e0zZ3zcPRaFUa7rpwgSHfCpdTlmm4S4jA3drQuLes3KTR0ONYnqr+t58tb42+7iDdqoDRZY9UgxSXaKYYnrHBCDGVwYduSTdWf+lgrQ8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ldDufEew; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-59-111.net.vodafone.it [5.90.59.111])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B625743;
	Mon, 28 Oct 2024 15:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730126167;
	bh=HPD8ZRLLtnHVf726wKWAdK5FV3gLOLtXJ8mQomeHB0c=;
	h=From:To:Cc:Subject:Date:From;
	b=ldDufEew9c6KgFzUw6zPdpI8LMrJHCwB0B48d3pctOwjGoHs/Pjoi34Q7/3AcfDB8
	 edb3TFSa60Ppe9PJB2DFSFAB+0khLDBCmiI+rWg/hvog/zEepm1XpV1yt8SN9zpbZw
	 45oLx2mY/MFT7HBkCmumy2rQBOae6tIJ90p4qdLE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:ROCKCHIP ISP V1 DRIVER)
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org (open list:ROCKCHIP ISP V1 DRIVER),
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH v2] media: rkisp1: Reduce min_queued_buffers to 0
Date: Mon, 28 Oct 2024 15:35:52 +0100
Message-ID: <20241028143553.36704-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There apparently is no reason to require 3 queued buffers to call
streamon() for the RkISP1 as the driver operates with a scratch buffer
where frames can be directed to if there's no available buffer provided
by userspace.

Reduce the number of required buffers to 0 to allow applications to
operate by queueing capture buffers on-demand.

Tested with libcamera, by operating with a single capture request. The
same request (and associated capture buffer) gets recycled once
completed. This of course causes a frame rate drop but doesn't hinder
operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
The first version of this patch set min_queued_buffers to 1, but setting it
to 0 doesn't compromise operations and it's even better as it allows application
to queue buffers to the capture devices on-demand. If a buffer is not provided
to the DMA engines, image data gets directed to the driver's internal scratch
buffer.
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 2bddb4fa8a5c..5fcf9731f41b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -35,8 +35,6 @@
 #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
 #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"

-#define RKISP1_MIN_BUFFERS_NEEDED 3
-
 enum rkisp1_plane {
 	RKISP1_PLANE_Y	= 0,
 	RKISP1_PLANE_CB	= 1,
@@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	q->ops = &rkisp1_vb2_ops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct rkisp1_buffer);
-	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
+	q->min_queued_buffers = 0;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 	q->dev = cap->rkisp1->dev;
--
2.47.0


