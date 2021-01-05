Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E092EAEE7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbhAEPkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:40:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbhAEPkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:40:40 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41A471C10;
        Tue,  5 Jan 2021 16:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860623;
        bh=2E/w+xveTKypmFeq82xLk+MFVucsMrX3n5O769ewUZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hy4+QV9comGXH0MCttvlGRT5rk+wg3I1x7SwiMSYqwsYQkaRuKOXQ9K490zBTpu23
         mcsGcGXI1A16aWmbID/XU05+vqVkk/VZY1/C5Kfw0b7BfdIvM8K62+MG6hvKmatLpw
         Jp80fdnm4TnFRHD6HOIXoUFAuOhLp9Uf5/E9qaUo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 70/75] media: imx: imx7_mipi_csis: Fully initialize MIPI_CSIS_DPHYCTRL register
Date:   Tue,  5 Jan 2021 17:28:47 +0200
Message-Id: <20210105152852.5733-71-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 63424a81c800..14496c6cbc09 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -532,10 +532,8 @@ static void mipi_csis_set_params(struct csi_state *state)
 
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

