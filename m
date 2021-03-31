Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB7134FDA6
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 12:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbhCaJ7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 05:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234963AbhCaJ7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 05:59:41 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21507C06175F
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 02:59:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ada2:b4da:6568:5ad5])
        by baptiste.telenet-ops.be with bizsmtp
        id mxzd2400C5W9KJv01xzdKj; Wed, 31 Mar 2021 11:59:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRXdQ-00BseR-MX; Wed, 31 Mar 2021 11:59:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRW2i-001XXx-8w; Wed, 31 Mar 2021 10:17:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: VIDEO_IMX8_JPEG should depend on ARCH_MXC and not default to m
Date:   Wed, 31 Mar 2021 10:17:35 +0200
Message-Id: <20210331081735.367238-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8 QXP/QM integrated JPEG encoder/decoder is only present on
Freescale/NXP i.MX8 QXP and QM SoCs.  Hence add a dependency on
ARCH_MXC, to prevent asking the user about this driver when configuring
a kernel without i.MX8 support.

Drop the "default m" (which means "default y" if CONFIG_MODULES is not
enabled), as merely enabling CONFIG_COMPILE_TEST should not enable
additional code.

Fixes: 2db16c6ed72ce644 ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/imx-jpeg/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/imx-jpeg/Kconfig
index d875f7c88cdad125..0e3269d06ded30ec 100644
--- a/drivers/media/platform/imx-jpeg/Kconfig
+++ b/drivers/media/platform/imx-jpeg/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_IMX8_JPEG
 	tristate "IMX8 JPEG Encoder/Decoder"
+	depends on ARCH_MXC || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
2.25.1

