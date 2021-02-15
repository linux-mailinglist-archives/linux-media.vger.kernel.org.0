Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BBD31B48B
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhBOE3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:29:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBOE3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:29:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E5601234;
        Mon, 15 Feb 2021 05:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363293;
        bh=Of/R/H4WYAe6GNLEwQDQFH84urvLQTB+ymshOsngUu8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pchly6zkwlAIGs3XkIOP/Isjyo/bFBz2d0edqnvAd8wCDMH/gEYoNPpZfBrGYXV3E
         2wJNz4WAzhxV3BmNEQDwc7axQY9Ax2lcd01UVN9Q5L2NK4qFMRhwqLlxvuCkPsmujO
         NlMF9VXwKLJgcKi7Wx9+Vz729kVpGk6zGv7ZApUQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 03/77] media: imx: Drop manual dependency on VIDEO_IMX_MEDIA
Date:   Mon, 15 Feb 2021 06:26:27 +0200
Message-Id: <20210215042741.28850-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIDEO_IMX_CSI and VIDEO_IMX7_CSI symbols are defined in a section
guarded by VIDEO_IMX_MEDIA. There's no need to duplicate that with a
"depends on" statement. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index e3ca3c9d5d22..c3bf433ba3e3 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -19,7 +19,6 @@ menu "i.MX5/6/7/8 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA
 	depends on IMX_IPUV3_CORE
 	default y
 	help
@@ -27,7 +26,6 @@ config VIDEO_IMX_CSI
 
 config VIDEO_IMX7_CSI
 	tristate "i.MX6UL/L / i.MX7 / i.MX8M Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-- 
Regards,

Laurent Pinchart

