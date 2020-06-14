Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EBE1F8B96
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgFOABJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgFOABF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:05 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA2A1F9;
        Mon, 15 Jun 2020 02:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179231;
        bh=SWJtCcbz1kZs93KnfyMgQw2sWuHhwtoQr2tKRvoXZp8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dyU9/e3amWzOzXBmYc7vFAPffghDd2DpP1psUXpEQFX7CorwMMjqc+ZBZ5nsm3jHp
         eIxoB6JMUz25A4XT4l3jPgp+UK3ltORDzHe/c/t4f81EAacaeId7vQsFSWpRIX0k4Z
         ZAGkJjH70EwHOugSNki5Iz8gGPorjpnTHbJrIT6M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 046/107] media: ti-vpe: cal: Add comments to cal_probe() to delimitate sections
Date:   Mon, 15 Jun 2020 02:58:43 +0300
Message-Id: <20200614235944.17716-47-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_probe() function is a bit long, add comments to delimitate
sections in order to improve readability. The platform_set_drvdata()
call is moved to a more logical place as a result.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c83bf261da91..9b116ffd6e41 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2308,9 +2308,10 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* save pdev pointer */
 	cal->pdev = pdev;
+	platform_set_drvdata(pdev, cal);
 
+	/* Acquire resources: clocks, CAMERARX regmap, I/O memory and IRQ. */
 	cal->fclk = devm_clk_get(&pdev->dev, "fck");
 	if (IS_ERR(cal->fclk)) {
 		dev_err(&pdev->dev, "cannot get CAL fclk\n");
@@ -2337,14 +2338,14 @@ static int cal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, cal);
-
+	/* Create CAMERARX PHYs. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
 		if (IS_ERR(cal->phy[i]))
 			return PTR_ERR(cal->phy[i]);
 	}
 
+	/* Create contexts. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
 		cal->ctx[i] = cal_create_instance(cal, i);
 
@@ -2355,15 +2356,13 @@ static int cal_probe(struct platform_device *pdev)
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
+	/* Read the revision and hardware info to verify hardware access. */
 	pm_runtime_enable(&pdev->dev);
-
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret)
 		goto runtime_disable;
 
-	/* Just check we can actually access the module */
 	cal_get_hwinfo(cal);
-
 	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

