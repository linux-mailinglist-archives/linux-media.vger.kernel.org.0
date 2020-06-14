Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE351F8B9B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFOABN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgFOABL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:11 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74432150;
        Mon, 15 Jun 2020 02:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179233;
        bh=WcJ7DN9RqBqPnda5rvACGKiR9TI+ciKYBphLEH03KTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KM8C6BbS1SxT0nOKmVA2NICYABekeiu+0gP/kChETKrz+HRN/z8Lt/D6GFtFj215F
         eaNCaTI0y/qxt5630dfuoRSqMd7rvA+ypBQO7uU8Cg5WnGIEmfdAvvYYSSd0lTl55n
         hEJ8yps0woKbidkolFaBdI2BI7oxPlkoSamtqa8E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 050/107] media: ti-vpe: cal: Fix usage of v4l2_fwnode_endpoint_parse()
Date:   Mon, 15 Jun 2020 02:58:47 +0300
Message-Id: <20200614235944.17716-51-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 7f2f206f578b..af7b4fede021 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2031,11 +2031,10 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
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

