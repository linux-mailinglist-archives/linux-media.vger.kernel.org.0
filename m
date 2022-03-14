Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A4B4D8948
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239124AbiCNQgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235820AbiCNQgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:36:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1594311C24;
        Mon, 14 Mar 2022 09:35:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 656096138B;
        Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6711C340F7;
        Mon, 14 Mar 2022 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647275706;
        bh=pGdMVo81L21nG9yhzpJ4FAUxkhj+Km9odTkR6fwp/F4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C7VEwuHpUixh3uASPaVRn5XFgd9qBRGXm2InpJIZ6XfvvsjPjR+9ZrW6HcrrFjoOg
         MV3gZsgIY1iiIDA5KNGwjl/6OtPcVtZhV8n7KMSgpImb3Q1nJJzEUhO2fOg+T5Qw59
         MggUQx1UmhRUcfSbtBKHnphRcKDJrItHbd3D11ntzxNW7DL8rfrI1Te4rP3GJF9CqU
         T44iUq2ojBID43uO+t+LXsmiRdh/N4r4LjuFgVNPFiAcBZ2owDvLKMlxheRYSTkrI+
         V30v3Gr9KM8I+COGWzXZrhVgIqnP7IRQEmQOyzaSKC9uBk9czJLczK4gZW3o4Krtwo
         hhFow68/jywhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTney-001wwU-Gb; Mon, 14 Mar 2022 17:35:04 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Andrew Jeffery <andrew@aj.id.au>,
        Dmitry Osipenko <digetx@gmail.com>,
        Eddie James <eajames@linux.ibm.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jammy Huang <jammy_huang@aspeedtech.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ming Qian <ming.qian@nxp.com>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Zev Weiss <zev@bewilderbeest.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 06/67] media: platform: place Aspeed driver on a separate dir
Date:   Mon, 14 Mar 2022 17:34:01 +0100
Message-Id: <69c5ee8aae03bb9f9a8a825175a1cd0644eaf20c.1647274406.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to cleanup the main platform media directory, move Aspeed
driver to its own directory.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 MAINTAINERS                                        |  2 +-
 drivers/media/platform/Kconfig                     | 10 +---------
 drivers/media/platform/Makefile                    |  2 +-
 drivers/media/platform/aspeed/Kconfig              | 10 ++++++++++
 drivers/media/platform/aspeed/Makefile             |  2 ++
 drivers/media/platform/{ => aspeed}/aspeed-video.c |  0
 6 files changed, 15 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/aspeed/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Makefile
 rename drivers/media/platform/{ => aspeed}/aspeed-video.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a9fb0615925..1b6f48a660de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3026,7 +3026,7 @@ L:	linux-media@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed-video.txt
-F:	drivers/media/platform/aspeed-video.c
+F:	drivers/media/platform/aspeed/
 
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 1446a99159c5..10f453ff2717 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -50,15 +50,7 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/omap/Kconfig"
 
-config VIDEO_ASPEED
-	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
-	select VIDEOBUF2_DMA_CONTIG
-	help
-	  Support for the Aspeed Video Engine (VE) embedded in the Aspeed
-	  AST2400 and AST2500 SOCs. The VE can capture and compress video data
-	  from digital or analog sources.
+source "drivers/media/platform/aspeed/Kconfig"
 
 config VIDEO_SH_VOU
 	tristate "SuperH VOU video output driver"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index e319044c57e9..18ec3d208483 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,6 +6,7 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
+obj-y += aspeed/
 obj-y += am437x/
 obj-y += amphion/
 obj-y += atmel/
@@ -47,7 +48,6 @@ obj-y += xilinx/
 # Please place here only ancillary drivers that aren't SoC-specific
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
-obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
 obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
 obj-$(CONFIG_VIDEO_MUX)			+= video-mux.o
diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
new file mode 100644
index 000000000000..5025e892844c
--- /dev/null
+++ b/drivers/media/platform/aspeed/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_ASPEED
+	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_V4L2
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for the Aspeed Video Engine (VE) embedded in the Aspeed
+	  AST2400 and AST2500 SOCs. The VE can capture and compress video data
+	  from digital or analog sources.
diff --git a/drivers/media/platform/aspeed/Makefile b/drivers/media/platform/aspeed/Makefile
new file mode 100644
index 000000000000..1979af63dadd
--- /dev/null
+++ b/drivers/media/platform/aspeed/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_ASPEED) += aspeed-video.o
diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
similarity index 100%
rename from drivers/media/platform/aspeed-video.c
rename to drivers/media/platform/aspeed/aspeed-video.c
-- 
2.35.1

