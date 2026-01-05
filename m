Return-Path: <linux-media+bounces-49932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCECF4A54
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 17:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F67830319DD
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 16:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF43348880;
	Mon,  5 Jan 2026 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hNvkxA11"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B72798F3
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629964; cv=none; b=c3ueloczBT/ILv6kD7YYdDnItarm+TjDVuLvs9syFhfoNGSc/VOctDozycdUltCZEze5rkhYcU4vXMNy44QffEaetYDJ4qJiIJ75h934UlXqVshI1OWY1AXF+UisnEFJZ5L75lF5r4xPugNSrpTFOOHefzyxhbZTgumcJ/NTCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629964; c=relaxed/simple;
	bh=k+H14FOgcNNYSO/kdraYro88vCxWdjv0/jWKuACripk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FvQDtkvWwmjrXYMH5TmjSnqyWT2RaYWrJ2TxmDSdZ2TOgpJcGScBqlP5P4jzKqJnNWPPh3ECii4exr//NBVNivHsEvbj7hPeGklPeLF+sdCStdCaPCBDl6b0bWtOj6sMgA2KaCrYsSs3ObzV1uBRlhA+iHRcS8hM46wkIgHzKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hNvkxA11; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28E7518D7;
	Mon,  5 Jan 2026 17:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767629939;
	bh=k+H14FOgcNNYSO/kdraYro88vCxWdjv0/jWKuACripk=;
	h=From:Date:Subject:To:Cc:From;
	b=hNvkxA11QVi8Fwl6EhQHven4EtpHBMGu4/pgSWo4eCZfEd0+pMf1Mly3CoCgx7iqY
	 LQoZlREm2InK9Qv76ACWl7u93hls0S/D1rPAw5b7Ckhcj8HCzA1jLUjToB2jTk38Y2
	 /VTpjYdGMI6YjqNWQ6i4+zI795jta0PhXrKw+ScU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 05 Jan 2026 16:19:08 +0000
Subject: [PATCH] media: rkisp1: request/free irqs in PM runtime ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-rkisp1-irqs-v1-1-922f6a94a2e2@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAHvkW2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNT3aLszOICQ93MosJiXYvENNNEw1SDJAsLcyWgjoKi1LTMCrBp0bG
 1tQBZ//rtXQAAAA==
X-Change-ID: 20260105-rkisp1-irqs-8af5a1e0b887
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8476;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=k+H14FOgcNNYSO/kdraYro88vCxWdjv0/jWKuACripk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpW+SGrnyffhPiwN+tXg9mQFM6G3WLd5dKT21yk
 sGjEF6RS5SJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaVvkhgAKCRDISVd6bEV1
 MhHvD/4stCLG18wjznfIsL1mTHYju7uzDWj18j6GLnZ0DKfwsihAsKNRMjq1RYYAYsbFeLtLqYj
 CRTuNk4iAYnnuwwkGSXpO/qcKI2TFHPIVmEKdg3BoPUUkyWNsUy0H88j3kGB711TxhCrtphF0le
 N2p8VyGhbShCuEmZeqULrsG7b1Y5gLeTntM3EMiDG9igJ745+43eVWZWXjESSTZURzniAJaUqNh
 cjZT6a3SzUDrVmb+bfsE/gcTM8OYxP2vCd2zRcaLv7NnqlV7d0DJV1hBwE8znS9MTqfnHZC9ICQ
 6qkt/7B2ARBSu1wdLcjhuq/9HSgmBVatGig2YFpFf4tFOljyrKl2LlYcVTyprDTEolWU0rZd1Uy
 APFwWbtLwfTkMj6lEHtx2tVQRrnqsuY/SSMdSJNBPmTdBF4DTJRVR0ZmByWWdQJfnXcfX+TWTwj
 r4u+GGLsCfOIzzQV2N6NUk/uFFmQuZGDPX18C6anYvE8Kec2bj+uHzBrld70XIHWZbHo3A/zj/C
 4lfAiVaJh0+yqHpOOIq11tHTaKVImM696N/h/YelW0pnpt59ql6wp1TrSDRBKiccDrOB4EHoxDg
 FKBBpVH9bm1p2NHnKxxW+xzAg6OUWn9uKWXhBIbdyEFYO2xbIJIows+H+5EkAzYkgu5h+AHkQGW
 fUSTDEbvIdHt15Q==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The rkisp1 driver tracks whether the IRQ handlers should take any
action through the use of an "irqs_enabled" flag which is set true
at the end of .runtime_resume() and false at the start of
.runtime_suspend(). In .runtime_suspend(), after setting the flag,
there's then a short window during which the hardware has not yet
been disabled by the clock APIs but interrupts remain enabled. If an
interrupt is triggered during that window the IRQ handlers will return
IRQ_NONE and fail to clear the ISP's IRQ reset registers.

Instead, delay calling request_irq() from .probe() to the end of the
.runtime_resume() callback, and call free_irq() at the start of the
.runtime_suspend() callback. This will prevent the interrupt handlers
being called at all for the device once .runtime_suspend() has been
called for it.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
We noticed this problem when testing hibernation with the streams
running. In a typical use-case the stream might be stopped before the
runtime PM suspend callback is called, and so the problem is avoided,
but when hibernated with active streams there are sufficient interrupts
coming in to reliably land one in the window between the irqs_enabled
flag being set to false and the hardware being disabled through
clk_bulk_disable_unprepare().

