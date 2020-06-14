Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01C91F8B9E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgFOABQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbgFOABP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:15 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57FB31A79;
        Mon, 15 Jun 2020 02:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179235;
        bh=YuhrFMh3uf31Q2kesD4znEnvt6Hj4sTIdIez5a4of+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qOa+4Oy7J/GHkMzBIXTRA7GTNmCcalM3b3VDykncj68v3u7xbViEdYsBfLCUazK12
         zi+adah/gr3HhKzllS4uhuA33unmn2LZttfblTS0xBxvncqfimv9JIhYH8cB1y38bP
         i+IpGSQCsR8/NnumIRrxXS+N5dpP32pIwQpEpTUM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 054/107] media: ti-vpe: cal: Add context V4L2 cleanup and unregister functions
Date:   Mon, 15 Jun 2020 02:58:51 +0300
Message-Id: <20200614235944.17716-55-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create cal_ctx_v4l2_unregister() and cal_ctx_v4l2_cleanup() functions to
unregister and cleanup the V4L2-related objects from the context, and
call them in cal_remove() and in the error path of cal_probe().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 52f4798024ad..1af64c144653 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1889,6 +1889,11 @@ static int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 	return 0;
 }
 
+static void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
+{
+	video_unregister_device(&ctx->vdev);
+}
+
 static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 {
 	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
@@ -1942,6 +1947,11 @@ static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	return 0;
 }
 
+static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
+{
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+}
+
 /* ------------------------------------------------------------------
  *	Initialization and module stuff
  * ------------------------------------------------------------------
@@ -2285,7 +2295,7 @@ static int cal_probe(struct platform_device *pdev)
 		if (ctx) {
 			v4l2_async_notifier_unregister(&ctx->notifier);
 			v4l2_async_notifier_cleanup(&ctx->notifier);
-			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+			cal_ctx_v4l2_cleanup(ctx);
 		}
 	}
 
@@ -2312,8 +2322,8 @@ static int cal_remove(struct platform_device *pdev)
 			cal_camerarx_disable(ctx->phy);
 			v4l2_async_notifier_unregister(&ctx->notifier);
 			v4l2_async_notifier_cleanup(&ctx->notifier);
-			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-			video_unregister_device(&ctx->vdev);
+			cal_ctx_v4l2_cleanup(ctx);
+			cal_ctx_v4l2_unregister(ctx);
 		}
 	}
 
-- 
Regards,

Laurent Pinchart

