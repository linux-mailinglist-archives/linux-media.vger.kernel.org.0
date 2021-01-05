Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2EB2EAE46
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbhAEPaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbhAEPaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:30:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679C4C061793
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 07:29:40 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54A0958B;
        Tue,  5 Jan 2021 16:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860577;
        bh=NYqyv/LirauqmS10uSegLidqQUwy8LzN5nqjZCNz+/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jftitxTbrEi2Ymioiag5c4dZ8Bm8Bt6mFiHCD07eljwopBsNClREp0S4nIlFDgoDf
         vzgqvsqyOznI9KIQAK6axy83aaqVduvkj5yaDsqbuDVgY2qVmzeFuyKTBiEZe8mqel
         LiSGXTLfm64lht/eOgMJjZu4rhoQaMv7F58fYS6Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 01/75] media: imx: Drop dependency on I2C
Date:   Tue,  5 Jan 2021 17:27:38 +0200
Message-Id: <20210105152852.5733-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX staging media drivers don't depend on I2C. Drop the dependency
from Kconfig.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index f555aac8a9d5..4782f7cfb709 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -18,14 +18,14 @@ menu "i.MX5/6/7 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
 	default y
 	help
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
 config VIDEO_IMX7_CSI
 	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-- 
Regards,

Laurent Pinchart

