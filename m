Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7258431B4D3
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhBOEkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOEkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9CDC061574
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 20:39:27 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B82302702;
        Mon, 15 Feb 2021 05:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363342;
        bh=YX6rc8Rheh/1WaUdItzZOB7LibYRaY3pc/tKYebuptE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r58lnHGykdn6Av304gkz3QM5Yf4hdF0qYiAaF9U0xl6LlzwL0xnXHlX20sHuUPz4R
         Xz4ZvZYhHVYlVy+oeP5wLlKpxfApFeutKdgPn+EqkdaBDopYi6HJqOwkdZOclPMs10
         Q0I/6cXDmwPVEcxFBJqYXNnt2qCtJGvQny1NbdBQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 66/77] media: imx: imx7_mipi_csis: Drop 10-bit YUV support
Date:   Mon, 15 Feb 2021 06:27:30 +0200
Message-Id: <20210215042741.28850-67-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The data type specified for 10-bit YUV is the same as 8-bit YUV. This is
wrong, and has thus clearly not been tested. Instead of fixing data type
without being able to test it, drop it. It can be added back later when
someone will have access to a 10-bit YUV source to this it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 816650c438aa..e73efc7e99f9 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -276,10 +276,6 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
 		.width = 8,
-	}, {
-		.code = MEDIA_BUS_FMT_UYVY10_2X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.width = 10,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
-- 
Regards,

Laurent Pinchart

