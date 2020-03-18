Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B3F18A173
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 18:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgCRRXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 13:23:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49948 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRRXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 13:23:44 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 532375F;
        Wed, 18 Mar 2020 18:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584552222;
        bh=/4/bLOSqyH+IXMmkxCbhoBOtpiP3tgIMK9bMqMDqjjk=;
        h=From:To:Subject:Date:From;
        b=Rbbb9ziXQiWh+unVOCNhudxbhqgBAthvzIXQeXHK3O4DJF1/TPuxNjUUCgtd8nL9Y
         41sDBBeI+lC85JRzY9yOoAbca9Fvddb9lonFrOv48XbNDf4cDbKEaVaurX0YRxXZZH
         rSePoBf+W4I86R+sCsPO1l+Ba+EUEateYGC/ZoQg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH RFC] media: platform: fcp: Set appropriate DMA parameters
Date:   Wed, 18 Mar 2020 17:23:38 +0000
Message-Id: <20200318172338.20132-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enabling CONFIG_DMA_API_DEBUG=y and CONFIG_DMA_API_DEBUG_SG=y will
enable extra validation on DMA operations ensuring that the size
restraints are met.

When using the FCP in conjunction with the VSP1/DU, and display frames,
the size of the DMA operations is larger than the default maximum
segment size reported by the DMA core (64K). With the DMA debug enabled,
this produces a warning such as the following:

"DMA-API: rcar-fcp fea27000.fcp: mapping sg segment longer than device"

We have no specific limitation on the segment size which isn't already
handled by the VSP1/DU which actually handles the DMA allcoations and
buffer management, so define a maximum segment size of up to 4GB (a 32
bit mask).

Fixes: 7b49235e83b2 ("[media] v4l: Add Renesas R-Car FCP driver")

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

I see no reference to any specific limitation on the FCP in regards to
DMA operation size, but there are limitations on the supported image
sizes at 8190*8190 pixels. (smaller for FCPC at 3190) As that could be at
various BPP which is unkown to the FCP driver, and because any maximum
limitation should already be provided elsewhere, I don't think we need
to arbitrarly define a maximum segment size here, so defaulting to a '32
bit maximum' to prevent uneccessary warnings from being printed.

Alternatively, we could assume a 4BPP, and define maximum segment sizes
based upon the maximum capabilities of each FCP instance, but I'm not
sure if that will be

Interestingly though, the FCP should have an alignment of 256 byte
boundarys on buffers, but I don't yet see a means to validate that
through CONFIG_DMA_API_DEBUG/CONFIG_DMA_API_DEBUG_SG.
---
 drivers/media/platform/rcar-fcp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 43c78620c9d8..5c6b00737fe7 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -21,6 +22,7 @@
 struct rcar_fcp_device {
 	struct list_head list;
 	struct device *dev;
+	struct device_dma_parameters dma_parms;
 };
 
 static LIST_HEAD(fcp_devices);
@@ -136,6 +138,9 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 
 	fcp->dev = &pdev->dev;
 
+	fcp->dev->dma_parms = &fcp->dma_parms;
+	dma_set_max_seg_size(fcp->dev, DMA_BIT_MASK(32));
+
 	pm_runtime_enable(&pdev->dev);
 
 	mutex_lock(&fcp_lock);
-- 
2.20.1

