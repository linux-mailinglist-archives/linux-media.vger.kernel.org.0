Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CDA39700A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 11:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbhFAJM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 05:12:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233626AbhFAJMu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 05:12:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76A46613A9;
        Tue,  1 Jun 2021 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622538668;
        bh=q8KnKc40WZgJ5sv4lBQBF1ij+CBYkkDHJoGvstVQIGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j1zh7SnCZ+XMdMpj2PEgKaSWdxiq+hGQN59apJ/Sh+EXDMUTRGhBGkpis70a/WvD9
         tw2gOkJ+KHpOGbhx8ATn1EaTG2NgxtJFQBnIuOTe2jZ2IkPAej6q+B+X+z2wXHXad8
         WzqT3eLC6l3VcpHhbSiV7/UHRQgDg8F6UrT9rwFVZiEw8MLAIwhmU0GEwNYe5Axvfd
         IvWvTuB+xrdF+3TpRHlmhW80As/wTBiTH/bJpsOZwWs776GgYDJvaViGjeYUq3xbCl
         rTzDoUHMCOkxIzcRkVmd4GVYfbJ9ZCwzLgP9q2Rt10o98q+ErwzZD6GDTS4Z8vekFt
         O2Qic3IxUqCHg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lo0QT-000vRi-W4; Tue, 01 Jun 2021 11:11:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 1/3] media: move ttpci-eeprom to common
Date:   Tue,  1 Jun 2021 11:11:02 +0200
Message-Id: <500441146cba4025369fd67f3e68e1a351f33864.1622537534.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622537534.git.mchehab+huawei@kernel.org>
References: <cover.1622537534.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ttpci-eeprom is actually an independent driver that
doesn't depend on the stuff under drivers/media/pci/ttpci/.

Also, it is used by an USB driver (pctv452e).

So, move it to the common directory.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/common/Kconfig                       | 4 ++++
 drivers/media/common/Makefile                      | 1 +
 drivers/media/{pci/ttpci => common}/ttpci-eeprom.c | 0
 drivers/media/{pci/ttpci => common}/ttpci-eeprom.h | 0
 drivers/media/pci/ttpci/Makefile                   | 2 +-
 drivers/media/usb/Kconfig                          | 5 -----
 drivers/media/usb/dvb-usb/Makefile                 | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/media/{pci/ttpci => common}/ttpci-eeprom.c (100%)
 rename drivers/media/{pci/ttpci => common}/ttpci-eeprom.h (100%)

diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index 4ea03b7899a8..0f6bde0f793e 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -13,6 +13,10 @@ config VIDEO_TVEEPROM
 	tristate
 	depends on I2C
 
+config TTPCI_EEPROM
+        tristate
+        depends on I2C
+
 config CYPRESS_FIRMWARE
 	tristate
 	depends on USB
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index b71e4b62eea5..55b5a1900124 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -3,3 +3,4 @@ obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
 obj-$(CONFIG_VIDEO_CX2341X) += cx2341x.o
 obj-$(CONFIG_VIDEO_TVEEPROM) += tveeprom.o
 obj-$(CONFIG_CYPRESS_FIRMWARE) += cypress_firmware.o
+obj-$(CONFIG_TTPCI_EEPROM) += ttpci-eeprom.o
diff --git a/drivers/media/pci/ttpci/ttpci-eeprom.c b/drivers/media/common/ttpci-eeprom.c
similarity index 100%
rename from drivers/media/pci/ttpci/ttpci-eeprom.c
rename to drivers/media/common/ttpci-eeprom.c
diff --git a/drivers/media/pci/ttpci/ttpci-eeprom.h b/drivers/media/common/ttpci-eeprom.h
similarity index 100%
rename from drivers/media/pci/ttpci/ttpci-eeprom.h
rename to drivers/media/common/ttpci-eeprom.h
diff --git a/drivers/media/pci/ttpci/Makefile b/drivers/media/pci/ttpci/Makefile
index 9b44c479fcdd..61001fa5a93e 100644
--- a/drivers/media/pci/ttpci/Makefile
+++ b/drivers/media/pci/ttpci/Makefile
@@ -10,7 +10,6 @@ ifdef CONFIG_DVB_AV7110_IR
 dvb-ttpci-objs += av7110_ir.o
 endif
 
-obj-$(CONFIG_TTPCI_EEPROM) += ttpci-eeprom.o
 obj-$(CONFIG_DVB_BUDGET_CORE) += budget-core.o
 obj-$(CONFIG_DVB_BUDGET) += budget.o
 obj-$(CONFIG_DVB_BUDGET_AV) += budget-av.o
@@ -20,3 +19,4 @@ obj-$(CONFIG_DVB_AV7110) += dvb-ttpci.o
 
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
 ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)/drivers/media/common
diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index 00feadb217d8..f97153df3c84 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-# This Kconfig option is also used by the legacy av7110 driver
-config TTPCI_EEPROM
-	tristate
-	depends on I2C
-
 if USB && MEDIA_SUPPORT
 
 menuconfig MEDIA_USB_SUPPORT
diff --git a/drivers/media/usb/dvb-usb/Makefile b/drivers/media/usb/dvb-usb/Makefile
index 28e4806a87cd..c22514948db2 100644
--- a/drivers/media/usb/dvb-usb/Makefile
+++ b/drivers/media/usb/dvb-usb/Makefile
@@ -83,4 +83,4 @@ obj-$(CONFIG_DVB_USB_TECHNISAT_USB2) += dvb-usb-technisat-usb2.o
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends/
 # due to tuner-xc3028
 ccflags-y += -I$(srctree)/drivers/media/tuners
-ccflags-y += -I$(srctree)/drivers/media/pci/ttpci
+ccflags-y += -I$(srctree)/drivers/media/common
-- 
2.31.1

