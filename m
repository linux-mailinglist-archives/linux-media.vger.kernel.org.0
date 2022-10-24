Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2CEE60BB50
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 22:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbiJXUzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 16:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbiJXUzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 16:55:20 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251A2BA930
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 12:01:22 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MwxKF2QnNzHvFR;
        Mon, 24 Oct 2022 21:50:09 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 21:50:20 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 21:50:20 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <laurent.pinchart@ideasonboard.com>, <ribalda@chromium.org>,
        <mchehab@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH] media: uvcvideo: fix return value check in uvc_gpio_parse()
Date:   Mon, 24 Oct 2022 21:49:32 +0800
Message-ID: <20221024134932.2873081-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

gpiod_to_irq() may return -EPROBE_DEFER, add a minus sign to fix it.

Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 215fb483efb0..1e6bdd6104ef 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1267,7 +1267,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0) {
-		if (irq != EPROBE_DEFER)
+		if (irq != -EPROBE_DEFER)
 			dev_err(&dev->udev->dev,
 				"No IRQ for privacy GPIO (%d)\n", irq);
 		return irq;
-- 
2.25.1

