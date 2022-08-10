Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8958EB92
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 13:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbiHJLy5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 07:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiHJLyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 07:54:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6259580507
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:54:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA5D16131B
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 11:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6C9C433D6;
        Wed, 10 Aug 2022 11:54:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Corentin Labbe <clabbe@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/4] zoran: move to mainline
Date:   Wed, 10 Aug 2022 13:54:45 +0200
Message-Id: <20220810115445.2302477-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
References: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The zoran driver can be moved back to mainline after it has been
converted by Corentin Labbe to vb2.

Note that the zoran driver no longer supports video output, but
video capture is working fine now.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/Kconfig                     |  1 +
 drivers/media/pci/Makefile                    |  1 +
 .../media => media/pci}/zoran/Kconfig         |  0
 .../media => media/pci}/zoran/Makefile        |  0
 .../media => media/pci}/zoran/videocodec.c    |  0
 .../media => media/pci}/zoran/videocodec.h    |  0
 .../media => media/pci}/zoran/zoran.h         |  0
 .../media => media/pci}/zoran/zoran_card.c    |  0
 .../media => media/pci}/zoran/zoran_card.h    |  0
 .../media => media/pci}/zoran/zoran_device.c  |  0
 .../media => media/pci}/zoran/zoran_device.h  |  0
 .../media => media/pci}/zoran/zoran_driver.c  |  0
 .../media => media/pci}/zoran/zr36016.c       |  0
 .../media => media/pci}/zoran/zr36016.h       |  0
 .../media => media/pci}/zoran/zr36050.c       |  0
 .../media => media/pci}/zoran/zr36050.h       |  0
 .../media => media/pci}/zoran/zr36057.h       |  0
 .../media => media/pci}/zoran/zr36060.c       |  0
 .../media => media/pci}/zoran/zr36060.h       |  0
 drivers/staging/media/Kconfig                 |  2 --
 drivers/staging/media/Makefile                |  1 -
 drivers/staging/media/zoran/TODO              | 19 -------------------
 22 files changed, 2 insertions(+), 22 deletions(-)
 rename drivers/{staging/media => media/pci}/zoran/Kconfig (100%)
 rename drivers/{staging/media => media/pci}/zoran/Makefile (100%)
 rename drivers/{staging/media => media/pci}/zoran/videocodec.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/videocodec.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zoran.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_card.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_card.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_device.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_device.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_driver.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36016.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36016.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36050.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36050.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36057.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36060.c (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36060.h (100%)
 delete mode 100644 drivers/staging/media/zoran/TODO

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 1224d908713a..7a229dddadaf 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -19,6 +19,7 @@ source "drivers/media/pci/sta2x11/Kconfig"
 source "drivers/media/pci/tw5864/Kconfig"
 source "drivers/media/pci/tw68/Kconfig"
 source "drivers/media/pci/tw686x/Kconfig"
+source "drivers/media/pci/zoran/Kconfig"
 
 endif
 
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index 551169a3e434..00d740b953d5 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_VIDEO_SOLO6X10) += solo6x10/
 obj-$(CONFIG_VIDEO_TW5864) += tw5864/
 obj-$(CONFIG_VIDEO_TW686X) += tw686x/
 obj-$(CONFIG_VIDEO_TW68) += tw68/
