Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541CC3519A1
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhDARzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbhDARo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:44:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB01C0045EC;
        Thu,  1 Apr 2021 07:43:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id b7so3288755ejv.1;
        Thu, 01 Apr 2021 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yig8wQrnDjVWOaduCo+gf0ULa0HF9/VzKj4q+s3NOg0=;
        b=iA+jBF2AtdizxHuy6c1WTy36heCgpdHTHOf9wlsxGeKwSk0QQNSASMsUO7mCWDk787
         8JpJFk+POrnc74pOlD/EjNy+B84xWf1phARmPuKUTqd4/nkgM096fBJXPHc+wU4OKmgd
         6eOQMdiThCGfRHwcso19u/zOpf/S83/cwVKvly6BldkWSvJqzbpfuPUuW3UAcamoemOP
         5TH1Q6BMRcE6Buf2ZPqrqiJLioBl4liOwcSa++y93XJG1it1yKDcYMKK9d4eVHHfRqpw
         RlZgg74OEdMoFuePFswqUDrdKJPG3chO38RIJPVkBmvNnDbPa0yFyMvGXzurr62fUfx2
         p2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yig8wQrnDjVWOaduCo+gf0ULa0HF9/VzKj4q+s3NOg0=;
        b=eKfekdlmSLcElMgn+TppKfE8Il9mSXG+puUms1g1oh/uN2Pf9+Kg1RRy/axTfK4jkZ
         aop6cKME9WgnWo0rCnSbcv/FzCii2fyheXFamUgw5Jmm9uzGEPjyAXHSvSGqA17quN5b
         0dP4Rm9bGL+BxZSgZli81nyGvJal6pWlyQr+rb1uBFX419ZxYgp1co2OLXDZs4U9twuZ
         iNtPwnR4T7gEUGgpGKldcuA5ch3ELBxW8pYvZsXLs9vKvlBG9AT/lMiB1fmo/ozpnUzc
         UyV65ETU1H3V0Z92T/EwHARnW7Jk/m/FZ60FhQEfqm9XLGOk34uffZW4wHZm4p86H2Ap
         Wdtw==
X-Gm-Message-State: AOAM531eWcuq0SHKU9Zc+rW446j9hf4X5SqA/JLImZ53dt6A5GFI80bU
        UY1VubM+UL2qugVzmYYkNiE=
X-Google-Smtp-Source: ABdhPJzFfoNll0q3Uy/syhJ58IU7DBgEtCbBIxOU1O6lmNSDG0VhWTV+qaqNKijHJgm81V4lUHRLOQ==
X-Received: by 2002:a17:906:130c:: with SMTP id w12mr9410734ejb.253.1617288231693;
        Thu, 01 Apr 2021 07:43:51 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:51 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 6/9] media: hantro: add fallback handling for single irq/clk
Date:   Thu,  1 Apr 2021 15:43:33 +0100
Message-Id: <20210401144336.2495479-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Currently the driver expects that each irq/clk will have a name
specified.

A valid point was raised by the DT maintainers - when there is a single
interrupt line or clock - the names are not needed.

Keep the names within the drivers themselves, but don't use them when
only a single entry exists. Instead use:
 - num_clk == 1 - devm_clk_get(..., NULL)
 - num_irq == 1 - platform_get_irq(..., 0)

Suggested-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v3
 - New patch

v4
 - Drop WARN_ON, guard on num_{irq,clk} instead (Eze)
 - Drop Nicolas ack (Eze)
---
 drivers/staging/media/hantro/hantro_drv.c | 37 ++++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e5f200e64993..a51700a9e3b7 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -752,12 +752,23 @@ static int hantro_probe(struct platform_device *pdev)
 	if (!vpu->clocks)
 		return -ENOMEM;
 
-	for (i = 0; i < vpu->variant->num_clocks; i++)
-		vpu->clocks[i].id = vpu->variant->clk_names[i];
-	ret = devm_clk_bulk_get(&pdev->dev, vpu->variant->num_clocks,
-				vpu->clocks);
-	if (ret)
-		return ret;
+	if (vpu->variant->num_clocks > 1) {
+		for (i = 0; i < vpu->variant->num_clocks; i++)
+			vpu->clocks[i].id = vpu->variant->clk_names[i];
+
+		ret = devm_clk_bulk_get(&pdev->dev, vpu->variant->num_clocks,
+					vpu->clocks);
+		if (ret)
+			return ret;
+	} else {
+		/*
+		 * If the driver has a single clk, chances are there will be no
+		 * actual name in the DT bindings.
+		 */
+		vpu->clocks[0].clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(vpu->clocks))
+			return PTR_ERR(vpu->clocks);
+	}
 
 	num_bases = vpu->variant->num_regs ?: 1;
 	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
@@ -785,13 +796,23 @@ static int hantro_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	for (i = 0; i < vpu->variant->num_irqs; i++) {
-		const char *irq_name = vpu->variant->irqs[i].name;
+		const char *irq_name;
 		int irq;
 
 		if (!vpu->variant->irqs[i].handler)
 			continue;
 
-		irq = platform_get_irq_byname(vpu->pdev, irq_name);
+		if (vpu->variant->num_clocks > 1) {
+			irq_name = vpu->variant->irqs[i].name;
+			irq = platform_get_irq_byname(vpu->pdev, irq_name);
+		} else {
+			/*
+			 * If the driver has a single IRQ, chances are there
+			 * will be no actual name in the DT bindings.
+			 */
+			irq_name = "default";
+			irq = platform_get_irq(vpu->pdev, 0);
+		}
 		if (irq <= 0)
 			return -ENXIO;
 
-- 
2.31.1

