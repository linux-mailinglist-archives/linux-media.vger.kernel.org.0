Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC51269848
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 23:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgINVvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 17:51:15 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:34554 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726068AbgINVvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 17:51:09 -0400
X-Halon-ID: 642d2a8e-f6d4-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 642d2a8e-f6d4-11ea-a39b-005056917f90;
        Mon, 14 Sep 2020 23:51:06 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] rcar-csi2: Set bus type when parsing fwnode
Date:   Mon, 14 Sep 2020 23:50:11 +0200
Message-Id: <20200914215011.339387-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only supported bus for the R-Car CSI-2 driver is CSI-2 DPHY, specify
this before parsing the fwnode.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 23e89ef2429d310a..b2e58f51b94fccd7 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -874,7 +874,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
-	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev), 0, 0, 0);
-- 
2.28.0

