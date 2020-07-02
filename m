Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73654212491
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgGBN0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 09:26:01 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:38011 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbgGBN0B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 09:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1593696360; x=1625232360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PQJD5iuJXUSsGZM7I9TKdT2Kv84crJHcRFOPfrfc7cM=;
  b=rP62sV3XpTUyFDIJmmQoW93niD/GpCzkRxIl6kpxdXp2ynARRWGdUoWB
   BmtMj3+ZG1MfVAHZzlK7cZAP5UZe7UmfYDw40yYk8DhLAAACnNDsMshmB
   jwzStCzU4un9u2OM0du1anG0207Xg79lwtH8v7TDYbDD1GhNmdM85tFXv
   3mQR0Qnpm9siQLdh4O/htZLvJsEd6ng4JSWL7aX6uX63kGRo6KG3wsifc
   F43JKqTvuDItzKMiAFBjbcDfya6otg3V2Z6hyNywdDLNN/MDDq6h/qQss
   SpLTu52LqQGqQgv9AubGW/QYqqhbrub2rypVPcU8I2iAPmLDHYs/uACJw
   Q==;
IronPort-SDR: zMeqEU3emBzSIPEngKxWnta1KI3jvb9IRztbGFZrHZNxFwInFnrD/G3GltcxoTNyeTEk17KZ5H
 xT+EsnIPvxgEVpC3+jgR+qpM3K/ECn3lRP0WVi6M+cfXC79tD2OJzhAdvo+1a2BjuBTeWrOjDb
 DmgOUidoIsWpK9vDC60DVRnu05aCVKy/q1HgG/JMw6/JqEziEH6vAHZ4tuToC01ZTcpvlIiFd4
 r9pq7PJwKGmUh3LnnpJmbfBorbLVVbd8Qv3KSNAbIXSp+9esH6ev+wSZMxhApqHLu5+bLjBgsU
 tes=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="82395064"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jul 2020 06:26:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 06:26:00 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 2 Jul 2020 06:25:50 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 2/4] media: misc: introduce miscellaneous menu for helper chips
Date:   Thu, 2 Jul 2020 16:23:57 +0300
Message-ID: <20200702132359.122844-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702132359.122844-1-eugen.hristev@microchip.com>
References: <20200702132359.122844-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce misc directory for misc driver: various helper chips
on different platforms.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/Kconfig       |  1 +
 drivers/media/Makefile      |  2 +-
 drivers/media/misc/Kconfig  | 13 +++++++++++++
 drivers/media/misc/Makefile |  1 +
 4 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/misc/Kconfig
 create mode 100644 drivers/media/misc/Makefile

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a6d073f2e036..99d842fc63ce 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -258,6 +258,7 @@ source "drivers/media/i2c/Kconfig"
 source "drivers/media/spi/Kconfig"
 source "drivers/media/tuners/Kconfig"
 source "drivers/media/dvb-frontends/Kconfig"
+source "drivers/media/misc/Kconfig"
 
 endmenu
 
diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index d18357bf1346..d7545d090f5b 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_CEC_CORE) += cec/
 # Finally, merge the drivers that require the core
 #
 
-obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/ test-drivers/
+obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/ test-drivers/ misc/
 obj-$(CONFIG_VIDEO_DEV) += radio/
 
diff --git a/drivers/media/misc/Kconfig b/drivers/media/misc/Kconfig
new file mode 100644
index 000000000000..206f39f86f46
--- /dev/null
+++ b/drivers/media/misc/Kconfig
@@ -0,0 +1,13 @@
+#
+# Multimedia Video Miscellaneous device configuration
+#
+
+if VIDEO_V4L2
+
+menu "Miscellaneous helper chips"
+
+comment "Various helper chips"
+
+endmenu
+
+endif
diff --git a/drivers/media/misc/Makefile b/drivers/media/misc/Makefile
new file mode 100644
index 000000000000..f66554cd5c45
--- /dev/null
+++ b/drivers/media/misc/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0
-- 
2.25.1

