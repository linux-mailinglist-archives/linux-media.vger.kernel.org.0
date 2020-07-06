Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F33215EB1
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbgGFSid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729945AbgGFSic (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:32 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE8BB12BE;
        Mon,  6 Jul 2020 20:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060690;
        bh=yzdnRi6/LyCoF44mwYgXYA0EIK749k3ua6ufzUM4cs0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RHuI9g9I+5sq0PZuHFrqzxjou5/P3lWXYZ0N2w+a33zRKw5ypw0EPaMDWjF6hTGj5
         DqXrBSt6P+HxSEb41Z5U9eNNrP3BlA70h7N6RlRbw0vIOkLG8Nw89Lrn/Zdsqt3rmx
         M7o+fB8GkTRJc7gsu2OSustzCFaEAxg1rDrMZE/8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 065/108] media: ti-vpe: cal: Decouple context and phy cleanup at remove time
Date:   Mon,  6 Jul 2020 21:36:26 +0300
Message-Id: <20200706183709.12238-66-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver happens the use the same number of CAMERARX and context, but
coupling their cleanup at remove time is wrong. To prepare for the
introduction of additional contexts, decouple the two.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 03b4d5351bfd..e4d8cadf7bef 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1976,6 +1976,9 @@ static int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 
 static void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 {
+	ctx_dbg(1, ctx, "unregistering %s\n",
+		video_device_node_name(&ctx->vdev));
+
 	video_unregister_device(&ctx->vdev);
 }
 
@@ -2408,7 +2411,6 @@ static int cal_probe(struct platform_device *pdev)
 static int cal_remove(struct platform_device *pdev)
 {
 	struct cal_dev *cal = platform_get_drvdata(pdev);
-	struct cal_ctx *ctx;
 	unsigned int i;
 
 	cal_dbg(1, cal, "Removing %s\n", CAL_MODULE_NAME);
@@ -2418,14 +2420,18 @@ static int cal_remove(struct platform_device *pdev)
 	cal_async_notifier_unregister(cal);
 
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
-		ctx = cal->ctx[i];
-		if (ctx) {
-			ctx_dbg(1, ctx, "unregistering %s\n",
-				video_device_node_name(&ctx->vdev));
-			cal_ctx_v4l2_unregister(ctx);
-			cal_camerarx_disable(ctx->phy);
-			cal_ctx_v4l2_cleanup(ctx);
-		}
+		if (cal->ctx[i])
+			cal_ctx_v4l2_unregister(cal->ctx[i]);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cal->phy); i++) {
+		if (cal->phy[i])
+			cal_camerarx_disable(cal->phy[i]);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
+		if (cal->ctx[i])
+			cal_ctx_v4l2_cleanup(cal->ctx[i]);
 	}
 
 	v4l2_device_unregister(&cal->v4l2_dev);
-- 
Regards,

Laurent Pinchart

