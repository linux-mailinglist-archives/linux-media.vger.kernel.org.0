Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04460192493
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCYJtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbgCYJtk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:40 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAA272078D;
        Wed, 25 Mar 2020 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=1vb9vh+95ah3C+NiQFX7cwPOTr+QIJDrzKOUv4TlVvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vb8vxG6gm6diqgCtON7D6cqYpfBlcg4di37YeMym4YqyfOUO7TqdZCwfuFOIS6ah7
         o4yoLRA7F4TizkpA5J6y3xoQuGa9zUDzEDjytbwTZ5IQwmErjoDcsvmvDn7UREAqsn
         BvgI33FktblAJCpzfXYidu9lYjf5pwYjH0uZf9dc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HTD-2p; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 03/22] media: Kconfig: not all V4L2 platform drivers are for camera
Date:   Wed, 25 Mar 2020 10:49:17 +0100
Message-Id: <6a277befc48f421c455a4054ee987e7e99b1e79b.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
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
index 03c295a2710a..184c7f4f057b 100644
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

