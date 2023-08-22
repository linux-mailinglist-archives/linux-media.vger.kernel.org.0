Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA64783EA6
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 13:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbjHVLTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 07:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjHVLTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 07:19:05 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1071BE
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 04:19:03 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVRcv1tnPzVkpl;
        Tue, 22 Aug 2023 19:16:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 19:19:01 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <andrzej.p@collabora.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 2/2] media: cx231xx: Switch to use kmemdup() helper
Date:   Tue, 22 Aug 2023 19:18:32 +0800
Message-ID: <20230822111832.822367-3-ruanjinjie@huawei.com>
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use kmemdup() helper instead of open-coding to
simplify the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Replace the magic constant "4096" with BUF_SIZE macro in another patch.
---
 drivers/media/usb/cx231xx/cx231xx-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
index ce9e72b9b052..1910adc2aeb2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -751,10 +751,9 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size)
 	int ret = -ENOMEM;
 	u32 *buffer;
 
-	buffer = kzalloc(BUF_SIZE, GFP_KERNEL);
+	buffer = kmemdup(firmware, BUF_SIZE, GFP_KERNEL);
 	if (buffer == NULL)
 		return -ENOMEM;
-	memcpy(&buffer[0], firmware, BUF_SIZE);
 
 	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
 			buffer, BUF_SIZE, &actlen, TIMEOUT_MS);
-- 
2.34.1

