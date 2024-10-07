Return-Path: <linux-media+bounces-19152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B901992C48
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 14:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA7CDB25FA3
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 12:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18181D5CC5;
	Mon,  7 Oct 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W4eTM81i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94D1D2B1B
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304967; cv=none; b=MEwW/HeQwb53jm4Cz0w7BuH4skOPM0jjAczlE/mYZJuWiQN5zYXRJ29DGXM+cECR26+UVvnF9bkSj8liT6GFHgdwl8Mj46zH/Vs510WTAs2g6xkgxNG7Mr9U7/6z+k5qgxnvmlJZX5iRdLDiFkqaeZkHaNg1KHGLZnQk3mEVZr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304967; c=relaxed/simple;
	bh=cIgOXRu/QnyKT6Kc7YLPsAf05GbLiRTeiJs2EJHzoZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DILCBDDMyt9rc3TIoEjAeelyCDljozYT31r7ZhgqGTeL+nH5PYUEUbZor8Z3DMgHCeVwYlLWW8akx7UYD5jhB/6+uUnNIwlOoTHjnfN7JO7Ig9K0JgpCoCN3YbrxpcbintLO+7PeeQVSvFWw9VU7BDva3ERQqp8nMR9zaaGpDzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W4eTM81i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [5.179.165.198])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43A5649E;
	Mon,  7 Oct 2024 14:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728304861;
	bh=cIgOXRu/QnyKT6Kc7YLPsAf05GbLiRTeiJs2EJHzoZw=;
	h=From:To:Cc:Subject:Date:From;
	b=W4eTM81ilY3L2TGxgvdaMvuH8JjevuQR494wC/1QEPbbWT9aM6oWPRNMlr/wDs8eZ
	 QjUsoorgF3tF3eMCKlw1P+yoZEu3ZAnlXpsIMlrDi8E/3WrYeVRXps2jiiUyVnjlrh
	 bHGCcmw3BMQIYGHsCxuZSE9GSYycDIcmOpO4Sy0o=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:ROCKCHIP ISP V1 DRIVER)
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org (open list:ROCKCHIP ISP V1 DRIVER),
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Date: Mon,  7 Oct 2024 14:42:24 +0200
Message-ID: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.1
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

Reduce the number of required buffers to 1 to allow applications to
operate with a single queued buffer.

Tested with libcamera, by operating with a single capture a request. The
same request (and associated capture buffer) gets recycled once
completed. This of course causes a frame rate drop but doesn't hinder
operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---

Adam,
   a few months ago you were exercizing your pinhole app with a single capture
request for StillCapture operations and you got the video device to hang because
no enough buffers where provided.

This small change should be enough to unblock you. Could you maybe give it a
spin if you're still working on this ?

Thanks
   j
---

 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 2bddb4fa8a5c..34adaecdee54 100644
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
+	q->min_queued_buffers = 1;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->vlock;
 	q->dev = cap->rkisp1->dev;
--
2.46.1


