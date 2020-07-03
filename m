Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5628721356B
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 09:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGCHqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 03:46:51 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51148 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgGCHqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 03:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1593762410; x=1625298410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PQJD5iuJXUSsGZM7I9TKdT2Kv84crJHcRFOPfrfc7cM=;
  b=JJCVGBlKypn1TaqB0jZ3MvbZgyZbIUxkIA1Kat8SH4e0mpdAVxjhz3Bo
   WdpobwAmq5CGuHu0Fxrd9CbA87ghVMCkLhHRdmAkvRZ/Nv8VOKrxZAPzY
   WacZYjiroJIaM/ZAFXjvox083oxeqXfpTC+fMNr5IOpCUxmWUxqFpaHXm
   pYm/cbFwmA45vF9FvWtvD617TRB0TUKWkFDZFgMHk/tyZNWx1E35zmA5E
   hur7HmS+BSvtIIsmkixgglTZCm+JmExQiH8oESB0YG+RhNYmYvUC/Lcgo
   WFVNmCUONVxXzF2vp6aGfZeoPcZ2u+34hncM4YkjXWjFdyjD28I7qGKzh
   w==;
IronPort-SDR: dJyc9LRexXnBf9uoNc2H2PYYtQEyqbzn9pcs4mGFLYGi15TtirnHgRD310LJWBA/JCn9/KWXRM
 oSchswOywTtjREjHiuNi7OJ3NCY2BgOM9iG48eQ0677B4r7WP23IkjrB2heO7qL1cYAGc/4Mff
 f0eFL78XLqXO7WAEaJybIw3EWfajYdD3J1jjyJrWMHQIV+XvZUyjkij2oiSewKF1MbPREEmnVe
 Xt8fzPfZ5D24iewmuf8Od6/ZvjWqXRpPxyOnOgoOLjpyXYee2zeMtu0muTGfiR/tWGVvh5HZmG
 +vk=
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="80602039"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2020 00:46:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 3 Jul 2020 00:46:47 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 3 Jul 2020 00:46:22 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 2/4] media: misc: introduce miscellaneous menu for helper chips
Date:   Fri, 3 Jul 2020 10:44:14 +0300
Message-ID: <20200703074416.55272-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703074416.55272-1-eugen.hristev@microchip.com>
References: <20200703074416.55272-1-eugen.hristev@microchip.com>
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

