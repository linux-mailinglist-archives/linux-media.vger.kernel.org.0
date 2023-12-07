Return-Path: <linux-media+bounces-1790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E038808239
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5CA1F219A9
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 07:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DE11E49A;
	Thu,  7 Dec 2023 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SDPB+ePJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488DDD59;
	Wed,  6 Dec 2023 23:58:13 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58E39B90;
	Thu,  7 Dec 2023 08:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701935849;
	bh=bGiI3ohQXukgHLEaHJG8c1OieVXiQ00QG2sxjKW40bM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SDPB+ePJxt97r3PBmz6a1aEDg0KDvpBpWpl30pD+NrSDV5yVd+fp5Q/3+WZxuz4ke
	 AXyMrH6sK+31o73OWydiv0CtmMCupuWMzGmEQ4ZhQBi8/N9EobcRBsXLXqtXTtVEfP
	 MMG4L6CmPXOpEosI80JIX7Xyi4BULBu/9JKCi73E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 07 Dec 2023 09:57:46 +0200
Subject: [PATCH v3 2/4] media: rkisp1: Fix IRQ handler return values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-rkisp-irq-fix-v3-2-358a2c871a3c@ideasonboard.com>
References: <20231207-rkisp-irq-fix-v3-0-358a2c871a3c@ideasonboard.com>
In-Reply-To: <20231207-rkisp-irq-fix-v3-0-358a2c871a3c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com, 
 aford173@gmail.com, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bGiI3ohQXukgHLEaHJG8c1OieVXiQ00QG2sxjKW40bM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlcXsOKgEcZaHHloIBNCieuxBeeKoqHOKwE/9m0
 PUGT9kmPEiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZXF7DgAKCRD6PaqMvJYe
 9U3YD/9tsbBKzMKy+XePs7loo/BXgqs03sIny/UoyRHH6spbrIZdOawKUOr98MvUPH3AP5pJPC4
 y74ntV+wR24XZdAXb82sYmqkKEm4nIUTaL8dc0Kk2mvgAwvZVSN08DRxFF8zYxMExKFD8rmLAn0
 kEGNPTbmmqMpwpDhQODFGpJPDnQ+Y/uTtYDDt5MfHVqQ28Ene2hD1i4idBa+s50sugtT93yf2lZ
 z3jGrBAABYFQS6TQoT4W2QtDS2WCLiHNMA8pMAawD5z2NTPoDns3OUiRWvVW+wcmyhcQ0/M5l3r
 PRpO13NFtbMTzsVE6NxCqHVlS764Y4dJyh7tY7HW/Mn+rL/0LzpT7SZMIuHz7/5J4a0W9biATlX
 dJocbkpAM5Cu9atIJLLgn/8kBQpuEAkl9rv+HNQ7eUd30diYpXPBuQfAVWyvzCF8HgGTc3Jv2XV
 BGZkcXwWpaOoQ+/zVhvb5DnvjdWfDEtvrnD2YoUBrwQZXNeQQMmARweHSGmfVb+02AWn1MJADCV
 5Lg6x+MXx0PkIyxu2unWE4rXXI2GBTF6/qr5tRbLOsDkgAgp9u6cSXbzGkDfOsYZEZSDeIzWKj2
 6g+6RSHSVCwRBiS36UORj46S2iZHLWhuPOmh+i5IVczYKsvvfgWz45TwlgB9aeG5WoovqIWzcvJ
 ZxW4aUjmogsRkcQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The IRQ handler rkisp1_isr() calls sub-handlers, all of which returns an
irqreturn_t value, but rkisp1_isr() ignores those values and always
returns IRQ_HANDLED.

Fix this by collecting the return values, and returning IRQ_HANDLED or
IRQ_NONE as appropriate.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Adam Ford <aford173@gmail.com>  #imx8mp-beacon
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 4c4514e20673..22b2ae0e89c4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -442,17 +442,25 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 
 static irqreturn_t rkisp1_isr(int irq, void *ctx)
 {
+	irqreturn_t ret = IRQ_NONE;
+
 	/*
 	 * Call rkisp1_capture_isr() first to handle the frame that
 	 * potentially completed using the current frame_sequence number before
 	 * it is potentially incremented by rkisp1_isp_isr() in the vertical
 	 * sync.
 	 */
-	rkisp1_capture_isr(irq, ctx);
-	rkisp1_isp_isr(irq, ctx);
-	rkisp1_csi_isr(irq, ctx);
 
-	return IRQ_HANDLED;
+	if (rkisp1_capture_isr(irq, ctx) == IRQ_HANDLED)
+		ret = IRQ_HANDLED;
+
+	if (rkisp1_isp_isr(irq, ctx) == IRQ_HANDLED)
+		ret = IRQ_HANDLED;
+
+	if (rkisp1_csi_isr(irq, ctx) == IRQ_HANDLED)
+		ret = IRQ_HANDLED;
+
+	return ret;
 }
 
 static const char * const px30_isp_clks[] = {

-- 
2.34.1


