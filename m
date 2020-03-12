Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02FD183D8E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgCLXrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbgCLXrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11B1F144E;
        Fri, 13 Mar 2020 00:47:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056856;
        bh=IkSi/y206ethh5aFrlCqWo0gaCVsIzdna/RtffOdjSQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i8qVeiir/DCJsx11N6hP4AR3wYhOdhTC+H9mEgD5ojPFCNf23PHJcHLi+dkwwTfJJ
         ePXQGJ7W0fjJqKpCjCK12FUaWxadwCAv6tKqhVtuN7C6OE20/AD5bCpmuR2lkakszo
         G/v2ZxF1fGog44p4ar/emRHWkCLqczqCLoyyZtsI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 09/14] media: imx: imx7-mipi-csis: Never set MIPI_CSIS_ISPCFG_ALIGN_32BIT
Date:   Fri, 13 Mar 2020 01:47:17 +0200
Message-Id: <20200312234722.23483-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MIPI_CSIS_ISPCFG_ALIGN_32BIT bit enables output of 32-bit data. The
driver sets it based on the select format, but no format uses a 32-bit
bus width, so the bit is never set in practice. This isn't likely to
change any time soon, as the CSI IP core connected at the output of the
CSIS doesn't support 32-bit data width. Hardcode the bit to 0.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index ef5fabfcdada..922657b856b6 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -464,7 +464,8 @@ static void __mipi_csis_set_format(struct csi_state *state)
 
 	/* Color format */
 	val = mipi_csis_read(state, MIPI_CSIS_ISPCONFIG_CH0);
-	val = (val & ~MIPI_CSIS_ISPCFG_FMT_MASK) | state->csis_fmt->fmt_reg;
+	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
+	val |= state->csis_fmt->fmt_reg;
 	mipi_csis_write(state, MIPI_CSIS_ISPCONFIG_CH0, val);
 
 	/* Pixel resolution */
@@ -496,13 +497,6 @@ static void mipi_csis_set_params(struct csi_state *state)
 
 	mipi_csis_set_hsync_settle(state, state->hs_settle);
 
-	val = mipi_csis_read(state, MIPI_CSIS_ISPCONFIG_CH0);
-	if (state->csis_fmt->width == 32)
-		val |= MIPI_CSIS_ISPCFG_ALIGN_32BIT;
-	else
-		val &= ~MIPI_CSIS_ISPCFG_ALIGN_32BIT;
-	mipi_csis_write(state, MIPI_CSIS_ISPCONFIG_CH0, val);
-
 	val = (0 << MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET) |
 		(0 << MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET) |
 		(0 << MIPI_CSIS_ISPSYNC_VSYNC_EINTV_OFFSET);
-- 
Regards,

Laurent Pinchart

