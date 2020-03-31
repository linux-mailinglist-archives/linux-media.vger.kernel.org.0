Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F27199513
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbgCaLMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730380AbgCaLMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 438EE208FE;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=ZTWt/yEu/0Nk6OMdTnDTOmL6PcNfD/4UVLIrMPk1B3A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e1ag+xBiOISY0Q9js0ua+b1Xpwyfyvh7aj0+1Y+kNEya5PJuE2gju/kSb2XoIYMu+
         X7nFoEF2f89FQyNBK6Nm5RGEtHa+aOnepMNnGRr7wzCJYt18aK0yHSXRaKOJBokvac
         jklzGl0RcvgdlueFgMNc4jGM2jnYjeSgZ+GwyWDE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bq0-2O; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 03/33] media: Kconfig: not all V4L2 platform drivers are for camera
Date:   Tue, 31 Mar 2020 13:11:39 +0200
Message-Id: <28d17fed173872f6f2629ecfcc56dd2807048d87.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the platform drivers got added, they were all part of
complex camera support. This is not the case anymore, as we
now have codecs and other stuff there too.

So, fix the dependencies, in order to not require users to
manually select something that it doesn't make sense.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig          | 3 +--
 drivers/media/platform/Kconfig | 3 ---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 2b6ea8beb919..31fbdb2a8d41 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -111,8 +111,7 @@ source "drivers/media/mc/Kconfig"
 config VIDEO_DEV
 	tristate
 	depends on MEDIA_SUPPORT
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
-	default y
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
 
 config VIDEO_V4L2_SUBDEV_API
 	bool "V4L2 sub-device userspace API"
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index e01bbb9dd1c1..c4178420d2c5 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -5,7 +5,6 @@
 
 menuconfig V4L_PLATFORM_DRIVERS
 	bool "V4L platform devices"
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  Say Y here to enable support for platform-specific V4L drivers.
 
@@ -43,7 +42,6 @@ config VIDEO_ASPEED
 
 config VIDEO_SH_VOU
 	tristate "SuperH VOU video output driver"
-	depends on MEDIA_CAMERA_SUPPORT
 	depends on VIDEO_DEV && I2C
 	depends on ARCH_SHMOBILE || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
@@ -165,7 +163,6 @@ endif # V4L_PLATFORM_DRIVERS
 menuconfig V4L_MEM2MEM_DRIVERS
 	bool "Memory-to-memory multimedia devices"
 	depends on VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  Say Y here to enable selecting drivers for V4L devices that
 	  use system memory for both source and destination buffers, as opposed
-- 
2.25.1

