Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADD95FC5B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfGDRQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:16:27 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:30467 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfGDRQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 13:16:26 -0400
X-Halon-ID: 72d7ef3f-9e7f-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 72d7ef3f-9e7f-11e9-8ab4-005056917a89;
        Thu, 04 Jul 2019 19:16:24 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 3/4] rcar-vin: Add support for RGB formats with alpha component
Date:   Thu,  4 Jul 2019 19:16:01 +0200
Message-Id: <20190704171602.29541-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190704171602.29541-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190704171602.29541-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The R-Car VIN module supports V4L2_PIX_FMT_ARGB555 and
V4L2_PIX_FMT_ABGR32 pixel formats. Add the hardware register setup and
allow the alpha component to be changed while streaming using the
V4L2_CID_ALPHA_COMPONENT control.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 35 +++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  8 +++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 4e991cce5fb56a90..620976d173585694 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -111,8 +111,11 @@
 #define VNIE_EFE		(1 << 1)
 
 /* Video n Data Mode Register bits */
+#define VNDMR_A8BIT(n)		((n & 0xff) << 24)
+#define VNDMR_A8BIT_MASK	(0xff << 24)
 #define VNDMR_EXRGB		(1 << 8)
 #define VNDMR_BPSM		(1 << 4)
+#define VNDMR_ABIT		(1 << 2)
 #define VNDMR_DTMD_YCSEP	(1 << 1)
 #define VNDMR_DTMD_ARGB		(1 << 0)
 
@@ -730,6 +733,12 @@ static int rvin_setup(struct rvin_dev *vin)
 		/* Note: not supported on M1 */
 		dmr = VNDMR_EXRGB;
 		break;
+	case V4L2_PIX_FMT_ARGB555:
+		dmr = (vin->alpha ? VNDMR_ABIT : 0) | VNDMR_DTMD_ARGB;
+		break;
+	case V4L2_PIX_FMT_ABGR32:
+		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1346,5 +1355,31 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 
 void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
 {
+	unsigned long flags;
+	u32 dmr;
+
+	spin_lock_irqsave(&vin->qlock, flags);
+
 	vin->alpha = alpha;
+
+	if (vin->state == STOPPED)
+		goto out;
+
+	switch (vin->format.pixelformat) {
+	case V4L2_PIX_FMT_ARGB555:
+		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_ABIT;
+		if (vin->alpha)
+			dmr |= VNDMR_ABIT;
+		break;
+	case V4L2_PIX_FMT_ABGR32:
+		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_A8BIT_MASK;
+		dmr |= VNDMR_A8BIT(vin->alpha);
+		break;
+	default:
+		goto out;
+	}
+
+	rvin_write(vin, dmr,  VNDMR_REG);
+out:
+	spin_unlock_irqrestore(&vin->qlock, flags);
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 0936bcd98df1f75d..f8b6ec4408b2f5fa 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -54,6 +54,14 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_XBGR32,
 		.bpp			= 4,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_ARGB555,
+		.bpp			= 2,
+	},
+	{
+		.fourcc			= V4L2_PIX_FMT_ABGR32,
+		.bpp			= 4,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)
-- 
2.21.0

