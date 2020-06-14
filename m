Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088401F8B86
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgFOAAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728125AbgFOAAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:45 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FE71F7F;
        Mon, 15 Jun 2020 02:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179223;
        bh=PEDOlICd+kVglk6x4+NWqRsQZJPJ8l7gBY556hS1tRQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O7ScEjucJGli4m1YZktN2oDVDlusIAwQ6iIEfGbk/DjfPGs3UdlZdQkHg1sKLPmo1
         qNOvhAPYE7bVamApW7STvX7tTHBh41Dl0KX8nub3jWwcD7xeNqiIjCV1JN0HFPur5I
         zZt1zwhAbo3hxBxhU1cI76WD+Ehe7y02Zb3gZ6+U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 030/107] media: ti-vpe: cal: Use dev_* print macros
Date:   Mon, 15 Jun 2020 02:58:27 +0300
Message-Id: <20200614235944.17716-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e40967751aa4..e62089832713 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -53,19 +53,22 @@ static unsigned debug;
 module_param(debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
-#define cal_dbg(level, cal, fmt, arg...)	\
-		v4l2_dbg(level, debug, &cal->v4l2_dev, fmt, ##arg)
+#define cal_dbg(level, cal, fmt, arg...)				\
+	do {								\
+		if (debug >= (level))					\
+			dev_dbg(&(cal)->pdev->dev, fmt, ##arg);		\
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

