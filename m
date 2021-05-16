Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C35381C1B
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhEPC3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEPC3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:29:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F70C061760
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 18:50:06 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42226B8A;
        Sun, 16 May 2021 03:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129500;
        bh=yd2k7p0t/i4uZXkvy0iYdsiRXQce30xAgzm8AHXI8ns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S0MuVAn7bs+JS41DArPSH2Tv8q0yMW0lddzfzmkn73AHC/MWThhVrqluq2VpOEJvi
         BNlDQGItzJmsAta5sN02QQqx3MJ+V9rOPgeRzHgnXQ3ysmiNPdfldqPqB+jYTdDGK9
         Goady/g2pZlOsmDd+cxwBysKSfM50WKo4so5nufg=
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
Subject: [PATCH v2 04/25] media: imx: imx7_mipi_csis: Move static data to top of mipi_csis_dump_regs()
Date:   Sun, 16 May 2021 04:44:20 +0300
Message-Id: <20210516014441.5508-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's customary to declare static variables at the top of the function,
with a blank line separating them from the non-static variables.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index f7c8b6d67e1c..25125e067aa7 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -429,9 +429,6 @@ static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
 
 static int mipi_csis_dump_regs(struct csi_state *state)
 {
-	struct device *dev = &state->pdev->dev;
-	unsigned int i;
-	u32 cfg;
 	static const struct {
 		u32 offset;
 		const char * const name;
@@ -450,6 +447,10 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 	};
 
+	struct device *dev = &state->pdev->dev;
+	unsigned int i;
+	u32 cfg;
+
 	dev_info(dev, "--- REGISTERS ---\n");
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
-- 
Regards,

Laurent Pinchart

