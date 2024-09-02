Return-Path: <linux-media+bounces-17365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB559968967
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98B10282B47
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670E32101AD;
	Mon,  2 Sep 2024 14:05:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4732101AB
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285906; cv=none; b=hw70hCbWhRqH0Ecy13d5raFvXw+1SEo9oHpsqcQrPPzMiG+7RszG9AoN/XZloKrTOIxWxwSagDNrSSZbPLgCuTZJSkZ+rtvuw+wSzI8m1FfAPqj9sxF4itef7+kxuDdTdx7OEXLRQfXCPCmwnXPFkJiwPiYS8YDuWsWVKEDN8Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285906; c=relaxed/simple;
	bh=4+sYOVEWudfQ7A3gAJKo1TYrsTzNLGy1rNQrOlopv/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AlgkfQxS8wRP2dvT1jRBAuIcj8WM4qAkuVZ7ONe4RdALCUYlQ9TybOV0pR9OCk5I2E+tooHZ6Wy6bUx4b9hm4QBufzSHfRYz9QVGtX43wnlsX8Zwq/Y8HyrgQgn4yPZ+jChHaF2Aqk+Wg/iZMdJ28ZhXXpDKoyIlJeYvJSUczGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940C7C4CEC4;
	Mon,  2 Sep 2024 14:05:04 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 6/9] media: rcar_drif.c: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:52 +0200
Message-Id: <31085af170e3cc9b4fe115d53a556ccf477751d3.1725285495.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
the future. So for those drivers that set the lock later, move it up to
before the vb2_queue_init() call.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index f21d05054341..5d3109940ded 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1071,7 +1071,6 @@ static int rcar_drif_sdr_register(struct rcar_drif_sdr *sdr)
 	sdr->vdev->release = video_device_release;
 	sdr->vdev->lock = &sdr->v4l2_mutex;
 	sdr->vdev->queue = &sdr->vb_queue;
-	sdr->vdev->queue->lock = &sdr->vb_queue_mutex;
 	sdr->vdev->ctrl_handler = &sdr->ctrl_hdl;
 	sdr->vdev->v4l2_dev = &sdr->v4l2_dev;
 	sdr->vdev->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER |
@@ -1316,6 +1315,7 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
 	sdr->vb_queue.ops = &rcar_drif_vb2_ops;
 	sdr->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	sdr->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	sdr->vb_queue.lock = &sdr->vb_queue_mutex;
 
 	/* Init videobuf2 queue */
 	ret = vb2_queue_init(&sdr->vb_queue);
-- 
2.34.1


