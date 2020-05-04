Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FD01C35A5
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgEDJ0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbgEDJ0u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:50 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DFC5121D;
        Mon,  4 May 2020 11:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584405;
        bh=V5vv4x5wKJ6hQdH/FUQfwW3D36Z91fOws36otLzl6f4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JwSyiJmVRFA5RcwUsB4NyOVsMs8GegaAgfcq3rOgvK9sa2EQCYWNlEVs8tOtpQUKQ
         nxcUOFErAwWwuMAwK7RGbrNJ4e7YR8XCAxYgmQqubj7XU4f3WPeyCxvNYuJFR7VFdr
         Go+HRTKdwq2IlkdF1T7ReAfM8mGNS0BQGAR/IhTQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 27/34] staging: vchiq: Use the old dma controller for OF config on platform devices
Date:   Mon,  4 May 2020 12:26:04 +0300
Message-Id: <20200504092611.9798-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

vchiq on Pi4 is no longer under the soc node, therefore it
doesn't get the dma-ranges for the VPU.

Switch to using the configuration of the old dma controller as
that will set the dma-ranges correctly.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../interface/vchiq_arm/vchiq_arm.c             | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 15ccd624aaab..d1a556f16499 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2719,6 +2719,7 @@ vchiq_register_child(struct platform_device *pdev, const char *name)
 {
 	struct platform_device_info pdevinfo;
 	struct platform_device *child;
+	struct device_node *np;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 
@@ -2734,10 +2735,20 @@ vchiq_register_child(struct platform_device *pdev, const char *name)
 	}
 
 	/*
-	 * We want the dma-ranges etc to be copied from the parent VCHIQ device
-	 * to be passed on to the children too.
+	 * We want the dma-ranges etc to be copied from a device with the
+	 * correct dma-ranges for the VPU.
+	 * VCHIQ on Pi4 is now under scb which doesn't get those dma-ranges.
+	 * Take the "dma" node as going to be suitable as it sees the world
+	 * through the same eyes as the VPU.
 	 */
-	of_dma_configure(&new_dev->dev, pdev->dev.of_node, true);
+	np = of_find_node_by_path("dma");
+	if (!np)
+		np = pdev->dev.of_node;
+
+	of_dma_configure(&child->dev, np, true);
+
+	if (np != pdev->dev.of_node)
+		of_node_put(np);
 
 	return child;
 }
-- 
Regards,

Laurent Pinchart

