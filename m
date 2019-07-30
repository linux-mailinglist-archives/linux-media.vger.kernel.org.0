Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3B17B1B0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 20:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387854AbfG3STh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 14:19:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45428 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387931AbfG3SQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 14:16:20 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so30460580pgp.12
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2019 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2KtwSRIbO6QW1fCt0Ff/bOukvJcYpl7E88tyv175JYo=;
        b=aRQ+kcxN22tM47SoDkbLmRiqPa2VggkWwmFKZSOIijBCTAAzR/9/jnhQ3S2rs/hROm
         kBA9D2mpwDXCYLwmGxaqFqv7f4XoF8aAooe3eDfyqvBTIscwxyMlrLpuKJXyC49DOvge
         CIzYUcrjnq7+IGAN4EU0hRfGBrS3VGitvd7nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2KtwSRIbO6QW1fCt0Ff/bOukvJcYpl7E88tyv175JYo=;
        b=G7218rlRDGe5DLaMcjUWiuu28JUByRqVm+fztx9fhyAAujKftmZMngGfiCt78B1i1U
         9LxByIYq+wYQ6A4qOlV5cjppyCSStv+FeNcq1813w0+34ScObiLrgZFzooPOc0dOjs8K
         3uV0OBsMe0GH7CJMqmci48VdKj/ikyNZvrLJ8GLc2TYbQhbArUdgaG81VVEoSG3epHRf
         BjQivWmyHWkP+jwsIeIJbnGFCKtCp4f09IwB9CJ6zNjBVk2pUkn+BxPOf9iAZHrNznvW
         rUCdqEY4FZuxV+FQikha4izFvZAGqYl7e9Wc7SFABnlGyKb8veWU04WCjuAgftR37b7n
         5iiw==
X-Gm-Message-State: APjAAAXDNj6egJth+ONnzYqxz4HWxhCrQfJBMNBIFsIR5GgbOL2xawjR
        OlJLu2xR/HeZ3F0ZtrxnBojGeQ==
X-Google-Smtp-Source: APXvYqxh/QBqL0ZFtQjel2WLJJtHFFSNwgwYRCtpFDok/0ec8i/VSYQ/49MPYY0gbJK8DwD99RSBww==
X-Received: by 2002:a63:4522:: with SMTP id s34mr109187680pga.362.1564510579680;
        Tue, 30 Jul 2019 11:16:19 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:19 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 25/57] media: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:25 -0700
Message-Id: <20190730181557.90391-26-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/media/platform/am437x/am437x-vpfe.c           | 1 -
 drivers/media/platform/atmel/atmel-sama5d2-isc.c      | 7 ++-----
 drivers/media/platform/exynos4-is/mipi-csis.c         | 4 +---
 drivers/media/platform/imx-pxp.c                      | 4 +---
 drivers/media/platform/omap3isp/isp.c                 | 1 -
 drivers/media/platform/renesas-ceu.c                  | 4 +---
 drivers/media/platform/rockchip/rga/rga.c             | 1 -
 drivers/media/platform/s3c-camif/camif-core.c         | 4 +---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 ++------
 drivers/media/platform/sti/hva/hva-hw.c               | 8 ++------
 drivers/media/platform/stm32/stm32-dcmi.c             | 5 +----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c    | 7 ++-----
 drivers/media/rc/img-ir/img-ir-core.c                 | 4 +---
 drivers/media/rc/ir-hix5hd2.c                         | 4 +---
 drivers/media/rc/meson-ir.c                           | 4 +---
 drivers/media/rc/mtk-cir.c                            | 4 +---
 drivers/media/rc/sunxi-cir.c                          | 1 -
 17 files changed, 17 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index fe7b937eb5f2..c7109ba35ebf 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2557,7 +2557,6 @@ static int vpfe_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
 		ret = -ENODEV;
 		goto probe_out_cleanup;
 	}
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 266df14da2d5..78381651238d 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -160,11 +160,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		dev_err(dev, "failed to get irq: %d\n", ret);
-		return ret;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(dev, irq, isc_interrupt, 0,
 			       ATMEL_ISC_NAME, isc);
diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index 3e9ac6066cf6..b9f1cc42b0ab 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -803,10 +803,8 @@ static int s5pcsis_probe(struct platform_device *pdev)
 		return PTR_ERR(state->regs);
 
 	state->irq = platform_get_irq(pdev, 0);
-	if (state->irq < 0) {
-		dev_err(dev, "Failed to get irq\n");
+	if (state->irq < 0)
 		return state->irq;
-	}
 
 	for (i = 0; i < CSIS_NUM_SUPPLIES; i++)
 		state->supplies[i].supply = csis_supply_name[i];
diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 8e7ef23b9a7e..38d942322302 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -1661,10 +1661,8 @@ static int pxp_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Failed to get irq resource: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
 			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 83216fc7156b..649c5c0bbd39 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2324,7 +2324,6 @@ static int isp_probe(struct platform_device *pdev)
 	/* Interrupt */
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
-		dev_err(isp->dev, "No IRQ resource\n");
 		ret = -ENODEV;
 		goto error_iommu;
 	}
diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 57d0c0f9fa4b..197b3991330d 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -1659,10 +1659,8 @@ static int ceu_probe(struct platform_device *pdev)
 	}
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to get irq: %d\n", ret);
+	if (ret < 0)
 		goto error_free_ceudev;
