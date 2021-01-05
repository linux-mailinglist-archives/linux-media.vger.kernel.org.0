Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027502EAE4B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbhAEPai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:30:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbhAEPai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:30:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F79889F;
        Tue,  5 Jan 2021 16:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860579;
        bh=VJojIdfVjDN97EnXi0Cis9jbqpnEQTzLRJWDBVUD7as=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pMd5ZfF82ETcxvqh1bgjmwYgI2HOlRFiZ4DLQ8IvUbPljQaqLOlexLMClRjb8KfNH
         iwD7sT/4/Zk8qIPyKOOFYIzJlWQRhm/20ubapR/KsDle6MFcaI/w1L8D7uNDJKxYxB
         CkR3uZi0MLSXR7yanGhzC4SapVPvkfcmwYUBbKSs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 04/75] media: imx: Move IMX_IPUV3_CORE dependency to VIDEO_IMX_CSI
Date:   Tue,  5 Jan 2021 17:27:41 +0200
Message-Id: <20210105152852.5733-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX7 camera drivers, selected by VIDEO_IMX7_CSI, don't depend on
IMX_IPUV3_CORE. Move the dependency from the common VIDEO_IMX_MEDIA
symbol to VIDEO_IMX_CSI.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index ce270627a7c4..0f1277a58d3c 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_IMX_MEDIA
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA
 	depends on VIDEO_DEV
-	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
+	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
@@ -19,6 +19,7 @@ menu "i.MX5/6/7 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
+	depends on IMX_IPUV3_CORE
 	default y
 	help
 	  A video4linux camera sensor interface driver for i.MX5/6.
-- 
Regards,

Laurent Pinchart