I'm under the impression that requesting the IRQs when the device is
in use in the manner of this patch and releasing the when it is not
in use is preferred over requesting them in the .probe() function -
possibly an impression I picked up from Linux Device Drivers. It
doesn't seem to be a particularly common model though, so I thought
I'd flag the method here.
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  3 -
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 -
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  3 -
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 82 +++++++++++++++-------
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  3 -
 5 files changed, 57 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 6dcefd144d5abe358323e37ac6133c6134ac636e..510d1e8d8bbc86e8b8be3579571e308e5ad9f260 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -820,9 +820,6 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
 	unsigned int i;
 	u32 status;
 
-	if (!rkisp1->irqs_enabled)
-		return IRQ_NONE;
-
 	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
 	if (!status)
 		return IRQ_NONE;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 5e6a4d5f6fd12baf45a0083eff75de1095162b2d..2a5f6f69b217cdba2fa7c4d1f230ede5aff49149 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -507,7 +507,6 @@ struct rkisp1_debug {
  * @debug:	   debug params to be exposed on debugfs
  * @info:	   version-specific ISP information
  * @irqs:          IRQ line numbers
- * @irqs_enabled:  the hardware is enabled and can cause interrupts
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -532,7 +531,6 @@ struct rkisp1_device {
 	struct rkisp1_debug debug;
 	const struct rkisp1_info *info;
 	int irqs[RKISP1_NUM_IRQS];
-	bool irqs_enabled;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index ddc6182f3e4bdacdd1962c86f6259334b16aa505..bfc33365ad9d09ccace4ccbb2b19a2fbe1b77eb2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -196,9 +196,6 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 	u32 val, status;
 
-	if (!rkisp1->irqs_enabled)
-		return IRQ_NONE;
-
 	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
 	if (!status)
 		return IRQ_NONE;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 1791c02a40ae18205f5eb2fd6edca6cda6b459bf..6fa76423bacf3e92cbbb4ef1ceb55e194b88d963 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -307,28 +307,62 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
  * Power
  */
 
-static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
+static void rkisp1_free_irqs(struct rkisp1_device *rkisp1)
 {
-	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1->irqs); i++) {
+		if (rkisp1->irqs[i] == -1)
+			continue;
 
-	rkisp1->irqs_enabled = false;
-	/* Make sure the IRQ handler will see the above */
-	mb();
+		if (irq_has_action(rkisp1->irqs[i]))
+			free_irq(rkisp1->irqs[i], rkisp1->dev);
+	}
+}
 
-	/*
-	 * Wait until any running IRQ handler has returned. The IRQ handler
-	 * may get called even after this (as it's a shared interrupt line)
-	 * but the 'irqs_enabled' flag will make the handler return immediately.
-	 */
-	for (unsigned int il = 0; il < ARRAY_SIZE(rkisp1->irqs); ++il) {
-		if (rkisp1->irqs[il] == -1)
+static int rkisp1_request_irqs(struct rkisp1_device *rkisp1)
+{
+	const struct rkisp1_info *info = rkisp1->info;
+	int ret;
+
+	for (unsigned int irqn = 0; irqn < ARRAY_SIZE(rkisp1->irqs); irqn++) {
+		unsigned int isrn;
+
+		if (rkisp1->irqs[irqn] == -1)
 			continue;
 
-		/* Skip if the irq line is the same as previous */
-		if (il == 0 || rkisp1->irqs[il - 1] != rkisp1->irqs[il])
-			synchronize_irq(rkisp1->irqs[il]);
+		if (irq_has_action(rkisp1->irqs[irqn]))
+			continue;
+
+		for (isrn = 0; isrn < info->isr_size; isrn++)
+			if ((info->isrs[isrn].line_mask & BIT(irqn)))
+				break;
+
+		if (isrn == info->isr_size) {
+			dev_err(rkisp1->dev, "Failed to find IRQ handler\n");
+			return -EINVAL;
+		}
+
+		ret = request_irq(rkisp1->irqs[irqn], info->isrs[isrn].isr,
+				  IRQF_SHARED, dev_driver_string(rkisp1->dev),
+				  rkisp1->dev);
+		if (ret) {
+			dev_err(rkisp1->dev, "Failed to request IRQ\n");
+			goto err_free_irqs;
+		}
 	}
 
+	return 0;
+
+err_free_irqs:
+	rkisp1_free_irqs(rkisp1);
+	return ret;
+}
+
+static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
+{
+	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+
+	rkisp1_free_irqs(rkisp1);
+
 	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
 	return pinctrl_pm_select_sleep_state(dev);
 }
@@ -345,11 +379,16 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rkisp1->irqs_enabled = true;
-	/* Make sure the IRQ handler will see the above */
-	mb();
+	ret = rkisp1_request_irqs(rkisp1);
+	if (ret)
+		goto err_clk_disable;
 
 	return 0;
+
+err_clk_disable:
+	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
+
+	return ret;
 }
 
 static const struct dev_pm_ops rkisp1_pm_ops = {
@@ -694,13 +733,6 @@ static int rkisp1_probe(struct platform_device *pdev)
 			if (info->isrs[i].line_mask & BIT(il))
 				rkisp1->irqs[il] = irq;
 		}
-
-		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
-				       dev_driver_string(dev), dev);
-		if (ret) {
-			dev_err(dev, "request irq failed: %d\n", ret);
-			return ret;
-		}
 	}
 
 	ret = rkisp1_init_clocks(rkisp1);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1b6c9dd7f1b883adcac1516a685ae..c6b1ecd2d0c260f6739726c9f32562b98ca31364 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -1106,9 +1106,6 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 	u32 status, isp_err;
 
-	if (!rkisp1->irqs_enabled)
-		return IRQ_NONE;
-
 	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
 	if (!status)
 		return IRQ_NONE;

---
base-commit: ee5b462b97162dbb6c536e18a37b3048f6520019
change-id: 20260105-rkisp1-irqs-8af5a1e0b887

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