-	}
 	irq = ret;
 
 	ret = devm_request_irq(dev, irq, ceu_irq,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 5283d4533fa0..e9ff12b6b5bb 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -831,7 +831,6 @@ static int rga_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(rga->dev, "failed to get irq\n");
 		ret = irq;
 		goto err_put_clk;
 	}
diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index b05ce0149ca1..b2d2098c01dd 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -386,10 +386,8 @@ static int camif_request_irqs(struct platform_device *pdev,
 		init_waitqueue_head(&vp->irq_queue);
 
 		irq = platform_get_irq(pdev, i);
-		if (irq <= 0) {
-			dev_err(&pdev->dev, "failed to get IRQ %d\n", i);
+		if (irq <= 0)
 			return -ENXIO;
-		}
 
 		ret = devm_request_irq(&pdev->dev, irq, s3c_camif_irq_handler,
 				       0, dev_name(&pdev->dev), vp);
diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 3c05b3dc49ec..5baada4f65e5 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -693,16 +693,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 	fei->sram_size = resource_size(res);
 
 	fei->idle_irq = platform_get_irq_byname(pdev, "c8sectpfe-idle-irq");
-	if (fei->idle_irq < 0) {
-		dev_err(dev, "Can't get c8sectpfe-idle-irq\n");
+	if (fei->idle_irq < 0)
 		return fei->idle_irq;
-	}
 
 	fei->error_irq = platform_get_irq_byname(pdev, "c8sectpfe-error-irq");
-	if (fei->error_irq < 0) {
-		dev_err(dev, "Can't get c8sectpfe-error-irq\n");
+	if (fei->error_irq < 0)
 		return fei->error_irq;
-	}
 
 	platform_set_drvdata(pdev, fei);
 
diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index 7917fd2c4bd4..401aaafa1710 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -341,10 +341,8 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 
 	/* get status interruption resource */
 	ret  = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err(dev, "%s     failed to get status IRQ\n", HVA_PREFIX);
+	if (ret < 0)
 		goto err_clk;
-	}
 	hva->irq_its = ret;
 
 	ret = devm_request_threaded_irq(dev, hva->irq_its, hva_hw_its_interrupt,
@@ -360,10 +358,8 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 
 	/* get error interruption resource */
 	ret = platform_get_irq(pdev, 1);
-	if (ret < 0) {
-		dev_err(dev, "%s     failed to get error IRQ\n", HVA_PREFIX);
+	if (ret < 0)
 		goto err_clk;
-	}
 	hva->irq_err = ret;
 
 	ret = devm_request_threaded_irq(dev, hva->irq_err, hva_hw_err_interrupt,
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index d855e9c09c08..672a53195b56 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1699,11 +1699,8 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get irq\n");
+	if (irq <= 0)
 		return irq ? irq : -ENXIO;
-	}
 
 	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!dcmi->res) {
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 6e0e894154f4..055eb0b8e396 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -866,11 +866,8 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "No csi IRQ specified\n");
-		ret = -ENXIO;
-		return ret;
-	}
+	if (irq < 0)
+		return -ENXIO;
 
 	ret = devm_request_irq(&pdev->dev, irq, sun6i_csi_isr, 0, MODULE_NAME,
 			       sdev);
diff --git a/drivers/media/rc/img-ir/img-ir-core.c b/drivers/media/rc/img-ir/img-ir-core.c
index 7e457f26a595..094aa6a06315 100644
--- a/drivers/media/rc/img-ir/img-ir-core.c
+++ b/drivers/media/rc/img-ir/img-ir-core.c
@@ -81,10 +81,8 @@ static int img_ir_probe(struct platform_device *pdev)
 
 	/* Get resources from platform device */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "cannot find IRQ resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	/* Private driver data */
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 85561f6555a2..32ccefeff57d 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -232,10 +232,8 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	priv->irq = platform_get_irq(pdev, 0);
-	if (priv->irq < 0) {
-		dev_err(dev, "irq can not get\n");
+	if (priv->irq < 0)
 		return priv->irq;
-	}
 
 	rdev = rc_allocate_device(RC_DRIVER_IR_RAW);
 	if (!rdev)
diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 72a7bbbf6b1f..51c6dd3406a0 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -117,10 +117,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 		return PTR_ERR(ir->reg);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "no irq resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
 	if (!ir->rc) {
diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 50fb0aebb8d4..4507f729a656 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -353,10 +353,8 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ir);
 
 	ir->irq = platform_get_irq(pdev, 0);
-	if (ir->irq < 0) {
-		dev_err(dev, "no irq resource\n");
+	if (ir->irq < 0)
 		return -ENODEV;
-	}
 
 	if (clk_prepare_enable(ir->clk)) {
 		dev_err(dev, "try to enable ir_clk failed\n");
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index aa719d0ae6b0..905e4cc382e9 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -233,7 +233,6 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	/* IRQ */
 	ir->irq = platform_get_irq(pdev, 0);
 	if (ir->irq < 0) {
-		dev_err(dev, "no irq resource\n");
 		ret = ir->irq;
 		goto exit_free_dev;
 	}
-- 
Sent by a computer through tubes

