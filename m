Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFEE36586C
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhDTMF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhDTMF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:56 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D17470;
        Tue, 20 Apr 2021 14:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920321;
        bh=yj9nyrYH84pMVa6TECqfPVpRnpCqviB2zDa0E/EPLz0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d/PKhzqIp/t91RRWmoAxu4zhEUXzWuct5LNjQuKOubktu2HkKPm+3rQGcEjP2KEkN
         CVwGUvaO9c8Ik+V/oP+PZcp1CJ7A/iLE8PIBZzYiWeYFOQxJe44XXbft5ff/sBaYNq
         jMtOIrcDZs0aGmubVpWYk/VJXB9Ri7f73+GIhMqg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 15/35] media: ti-vpe: cal: remove wait when stopping camerarx
Date:   Tue, 20 Apr 2021 15:04:13 +0300
Message-Id: <20210420120433.902394-16-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Asserting ComplexIO reset seems to affect the HW (ie. asserting reset
will break an active capture), but the RESET_DONE bit never changes to
"reset is ongoing" state. Thus we always get a timeout.

Drop the wait, as it seems to achieve nothing.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 043e462c1d36..5b460b3ad94c 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -407,7 +407,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 
 static void cal_camerarx_stop(struct cal_camerarx *phy)
 {
-	unsigned int i;
 	int ret;
 
 	cal_camerarx_ppi_disable(phy);
@@ -421,19 +420,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 
-	/* Wait for power down completion */
-	for (i = 0; i < 10; i++) {
-		if (cal_read_field(phy->cal,
-				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
-		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
-			break;
-		usleep_range(1000, 1100);
-	}
-	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset\n",
 		phy->instance,
-		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
-		(i >= 10) ? "(timeout)" : "");
+		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
 
 	/* Disable the phy */
 	cal_camerarx_disable(phy);
-- 
2.25.1

