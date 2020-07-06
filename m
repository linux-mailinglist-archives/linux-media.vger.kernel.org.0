Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F080215EA7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbgGFSiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729942AbgGFSiX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:23 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57A7CD98;
        Mon,  6 Jul 2020 20:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060682;
        bh=16oVFKsWdABvqWein5ILtl48bVtIiwLZpFDWcPbBXAM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XNesynqbTdAla0vTrPZeFsuQ3ohLxGxfgJk35GI0Z/Z7IV+s7IwKlpFB0tGFFBIfG
         j1fDfZhoTxI0i4YQmsBMs43+tIY5StFDZfAPiPz53+CslXTwCLoAW7zULuiaBRx0uN
         osiLNxwdJd2X2MrW86s6giq2uQAvbBWNV2fWXewI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 056/108] media: ti-vpe: cal: Unregister video device before cleanup
Date:   Mon,  6 Jul 2020 21:36:17 +0300
Message-Id: <20200706183709.12238-57-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cal_remove(), unregister the video devices as the first operation,
before cleaning up the V4L2 objects, to avoid use-after-free. This isn't
a complete solution yet, as video nodes can be kept open across
unregistration.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5f218ac5fb60..5580913a1356 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2320,11 +2320,11 @@ static int cal_remove(struct platform_device *pdev)
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

