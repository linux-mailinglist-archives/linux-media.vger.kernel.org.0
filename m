Return-Path: <linux-media+bounces-20491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50E9B440C
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659631F235B2
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C42C202F64;
	Tue, 29 Oct 2024 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TeG6JMJC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E21DFD96
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190099; cv=none; b=caBuuBP3aADMgCM0Kn7brWDbUUYr82tDiGkExcrpWTQx0rEqHKjXs/tNY29c2B7hocXrnJptcAXRH0Ylih4aBIx0gg2O1LaQ9MwbY0mnpORJdR4jQM4Mnag3n+7pzxlnHiaw1wkmbwS0HGLXFAqtumgbDXzZENxHuBEHjkf4aAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190099; c=relaxed/simple;
	bh=gY8gAnJmjmAm1iIjaHWycvChikO7TknVEVxU2X2bhko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeI+/M6xnVKgjj3Dd7ZVkoQrG09nPEbnrW5p2ks5cI9wCFUL4rpcDUAwcEgooHAddZZIWaKmXILPdpLvsAbMGVh7pjnHbzDRYzXY9twx71bIi/WtgnFxniO6qNA8iWMO+mXdFl6+TlerqZNpjHAs+LWX+uYLP9HM+rJmuNC2NhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TeG6JMJC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-182.net.vodafone.it [5.90.50.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC5D44D4;
	Tue, 29 Oct 2024 09:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730190087;
	bh=gY8gAnJmjmAm1iIjaHWycvChikO7TknVEVxU2X2bhko=;
	h=From:To:Cc:Subject:Date:From;
	b=TeG6JMJCnpdI8pGSB8j6/TKnkCgJJKt5ERu65UgZJWzWaVYl4sH0aKjsSX9VBN5SY
	 ePKxUq99hVTT2dYsm1JfscjX18u8X3KSr7on62cDKiumgy7rO+heUsG/TIBi+D473x
	 cDVEKqzoSRp0Pa2mzP+TLXdOm2nOiN2Mv3GLPta8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org (open list:ROCKCHIP ISP V1 DRIVER)
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org (open list:ROCKCHIP ISP V1 DRIVER),
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH v3] media: rkisp1: Remove min_queued_buffers
Date: Tue, 29 Oct 2024 09:21:16 +0100
Message-ID: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There apparently is no reason to require 3 queued buffers for RkISP1,
as the driver operates with a scratch buffer where data can be
directed to if there's no available buffer provided by userspace.

Reduce the number of required buffers to 0 by removing the
initialization of min_queued_buffers, to allow applications to operate
by queueing capture buffers on-demand.

Tested with libcamera, by operating with a single capture request. The
same request (and the associated capture buffer) gets recycled once
completed. This of course causes a frame rate drop but doesn't hinder
operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
v2->v3:
- Remove min_queued_buffers initialization

v1->v2:
The first version of this patch set min_queued_buffers to 1, but setting it
to 0 doesn't compromise operations and it's even better as it allows application
to queue buffers to the capture devices on-demand. If a buffer is not provided
to the DMA engines, image data gets directed to the driver's internal scratch
buffer.
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 2bddb4fa8a5c..2f0c610e74b9 100644
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
@@ -1563,7 +1561,6 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	q->ops = &rkisp1_vb2_ops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct rkisp1_buffer);
-	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 	q->dev = cap->rkisp1->dev;
--
2.47.0


