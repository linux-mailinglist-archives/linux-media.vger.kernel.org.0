Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBAB215E9F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgGFSiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbgGFSiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:15 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86017215D;
        Mon,  6 Jul 2020 20:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060678;
        bh=NCAiHkHnyywtrJl98mEhvBxKr3BTZ85L3JQz8RISERo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qe03SevDAaXM9GtC0PcoC151qmpwC7I2j0C/4zkqQ2g3oc/PklVEyJPxoYOyQVgfT
         vxicwFRIv2LUYtMurWKn3Mu7nTz0qg87NlVhMK8Tyj69ipRjyn3Oz/km69qLKhcIFp
         Kv909nY5btPxJEoPRZi9lGtuJdxdFgthx78+gYvc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 047/108] media: ti-vpe: cal: Add comments to cal_probe() to delimitate sections
Date:   Mon,  6 Jul 2020 21:36:08 +0300
Message-Id: <20200706183709.12238-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index aecded3cad16..738fd7a46399 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2309,9 +2309,10 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* save pdev pointer */
 	cal->pdev = pdev;
+	platform_set_drvdata(pdev, cal);
 
+	/* Acquire resources: clocks, CAMERARX regmap, I/O memory and IRQ. */
 	cal->fclk = devm_clk_get(&pdev->dev, "fck");
 	if (IS_ERR(cal->fclk)) {
 		dev_err(&pdev->dev, "cannot get CAL fclk\n");
@@ -2338,14 +2339,14 @@ static int cal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, cal);
-
+	/* Create CAMERARX PHYs. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
 		if (IS_ERR(cal->phy[i]))
 			return PTR_ERR(cal->phy[i]);
 	}
 
+	/* Create contexts. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i)
 		cal->ctx[i] = cal_create_instance(cal, i);
 
@@ -2356,15 +2357,13 @@ static int cal_probe(struct platform_device *pdev)
 
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

