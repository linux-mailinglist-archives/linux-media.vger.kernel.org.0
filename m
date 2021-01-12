Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CDA2F3B34
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 20:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436759AbhALTwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 14:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436747AbhALTwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 14:52:20 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C90C061786
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 11:51:39 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 278671F45505
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/6] media: mach-pxa: Register the camera sensor fixed-rate clock
Date:   Tue, 12 Jan 2021 16:49:14 -0300
Message-Id: <20210112194919.50176-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112194919.50176-1-ezequiel@collabora.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pxa-camera capture driver currently registers a v4l2-clk
clock, named "mclk", to represent the mt9m111 sensor clock.

Register a proper fixed-rate clock using the generic clock framework,
which will allow to remove the v4l2-clk clock in the pxa-camera
driver in a follow-up commit.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Arnd Bergmann <arnd@arndb.de> (for arch/arm/mach-*/)
---
Quoting Arnd:
"""
If there are no objections to the change itself, please take it through
the v4l2 git tree.
"""

 arch/arm/mach-pxa/devices.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 524d6093e0c7..09b8495f3fd9 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -4,6 +4,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/spi/pxa2xx_spi.h>
@@ -634,6 +635,13 @@ static struct platform_device pxa27x_device_camera = {
 
 void __init pxa_set_camera_info(struct pxacamera_platform_data *info)
 {
+	struct clk *mclk;
+
+	/* Register a fixed-rate clock for camera sensors. */
+	mclk = clk_register_fixed_rate(NULL, "pxa_camera_clk", NULL, 0,
+					     info->mclk_10khz * 10000);
+	if (!IS_ERR(mclk))
+		clkdev_create(mclk, "mclk", NULL);
 	pxa_register_device(&pxa27x_device_camera, info);
 }
 
-- 
2.29.2

