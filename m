Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB417CD044
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2019 12:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfJFKG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Oct 2019 06:06:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51638 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726261AbfJFKG6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 6 Oct 2019 06:06:58 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8A4C287F12C66BAE3E49;
        Sun,  6 Oct 2019 18:06:56 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 18:06:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <akinobu.mita@gmail.com>,
        <arnd@arndb.de>, <yuehaibing@huawei.com>, <mickael.guene@st.com>,
        <shawnx.tu@intel.com>, <ricardo.ribalda@gmail.com>,
        <dongchun.zhu@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] media: i2c: ov5695: Fix randbuild error
Date:   Sun, 6 Oct 2019 15:38:38 +0800
Message-ID: <20191006073838.54048-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If VIDEO_OV5695 is y and V4L2_FWNODE is m, building fails:

drivers/media/i2c/ov5695.o: In function `ov5695_probe':
ov5695.c:(.text+0xf4c): undefined reference to `v4l2_async_register_subdev_sensor_common'

Select V4L2_FWNODE like OV5675 does.

Fixes: 623df5d710fe ("media: i2c: ov5695: Modify the function of async register subdev related devices")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 78dc64d..70a7233 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -729,6 +729,7 @@ config VIDEO_OV5675
 config VIDEO_OV5695
 	tristate "OmniVision OV5695 sensor support"
 	depends on I2C && VIDEO_V4L2
+	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5695 camera.
-- 
2.7.4


