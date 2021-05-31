Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC993964D0
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 18:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhEaQMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 12:12:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234260AbhEaQJ4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 12:09:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11E7D61370;
        Mon, 31 May 2021 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622477296;
        bh=mbjHGiixcSsPgqhpskP0uFDOFBnh6wzWCECpG4kopOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XkmVLdX5YFfVHuhnQV93uDIZ2efjQVchqw3YnTlTV76clM3qWwbddKa3GJ8kuvfKC
         Ll9OQSzXrzWr9dbjifUF2ysD+PuWfo2WiyfmCKeE0gWsjGHrizhzSStPr0j3VI5QDj
         t2+p4Uv7GoA1s63bJKYxNtjURQqntmrQrQOHAu6y5N3iNYhXS4XQQYxyPJXpZ2lnIH
         KjSrGBqGoc88PmQfn33WcrO7JLlzIKAKHE6GOeNWRRTuWKQ7UQxkRJamrIxb3KFewF
         lfmsWNOjugAFfodUO1hPvg0aGW+q1vWKu0ric83jMrc1fF1gksYTDB7eXgRMHU1bD/
         NYjRJSx4C8u5Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lnkSb-000epQ-LW; Mon, 31 May 2021 18:08:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jakub Kicinski <kuba@kernel.org>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Jia-Ju Bai <baijiaju@tsinghua.edu.cn>,
        Johannes Berg <johannes@sipsolutions.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Romain Perier <romain.perier@gmail.com>,
        Sean Young <sean@mess.org>,
        Shannon Nelson <snelson@pensando.io>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: av7110: move driver to staging
Date:   Mon, 31 May 2021 18:08:12 +0200
Message-Id: <4e7136434c68eabcdb66d25f44946ab794f4af0b.1622476959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622476959.git.mchehab+huawei@kernel.org>
References: <cover.1622476959.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver is really old, from a device whose manufacturer
got bankrupted more than 15 years ago.

It is also the only upstream driver relying on the DVB
"full-featured" API.

Some changes at the frontend drivers seem to have broken it
without anybody noticing.

So, it sounds it is time to retire the driver for good.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/ttpci/Kconfig               | 74 -------------------
 drivers/media/pci/ttpci/Makefile              |  9 ---
 drivers/media/pci/ttpci/budget.h              |  2 +-
 drivers/staging/media/Kconfig                 |  2 +
 drivers/staging/media/Makefile                |  1 +
 drivers/staging/media/av7110/Kconfig          | 74 +++++++++++++++++++
 drivers/staging/media/av7110/Makefile         | 20 +++++
 drivers/staging/media/av7110/TODO             |  2 +
 .../ttpci => staging/media/av7110}/av7110.c   |  0
 .../ttpci => staging/media/av7110}/av7110.h   |  0
 .../media/av7110}/av7110_av.c                 |  0
 .../media/av7110}/av7110_av.h                 |  0
 .../media/av7110}/av7110_ca.c                 |  0
 .../media/av7110}/av7110_ca.h                 |  0
 .../media/av7110}/av7110_hw.c                 |  0
 .../media/av7110}/av7110_hw.h                 |  0
 .../media/av7110}/av7110_ipack.c              |  0
 .../media/av7110}/av7110_ipack.h              |  0
 .../media/av7110}/av7110_ir.c                 |  0
 .../media/av7110}/av7110_v4l.c                |  0
 .../media/av7110}/budget-patch.c              |  0
 .../media/av7110}/dvb_filter.c                |  0
 .../media/av7110}/dvb_filter.h                |  0
 23 files changed, 100 insertions(+), 84 deletions(-)
 create mode 100644 drivers/staging/media/av7110/Kconfig
 create mode 100644 drivers/staging/media/av7110/Makefile
 create mode 100644 drivers/staging/media/av7110/TODO
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_av.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_av.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ca.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ca.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_hw.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_hw.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ipack.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ipack.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ir.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_v4l.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/budget-patch.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/dvb_filter.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/dvb_filter.h (100%)

diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
index 8a362ee9105f..65a6832a6b96 100644
--- a/drivers/media/pci/ttpci/Kconfig
+++ b/drivers/media/pci/ttpci/Kconfig
@@ -1,56 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config DVB_AV7110_IR
-	bool
-	depends on RC_CORE=y || RC_CORE = DVB_AV7110
-	default DVB_AV7110
-
-config DVB_AV7110
-	tristate "AV7110 cards"
-	depends on DVB_CORE && PCI && I2C
-	select TTPCI_EEPROM
-	select VIDEO_SAA7146_VV
-	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
-	select DVB_VES1820 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_TDA8083 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_SP8870 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_STV0297 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_L64781 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_LNBP21 if MEDIA_SUBDRV_AUTOSELECT
-	help
-	  Support for SAA7146 and AV7110 based DVB cards as produced
-	  by Fujitsu-Siemens, Technotrend, Hauppauge and others.
-
-	  This driver only supports the fullfeatured cards with
-	  onboard MPEG2 decoder.
-
-	  This driver needs an external firmware. Please use the script
-	  "<kerneldir>/scripts/get_dvb_firmware av7110" to
-	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
-	  or /lib/firmware (depending on configuration of firmware hotplug).
-
-	  Alternatively, you can download the file and use the kernel's
-	  EXTRA_FIRMWARE configuration option to build it into your
-	  kernel image by adding the filename to the EXTRA_FIRMWARE
-	  configuration option string.
-
-	  Say Y if you own such a card and want to use it.
-
-config DVB_AV7110_OSD
-	bool "AV7110 OSD support"
-	depends on DVB_AV7110
-	default y if DVB_AV7110=y || DVB_AV7110=m
-	help
-	  The AV7110 firmware provides some code to generate an OnScreenDisplay
-	  on the video output. This is kind of nonstandard and not guaranteed to
-	  be maintained.
-
-	  Anyway, some popular DVB software like VDR uses this OSD to render
-	  its menus, so say Y if you want to use this software.
-
-	  All other people say N.
-
 config DVB_BUDGET_CORE
 	tristate "SAA7146 DVB cards (aka Budget, Nova-PCI)"
 	depends on DVB_CORE && PCI && I2C
@@ -136,25 +84,3 @@ config DVB_BUDGET_AV
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget-av.
-
-config DVB_BUDGET_PATCH
-	tristate "AV7110 cards with Budget Patch"
-	depends on DVB_BUDGET_CORE && I2C
-	depends on DVB_AV7110
-	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_TDA8083 if MEDIA_SUBDRV_AUTOSELECT
-	help
-	  Support for Budget Patch (full TS) modification on
-	  SAA7146+AV7110 based cards (DVB-S cards). This
-	  driver doesn't use onboard MPEG2 decoder. The
-	  card is driven in Budget-only mode. Card is
-	  required to have loaded firmware to tune properly.
-	  Firmware can be loaded by insertion and removal of
-	  standard AV7110 driver prior to loading this
-	  driver.
-
-	  Say Y if you own such a card and want to use it.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called budget-patch.
diff --git a/drivers/media/pci/ttpci/Makefile b/drivers/media/pci/ttpci/Makefile
index 61001fa5a93e..b0708f6e40cc 100644
--- a/drivers/media/pci/ttpci/Makefile
+++ b/drivers/media/pci/ttpci/Makefile
@@ -1,21 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for the kernel SAA7146 FULL TS DVB device driver
-# and the AV7110 DVB device driver
 #
 
-dvb-ttpci-objs := av7110_hw.o av7110_v4l.o av7110_av.o av7110_ca.o av7110.o av7110_ipack.o dvb_filter.o
-
-ifdef CONFIG_DVB_AV7110_IR
-dvb-ttpci-objs += av7110_ir.o
-endif
-
 obj-$(CONFIG_DVB_BUDGET_CORE) += budget-core.o
 obj-$(CONFIG_DVB_BUDGET) += budget.o
 obj-$(CONFIG_DVB_BUDGET_AV) += budget-av.o
 obj-$(CONFIG_DVB_BUDGET_CI) += budget-ci.o
