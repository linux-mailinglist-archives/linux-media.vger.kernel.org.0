Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D954E183D8A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgCLXri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgCLXrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7171F9D3;
        Fri, 13 Mar 2020 00:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056854;
        bh=CaY4A+FgGEet0rOQkL1VnJh54rMU0STURAJDE5ABAow=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=apllMm4URzIYDEQBGRNTtKPqltDjLgETBhkN/vN1uNjHub2VV3QaboMTxHbF2e7Jq
         t2ldSe5BGnRsc1dsCdNtOCB1LDMi0ZEFDTna1a3H9LHfBaPwUCMCoLfwJIfnMhhmVY
         xsE4W72hVD6CSIkcqtCOZVPkJKALjOgQ48gS9giQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 06/14] media: imx: imx7-mipi-csis: Add MEDIA_BUS_FMT_UYVY10_2X10 support
Date:   Fri, 13 Mar 2020 01:47:14 +0200
Message-Id: <20200312234722.23483-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for 10-bit YUV 4:2:2.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index ffb1c87532f1..d8521e2b8a4f 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -270,6 +270,10 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
 		.data_alignment = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY10_2X10,
+		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
+		.data_alignment = 10,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
-- 
Regards,

Laurent Pinchart

