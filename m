Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536011802CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgCJQGp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgCJQGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:44 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FE5DD09;
        Tue, 10 Mar 2020 17:06:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856401;
        bh=VvvepFoDRdDtkM1OlqpjgnC3fXcs3t4y/DZwit4/Ld8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kCNWjE8vjIGT1Q7Ty0jq/WTP8ghgtl2g7DqAmjpcwQi+oDbZY87lDBiRWlunCr6bS
         nDUE2Cum8CJxZfa23PO4FLgXYw3zTbdwA3u12EId8u0PFnht7JWKHL/zoMw/azSxDb
         oCZGJGpdlCGd5LBz69Lw8rNL8BhnmeTqQEwraXM0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 03/10] media: imx: imx7_mipi_csis: Add greyscale formats support
Date:   Tue, 10 Mar 2020 18:06:26 +0200
Message-Id: <20200310160633.950-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the 8-, 10- and 12-bit greyscale media bus formats, and
map them to the CSI-2 RAW8, RAW10 and RAW12 formats respectively.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index f96e32549381..2dd0b02e98b7 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -280,6 +280,18 @@ static const struct csis_pix_format mipi_csis_formats[] = {
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

