Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B871F8B9F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgFOABR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgFOABP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:15 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C01042154;
        Mon, 15 Jun 2020 02:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179236;
        bh=qwoaMkdtVSyIQe95t2AIViHycUVgbbqj47+3QecCQWA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SNK35zXLDcn+XYnA405/gEVDeNYpquj1j+apqI4xVY54g/LYKKgdDp82m5cDXMhtR
         dKXqboFz+e3AeC5rLV8XxgUmwKZ0xb3DYrMAzAvlt7HmxpFAFdcvY8sUpcGs1v6gJt
         PCa0vhrpGl/cHiy47Z6v2tAQXRnf4MhW/I9C14V0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 055/107] media: ti-vpe: cal: Unregister video device before cleanup
Date:   Mon, 15 Jun 2020 02:58:52 +0300
Message-Id: <20200614235944.17716-56-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cal_remove(), unregister the video devices as the first operation,
before cleaning up the V4L2 objects, to avoid user-after-free. This
isn't a complete solution yet, as video nodes can be kept open across
unregistration.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 1af64c144653..b8c7ad8e39cd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2319,11 +2319,11 @@ static int cal_remove(struct platform_device *pdev)
 		if (ctx) {
 			ctx_dbg(1, ctx, "unregistering %s\n",
 				video_device_node_name(&ctx->vdev));
-			cal_camerarx_disable(ctx->phy);
-			v4l2_async_notifier_unregister(&ctx->notifier);
-			v4l2_async_notifier_cleanup(&ctx->notifier);
-			cal_ctx_v4l2_cleanup(ctx);
 			cal_ctx_v4l2_unregister(ctx);
+			cal_camerarx_disable(ctx->phy);
+			v4l2_async_notifier_unregister(&ctx->notifier);
+			v4l2_async_notifier_cleanup(&ctx->notifier);
+			cal_ctx_v4l2_cleanup(ctx);
 		}
 	}
 
-- 
Regards,

Laurent Pinchart

