Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E126531B4D8
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhBOEkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhBOEkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:17 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B6A52CDF;
        Mon, 15 Feb 2021 05:29:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363347;
        bh=SE2kOt4x0DLRgX5c4rVN82TAFqI2WSUKVMths7Fy6ok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C3i+2ajXXlc261yukIHl6Z+/CeR6uu7nJcl1yGvURHJ6dFGNveKRvzEj8kb/fFh8d
         +GOq5GhfOa67BkhsdJGXvbfyOumyosBPpu3P+zdxRQpgi+1sv5nvSZY6WAtsxj1Acs
         ysNsygZG7zsRvEJExcsKy/9d+bU/B6JF7qMXlTPQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 72/77] media: imx: imx7_mipi_csis: Fully initialize MIPI_CSIS_DPHYCTRL register
Date:   Mon, 15 Feb 2021 06:27:36 +0200
Message-Id: <20210215042741.28850-73-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When setting the CSIS parameters, write the MIPI_CSIS_DPHYCTRL register
fully instead of modifying selected fields, as the register doesn't
contain any reserved fields that need to be preserved. This simplifies
initialization slightly, and ensures that the register value doesn't
depend on its previous state (before a warm reboot for instance).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 5e907ea46743..26f323bff498 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -536,10 +536,8 @@ static void mipi_csis_set_params(struct csi_state *state)
 
 	__mipi_csis_set_format(state);
 
-	val = mipi_csis_read(state, MIPI_CSIS_DPHYCTRL);
-	val = (val & ~MIPI_CSIS_DPHYCTRL_HSSETTLE_MASK)
-	    | MIPI_CSIS_DPHYCTRL_HSSETTLE(state->hs_settle);
-	mipi_csis_write(state, MIPI_CSIS_DPHYCTRL, val);
+	mipi_csis_write(state, MIPI_CSIS_DPHYCTRL,
+			MIPI_CSIS_DPHYCTRL_HSSETTLE(state->hs_settle));
 
 	val = (0 << MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET) |
 		(0 << MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET) |
-- 
Regards,

Laurent Pinchart

