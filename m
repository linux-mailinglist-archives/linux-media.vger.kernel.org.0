Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4234D89D9
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243345AbiCNQgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243173AbiCNQgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:36:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E1C13F44;
        Mon, 14 Mar 2022 09:35:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82B796141B;
        Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0410C340F9;
        Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647275707;
        bh=C3JWrlSAPDswBmF5LE1NlYt/uxsqYMYJ3/o/FOHQbW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dcDNSJePck7CCGeWRmxSe5fa2kph5YLoA5VW+BKjIkSHoX5V9EuSJdewp7dpVsTSx
         NL/MadKXTK+yeXtpAKcEhSMmsHI0uvOXVBEWqbhu0IUkTO6DmNelTiXCGAz9/tHsNg
         x9M/nGwt1YpDeUqRL0brwrtnct32fJ7H+DQyXOsqmvTEZAA+yNBTAHKd+wqbb2jWm4
         pkpk1RlEJhl3xk+OTeZtKvA5yY2JQPJqXWtl6QW5TMN54R0rhS14jUwD+TkVxzaRDn
         +Urk0oeMrQ/i0E76ZnnQgqTb3PWoHvSJe45jQsylUNbIhB3U4a0r5wI9mPAs2mooSf
         2NXt4cPbImXbg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1nTnez-001wxf-Er; Mon, 14 Mar 2022 17:35:05 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ming Qian <ming.qian@nxp.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 24/67] media: platform: s3c-camif: move config to its own file
Date:   Mon, 14 Mar 2022 17:34:19 +0100
Message-Id: <fb3511d9ee146e1ee7424e6b5f48f3ba6f85c3e0.1647274406.git.mchehab@kernel.org>
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
s3c-camif-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig           | 16 +---------------
 drivers/media/platform/s3c-camif/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)
 create mode 100644 drivers/media/platform/s3c-camif/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 314e25dd7ca1..9fe01afd4145 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -59,6 +59,7 @@ source "drivers/media/platform/qcom/venus/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/rockchip/rga/Kconfig"
+source "drivers/media/platform/s3c-camif/Kconfig"
 
 config VIDEO_MUX
 	tristate "Video Multiplexer"
@@ -74,21 +75,6 @@ config VIDEO_MUX
 
 source "drivers/media/platform/intel/Kconfig"
 
-config VIDEO_S3C_CAMIF
-	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && I2C && PM
-	depends on ARCH_S3C64XX || PLAT_S3C24XX || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_CONTIG
-	help
-	  This is a v4l2 driver for s3c24xx and s3c64xx SoC series camera
-	  host interface (CAMIF).
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called s3c-camif.
-
 config VIDEO_STM32_DCMI
 	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/s3c-camif/Kconfig b/drivers/media/platform/s3c-camif/Kconfig
new file mode 100644
index 000000000000..e8ef9e06dc1b
--- /dev/null
+++ b/drivers/media/platform/s3c-camif/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_S3C_CAMIF
+	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_V4L2 && I2C && PM
+	depends on ARCH_S3C64XX || PLAT_S3C24XX || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  This is a v4l2 driver for s3c24xx and s3c64xx SoC series camera
+	  host interface (CAMIF).
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called s3c-camif.
-- 
2.35.1

