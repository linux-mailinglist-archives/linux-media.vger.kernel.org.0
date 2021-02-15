Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E066531B486
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBOE25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhBOE24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:28:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55BEC061756
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 20:28:15 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE6E3A25;
        Mon, 15 Feb 2021 05:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363292;
        bh=5qkcyL8CSVzlCODprLbiuhGMSr8z/oVh88RsRGcwnRw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G3uCj+nos+mAlPvcXfUgDlAbEERhr20wvtFBje5zFlOLRwceb4/+phyreM/2GKh9m
         Aybr0lYLBTQdSBHvRuO5+XHu1creYuUf3JabC9Udf+MhwKoOOzizIjbciZwpeMaAOL
         axcWyWjjtsRhPU2jNRAH17qDV7XcXDocFaVfLack=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 01/77] media: imx: Drop dependency on I2C
Date:   Mon, 15 Feb 2021 06:26:25 +0200
Message-Id: <20210215042741.28850-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX staging media drivers don't depend on I2C. Drop the dependency
from Kconfig.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 15322dc3124a..743e43742211 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -18,7 +18,7 @@ menu "i.MX5/6/7/8 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
 	depends on IMX_IPUV3_CORE
 	default y
 	help
@@ -26,7 +26,7 @@ config VIDEO_IMX_CSI
 
 config VIDEO_IMX7_CSI
 	tristate "i.MX6UL/L / i.MX7 / i.MX8M Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-- 
Regards,

Laurent Pinchart

