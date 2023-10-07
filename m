Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5618B7BC76F
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 14:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343892AbjJGMP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 08:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343680AbjJGMPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 08:15:54 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736B5BC
        for <linux-media@vger.kernel.org>; Sat,  7 Oct 2023 05:15:51 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S2kgH0zbgzLnZY;
        Sat,  7 Oct 2023 20:11:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 7 Oct
 2023 20:15:49 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] media: cx231xx: Use EP5_BUF_SIZE macro
Date:   Sat, 7 Oct 2023 20:14:47 +0800
Message-ID: <20231007121448.3473132-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As Andrzej suggested, use EP5_BUF_SIZE macro to replace the other three
places of 4096 in cx231xx with EP5_BUF_SIZE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c  | 9 ++++-----
 drivers/media/usb/cx231xx/cx231xx-core.c | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

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
index 57a8b4780a7d..7b7e2a26ef93 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -993,7 +993,7 @@ int cx231xx_init_isoc(struct cx231xx *dev, int max_packets,
 	/* De-allocates all pending stuff */
 	cx231xx_uninit_isoc(dev);
 
-	dma_q->p_left_data = kzalloc(4096, GFP_KERNEL);
+	dma_q->p_left_data = kzalloc(EP5_BUF_SIZE, GFP_KERNEL);
 	if (dma_q->p_left_data == NULL)
 		return -ENOMEM;
 
-- 
2.34.1

