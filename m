Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2EF39690E
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 22:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhEaUjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 16:39:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230032AbhEaUji (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 16:39:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EBD9611CB;
        Mon, 31 May 2021 20:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622493478;
        bh=GK7h9fk/CXJpmmpAdZO37HIYc4XszrgUo8eFRVrvFbA=;
        h=From:To:Cc:Subject:Date:From;
        b=EsuB0/Oq4wO8mDqGFoCv+juOz7gcg6BFAC59OTYC7pfthUiibesrVuSdPe7167Fm9
         8BC+tFXOUwNAx1FSPZT4UYoibIj2cVttwzJWLMHyZRfniadYipjKt7MbS0stLiZPgY
         CVMXfTbLI6CCiS9hPN4NRa1cxUk2z8J/TdZklyHIlqbSlT7QbbI3R9HptRaYQjpYje
         P1uw0QJq+UWyeJfnGOehu3WxXBwNUl6jGsAG7Mm+lNYKHJGeIiSFYsifik50y1bTbw
         xKKnALZsoJ+xrTFWMWpkqtRnGmlnBPgfLaoyle4ziNtOLsyvk0r4/bBpCsJxODpMy5
         TjtUJmR36yhKA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lnofb-000hsx-Jb; Mon, 31 May 2021 22:37:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alaa Emad <alaaemadhossney.ae@gmail.com>,
        Brad Love <brad@nextdimension.cc>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxim Plotnikov <wgh@torlan.ru>, Sean Young <sean@mess.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: sp8870: move it to staging
Date:   Mon, 31 May 2021 22:37:54 +0200
Message-Id: <5e694bc1b0670b58b93a9fea5712ed0f306e6050.1622493461.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver is used only ba av7110, which is preparing for
its retirement. So, move this ancillary driver to stay together
with av7110.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/Kconfig           | 12 -----------
 drivers/media/dvb-frontends/Makefile          |  1 -
 drivers/staging/media/av7110/Kconfig          | 20 +++++++++++++++++++
 drivers/staging/media/av7110/Makefile         |  2 ++
 .../media/av7110}/sp8870.c                    |  0
 .../media/av7110}/sp8870.h                    |  0
 6 files changed, 22 insertions(+), 13 deletions(-)
 rename drivers/{media/dvb-frontends => staging/media/av7110}/sp8870.c (100%)
 rename drivers/{media/dvb-frontends => staging/media/av7110}/sp8870.h (100%)

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index 3468b07b62fe..2c1ed98d43c5 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -323,18 +323,6 @@ config DVB_TDA10071
 comment "DVB-T (terrestrial) frontends"
 	depends on DVB_CORE
 
-config DVB_SP8870
-	tristate "Spase sp8870 based"
-	depends on DVB_CORE && I2C
-	default m if !MEDIA_SUBDRV_AUTOSELECT
-	help
-	  A DVB-T tuner module. Say Y when you want to support this frontend.
-
-	  This driver needs external firmware. Please use the command
-	  "<kerneldir>/scripts/get_dvb_firmware sp8870" to
-	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
-	  or /lib/firmware (depending on configuration of firmware hotplug).
-
 config DVB_SP887X
 	tristate "Spase sp887x based"
 	depends on DVB_CORE && I2C
diff --git a/drivers/media/dvb-frontends/Makefile b/drivers/media/dvb-frontends/Makefile
index b9f47d68e14e..d32e4c0be576 100644
--- a/drivers/media/dvb-frontends/Makefile
+++ b/drivers/media/dvb-frontends/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_DVB_PLL) += dvb-pll.o
 obj-$(CONFIG_DVB_STV0299) += stv0299.o
 obj-$(CONFIG_DVB_STB0899) += stb0899.o
 obj-$(CONFIG_DVB_STB6100) += stb6100.o
-obj-$(CONFIG_DVB_SP8870) += sp8870.o
 obj-$(CONFIG_DVB_CX22700) += cx22700.o
 obj-$(CONFIG_DVB_S5H1432) += s5h1432.o
 obj-$(CONFIG_DVB_CX24110) += cx24110.o
diff --git a/drivers/staging/media/av7110/Kconfig b/drivers/staging/media/av7110/Kconfig
index e19d24bf2eb4..f2d706acc131 100644
--- a/drivers/staging/media/av7110/Kconfig
+++ b/drivers/staging/media/av7110/Kconfig
@@ -72,3 +72,23 @@ config DVB_BUDGET_PATCH
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget-patch.
+
+if DVB_AV7110
+
+# frontend drivers that are used only by AV7110 driver
+# While those are technically independent, it doesn't make sense to keep
+# them if we drop support for AV7110
+
+config DVB_SP8870
+	tristate "Spase sp8870 based"
+	depends on DVB_CORE && I2C
+	default m if !MEDIA_SUBDRV_AUTOSELECT
+	help
+	  A DVB-T tuner module. Say Y when you want to support this frontend.
+
+	  This driver needs external firmware. Please use the command
+	  "<kerneldir>/scripts/get_dvb_firmware sp8870" to
+	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
+	  or /lib/firmware (depending on configuration of firmware hotplug).
+
+endif
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media/av7110/Makefile
index dcabecf1abde..307b267598ea 100644
--- a/drivers/staging/media/av7110/Makefile
+++ b/drivers/staging/media/av7110/Makefile
@@ -14,6 +14,8 @@ obj-$(CONFIG_DVB_BUDGET_PATCH) += budget-patch.o
 
 obj-$(CONFIG_DVB_AV7110) += dvb-ttpci.o
 
+obj-$(CONFIG_DVB_SP8870) += sp8870.o
+
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
 ccflags-y += -I $(srctree)/drivers/media/tuners
 ccflags-y += -I $(srctree)/drivers/media/pci/ttpci
diff --git a/drivers/media/dvb-frontends/sp8870.c b/drivers/staging/media/av7110/sp8870.c
similarity index 100%
rename from drivers/media/dvb-frontends/sp8870.c
rename to drivers/staging/media/av7110/sp8870.c
diff --git a/drivers/media/dvb-frontends/sp8870.h b/drivers/staging/media/av7110/sp8870.h
similarity index 100%
rename from drivers/media/dvb-frontends/sp8870.h
rename to drivers/staging/media/av7110/sp8870.h
-- 
2.31.1

