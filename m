Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53370381C06
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhEPCQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbhEPCOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:14:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFEEC06138F
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:05:08 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 664E41576;
        Sun, 16 May 2021 03:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129507;
        bh=iYvkTcnN2nxpj3Ab8SW5WoHsML5UfRnYM1R36PDoPaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LMcGfTl0+LaPwZK+dRg7QOYQhMtKMB+ZaK/eLiBCjzhFz1idsk1cvqKlITwG3bVbh
         uSuvFw2blr0n3q5Zzmw+1aGKd3GS4Pjz96sQgfSi3rVEbbyRVuKAOT6rXCq2PwbY8o
         qlCmNXcl2Iwu7AfLf/68Ym4qINZtJxKWBts9NaVU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 11/25] media: imx: imx7_mipi_csis: Drop csi_state phy field
Date:   Sun, 16 May 2021 04:44:27 +0300
Message-Id: <20210516014441.5508-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The phy field of the csi_state structure is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
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

