Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D003BBD2F
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 14:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhGEM76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 08:59:58 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:41874 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhGEM75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 08:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1625489840; x=1657025840;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bVuldxLMBwWlpqbA8gjwabaB/GPZv2qJ3tHQMbqCgNQ=;
  b=Mg6vLnyRHY0eBOprNFlhbrBPBIPDpFO4z2Esb0Ze891LBrXGYG9lbbmy
   N8Vm6cfXXY38yyONvEiKGyaml61SUGjy554tew263n9PiQg5ntodMr6fS
   Uc74nUGS0v42qnCB38lRaozistwoAm9yYqfAD2kIfLL6tOEo/WG1nI6xw
   vYA9E/d6DEaWvFSxW2LoiTD0jGvho2tUBliIgDf9PznnOWnmkX/5AFy1Y
   g9uVVdZk0x78Kzvz6h8EiiYBQEPt2fCsB/0uSA0v5M1+RsdcYHGLj2t2U
   RtMUGpVRicZDmiJ8yaJ+oOO/dulCjOiYJD/ZbOUTVEBDyWpoptJs8Q0KT
   w==;
IronPort-SDR: Ao8TT723racjsDO968c/gdQBUf7fh+aoaKf0SqDGkzybra5vXUg66FONecXnZocEuzFxY9Qp5H
 Hyf5DkpdhSR0UvYKWas7oPWSiQXHlm8vf8dff4kPYAelEJgXAWBTnYwCbn7A6BeQ4cSkny7mbR
 T/K/6teE5SWz9df1LWxDPBfv4o3klsv5QKERevRve81Mg8P5SoyiDCZk787ZxWzs0doOTS2Z3d
 2HWgVDiHUArUk5BISFGedTYk672zt5mVmCibZZlpuuwLfXAk6lx1CBpiUarid7DZYCgPz5XB/c
 pg8=
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="127698504"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2021 05:57:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 05:57:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Jul 2021 05:57:18 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <hverkuil-cisco@xs4all.nl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: atmel: fix build when ISC=m and XISC=y
Date:   Mon, 5 Jul 2021 15:57:08 +0300
Message-ID: <20210705125708.121902-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Building VIDEO_ATMEL_ISC as module and VIDEO_ATMEL_XISC as built-in
(or viceversa) causes build errors:

 or1k-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o: in function `isc_async_complete':
 atmel-isc-base.c:(.text+0x40d0): undefined reference to `__this_module'
 or1k-linux-ld: atmel-isc-base.c:(.text+0x40f0): undefined reference to `__this_module'
 or1k-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o:(.rodata+0x390): undefined reference to `__this_module'
 or1k-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o:(__param+0x4): undefined reference to `__this_module'
 or1k-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o:(__param+0x18): undefined reference to `__this_module'

This is caused by the file atmel-isc-base.c which is common code between
the two drivers.

The solution is to create another Kconfig symbol that is automatically
selected and generates the module atmel-isc-base.ko. This module can be
loaded when both drivers are modules, or built-in when at least one of them
is built-in.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c9aa973884a1 ("media: atmel: atmel-isc: add microchip-xisc driver")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/Kconfig          |  8 ++++++++
 drivers/media/platform/atmel/Makefile         |  5 +++--
 drivers/media/platform/atmel/atmel-isc-base.c | 11 +++++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 99b51213f871..dda2f27da317 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -8,6 +8,7 @@ config VIDEO_ATMEL_ISC
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
 	select V4L2_FWNODE
+	select VIDEO_ATMEL_ISC_BASE
 	help
 	   This module makes the ATMEL Image Sensor Controller available
 	   as a v4l2 device.
@@ -19,10 +20,17 @@ config VIDEO_ATMEL_XISC
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
 	select V4L2_FWNODE
+	select VIDEO_ATMEL_ISC_BASE
 	help
 	   This module makes the ATMEL eXtended Image Sensor Controller
 	   available as a v4l2 device.
 
+config VIDEO_ATMEL_ISC_BASE
+	tristate
+	default n
+	help
+	  ATMEL ISC and XISC common code base.
+
 config VIDEO_ATMEL_ISI
 	tristate "ATMEL Image Sensor Interface (ISI) support"
 	depends on VIDEO_V4L2 && OF
diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index c5c01556c653..46d264ab7948 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-atmel-isc-objs = atmel-sama5d2-isc.o atmel-isc-base.o
-atmel-xisc-objs = atmel-sama7g5-isc.o atmel-isc-base.o
+atmel-isc-objs = atmel-sama5d2-isc.o
+atmel-xisc-objs = atmel-sama7g5-isc.o
 
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
+obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
 obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 45679acb2706..37441f854a3e 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -370,6 +370,7 @@ int isc_clk_init(struct isc_device *isc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(isc_clk_init);
 
 void isc_clk_cleanup(struct isc_device *isc)
 {
@@ -384,6 +385,7 @@ void isc_clk_cleanup(struct isc_device *isc)
 			clk_unregister(isc_clk->clk);
 	}
 }
+EXPORT_SYMBOL_GPL(isc_clk_cleanup);
 
 static int isc_queue_setup(struct vb2_queue *vq,
 			    unsigned int *nbuffers, unsigned int *nplanes,
@@ -1565,6 +1567,7 @@ irqreturn_t isc_interrupt(int irq, void *dev_id)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(isc_interrupt);
 
 static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 {
@@ -2196,6 +2199,7 @@ const struct v4l2_async_notifier_operations isc_async_ops = {
 	.unbind = isc_async_unbind,
 	.complete = isc_async_complete,
 };
+EXPORT_SYMBOL_GPL(isc_async_ops);
 
 void isc_subdev_cleanup(struct isc_device *isc)
 {
@@ -2208,6 +2212,7 @@ void isc_subdev_cleanup(struct isc_device *isc)
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 }
+EXPORT_SYMBOL_GPL(isc_subdev_cleanup);
 
 int isc_pipeline_init(struct isc_device *isc)
 {
@@ -2248,6 +2253,7 @@ int isc_pipeline_init(struct isc_device *isc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(isc_pipeline_init);
 
 /* regmap configuration */
 #define ATMEL_ISC_REG_MAX    0xd5c
@@ -2257,4 +2263,9 @@ const struct regmap_config isc_regmap_config = {
 	.val_bits       = 32,
 	.max_register	= ATMEL_ISC_REG_MAX,
 };
+EXPORT_SYMBOL_GPL(isc_regmap_config);
 
+MODULE_AUTHOR("Songjun Wu");
+MODULE_AUTHOR("Eugen Hristev");
+MODULE_DESCRIPTION("Atmel ISC common code base");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

