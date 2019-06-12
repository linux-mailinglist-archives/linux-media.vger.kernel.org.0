Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDEC41AD0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 05:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbfFLDoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 23:44:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:55226 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726568AbfFLDoQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 23:44:16 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 6A40A1D14A6A6AD88AE1;
        Wed, 12 Jun 2019 11:44:14 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Wed, 12 Jun 2019
 11:44:05 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mchehab@kernel.org>, <tglx@linutronix.de>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <sean@mess.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] media: ttpci: Fix build error without RC_CORE
Date:   Wed, 12 Jun 2019 11:43:10 +0800
Message-ID: <20190612034310.4640-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
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
Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/pci/ttpci/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
index d96d4fa..b705631 100644
--- a/drivers/media/pci/ttpci/Kconfig
+++ b/drivers/media/pci/ttpci/Kconfig
@@ -7,7 +7,7 @@ config DVB_AV7110
 	depends on DVB_CORE && PCI && I2C
 	select TTPCI_EEPROM
 	select VIDEO_SAA7146_VV
-	select DVB_AV7110_IR if INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110
+	select DVB_AV7110_IR if RC_CORE=DVB_AV7110 && (INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110)
 	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
 	select DVB_VES1820 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
-- 
2.7.4


