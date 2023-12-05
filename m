Return-Path: <linux-media+bounces-1631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1DB804BE6
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795001C20DCF
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 08:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84C3C08F;
	Tue,  5 Dec 2023 08:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T2B8z+EF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199FFD3;
	Tue,  5 Dec 2023 00:10:09 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 243E31010;
	Tue,  5 Dec 2023 09:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701763765;
	bh=mZtjLUcwPurRjWrqxlSCj4xDyOLWjQrMwEJHqEedGrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T2B8z+EFK7yLMReLZkqX9uLlblAixwWFtW4w9OrUtqDvnIfnZV28/DB3CAz3fRJPM
	 sDpUXFmHqK4sK6+zKXch5KJE1mZSLXmMaEI1NcnsP9PePDIOqzP2ZpkaRIa6XILfGv
	 5QqCugz8PlXWX2F8ueVztEMk5bYQKK38SVtYbquQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 05 Dec 2023 10:09:34 +0200
Subject: [PATCH 3/4] media: rkisp1: Fix IRQ handling due to shared
 interrupts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-rkisp-irq-fix-v1-3-f4045c74ba45@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4620;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mZtjLUcwPurRjWrqxlSCj4xDyOLWjQrMwEJHqEedGrc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlbtrY0ag5xyx3Lvv6lltmY2X9cTNDItBEJueE1
 /dtr4OCXaCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZW7a2AAKCRD6PaqMvJYe
 9QsvD/wKjXWKvhIraBeIDihoS0XIIVMphsqF9AQl4NGzoX0MehHO9SgTNjNmA95+ILO2R6MMuHx
 vXG7j3tLwF1O0WOjQzRXl2p9DHvtsySnQFHlSp8SEx0DXoVWwRbRGQ92tF6kYnQOUXeznJQOnG4
 idNHblxE3f7pfvwLmkpWTDfHVfKRJN76QNAt+pVEFCSTB+DtB2TBWXGrBazlPRBW0hbx414AmYA
 wI41GEvlDfpoACZxYjaKpb+/4UruMRASpZOd3Ksg4E92AFDNB+4RcecVwb4DTeFHX1m4JinRnlG
 t9S3D+AJS0qZg9ECDt3S3Fv4DAL4vuHModMlHZ/hPp4GGC9kVtqTMZUY4NMslb4uTpt/q0Tif1y
 Bth3uhcsXEb6XQ+P+mqBI8l88Z/RZffcH1i7DhH81oEtU0qORJpnEj8To8x4Va44Uj4Ai0vC3Z2
 OpMebdT+709zFSwVkUokuQUkSZ1I0ZRZ6NaycdrjCpR6/cuXE2bjcHdXq5UuuyOnUJpiDnAG3R2
 +AXqoxw0Zv9+rbSUEPOPtvJIbteqela88/Dao13K6GeJMLJTO5J6yNZC4+UrqN6zB1/w49H3dTB
 IUdwVTItp2jXk9prOm5FI7nFB/ujHNuruPx8svnd/huQPuuJAM6AnxSYSah7DaZsTdn/+UuXWnV
 558PKJn7Z9WAgVg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver requests the interrupts as IRQF_SHARED, so the interrupt
handlers can be called at any time. If such a call happens while the ISP
is powered down, the SoC will hang as the driver tries to access the
ISP registers.

Fix this by adding a new field, 'irqs_enabled', which is used to bail
out from the interrupt handler when the ISP is not operational.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c |  3 +++
 .../media/platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c |  3 +++
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 21 +++++++++++++++++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  3 +++
 5 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index b50b044d22af..e92067897f28 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -779,6 +779,9 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
 	unsigned int i;
 	u32 status;
 
+	if (!rkisp1->irqs_enabled)
+		return IRQ_NONE;
+
 	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
 	if (!status)
 		return IRQ_NONE;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ec28907d978e..7f97fdf6e24c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -465,6 +465,7 @@ struct rkisp1_debug {
  * @debug:	   debug params to be exposed on debugfs
  * @info:	   version-specific ISP information
  * @irqs:          IRQ line numbers
+ * @irqs_enabled:  the hardware is enabled and can cause interrupts
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -488,6 +489,7 @@ struct rkisp1_device {
 	struct rkisp1_debug debug;
 	const struct rkisp1_info *info;
 	int irqs[RKISP1_NUM_IRQS];
+	bool irqs_enabled;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 47f4353a1784..f6b54654b435 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -184,6 +184,9 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 	u32 val, status;
 
+	if (!rkisp1->irqs_enabled)
+		return IRQ_NONE;
+
 	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
 	if (!status)
 		return IRQ_NONE;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 1d60f4b8bd09..fbe03f7864e3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -306,6 +306,23 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 
+	rkisp1->irqs_enabled = false;
+	/* Make sure the IRQ handler will see the above */
+	mb();
+
+	/*
+	 * Wait until any running IRQ handler has returned. The IRQ handler
+	 * may get called even after this (as it's a shared interrupt line)
+	 * but the 'irqs_enabled' flag will make the handler return immediately.
+	 */
+	for (unsigned int i = 0; i < RKISP1_NUM_IRQS; ++i) {
+		if (rkisp1->irqs[i] == -1)
+			continue;
+
+		if (i == 0 || rkisp1->irqs[i - 1] != rkisp1->irqs[i])
+			synchronize_irq(rkisp1->irqs[i]);
+	}
+
 	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
 	return pinctrl_pm_select_sleep_state(dev);
 }
@@ -322,6 +339,10 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	rkisp1->irqs_enabled = true;
+	/* Make sure the IRQ handler will see the above */
+	mb();
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index dafbfd230542..d6b8786661ad 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -1082,6 +1082,9 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 	u32 status, isp_err;
 
+	if (!rkisp1->irqs_enabled)
+		return IRQ_NONE;
+
 	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
 	if (!status)
 		return IRQ_NONE;

-- 
2.34.1


