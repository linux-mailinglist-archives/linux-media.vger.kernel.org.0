Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68316183D89
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgCLXrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgCLXrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:36 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3BE75F;
        Fri, 13 Mar 2020 00:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056854;
        bh=omzJrI6tu+a2ojE6Q8F3su+bHhsYtPJYUMNdTQY3MKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uj43drhQ28BQs+p027WG18KwgnI0Ozb5HT7mh0FAZeFPXgEKiFRliIiByJpjSXKIZ
         X/qfuOuWFqKORuaSF84Ho7qRdhrW1F5EsLAZvf2pVie6m6jnwNJcpgkiBiAVVzUlhR
         cVAKw2bNM42Tv8EskjU8YYFzon0RnCaO2APy2+Is=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 05/14] media: imx: imx7-mipi-csis: Fix MEDIA_BUS_FMT_UYVY8_2X8 data alignment
Date:   Fri, 13 Mar 2020 01:47:13 +0200
Message-Id: <20200312234722.23483-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MEDIA_BUS_FMT_UYVY8_2X8 format reports a data alignment of 16 bits,
which isn't correct as it is output on an 8-bit bus. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 7515f1022271..ffb1c87532f1 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -269,7 +269,7 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.data_alignment = 16,
+		.data_alignment = 8,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
-- 
Regards,

Laurent Pinchart

