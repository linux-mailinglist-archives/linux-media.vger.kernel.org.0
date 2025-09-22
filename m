Return-Path: <linux-media+bounces-42961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B867B92966
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 20:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAA4344424A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 18:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78E83191DE;
	Mon, 22 Sep 2025 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L/8FBKlT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F2318146;
	Mon, 22 Sep 2025 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758565360; cv=none; b=VOs2ex/XUZ7itzgX0HtUob1TP/NIS4CMnW7ojmwpjJm62pLQVkn3a+QfqkLaxtL0M1rKFmvrQfhJ+R1/fePozykF4rUY6DAhXKvp/WFuatNkTpAq7AoCo73RW4TCYuJkLo/XhCxeWQqTf6hMqQa9x0qUSV9yL7oJ8UggjxlW7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758565360; c=relaxed/simple;
	bh=b5FgkqgcRpAPhJwM4wWi1BVoVHnT8H6KCuQiV5V1p+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWWWpifizhJDASgPwaIODG0O4y8hkS60ar5NVMz+84rwQp8CLj6n8aOPSTeYfGdpMjRbJAw4xGFhfWnhGIcAUgnzm+irkJWX6JchxnRCSqyf618CUPxfaNMQ0nvWamFk/m1yhm/w3EVqmB6W/jVtZhufnbDbZWkMYS1Sk47osHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L/8FBKlT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:2e97:e92:3fbf:8dbb])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 508A46DC;
	Mon, 22 Sep 2025 20:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758565267;
	bh=b5FgkqgcRpAPhJwM4wWi1BVoVHnT8H6KCuQiV5V1p+U=;
	h=From:To:Cc:Subject:Date:From;
	b=L/8FBKlTGlVV3ey/JGNvHo6MtrVf+y5bke3Xlf8bg+YOU2PXd0Dz7FhpkV1Ox6haE
	 K9QeVFFRVUZCbBWVJcL3x+AroTBlA/Z8PC98dlyj68cDMiATGWCncSn5JhV1SIzO1a
	 B7f/eCGy1HGbgsLo8veDdlTavU5elt8ACigglgM4=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: rkisp1: Improve frame sequence correctness on stats and params buffers
Date: Mon, 22 Sep 2025 20:19:57 +0200
Message-ID: <20250922182003.3712101-2-stefan.klug@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Hi all,

Here is an updated version of the patch with a fix for a typo that was
spotted in the last review.

Changes in v3:
- Fixed typo in comment
- Collected r-by tag

Changes in v2:
- Removed test for !frame_active in second v_start handler
- Improved comments

Best regards,
Stefan

---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++----
 2 files changed, 23 insertions(+), 5 deletions(-)

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
index 8c29a1c9309a..660c1fd7efcc 100644
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
@@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
 
-	/* Vertical sync signal, starting generating new frame */
-	if (status & RKISP1_CIF_ISP_V_START) {
-		rkisp1->isp.frame_sequence++;
-		rkisp1_isp_queue_event_sof(&rkisp1->isp);
+	/*
+	 * Vertical sync signal, starting new frame. Defer handling of vsync
+	 * after RKISP1_CIF_ISP_FRAME if the previous frame was not completed
+	 * yet.
+	 */
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
@@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	if (status & RKISP1_CIF_ISP_FRAME) {
 		u32 isp_ris;
 
+		rkisp1->isp.frame_active = false;
 		rkisp1->debug.complete_frames++;
 
 		/* New frame from the sensor received */
@@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 		rkisp1_params_isr(rkisp1);
 	}
 
+	/*
+	 * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
+	 * RKISP1_CIF_ISP_FRAME occurred in the same irq.
+	 */
+	if (status & RKISP1_CIF_ISP_V_START)
+		rkisp1_isp_sof(&rkisp1->isp);
+
 	return IRQ_HANDLED;
 }
-- 
2.48.1


