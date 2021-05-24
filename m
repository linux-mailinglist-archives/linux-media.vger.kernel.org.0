Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B179538E4EC
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhEXLLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33754 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbhEXLK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:57 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BB2D140C;
        Mon, 24 May 2021 13:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854564;
        bh=HqrhDruHAh04ay7WEMWsGhq+NT2/TcOOjBaQ2rD61zA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQrBmasr7nAZKXFk/U4IGZdSpKDyXrRa0MOBs59YcCPl2ubYc3BFO3+bM2/SOBPIy
         ig3SbIoNxkRG61ykXVscsIHbeLIxnswCXCWdedn6l2oZLZt8K1sCXTk6yW7ddrVWD8
         SgT7afM3QrVlvXaDrIjMC8ss5ycAn1byPc0nL7gg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 15/38] media: ti-vpe: cal: remove wait when stopping camerarx
Date:   Mon, 24 May 2021 14:08:46 +0300
Message-Id: <20210524110909.672432-16-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
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

