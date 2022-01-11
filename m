Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF6348A45B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 01:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345922AbiAKAXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 19:23:47 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:20992 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1345949AbiAKAXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 19:23:45 -0500
X-IronPort-AV: E=Sophos;i="5.88,278,1635174000"; 
   d="scan'208";a="106050162"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jan 2022 09:23:44 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD2B54157D34;
        Tue, 11 Jan 2022 09:23:41 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] media: exynos-gsc: Use platform_get_irq() to get the interrupt
Date:   Tue, 11 Jan 2022 00:23:08 +0000
Message-Id: <20220111002314.15213-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* No change.
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index cfd6ae70b8d8..e3559b047092 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -1106,9 +1106,9 @@ MODULE_DEVICE_TABLE(of, exynos_gsc_match);
 static int gsc_probe(struct platform_device *pdev)
 {
 	struct gsc_dev *gsc;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	const struct gsc_driverdata *drv_data = of_device_get_match_data(dev);
+	int irq;
 	int ret;
 	int i;
 
@@ -1141,11 +1141,9 @@ static int gsc_probe(struct platform_device *pdev)
 	if (IS_ERR(gsc->regs))
 		return PTR_ERR(gsc->regs);
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(dev, "failed to get IRQ resource\n");
-		return -ENXIO;
-	}
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	for (i = 0; i < gsc->num_clocks; i++) {
 		gsc->clock[i] = devm_clk_get(dev, drv_data->clk_names[i]);
@@ -1167,8 +1165,8 @@ static int gsc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = devm_request_irq(dev, res->start, gsc_irq_handler,
-				0, pdev->name, gsc);
+	ret = devm_request_irq(dev, irq, gsc_irq_handler,
+			       0, pdev->name, gsc);
 	if (ret) {
 		dev_err(dev, "failed to install irq (%d)\n", ret);
 		goto err_clk;
-- 
2.17.1

