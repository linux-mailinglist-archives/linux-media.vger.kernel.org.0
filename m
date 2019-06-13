Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553CF43B72
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfFMP3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:29:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48982 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727226AbfFMP3V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:29:21 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DD32B84DFAD0ADBD21A3;
        Thu, 13 Jun 2019 23:28:59 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Jun 2019
 23:28:49 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mchehab@kernel.org>, <tglx@linutronix.de>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <sean@mess.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2] media: ttpci: Fix build error without RC_CORE
Date:   Thu, 13 Jun 2019 23:23:19 +0800
Message-ID: <20190613152319.30076-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190612152531.624cfba4@coco.lan>
References: <20190612152531.624cfba4@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If RC_CORE is not set, building fails:

drivers/media/pci/ttpci/av7110_ir.o: In function `av7110_ir_init':
av7110_ir.c:(.text+0x1b0): undefined reference to `rc_allocate_device'
av7110_ir.c:(.text+0x2c1): undefined reference to `rc_register_device'
av7110_ir.c:(.text+0x2dc): undefined reference to `rc_free_device'

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Sean Young <sean@mess.org>
Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: use depends on DVB_AV7110_IR instead of select as Sean Young's suggestion
---
 drivers/media/pci/ttpci/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
index d96d4fa..8a362ee 100644
--- a/drivers/media/pci/ttpci/Kconfig
+++ b/drivers/media/pci/ttpci/Kconfig
@@ -1,13 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DVB_AV7110_IR
 	bool
+	depends on RC_CORE=y || RC_CORE = DVB_AV7110
+	default DVB_AV7110
 
 config DVB_AV7110
 	tristate "AV7110 cards"
 	depends on DVB_CORE && PCI && I2C
 	select TTPCI_EEPROM
 	select VIDEO_SAA7146_VV
-	select DVB_AV7110_IR if INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110
 	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
 	select DVB_VES1820 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
-- 
2.7.4


