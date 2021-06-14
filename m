Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956123A65B4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbhFNLmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58260 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236172AbhFNLiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:38:00 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27D4D5E9D;
        Mon, 14 Jun 2021 13:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669848;
        bh=PA5A0FNCshrb5wVZTDQR8khr5AFf8ornvOHO6rzn19Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fg71EdiZD/FC1BUVfNL92pjvAAorUQczQGkAUbiIiJfOAUUiPUcK3ORbeBgaGt8dr
         eFPThQjrJAW8bauqEAJw1YyUPbv3rJyKHVxdUFskFDD3uJT68NtH6Rv0uAT5EyyrkG
         0MyjgelfS9hlR8dVV+6IrK87ZS/H8TRHi6RCSGhc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 15/35] media: ti-vpe: cal: remove wait when stopping camerarx
Date:   Mon, 14 Jun 2021 14:23:25 +0300
Message-Id: <20210614112345.2032435-16-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index b36e55b63718..a8cca30f3f51 100644
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

