Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF24381BFA
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhEPCP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbhEPCMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:12:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8707AC061347
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:10:24 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AABC24E6;
        Sun, 16 May 2021 03:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129514;
        bh=EFYGxAwAFE8zRdjCe1AHA1BVGmwOtne50otnlDRF5aU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d2AMDsPB5e7vlAfHjL18kMC/nI9JVoKVVQuX9U2nqhPYLMWeN5UOViq8x7KheAIUC
         Ks0PYn3TDcynSj1aLw2qSWmkR/EBiH2FXYyxEjVMduLFw0yHjXB3ZiUWBS+mBIpZvr
         v2+Lu+UZ1QTzMuPW5WpDvGdstK/47NnuovUOnbm8=
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
Subject: [PATCH v2 18/25] media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
Date:   Sun, 16 May 2021 04:44:34 +0300
Message-Id: <20210516014441.5508-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The num_clocks field of the csi_state only stores positive values, make
it unsigned.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 1cb8eeb2fdac..0ec6870f98a8 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -309,7 +309,7 @@ struct csi_state {
 	struct dentry *debugfs_root;
 	bool debug;
 
-	int num_clks;
+	unsigned int num_clks;
 	struct clk_bulk_data *clks;
 
 	u32 clk_frequency;
-- 
Regards,

Laurent Pinchart

