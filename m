Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51FA215EA4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbgGFSiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbgGFSiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:18 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BE5D216E;
        Mon,  6 Jul 2020 20:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060680;
        bh=1lNwZiowWq8/sue0FSC1vsgWF8HBGwG/u4d/6DSDPGE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jaMhalRE6d6ZX45ZVqtU2ZGl4tjwwPkIU55kf+BxYBpzf0rX6t5/aUJDNfErdZGLo
         K6FHlAs4vhNE155SWSsrCcDidpFlXHykpIWjeAK9fyepRKrdSTtKTLUERh/1YX26xx
         OjfXXtCD3ydWm6VQdJT7+mKnGvA+p+FI26ZFTkTk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 051/108] media: ti-vpe: cal: Fix usage of v4l2_fwnode_endpoint_parse()
Date:   Mon,  6 Jul 2020 21:36:12 +0300
Message-Id: <20200706183709.12238-52-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Letting the v4l2_fwnode_endpoint_parse() function determine the bus type
automatically is deprecated. Set the bus type to DPHY manually as the TI
CAL only supports DPHY.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b406a56debac..8de4d7b96a22 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2037,11 +2037,10 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 		goto cleanup_exit;
 	}
 
-	v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
-
-	if (endpoint->bus_type != V4L2_MBUS_CSI2_DPHY) {
-		ctx_err(ctx, "Port:%d sub-device %pOFn is not a CSI2 device\n",
-			inst, sensor_node);
+	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to parse endpoint\n");
 		goto cleanup_exit;
 	}
 
-- 
Regards,

Laurent Pinchart