+obj-$(CONFIG_VIDEO_ZORAN) += zoran/
diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/media/pci/zoran/Kconfig
similarity index 100%
rename from drivers/staging/media/zoran/Kconfig
rename to drivers/media/pci/zoran/Kconfig
diff --git a/drivers/staging/media/zoran/Makefile b/drivers/media/pci/zoran/Makefile
similarity index 100%
rename from drivers/staging/media/zoran/Makefile
rename to drivers/media/pci/zoran/Makefile
diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/media/pci/zoran/videocodec.c
similarity index 100%
rename from drivers/staging/media/zoran/videocodec.c
rename to drivers/media/pci/zoran/videocodec.c
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/media/pci/zoran/videocodec.h
similarity index 100%
rename from drivers/staging/media/zoran/videocodec.h
rename to drivers/media/pci/zoran/videocodec.h
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
similarity index 100%
rename from drivers/staging/media/zoran/zoran.h
rename to drivers/media/pci/zoran/zoran.h
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
similarity index 100%
rename from drivers/staging/media/zoran/zoran_card.c
rename to drivers/media/pci/zoran/zoran_card.c
diff --git a/drivers/staging/media/zoran/zoran_card.h b/drivers/media/pci/zoran/zoran_card.h
similarity index 100%
rename from drivers/staging/media/zoran/zoran_card.h
rename to drivers/media/pci/zoran/zoran_card.h
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/media/pci/zoran/zoran_device.c
similarity index 100%
rename from drivers/staging/media/zoran/zoran_device.c
rename to drivers/media/pci/zoran/zoran_device.c
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/media/pci/zoran/zoran_device.h
similarity index 100%
rename from drivers/staging/media/zoran/zoran_device.h
rename to drivers/media/pci/zoran/zoran_device.h
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
similarity index 100%
rename from drivers/staging/media/zoran/zoran_driver.c
rename to drivers/media/pci/zoran/zoran_driver.c
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/media/pci/zoran/zr36016.c
similarity index 100%
rename from drivers/staging/media/zoran/zr36016.c
rename to drivers/media/pci/zoran/zr36016.c
diff --git a/drivers/staging/media/zoran/zr36016.h b/drivers/media/pci/zoran/zr36016.h
similarity index 100%
rename from drivers/staging/media/zoran/zr36016.h
rename to drivers/media/pci/zoran/zr36016.h
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/media/pci/zoran/zr36050.c
similarity index 100%
rename from drivers/staging/media/zoran/zr36050.c
rename to drivers/media/pci/zoran/zr36050.c
diff --git a/drivers/staging/media/zoran/zr36050.h b/drivers/media/pci/zoran/zr36050.h
similarity index 100%
rename from drivers/staging/media/zoran/zr36050.h
rename to drivers/media/pci/zoran/zr36050.h
diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/media/pci/zoran/zr36057.h
similarity index 100%
rename from drivers/staging/media/zoran/zr36057.h
rename to drivers/media/pci/zoran/zr36057.h
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/media/pci/zoran/zr36060.c
similarity index 100%
rename from drivers/staging/media/zoran/zr36060.c
rename to drivers/media/pci/zoran/zr36060.c
diff --git a/drivers/staging/media/zoran/zr36060.h b/drivers/media/pci/zoran/zr36060.h
similarity index 100%
rename from drivers/staging/media/zoran/zr36060.h
rename to drivers/media/pci/zoran/zr36060.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 421ce9dbf44c..ce379cae01b9 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -44,6 +44,4 @@ source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-video/Kconfig"
 
-source "drivers/staging/media/zoran/Kconfig"
-
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 950e96f10aad..7ece57ca0403 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -10,5 +10,4 @@ obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
-obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/staging/media/zoran/TODO b/drivers/staging/media/zoran/TODO
deleted file mode 100644
index 6992540d3e53..000000000000
--- a/drivers/staging/media/zoran/TODO
+++ /dev/null
@@ -1,19 +0,0 @@
-
-How to test the zoran driver:
-- RAW capture
-	mplayer tv:///dev/video0 -tv driver=v4l2
-
-- MJPEG capture (compression)
-	mplayer tv:///dev/video0 -tv driver=v4l2:outfmt=mjpeg
-	TODO: need two test for both Dcim path
-
-- MJPEG play (decompression)
-	ffmpeg -i test.avi -vcodec mjpeg -an -f v4l2 /dev/video0
-	Note: only recent ffmpeg has the ability of sending non-raw video via v4l2
-
-	The original way of sending video was via mplayer vo_zr/vo_zr2, but it does not compile
-	anymore and is a dead end (usage of some old private ffmpeg structures).
-
-TODO
-- fix the v4l compliance "TRY_FMT cannot handle an invalid pixelformat"
-- Filter JPEG data to made output work
-- 
2.35.1

