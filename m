Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF3F783EA5
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 13:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbjHVLTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 07:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjHVLTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 07:19:04 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D491BE
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 04:19:02 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RVRdm109sz1L9PJ;
        Tue, 22 Aug 2023 19:17:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 19:18:59 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <andrzej.p@collabora.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 1/2] media: cx231xx: Add BUF_SIZE and TIMEOUT_MS macros
Date:   Tue, 22 Aug 2023 19:18:31 +0800
Message-ID: <20230822111832.822367-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822111832.822367-1-ruanjinjie@huawei.com>
References: <20230822111832.822367-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define BUF_SIZE and TIMEOUT_MS macros to make the code
more readable.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/usb/cx231xx/cx231xx-core.c | 8 ++++----
 drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
index 727e6268567f..ce9e72b9b052 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -751,13 +751,13 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size)
 	int ret = -ENOMEM;
 	u32 *buffer;
 
-	buffer = kzalloc(4096, GFP_KERNEL);
+	buffer = kzalloc(BUF_SIZE, GFP_KERNEL);
 	if (buffer == NULL)
 		return -ENOMEM;
-	memcpy(&buffer[0], firmware, 4096);
+	memcpy(&buffer[0], firmware, BUF_SIZE);
 
 	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
-			buffer, 4096, &actlen, 2000);
+			buffer, BUF_SIZE, &actlen, TIMEOUT_MS);
 
 	if (ret)
 		dev_err(dev->dev,
@@ -994,7 +994,7 @@ int cx231xx_init_isoc(struct cx231xx *dev, int max_packets,
 	/* De-allocates all pending stuff */
 	cx231xx_uninit_isoc(dev);
 
-	dma_q->p_left_data = kzalloc(4096, GFP_KERNEL);
+	dma_q->p_left_data = kzalloc(BUF_SIZE, GFP_KERNEL);
 	if (dma_q->p_left_data == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 6929e4d97067..e09462254685 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -120,6 +120,9 @@
 #define CX23417_OSC_EN   8
 #define CX23417_RESET    9
 
+#define BUF_SIZE         4096
+#define TIMEOUT_MS       2000
+
 struct cx23417_fmt {
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
-- 
2.34.1

