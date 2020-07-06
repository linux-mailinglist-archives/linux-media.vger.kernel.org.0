Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEB3215E8E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729907AbgGFSh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729897AbgGFSh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB2A8214E;
        Mon,  6 Jul 2020 20:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060667;
        bh=/PcX00aOgdZWmIHju6zVlD03V5edyazVMbM0xgCZGfk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=reUBSLaHMFC7j1OI8TgysEItnuTNApVtYnk7HeOS3r8dZnLxUeJ6OBx5z061aDV6B
         BcyjZFJfH07or51OdjKvwDGet5elXsLSlF+dXAGTdkK8nOAyKJGEH/8FO1uMzlWrqr
         hjsmM0BtYDKcX4WaoqK1p8VzniJjCFAdmGsMAtyM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 030/108] media: ti-vpe: cal: Use dev_* print macros
Date:   Mon,  6 Jul 2020 21:35:51 +0300
Message-Id: <20200706183709.12238-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the dev_* print macros instead of the v4l2_* print macros. This
prepares for a common print infrastructure that will also support the
cal_camerarx instances.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v1:

- Replace dev_dbg(...) with dev_printk(KERN_DEBUG, ...)
---
 drivers/media/platform/ti-vpe/cal.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ff9bc3ae58ba..4b718b4a79c9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -53,19 +53,23 @@ static unsigned debug;
 module_param(debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
-#define cal_dbg(level, cal, fmt, arg...)	\
-		v4l2_dbg(level, debug, &cal->v4l2_dev, fmt, ##arg)
+#define cal_dbg(level, cal, fmt, arg...)				\
+	do {								\
+		if (debug >= (level))					\
+			dev_printk(KERN_DEBUG, &(cal)->pdev->dev,	\
+				   fmt,	##arg);				\
+	} while (0)
 #define cal_info(cal, fmt, arg...)	\
-		v4l2_info(&cal->v4l2_dev, fmt, ##arg)
+	dev_info(&(cal)->pdev->dev, fmt, ##arg)
 #define cal_err(cal, fmt, arg...)	\
-		v4l2_err(&cal->v4l2_dev, fmt, ##arg)
+	dev_err(&(cal)->pdev->dev, fmt, ##arg)
 
 #define ctx_dbg(level, ctx, fmt, arg...)	\
-		v4l2_dbg(level, debug, &ctx->v4l2_dev, fmt, ##arg)
+	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
 #define ctx_info(ctx, fmt, arg...)	\
-		v4l2_info(&ctx->v4l2_dev, fmt, ##arg)
+	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
 #define ctx_err(ctx, fmt, arg...)	\
-		v4l2_err(&ctx->v4l2_dev, fmt, ##arg)
+	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
 
 #define CAL_NUM_CONTEXT 2
 
-- 
Regards,

Laurent Pinchart

