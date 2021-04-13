Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6372335D544
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245636AbhDMCbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240904AbhDMCbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:35 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A150AF3;
        Tue, 13 Apr 2021 04:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281075;
        bh=tUBY7d/6LhaF/dXbi+xdE2BH+rNZ2o/eJpDyAnzteoE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gJSTcVW2dO2p1hTf4swBuO7EDbCTaJoIv6MRIzd6WhOvgWTg16fRrJ2aH6uDp4R3p
         mqYSU3aro7iZ46nmGkyXWsJM43UD99lfbDFIo3ivrBm3humM+ZMOiU01F1MeHQCg+M
         vyhm4ILgG/gHj+wGtjaWLdfEsa/GmyvThftZy/Mg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 11/23] media: imx: imx7_mipi_csis: Drop csi_state phy field
Date:   Tue, 13 Apr 2021 05:30:02 +0300
Message-Id: <20210413023014.28797-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The phy field of the csi_state structure is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 94afb103f951..78014ae02d34 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -304,7 +304,6 @@ struct csi_state {
 
 	u8 index;
 	struct platform_device *pdev;
-	struct phy *phy;
 	void __iomem *regs;
 	int irq;
 	u32 flags;
-- 
Regards,

Laurent Pinchart

