Return-Path: <linux-media+bounces-17363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40EE968965
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703DA282CF3
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC32B2101A1;
	Mon,  2 Sep 2024 14:05:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC519E992
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285903; cv=none; b=QpFpBAitlqlfw6PZPpNqT0HHfxG6JGQCLBxStVRJ4DmbjmiuDpZlpXWYIaZCix06x6LX0XXTbuFfmE0C+9d0BYIYLLyGw0R/KDoiZUV5IV9lwzN2US8sf43QVE9gqCKD8pRaGQjp5Xw4lE5W6ySQNzFsCCIXiIo9eeuHaPEB5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285903; c=relaxed/simple;
	bh=63teWxHNic6NpM+Kz7puKE2cIinSViFfhouVPJ8obsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1NtjTqM617JJO9+GD6MXG+H+HfN7ZDwf4TCNT7Jl4xRKwu88osYX6t61iJte3z964zuFhwCAsy0Q9V8v2qNtHXoz/GO46BbvfurOk6baeq/9ByTRtHSLWeBH30FktJfrZeSXrFS+I0dRuYPv9BX9N10OVZF2sGihzYfR0McgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA68C4CEC4;
	Mon,  2 Sep 2024 14:05:02 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/9] media: hackrf: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:50 +0200
Message-Id: <82f2c2cc2bfb9f30a65869202785c01aec3f591f.1725285495.git.hverkuil-cisco@xs4all.nl>
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
---
 drivers/media/usb/hackrf/hackrf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 9c0ecd5f056c..a1a7690a344a 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1398,6 +1398,7 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->rx_vb2_queue.drv_priv = dev;
 	dev->rx_vb2_queue.buf_struct_size = sizeof(struct hackrf_buffer);
 	dev->rx_vb2_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	dev->rx_vb2_queue.lock = &dev->vb_queue_lock;
 	ret = vb2_queue_init(&dev->rx_vb2_queue);
 	if (ret) {
 		dev_err(dev->dev, "Could not initialize rx vb2 queue\n");
@@ -1413,6 +1414,7 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->tx_vb2_queue.drv_priv = dev;
 	dev->tx_vb2_queue.buf_struct_size = sizeof(struct hackrf_buffer);
 	dev->tx_vb2_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	dev->tx_vb2_queue.lock = &dev->vb_queue_lock;
 	ret = vb2_queue_init(&dev->tx_vb2_queue);
 	if (ret) {
 		dev_err(dev->dev, "Could not initialize tx vb2 queue\n");
@@ -1474,7 +1476,6 @@ static int hackrf_probe(struct usb_interface *intf,
 	/* Init video_device structure for receiver */
 	dev->rx_vdev = hackrf_template;
 	dev->rx_vdev.queue = &dev->rx_vb2_queue;
-	dev->rx_vdev.queue->lock = &dev->vb_queue_lock;
 	dev->rx_vdev.v4l2_dev = &dev->v4l2_dev;
 	dev->rx_vdev.ctrl_handler = &dev->rx_ctrl_handler;
 	dev->rx_vdev.lock = &dev->v4l2_lock;
@@ -1494,7 +1495,6 @@ static int hackrf_probe(struct usb_interface *intf,
 	/* Init video_device structure for transmitter */
 	dev->tx_vdev = hackrf_template;
 	dev->tx_vdev.queue = &dev->tx_vb2_queue;
-	dev->tx_vdev.queue->lock = &dev->vb_queue_lock;
 	dev->tx_vdev.v4l2_dev = &dev->v4l2_dev;
 	dev->tx_vdev.ctrl_handler = &dev->tx_ctrl_handler;
 	dev->tx_vdev.lock = &dev->v4l2_lock;
-- 
2.34.1


