Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2239B2EAED7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbhAEPiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:38:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbhAEPiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:38:52 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 525B51BF2;
        Tue,  5 Jan 2021 16:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860617;
        bh=Wi0jh7X7z79/4q+XG3gUag2u7WPD58zF8yByXM9ynkU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U4x90FLHJqJCva322sNz5I4Lk3ixA8hm5fOfNj9vJwFqzyjgbHKw1eX87iwXUyx4E
         4r/wDj827qjOlLFK0O1aJnlpGWOmexpCBSgsMbkQzYBFkooVMdX8A9ioqoemFRNpGm
         zXMbvfbeS/w3+tmAm5xEH0hYWsgAOsRBaKMYnn84=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 60/75] media: imx: imx7_mipi_csis: Acquire reset control without naming it
Date:   Tue,  5 Jan 2021 17:28:37 +0200
Message-Id: <20210105152852.5733-61-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d8d1556cb526..b6a808cddb37 100644
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

