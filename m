Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05AC77D864
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 04:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241266AbjHPCXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 22:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241262AbjHPCXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 22:23:42 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51DE1FDC
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 19:23:41 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RQX163khpzFqYs;
        Wed, 16 Aug 2023 10:20:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 10:23:39 +0800
From:   Chen Jiahao <chenjiahao16@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <duoming@zju.edu.cn>, <dzm91@hust.edu.cn>,
        <linux-media@vger.kernel.org>
CC:     <chenjiahao16@huawei.com>
Subject: [PATCH -next] media: usb: siano: Use kmemdup to simplify kmalloc and memcpy logic
Date:   Wed, 16 Aug 2023 10:23:23 +0800
Message-ID: <20230816022323.1921907-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using kmemdup() helper function rather than implementing it again
with kmalloc() + memcpy(), which improves the code readability.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/media/usb/siano/smsusb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 8a39cac76c58..9d9e14c858e6 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -279,10 +279,8 @@ static int smsusb1_load_firmware(struct usb_device *udev, int id, int board_id)
 		}
 	}
 
-	fw_buffer = kmalloc(fw->size, GFP_KERNEL);
+	fw_buffer = kmemdup(fw->data, fw->size, GFP_KERNEL);
 	if (fw_buffer) {
-		memcpy(fw_buffer, fw->data, fw->size);
-
 		rc = usb_bulk_msg(udev, usb_sndbulkpipe(udev, 2),
 				  fw_buffer, fw->size, &dummy, 1000);
 
-- 
2.34.1

