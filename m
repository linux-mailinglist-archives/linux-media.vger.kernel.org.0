Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E934D6308
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 15:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349230AbiCKOLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 09:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349210AbiCKOLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 09:11:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490121B1DD0;
        Fri, 11 Mar 2022 06:09:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07EFC61EE9;
        Fri, 11 Mar 2022 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC81C34112;
        Fri, 11 Mar 2022 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647007778;
        bh=aFOhqNSDUze9t5+RGQdxCzp/Ocx35od7R8v2xJZs6Cw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HagVQ6RQ9SC8NJQQ+Gj1gg71AaMIO/GeWwid7LDqOXhuKxFnccP2Tp6yrOptvHfh9
         yqVKTQmlLHNClAVZJpCbHxyPCBWR9stmyLgkvcqQPlHhz6iIzsE3LBO09t6/yYB1/T
         yv1sMZqQIQ1r4zaqbC6x/kyDmQ/om97mv+Nq5XVia8bsRY+oesXRsQ7aHTbbzY2U5T
         HHPHOXTo3bd8j8aeFBdTRvTgypsu6xJL6g9e2DzhBB/Jm2NSA7wS+K9I1PdI5iAb75
         Rw6RcnT0hBuQZpZvyXvYvnr6pQYNBpMqMr2Dfm9fNO2ChgoMvHZ49/y6bWnp2wJFZw
         iGEJJRdfKPYAg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nSfxX-000lI9-TE; Fri, 11 Mar 2022 15:09:35 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chen-Yu Tsai <wens@csie.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Ming Qian <ming.qian@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v2 28/38] media: platform: sun8i-di: move config to its own file
Date:   Fri, 11 Mar 2022 15:07:41 +0100
Message-Id: <e551e94675be747c5377abed564fa73d3233e259.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to better organize the platform/Kconfig, place
sun8i-di-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig                | 15 +--------------
 drivers/media/platform/sunxi/sun8i-di/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 460ad793b89b..37103f24979f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -70,6 +70,7 @@ source "drivers/media/platform/s3c-camif/Kconfig"
 source "drivers/media/platform/s5p-g2d/Kconfig"
 source "drivers/media/platform/sti/hva/Kconfig"
 source "drivers/media/platform/stm32/Kconfig"
+source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
 
 config VIDEO_MUX
 	tristate "Video Multiplexer"
@@ -240,20 +241,6 @@ config VIDEO_TI_VPE_DEBUG
 	help
 	  Enable debug messages on VPE driver.
 
-config VIDEO_SUN8I_DEINTERLACE
-	tristate "Allwinner Deinterlace driver"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_SUNXI || COMPILE_TEST
-	depends on COMMON_CLK && OF
-	depends on PM
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	help
-	   Support for the Allwinner deinterlace unit with scaling
-	   capability found on some SoCs, like H3.
-	   To compile this driver as a module choose m here.
-
 config VIDEO_SUN8I_ROTATE
 	tristate "Allwinner DE2 rotation driver"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/platform/sunxi/sun8i-di/Kconfig
new file mode 100644
index 000000000000..8d762e664d45
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_SUN8I_DEINTERLACE
+	tristate "Allwinner Deinterlace driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on COMMON_CLK && OF
+	depends on PM
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	   Support for the Allwinner deinterlace unit with scaling
+	   capability found on some SoCs, like H3.
+	   To compile this driver as a module choose m here.
-- 
2.35.1

