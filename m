Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F242EAEF5
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbhAEPlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:41:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbhAEPlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:41:25 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95A621C1A;
        Tue,  5 Jan 2021 16:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860626;
        bh=ZZaTVs7UaluNlUTzTqbiQqvTzCBEmxSzHzHEZF+e3HQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q3auiVIBtkQ7xbEaJ1HsIaQC4a4HNk31BvDqcCr4QEsIEf98z3lBSpG6nEq+UFUwc
         /MYcUFKW+UUPSly3ZZl58pTG8LKhXPzxxwmSvLZ/RRa5rhJOrl/u0AUCcJ3+nQDNln
         +kYbr9QF7hE7oYHk4wpEQy6JWLtUMFsUFafjIsY4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 74/75] media: imx: imx7_mipi_csis: Use register macros in mipi_csis_dump_regs()
Date:   Tue,  5 Jan 2021 17:28:51 +0200
Message-Id: <20210105152852.5733-75-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace hardcoded register addresses in the MIPI_CSIS_DBG_CTRL()
function with macros. While at it, update the printed name of the
registers to match the datasheet, and short them by address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 5bbb26993597..63a150be3bd6 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -403,23 +403,23 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		u32 offset;
 		const char * const name;
 	} registers[] = {
-		{ 0x04, "CTRL" },
-		{ 0x24, "DPHYCTRL" },
-		{ 0x08, "CLKCTRL" },
-		{ 0x20, "DPHYSTS" },
-		{ 0x10, "INTMSK" },
-		{ 0x40, "CONFIG_CH0" },
-		{ 0x44, "RESOL_CH0" },
-		{ 0xC0, "DBG_CONFIG" },
-		{ 0x38, "DPHYSLAVE_L" },
-		{ 0x3C, "DPHYSLAVE_H" },
+		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
+		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
+		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
+		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
+		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
+		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
+		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
+		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
+		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 	};
 
 	dev_info(dev, "--- REGISTERS ---\n");
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(state, registers[i].offset);
-		dev_info(dev, "%12s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(dev, "%14s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

