Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041812AB37E
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 10:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgKIJXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 04:23:50 -0500
Received: from comms.puri.sm ([159.203.221.185]:58080 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgKIJXt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 04:23:49 -0500
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 04:23:49 EST
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id B199EE0FD5;
        Mon,  9 Nov 2020 01:14:21 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8mQolxL0Qg_d; Mon,  9 Nov 2020 01:14:20 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     rogerio.silva@nxp.com, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        festevam@gmail.com
Cc:     iain.galloway@nxp.com, kernel@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] staging: media: imx: drop dependency on ipuv3
Date:   Mon,  9 Nov 2020 10:13:40 +0100
Message-Id: <20201109091340.7223-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As described in NXPs' linux tree, the imx8m SoC includes the same
CSI bridge hardware that is part of imx7d. We should be able to
use the "fsl,imx7-csi" driver for imx8m directly.

Since ipuv3 is not relevant for imx8m, drop the build dependency
for it.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index f555aac8a9d5..98272fd92fe4 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_IMX_MEDIA
 	tristate "i.MX5/6 V4L2 media core driver"
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
+	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	depends on HAS_DMA
-- 
2.20.1

