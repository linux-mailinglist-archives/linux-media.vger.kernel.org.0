Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2A731B4CF
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhBOEjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:39:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBOEjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:39:18 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DBD1B23;
        Mon, 15 Feb 2021 05:28:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363339;
        bh=JcDzsKUSDr2Z+4JVbWyty9A5snQfHj+Ddh2mSesLKOM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dn6BtR1WCTjmnqZD6JPlI9betVe1Pt4SbzNoJiRnjOGW402esQ3T+dcpExgylWwZV
         h2MvpqnWJ2+GK69eBF+9cWcimohrNPBZ2raBptkM8qtQh63Hdy47G/M/+DYE031/Rc
         TH6cgAPdR+bXW4j59JuN/Ql/M8IRP0NdRKr8BKW0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 62/77] media: imx: imx7_mipi_csis: Acquire reset control without naming it
Date:   Mon, 15 Feb 2021 06:27:26 +0200
Message-Id: <20210215042741.28850-63-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device has a single reset line, there's thus no need to name it
explicitly when calling devm_reset_control_get_exclusive(). Drop the
name in preparation for the removal of the reset-names property in the
DT binding.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 8cf860544b0a..36eabab22bfb 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -943,7 +943,7 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
 
 	/* Get MIPI PHY resets */
-	state->mrst = devm_reset_control_get_exclusive(&pdev->dev, "mrst");
+	state->mrst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(state->mrst))
 		return PTR_ERR(state->mrst);
 
-- 
Regards,

Laurent Pinchart

