Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2E735C54F
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbhDLLfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238715AbhDLLfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:48 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB7A5E0A;
        Mon, 12 Apr 2021 13:35:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227328;
        bh=B6TqUG/T/kZoj7O/XFZKmyoB3Cqo8wK3z2st9Rpp4VQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ca72+E7+IOST0twKJ0kN4CupyEqkaDlI0MFXEBUU3LAHsRt9mXf2pG/hEHy4c30vh
         siAN9AlC7tv29Kvim4iXuOQ2B7CU7rzjD8ECJTRQcnB/0oLWqC0FkZ9Dzbq7hwcBs7
         49fuQAqxsAFn+Q1808KziKKvZ5KYzHj6ZCEN7bEc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 15/28] media: ti-vpe: cal: remove wait when stopping camerarx
Date:   Mon, 12 Apr 2021 14:34:44 +0300
Message-Id: <20210412113457.328012-16-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
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
index 0354f311c5d2..245c601b992c 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -405,7 +405,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 
 static void cal_camerarx_stop(struct cal_camerarx *phy)
 {
-	unsigned int i;
 	int ret;
 
 	cal_camerarx_ppi_disable(phy);
@@ -419,19 +418,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
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

