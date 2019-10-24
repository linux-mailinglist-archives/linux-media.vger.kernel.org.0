Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D641E2768
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408089AbfJXAmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52446 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392817AbfJXAmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:09 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 090749C7;
        Thu, 24 Oct 2019 02:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877726;
        bh=8R3td7eOiRhqQlXk9rYuK9e4ZoORMrPzlFcDDn7/+rM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U//mteH3HvPF9+41mwcItlwiZbuWnoLM85xWVDr8ZK6KRfePoZSaT899Nav8vlA/A
         4lomqMb8JwUn9ZHZwMC79G/UuwpL15G55CkB5uyhUNbSCHxbDsiGdaAyRgTwvyX+c5
         PaLGCz2A8CkqXP1bspTgbiFD/MK4cAgTQhP5/3P8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 3/7] media: imx: imx7_mipi_csis: Add greyscale formats support
Date:   Thu, 24 Oct 2019 03:41:51 +0300
Message-Id: <20191024004155.32068-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the 8-, 10- and 12-bit greyscale media bus formats, and
map them to the CSI-2 RAW8, RAW10 and RAW12 formats respectively.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a0ba3ed00cd8..8ffafbb6b34b 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -282,6 +282,18 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.code = MEDIA_BUS_FMT_YUYV8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
 		.data_alignment = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
+		.data_alignment = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
+		.data_alignment = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
+		.data_alignment = 16,
 	}
 };
 
-- 
Regards,

Laurent Pinchart

