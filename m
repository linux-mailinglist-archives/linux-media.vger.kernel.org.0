Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9157996E4
	for <lists+linux-media@lfdr.de>; Sat,  9 Sep 2023 10:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344092AbjIIIg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Sep 2023 04:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344091AbjIIIg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Sep 2023 04:36:27 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D815E1704
        for <linux-media@vger.kernel.org>; Sat,  9 Sep 2023 01:36:20 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RjR8K2Sb7zVk3y;
        Sat,  9 Sep 2023 16:33:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 9 Sep
 2023 16:36:18 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v4 2/2] media: cx231xx: Add EP5_BUF_SIZE and EP5_TIMEOUT_MS macros
Date:   Sat, 9 Sep 2023 16:36:12 +0800
Message-ID: <20230909083612.1845757-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909083612.1845757-1-ruanjinjie@huawei.com>
References: <20230909083612.1845757-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define EP5_BUF_SIZE and EP5_TIMEOUT_MS macros to make the code
more readable.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
v4:
- Replace the other 4 places with EP5_BUF_SIZE.
v3:
- Adjust use kmemdup() helper to be the first patch as suggested.
---
 drivers/media/usb/cx231xx/cx231xx-417.c  | 9 ++++-----
 drivers/media/usb/cx231xx/cx231xx-core.c | 6 +++---
 drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c5e21785fafe..fe4410a5e128 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -937,7 +937,6 @@ static int cx231xx_load_firmware(struct cx231xx *dev)
 	u32 *p_current_fw, *p_fw;
 	u32 *p_fw_data;
 	int frame = 0;
-	u16 _buffer_size = 4096;
 	u8 *p_buffer;
 
 	p_current_fw = vmalloc(1884180 * 4);
@@ -947,7 +946,7 @@ static int cx231xx_load_firmware(struct cx231xx *dev)
 		return -ENOMEM;
 	}
 
-	p_buffer = vmalloc(4096);
+	p_buffer = vmalloc(EP5_BUF_SIZE);
 	if (p_buffer == NULL) {
 		dprintk(2, "FAIL!!!\n");
 		vfree(p_current_fw);
@@ -1030,9 +1029,9 @@ static int cx231xx_load_firmware(struct cx231xx *dev)
 
 	/*download the firmware by ep5-out*/
 
-	for (frame = 0; frame < (int)(CX231xx_FIRM_IMAGE_SIZE*20/_buffer_size);
+	for (frame = 0; frame < (int)(CX231xx_FIRM_IMAGE_SIZE*20/EP5_BUF_SIZE);
 	     frame++) {
-		for (i = 0; i < _buffer_size; i++) {
+		for (i = 0; i < EP5_BUF_SIZE; i++) {
 			*(p_buffer + i) = (u8)(*(p_fw + (frame * 128 * 8 + (i / 4))) & 0x000000FF);
 			i++;
 			*(p_buffer + i) = (u8)((*(p_fw + (frame * 128 * 8 + (i / 4))) & 0x0000FF00) >> 8);
@@ -1041,7 +1040,7 @@ static int cx231xx_load_firmware(struct cx231xx *dev)
 			i++;
 			*(p_buffer + i) = (u8)((*(p_fw + (frame * 128 * 8 + (i / 4))) & 0xFF000000) >> 24);
 		}
-		cx231xx_ep5_bulkout(dev, p_buffer, _buffer_size);
+		cx231xx_ep5_bulkout(dev, p_buffer, EP5_BUF_SIZE);
 	}
 
 	p_current_fw = p_fw;
diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
index 746727ea1a4c..7b7e2a26ef93 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -751,12 +751,12 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size)
 	int ret = -ENOMEM;
 	u32 *buffer;
 
-	buffer = kmemdup(firmware, 4096, GFP_KERNEL);
+	buffer = kmemdup(firmware, EP5_BUF_SIZE, GFP_KERNEL);
 	if (buffer == NULL)
 		return -ENOMEM;
 
 	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
-			buffer, 4096, &actlen, 2000);
+			buffer, EP5_BUF_SIZE, &actlen, EP5_TIMEOUT_MS);
 
 	if (ret)
 		dev_err(dev->dev,
@@ -993,7 +993,7 @@ int cx231xx_init_isoc(struct cx231xx *dev, int max_packets,
 	/* De-allocates all pending stuff */
 	cx231xx_uninit_isoc(dev);
 
-	dma_q->p_left_data = kzalloc(4096, GFP_KERNEL);
+	dma_q->p_left_data = kzalloc(EP5_BUF_SIZE, GFP_KERNEL);
 	if (dma_q->p_left_data == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 6929e4d97067..74339a6a2f71 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -120,6 +120,9 @@
 #define CX23417_OSC_EN   8
 #define CX23417_RESET    9
 
+#define EP5_BUF_SIZE     4096
+#define EP5_TIMEOUT_MS   2000
+
 struct cx23417_fmt {
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
-- 
2.34.1

