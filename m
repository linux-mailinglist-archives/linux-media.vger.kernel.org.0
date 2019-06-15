Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAE446ECE
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2019 09:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfFOHr2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 03:47:28 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44118 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726236AbfFOHr2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 03:47:28 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 087FB341C58551243794;
        Sat, 15 Jun 2019 15:47:22 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Sat, 15 Jun 2019
 15:47:15 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mchehab@kernel.org>, <ckeepax@opensource.wolfsonmicro.com>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.de>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] media: meye: Fix build COMPILE_TEST error
Date:   Sat, 15 Jun 2019 15:45:53 +0800
Message-ID: <20190615074553.30084-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If COMPILE_TEST is y and SONY_LAPTOP is m,
building fais as below:

drivers/media/pci/meye/meye.o: In function `meye_s_ctrl':
meye.c:(.text+0xafa): undefined reference to `sony_pic_camera_command'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6159e12e1177 ("media: meye: allow building it with COMPILE_TEST on non-x86")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/pci/meye/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/meye/Kconfig b/drivers/media/pci/meye/Kconfig
index b0ba78a..b37da61 100644
--- a/drivers/media/pci/meye/Kconfig
+++ b/drivers/media/pci/meye/Kconfig
@@ -2,7 +2,8 @@
 config VIDEO_MEYE
 	tristate "Sony Vaio Picturebook Motion Eye Video For Linux"
 	depends on PCI && VIDEO_V4L2
-	depends on SONY_LAPTOP || COMPILE_TEST
+	depends on SONY_LAPTOP
+	depends on X86 || COMPILE_TEST
 	help
 	  This is the video4linux driver for the Motion Eye camera found
 	  in the Vaio Picturebook laptops. Please read the material in
-- 
2.7.4


