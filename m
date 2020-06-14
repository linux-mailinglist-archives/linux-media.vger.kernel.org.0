Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EA41F8B70
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgFOAAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgFOAAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:25 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63AA2197E;
        Mon, 15 Jun 2020 02:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179215;
        bh=3cGpTlxUPuF8vT/CBOHTP1G43qh9XOfsmfVV7RwmmaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tw+ghk6zJWY2miJqLQuLknkM1LjoeTZn4fob5aSI5WaI+DEtwvDOIJpjCzL/DjiRi
         0RNzzBBw1nUD8ISZmM+BKTu7/NQ5RLifjYl/SzetkXKoaP1itigBhcwJlESWXD7CPg
         SMlbc0HPer2aAALeoOL4wJquV5FZSYDVQXtafPMg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 012/107] media: ti-vpe: cal: Turn boolean variable into bool
Date:   Mon, 15 Jun 2020 02:58:09 +0300
Message-Id: <20200614235944.17716-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The found_port variable contains a boolean value, make it a bool.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 34817f8d81b5..0a4c2d1f72ef 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2069,7 +2069,8 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 	struct v4l2_fwnode_endpoint *endpoint;
 	struct v4l2_async_subdev *asd;
 	u32 regval = 0;
-	int ret, index, found_port = 0, lane;
+	int ret, index, lane;
+	bool found_port = false;
 
 	parent = pdev->dev.of_node;
 
@@ -2094,7 +2095,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 		ctx_dbg(3, ctx, "port:%d inst:%d <reg>:%d\n",
 			index, inst, regval);
 		if ((regval == inst) && (index == inst)) {
-			found_port = 1;
+			found_port = true;
 			break;
 		}
 	}
-- 
Regards,

Laurent Pinchart

