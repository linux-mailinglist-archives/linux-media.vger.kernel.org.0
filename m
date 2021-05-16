Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0905381C01
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhEPCQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbhEPCOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:14:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E18C06138E
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:00:17 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A23C1178;
        Sun, 16 May 2021 03:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129504;
        bh=ZjY8xLCwPwVC5gcoKSsmUgaQ4LjPfRZHMzqqjVhIKXA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c1lsjpTzlZ48RRf+f4w0Ek/tgEKfevfEhUzZdKtJD8g5u7/8xJCIpfBgJktijBFLE
         KhFZ+9zyHBuBgw81cqFfpobe33iI/fxqXnSq0Qr+iCltKpPQiK7vvn29ThTFtf4TJR
         xNxS0reVdvrUV9Vqzeqzc0om3BoOb19OVBIJMpaY=
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
Subject: [PATCH v2 09/25] media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
Date:   Sun, 16 May 2021 04:44:25 +0300
Message-Id: <20210516014441.5508-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The csis_hw_reset structure is instantiated as a member of csi_state,
but that member is never used. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 224d3ac9c9bf..695cb8aebcab 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -278,12 +278,6 @@ static const char * const mipi_csis_clk_id[] = {
 	"phy",
 };
 
-struct csis_hw_reset {
-	struct regmap *src;
-	u8 req_src;
-	u8 rst_bit;
-};
-
 struct csi_state {
 	/* lock elements below */
 	struct mutex lock;
@@ -321,7 +315,6 @@ struct csi_state {
 
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 
-	struct csis_hw_reset hw_reset;
 	struct regulator *mipi_phy_regulator;
 };
 
-- 
Regards,

Laurent Pinchart

