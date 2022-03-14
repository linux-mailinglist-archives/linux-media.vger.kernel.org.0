Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6528B4D89A7
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243408AbiCNQhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243193AbiCNQgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:36:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70D617ABE;
        Mon, 14 Mar 2022 09:35:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFA3961454;
        Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD4CC36B0D;
        Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647275707;
        bh=PPlZL/SB0tCVqUNa5+hEYDWbRfVKycaXFHPXViRWxog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rw3skd91+m0Bb4GFijkmNg4xwrbQwkV4paNOWX/EMRLsxRkRiYOmzqpLSvd06uZdy
         iI5Fl/3v5xPubAsxQ3oYnNnzlfjXLG6x92dynUs/ai+IwvhtfAQP3PdTfaMHEhCWKj
         435JWetqWTptL5OME05iE2pfhYJCGknkV8cBQTrcFjgTUbk6BdIBhPcGJYQLWnCR87
         RVDboYaDmkmJz6yu+FxY0tpJS2qAWeN+8PzidQedLCqwJz57vcWx7ZxP8vafLTr6Z7
         r4GG4lAqVpRfDf+uuLUSxcmYTyPYyOqV0SDVssw1W8u9aaYf8VIpLDq0i9OCv3mJA9
         fBvx9uNf9QGhA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTnez-001wxb-DJ; Mon, 14 Mar 2022 17:35:05 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ming Qian <ming.qian@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 23/67] media: platform: rga: move config to its own file
Date:   Mon, 14 Mar 2022 17:34:18 +0100
Message-Id: <2feaaa94cd80692cdcfe4488fe8ee08b40c80a63.1647274406.git.mchehab@kernel.org>
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

In order to better organize the platform/Kconfig, place
rga-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig              | 16 +---------------
 drivers/media/platform/rockchip/rga/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rga/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 5a8495338fd4..314e25dd7ca1 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -58,6 +58,7 @@ source "drivers/media/platform/qcom/camss/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
+source "drivers/media/platform/rockchip/rga/Kconfig"
 
 config VIDEO_MUX
 	tristate "Video Multiplexer"
@@ -284,21 +285,6 @@ config VIDEO_STM32_DMA2D
 	  The STM32 DMA2D is a memory-to-memory engine for pixel conversion
 	  and specialized DMA dedicated to image manipulation.
 
-config VIDEO_ROCKCHIP_RGA
-	tristate "Rockchip Raster 2d Graphic Acceleration Unit"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
-	select VIDEOBUF2_DMA_SG
-	select V4L2_MEM2MEM_DEV
-	help
-	  This is a v4l2 driver for Rockchip SOC RGA 2d graphics accelerator.
-	  Rockchip RGA is a separate 2D raster graphic acceleration unit.
-	  It accelerates 2D graphics operations, such as point/line drawing,
-	  image scaling, rotation, BitBLT, alpha blending and image blur/sharpness.
-
-	  To compile this driver as a module choose m here.
-
 config VIDEO_TI_VPE
 	tristate "TI VPE (Video Processing Engine) driver"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/rockchip/rga/Kconfig b/drivers/media/platform/rockchip/rga/Kconfig
new file mode 100644
index 000000000000..0106cc8a93a7
--- /dev/null
+++ b/drivers/media/platform/rockchip/rga/Kconfig
@@ -0,0 +1,14 @@
+config VIDEO_ROCKCHIP_RGA
+	tristate "Rockchip Raster 2d Graphic Acceleration Unit"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select VIDEOBUF2_DMA_SG
+	select V4L2_MEM2MEM_DEV
+	help
+	  This is a v4l2 driver for Rockchip SOC RGA 2d graphics accelerator.
+	  Rockchip RGA is a separate 2D raster graphic acceleration unit.
+	  It accelerates 2D graphics operations, such as point/line drawing,
+	  image scaling, rotation, BitBLT, alpha blending and image blur/sharpness.
+
+	  To compile this driver as a module choose m here.
-- 
2.35.1