-obj-$(CONFIG_DVB_BUDGET_PATCH) += budget-patch.o
-obj-$(CONFIG_DVB_AV7110) += dvb-ttpci.o
 
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
 ccflags-y += -I $(srctree)/drivers/media/tuners
diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/media/pci/ttpci/budget.h
index a7463daf39f1..bd87432e6cde 100644
--- a/drivers/media/pci/ttpci/budget.h
+++ b/drivers/media/pci/ttpci/budget.h
@@ -8,7 +8,6 @@
 #include <media/demux.h>
 #include <media/dvb_demux.h>
 #include <media/dmxdev.h>
-#include "dvb_filter.h"
 #include <media/dvb_net.h>
 
 #include <linux/module.h>
@@ -28,6 +27,7 @@ extern int budget_debug;
 		       __func__, ##arg);				\
 } while (0)
 
+#define TS_SIZE        188
 
 struct budget_info {
 	char *name;
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index ca59986b20f8..e3aaae920847 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -42,4 +42,6 @@ source "drivers/staging/media/tegra-video/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
 
+source "drivers/staging/media/av7110/Kconfig"
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 716929a1a313..5b5afc5b03a0 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
+obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/staging/media/av7110/Kconfig b/drivers/staging/media/av7110/Kconfig
new file mode 100644
index 000000000000..e19d24bf2eb4
--- /dev/null
+++ b/drivers/staging/media/av7110/Kconfig
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DVB_AV7110_IR
+	bool
+	depends on RC_CORE=y || RC_CORE = DVB_AV7110
+	default DVB_AV7110
+
+config DVB_AV7110
+	tristate "AV7110 cards"
+	depends on DVB_CORE && PCI && I2C
+	select TTPCI_EEPROM
+	select VIDEO_SAA7146_VV
+	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
+	select DVB_VES1820 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_TDA8083 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_SP8870 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_STV0297 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_L64781 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_LNBP21 if MEDIA_SUBDRV_AUTOSELECT
+	help
+	  Support for SAA7146 and AV7110 based DVB cards as produced
+	  by Fujitsu-Siemens, Technotrend, Hauppauge and others.
+
+	  This driver only supports the fullfeatured cards with
+	  onboard MPEG2 decoder.
+
+	  This driver needs an external firmware. Please use the script
+	  "<kerneldir>/scripts/get_dvb_firmware av7110" to
+	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
+	  or /lib/firmware (depending on configuration of firmware hotplug).
+
+	  Alternatively, you can download the file and use the kernel's
+	  EXTRA_FIRMWARE configuration option to build it into your
+	  kernel image by adding the filename to the EXTRA_FIRMWARE
+	  configuration option string.
+
+	  Say Y if you own such a card and want to use it.
+
+config DVB_AV7110_OSD
+	bool "AV7110 OSD support"
+	depends on DVB_AV7110
+	default y if DVB_AV7110=y || DVB_AV7110=m
+	help
+	  The AV7110 firmware provides some code to generate an OnScreenDisplay
+	  on the video output. This is kind of nonstandard and not guaranteed to
+	  be maintained.
+
+	  Anyway, some popular DVB software like VDR uses this OSD to render
+	  its menus, so say Y if you want to use this software.
+
+	  All other people say N.
+
+config DVB_BUDGET_PATCH
+	tristate "AV7110 cards with Budget Patch"
+	depends on DVB_BUDGET_CORE && I2C
+	depends on DVB_AV7110
+	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_TDA8083 if MEDIA_SUBDRV_AUTOSELECT
+	help
+	  Support for Budget Patch (full TS) modification on
+	  SAA7146+AV7110 based cards (DVB-S cards). This
+	  driver doesn't use onboard MPEG2 decoder. The
+	  card is driven in Budget-only mode. Card is
+	  required to have loaded firmware to tune properly.
+	  Firmware can be loaded by insertion and removal of
+	  standard AV7110 driver prior to loading this
+	  driver.
+
+	  Say Y if you own such a card and want to use it.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called budget-patch.
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media/av7110/Makefile
new file mode 100644
index 000000000000..dcabecf1abde
--- /dev/null
+++ b/drivers/staging/media/av7110/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the AV7110 DVB device driver
+#
+
+dvb-ttpci-objs := av7110_hw.o av7110_v4l.o av7110_av.o av7110_ca.o av7110.o \
+		  av7110_ipack.o dvb_filter.o
+
+ifdef CONFIG_DVB_AV7110_IR
+dvb-ttpci-objs += av7110_ir.o
+endif
+
+obj-$(CONFIG_DVB_BUDGET_PATCH) += budget-patch.o
+
+obj-$(CONFIG_DVB_AV7110) += dvb-ttpci.o
+
+ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)/drivers/media/pci/ttpci
+ccflags-y += -I $(srctree)/drivers/media/common
diff --git a/drivers/staging/media/av7110/TODO b/drivers/staging/media/av7110/TODO
new file mode 100644
index 000000000000..84a16d077318
--- /dev/null
+++ b/drivers/staging/media/av7110/TODO
@@ -0,0 +1,2 @@
+- Thid driver is too old and relies on a different API.
+  Drop it from Kernel on a couple of versions.
diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/staging/media/av7110/av7110.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110.c
rename to drivers/staging/media/av7110/av7110.c
diff --git a/drivers/media/pci/ttpci/av7110.h b/drivers/staging/media/av7110/av7110.h
similarity index 100%
rename from drivers/media/pci/ttpci/av7110.h
rename to drivers/staging/media/av7110/av7110.h
diff --git a/drivers/media/pci/ttpci/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_av.c
rename to drivers/staging/media/av7110/av7110_av.c
diff --git a/drivers/media/pci/ttpci/av7110_av.h b/drivers/staging/media/av7110/av7110_av.h
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_av.h
rename to drivers/staging/media/av7110/av7110_av.h
diff --git a/drivers/media/pci/ttpci/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_ca.c
rename to drivers/staging/media/av7110/av7110_ca.c
diff --git a/drivers/media/pci/ttpci/av7110_ca.h b/drivers/staging/media/av7110/av7110_ca.h
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_ca.h
rename to drivers/staging/media/av7110/av7110_ca.h
diff --git a/drivers/media/pci/ttpci/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_hw.c
rename to drivers/staging/media/av7110/av7110_hw.c
diff --git a/drivers/media/pci/ttpci/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_hw.h
rename to drivers/staging/media/av7110/av7110_hw.h
diff --git a/drivers/media/pci/ttpci/av7110_ipack.c b/drivers/staging/media/av7110/av7110_ipack.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_ipack.c
rename to drivers/staging/media/av7110/av7110_ipack.c
diff --git a/drivers/media/pci/ttpci/av7110_ipack.h b/drivers/staging/media/av7110/av7110_ipack.h
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_ipack.h
rename to drivers/staging/media/av7110/av7110_ipack.h
diff --git a/drivers/media/pci/ttpci/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_ir.c
rename to drivers/staging/media/av7110/av7110_ir.c
diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
similarity index 100%
rename from drivers/media/pci/ttpci/av7110_v4l.c
rename to drivers/staging/media/av7110/av7110_v4l.c
diff --git a/drivers/media/pci/ttpci/budget-patch.c b/drivers/staging/media/av7110/budget-patch.c
similarity index 100%
rename from drivers/media/pci/ttpci/budget-patch.c
rename to drivers/staging/media/av7110/budget-patch.c
diff --git a/drivers/media/pci/ttpci/dvb_filter.c b/drivers/staging/media/av7110/dvb_filter.c
similarity index 100%
rename from drivers/media/pci/ttpci/dvb_filter.c
rename to drivers/staging/media/av7110/dvb_filter.c
diff --git a/drivers/media/pci/ttpci/dvb_filter.h b/drivers/staging/media/av7110/dvb_filter.h
similarity index 100%
rename from drivers/media/pci/ttpci/dvb_filter.h
rename to drivers/staging/media/av7110/dvb_filter.h
-- 
2.31.1

