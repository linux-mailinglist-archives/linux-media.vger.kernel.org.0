Return-Path: <linux-media+bounces-41973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9334B488D9
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D18B3B99B3
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB4D2F0C78;
	Mon,  8 Sep 2025 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dQ4NJpI5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C112EA752;
	Mon,  8 Sep 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324543; cv=none; b=CPBxIVAsXvm/vzI0oWxkjHMCHfPj42K7se5JaOJzXUaGMxVDr80gs93ABRbsJ7BwEl6wvdU9p+qwDcppcHFZXsrm3VQwe6q4krtVJSmzOaFG+5Kx0eyEOzCXGHmJXlIucqabIrPnT9iT2qIiLbS60Dzp3K+hvLz2hd+ksMIPJ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324543; c=relaxed/simple;
	bh=rnd6RDB+ozLJ6GnyO0aYYhAe1Suo1G2ATJAAjchaT4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wu4oxPiqOdc3ZttFigrTdMMi51Y6cY9bcIf6t1aIwtVBU2p6kkE9P1xIPGP/bx4eNf0g7YSXelyhJQjpslx6ORj2hRcoObrUmOFvrrWd9YDWYC27yOGsfFfibbCLVCjZI4tMfLeZpZjfzftdQVG2fASc8RclljFOa+ku2vrwi48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dQ4NJpI5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c241:40fd:9e5d:437c])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A397310BE;
	Mon,  8 Sep 2025 11:41:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757324464;
	bh=rnd6RDB+ozLJ6GnyO0aYYhAe1Suo1G2ATJAAjchaT4k=;
	h=From:To:Cc:Subject:Date:From;
	b=dQ4NJpI5PqVhdipK9jmKPgYLgosjlgb1nWZtjezh3jmh7178lplS4hxGh+eXpqkO0
	 W9MkAw4pnUxJBO9FfcZNU4Ypcr43Sg0OA/A3VxHHbB0d1NXDjDa5iUIrOm+D79CeZs
	 U2knWweIh4ly9rdszHBoD/BuLpn1y2eweOHPcR40=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkisp1: Improve frame sequence correctness on stats and params buffers
Date: Mon,  8 Sep 2025 11:41:48 +0200
Message-ID: <20250908094200.48002-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
debugfs var for irq delay") a warning was added for that. There are two
cases where this condition can occur:

1. The v-sync and the frame-end belong to the same frame. This means,
   the irq was heavily delayed and the warning is likely appropriate.

2. The v-sync belongs to the next frame. This can happen if the vertical
   blanking between two frames is very short.

The current code always handles case 1 although case 2 is in my
experience the more common case and happens in regular usage. This leads
to incorrect sequence numbers on stats and params buffers which in turn
breaks the regulation in user space. Fix that by adding a frame_active
flag to distinguish between these cases and handle the start of frame
either at the beginning or at the end of the rkisp1_isp_isr().

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ca952fd0829b..adf23416de9a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -222,6 +222,7 @@ struct rkisp1_isp {
 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_mbus_info *sink_fmt;
 	__u32 frame_sequence;
+	bool frame_active;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 8c29a1c9309a..1469075b2d45 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	isp->frame_sequence = -1;
+	isp->frame_active = false;
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 
@@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
  * Interrupt handlers
  */
 
-static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
+static void rkisp1_isp_sof(struct rkisp1_isp *isp)
 {
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
 
+	isp->frame_sequence++;
+	isp->frame_active = true;
+
 	event.u.frame_sync.frame_sequence = isp->frame_sequence;
 	v4l2_event_queue(isp->sd.devnode, &event);
 }
@@ -1112,14 +1116,15 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
 
 	/* Vertical sync signal, starting generating new frame */
-	if (status & RKISP1_CIF_ISP_V_START) {
-		rkisp1->isp.frame_sequence++;
-		rkisp1_isp_queue_event_sof(&rkisp1->isp);
+	if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active) {
+		status &= ~RKISP1_CIF_ISP_V_START;
+		rkisp1_isp_sof(&rkisp1->isp);
 		if (status & RKISP1_CIF_ISP_FRAME) {
 			WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
 			rkisp1->debug.irq_delay++;
 		}
 	}
+
 	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
 		/* Clear pic_size_error */
 		isp_err = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
@@ -1138,6 +1143,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	if (status & RKISP1_CIF_ISP_FRAME) {
 		u32 isp_ris;
 
+		rkisp1->isp.frame_active = false;
 		rkisp1->debug.complete_frames++;
 
 		/* New frame from the sensor received */
@@ -1152,5 +1158,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 		rkisp1_params_isr(rkisp1);
 	}
 
+	if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)
+		rkisp1_isp_sof(&rkisp1->isp);
+
 	return IRQ_HANDLED;
 }
-- 
2.48.1


