Return-Path: <linux-media+bounces-1632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB09804BE7
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 089CA1C20DAF
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 08:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083EB3C469;
	Tue,  5 Dec 2023 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MuUU0XQX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26CC11F;
	Tue,  5 Dec 2023 00:10:09 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21D0B158D;
	Tue,  5 Dec 2023 09:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701763766;
	bh=rVmPtwm1uGmDrIWKXT2svm/MUUgksqxTNOdoxtoMjGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MuUU0XQXq6ZXG66dOeIgSjJveT/+bR/YLt/ymW2upTL3owTAskGnfjTO/vYsO7QPL
	 16zakRN2AQ+QS8PFU6CSOLnFEmmY/pfkHl9LXGZICRZ4V37I0T/3WAsE3RTucbTC3t
	 9487GO8l/Jh18OrjAFpZx08TGj6KD5NSBdOvJvk8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 05 Dec 2023 10:09:35 +0200
Subject: [PATCH 4/4] media: rkisp1: Fix IRQ disable race issue
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-rkisp-irq-fix-v1-4-f4045c74ba45@ideasonboard.com>
References: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com>
In-Reply-To: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3150;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rVmPtwm1uGmDrIWKXT2svm/MUUgksqxTNOdoxtoMjGU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlbtrZU6iFL2/Y58GR7rOJhBlQDCvuGEErOgG0X
 XlZATZxLJKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZW7a2QAKCRD6PaqMvJYe
 9Tm4D/9Sq2B3VjwaBr6L8KhLLf2C7zg40sLxpalB/S4jSwZguMCWNTiEuqknm/LXBBOh5HG8GEp
 VLyFyIn0NvXtVvxyOLYf3hlux+YjGoZABwQps827/TlJs9Egyf1D+X7EYwfdgguuePOeDp3H2z2
 YhBzLAdIaJ2le4cmk89cow16VtWuoKgjo8fcM5edz72sV/8/NM7pqQJ+5PZMZD1wWs0fsH0+GHE
 wROiwZB8Kj9QLf9P6GLlOymwP1rqmVhTf8BOIHeYaxxlbQrS8AdHNw7pZ0aDkx+7kVS4BnOxemi
 BdJekPp9Xj+k8AEHQmouZ77wMZxBUuYg1vKSoKJwMFC4TR+TM97Q5gPcb6gCE3BkqRUBlZ/3Mv8
 kGEZhc2cQRU3BXeoUsnPbI/Qlu31jlz9LGE9Ws15h/mTdP+uNiPDgHwYCNPQpL+zshEbeIqOTTR
 FZ9P572LCytqw/V2qlI2r5EnDyJ37Hi1X5nzzL88/Js1tCL/OIQf9/XMpjtKsCYxFZqu97PmIRE
 TTYyugTXYCWiFCrYC380+wIgU37svswllDUwCv6y2bLxisA7BXPSWLP3d2RUd7vlisv5jlGQ+l/
 XnRzAgi2gBVOk2u5qvZ8LXR+t6sqGzO6p6EuZjheclWTre0ek9cM/Irob4PCWpbaxIi8opGjYfu
 usRe3ZoUttSytSQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

In rkisp1_isp_stop() and rkisp1_csi_disable() the driver masks the
interrupts and then apparently assumes that the interrupt handler won't
be running, and proceeds in the stop procedure. This is not the case, as
the interrupt handler can already be running, which would lead to the
ISP being disabled while the interrupt handler handling a captured
frame.

It is not clear to me if this problem causes a real issue, but shutting
down the ISP while an interrupt handler is running sounds rather bad.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 14 +++++++++++++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 20 +++++++++++++++++---
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index f6b54654b435..f0cef766fc0c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -125,8 +125,20 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	u32 val;
 
-	/* Mask and clear interrupts. */
+	/* Mask MIPI interrupts. */
 	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
+
+	/* Flush posted writes */
+	rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
+
+	/*
+	 * Wait until the IRQ handler has ended. The IRQ handler may get called
+	 * even after this, but it will return immediately as the MIPI
+	 * interrupts have been masked.
+	 */
+	synchronize_irq(rkisp1->irqs[RKISP1_IRQ_MIPI]);
+
+	/* Clear MIPI interrupt status */
 	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
 
 	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d6b8786661ad..a6dd497c884c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -364,11 +364,25 @@ static void rkisp1_isp_stop(struct rkisp1_isp *isp)
 	 * ISP(mi) stop in mi frame end -> Stop ISP(mipi) ->
 	 * Stop ISP(isp) ->wait for ISP isp off
 	 */
-	/* stop and clear MI and ISP interrupts */
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
 
+	/* Mask MI and ISP interrupts */
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_IMSC, 0);
+
+	/* Flush posted writes */
+	rkisp1_read(rkisp1, RKISP1_CIF_MI_IMSC);
+
+	/*
+	 * Wait until the IRQ handler has ended. The IRQ handler may get called
+	 * even after this, but it will return immediately as the MI and ISP
+	 * interrupts have been masked.
+	 */
+	synchronize_irq(rkisp1->irqs[RKISP1_IRQ_ISP]);
+	if (rkisp1->irqs[RKISP1_IRQ_ISP] != rkisp1->irqs[RKISP1_IRQ_MI])
+		synchronize_irq(rkisp1->irqs[RKISP1_IRQ_MI]);
+
+	/* Clear MI and ISP interrupt status */
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, ~0);
 
 	/* stop ISP */

-- 
2.34.1


