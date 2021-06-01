Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C14B397007
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 11:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhFAJM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 05:12:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233627AbhFAJMu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 05:12:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78FFD613AB;
        Tue,  1 Jun 2021 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622538668;
        bh=7Bq5BexlVK9T8fkTBp8wKN4Dq7W5jstexvuIXnyTpQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oOun13lYV2AnXJQuzudIT4j2IEdN/wzH067SMKvSOHx6ui0cxGZaPk+IfqB733x30
         PaC75lgP8/4j1Hhui15awCZ0fDdmgoCrSlTUj3KOk0nWigderTQFnvQMqmheaafjWn
         Hw5t1NQ16+4hKhA2NC22Mstp0f8uuob+JD9e+DcpJfAgSy4gRpiu9RorMJOsUZ16wL
         ePaint4rEvudwMxHrgMEtbRHUgXHTSLmE3OsIrroP3sUbysnsJFdscSTDKou0jiD9/
         VQIBNyeIE65SCi7H71E6rn41ZD81v8ZBDDShlzYvuJzfGRf4ChH5zXxVcVtNSkHqjr
         XRuJTifzeUbmA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lo0QU-000vRq-2E; Tue, 01 Jun 2021 11:11:06 +0200
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
Subject: [PATCH v2 3/3] media: sp8870: move it to staging
Date:   Tue,  1 Jun 2021 11:11:04 +0200
Message-Id: <2113b7c773a5fe55d5d04082ee3c6873a29f71e9.1622537534.git.mchehab+huawei@kernel.org>
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

This driver is used only by av7110, which is preparing for
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
index e19d24bf2eb4..9faf9d2d4001 100644
--- a/drivers/staging/media/av7110/Kconfig
+++ b/drivers/staging/media/av7110/Kconfig
@@ -72,3 +72,23 @@ config DVB_BUDGET_PATCH
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget-patch.
+
+if DVB_AV7110
+
+# Frontend driver that it is used only by AV7110 driver
+# While technically independent, it doesn't make sense to keep
+# it if we drop support for AV7110, as no other driver will use it.
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

