Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FD53D2053
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 11:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhGVIYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 04:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231259AbhGVIYi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 04:24:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C92606120C;
        Thu, 22 Jul 2021 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626944713;
        bh=mDlBm1+st6/RYgagHA47JigTq8drz+tHlBP+CXPZbVk=;
        h=From:To:Cc:Subject:Date:From;
        b=ZnI8FnerWIhS6ihirfALUw+u2q0hXQW0mcUNrGHQxMNBf7e9nxMlJ6hfE0uvuqBZQ
         QHPLbZjjQ+JS+8st7iUbQSCGowkYzDp7ES/qFtLA7HL65Ac5RXGYo1ej69zmEc7hje
         zdHOe2l6NLLC53fBQPTAemyVaDphW+9cs9lFEaeBtUZiuLfDEhS9r2pE/X5zh9Hvnu
         VBrh4cLFwLEz4fjhULIFtlxBOoNmSUt7fqfh+7n2sTW94qzOe+ZKqzLq9C3CPEne5p
         tRf22HctJ5G0kUVFOJejeD0im0lOU/R3KuXYdYX9UwYCuDB702mvbMrvKll6Ku6S3T
         E9uBh7bfQjZpw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atmel: atmel-isc: fix build failures after split
Date:   Thu, 22 Jul 2021 11:04:59 +0200
Message-Id: <20210722090509.1054249-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When the two isc driver front-ends are both enabled, but one of them
is built-in and the other one is a loadable module, the 'base' driver
is in a state that does not really work, as it would have to be
built in two different ways:

arm-linux-gnueabi-ld: drivers/media/platform/atmel/atmel-isc-base.o: in function `isc_async_complete':
atmel-isc-base.c:(.text+0x1e80): undefined reference to `__this_module'
arm-linux-gnueabi-ld: drivers/media/platform/atmel/atmel-isc-base.o:(.rodata+0x3c8): undefined reference to `__this_module'
arm-linux-gnueabi-ld: drivers/media/platform/atmel/atmel-isc-base.o:(__param+0x4): undefined reference to `__this_module'
arm-linux-gnueabi-ld: drivers/media/platform/atmel/atmel-isc-base.o:(__param+0x18): undefined reference to `__this_module'

As a workaround, turn the base portion of the driver into a library
by itself that can become a standalone module rather than being built
into the two drivers.

Fixes: 0a0e265515db ("media: atmel: atmel-isc: split driver into driver base and isc")
Fixes: c9aa973884a1 ("media: atmel: atmel-isc: add microchip-xisc driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/atmel/Makefile         |  8 ++++----
 drivers/media/platform/atmel/atmel-isc-base.c | 10 ++++++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index c5c01556c653..03c896e478c2 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-atmel-isc-objs = atmel-sama5d2-isc.o atmel-isc-base.o
-atmel-xisc-objs = atmel-sama7g5-isc.o atmel-isc-base.o
+atmel-isc-objs = atmel-sama5d2-isc.o
+atmel-xisc-objs = atmel-sama7g5-isc.o
 
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
-obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
-obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
+obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o atmel-isc-base.o
+obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o atmel-isc-base.o
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 19daa49bf604..b3730021dd89 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -378,6 +378,7 @@ int isc_clk_init(struct isc_device *isc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(isc_clk_init);
 
 void isc_clk_cleanup(struct isc_device *isc)
 {
@@ -392,6 +393,7 @@ void isc_clk_cleanup(struct isc_device *isc)
 			clk_unregister(isc_clk->clk);
 	}
 }
+EXPORT_SYMBOL_GPL(isc_clk_cleanup);
 
 static int isc_queue_setup(struct vb2_queue *vq,
 			    unsigned int *nbuffers, unsigned int *nplanes,
@@ -1578,6 +1580,7 @@ irqreturn_t isc_interrupt(int irq, void *dev_id)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(isc_interrupt);
 
 static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 {
@@ -2212,6 +2215,7 @@ const struct v4l2_async_notifier_operations isc_async_ops = {
 	.unbind = isc_async_unbind,
 	.complete = isc_async_complete,
 };
+EXPORT_SYMBOL_GPL(isc_async_ops);
 
 void isc_subdev_cleanup(struct isc_device *isc)
 {
@@ -2224,6 +2228,7 @@ void isc_subdev_cleanup(struct isc_device *isc)
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 }
+EXPORT_SYMBOL_GPL(isc_subdev_cleanup);
 
 int isc_pipeline_init(struct isc_device *isc)
 {
@@ -2264,6 +2269,7 @@ int isc_pipeline_init(struct isc_device *isc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(isc_pipeline_init);
 
 /* regmap configuration */
 #define ATMEL_ISC_REG_MAX    0xd5c
@@ -2273,4 +2279,8 @@ const struct regmap_config isc_regmap_config = {
 	.val_bits       = 32,
 	.max_register	= ATMEL_ISC_REG_MAX,
 };
+EXPORT_SYMBOL_GPL(isc_regmap_config);
 
+MODULE_AUTHOR("Songjun Wu");
+MODULE_DESCRIPTION("The V4L2 driver for Atmel-ISC, common parts");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2

