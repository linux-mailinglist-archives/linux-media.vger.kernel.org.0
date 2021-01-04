Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06792E9B69
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 17:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbhADQ6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 11:58:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33768 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADQ6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 11:58:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 24D191F44B6F
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/6] media: mach-pxa: Register the camera sensor fixed-rate clock
Date:   Mon,  4 Jan 2021 13:57:34 -0300
Message-Id: <20210104165739.116404-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210104165739.116404-1-ezequiel@collabora.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
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

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
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

