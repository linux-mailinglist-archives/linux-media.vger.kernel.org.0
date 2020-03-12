Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0102183D87
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgCLXrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbgCLXrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:35 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 635E41467;
        Fri, 13 Mar 2020 00:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056853;
        bh=7zQVQFam5QC44AhNw796afY5BC9QPgQuRv5u77igIhs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nbl08/2VCg6npv5+kTJiV6eK16OkPCCwc5YcSUlK9iE3AeO6nPh0yEQcJIn+y14Mr
         ag0a71kV0CG7CiuSZEHEoaNGVU0xDRi1A94iuRj5rIUqv/rGyJdGiZcYZmfVWCUifF
         vU9Bq1EJ8UO/5hglD0RtZHXxqF+hKdRNhOwB8nwk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 04/14] media: imx: imx7-mipi-csis: Expose correct YUV formats
Date:   Fri, 13 Mar 2020 01:47:12 +0200
Message-Id: <20200312234722.23483-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7-mipi-csis driver claims to support MEDIA_BUS_FMT_VYUY8_2X8 and
MEDIA_BUS_FMT_YUYV8_2X8, but this is not correct. When receiving
YUV 4:2:2 data on the CSI-2 bus, the output format is
MEDIA_BUS_FMT_UYVY8_2X8. Fix this.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index dec144d327b5..7515f1022271 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -267,11 +267,7 @@ struct csis_pix_format {
 static const struct csis_pix_format mipi_csis_formats[] = {
 	/* YUV formats. */
 	{
-		.code = MEDIA_BUS_FMT_VYUY8_2X8,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.data_alignment = 16,
-	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
 		.data_alignment = 16,
 	},
-- 
Regards,

Laurent Pinchart

