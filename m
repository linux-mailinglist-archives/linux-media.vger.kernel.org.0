Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9434B1A107A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 17:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgDGPo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 11:44:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgDGPo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 11:44:26 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF1D759E;
        Tue,  7 Apr 2020 17:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586274264;
        bh=6qh5BzbMAlnkA/Tb3uI2dawbLGOU/z4o+b2gnjDgpj0=;
        h=From:To:Cc:Subject:Date:From;
        b=W0LS3zkE2W8YxjyDpisUv3oY5+P5F+z3+xTNbvOWSFiTxgs6rLzh5Rf+txjrszq/0
         KSWuf0rZ/RW3jVF2KOtYYyRUcjXSggUp09m94Oe6xIgvtCOHuN0jqpKO0I31ONHMj0
         KdflQvtFUOXocOl0vaHHPDLusMauZzGQ8oEOsSrY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] media: platform: fcp: Set appropriate DMA parameters
Date:   Tue,  7 Apr 2020 16:44:17 +0100
Message-Id: <20200407154417.17082-1-kieran.bingham+renesas@ideasonboard.com>
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

"DMA-API: rcar-fcp fea27000.fcp: mapping sg segment longer than device
claims to support [len=3145728] [max=65536]"

We have no specific limitation on the segment size which isn't already
handled by the VSP1/DU which actually handles the DMA allcoations and
buffer management, so define a maximum segment size of up to 4GB (a 32
bit mask).

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 7b49235e83b2 ("[media] v4l: Add Renesas R-Car FCP driver")

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

v2:
 - Collect tags
 - Fix commit message

I see no reference to any specific limitation on the FCP in regards to
DMA operation size, but there are limitations on the supported image
sizes at 8190*8190 pixels. (smaller for FCPC at 3190) As that could be at
various BPP which is unkown to the FCP driver, and because any maximum
limitation should already be provided elsewhere, I don't think we need
to arbitrarly define a maximum segment size here, so defaulting to a '32
bit maximum' to prevent uneccessary warnings from being printed.

Alternatively, we could assume a 4BPP, and define maximum segment sizes
based upon the maximum capabilities of each FCP instance, but I'm not
sure if that will be of much benefit.

Interestingly though, the FCP should have an alignment of 256 byte
boundarys on buffers, but I don't yet see a means to validate that
through CONFIG_DMA_API_DEBUG/CONFIG_DMA_API_DEBUG_SG.

Along with Geert's tested-by tag, I've futher validated and run both the VSP
and DU test suites with this patch.

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

