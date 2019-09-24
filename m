Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1174BC4E2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 11:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390805AbfIXJbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 05:31:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2710 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390668AbfIXJbx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 05:31:53 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 434FCCD2BE73B968E31A;
        Tue, 24 Sep 2019 17:31:50 +0800 (CST)
Received: from huawei.com (10.175.101.78) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Sep 2019
 17:31:46 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: flexcop-usb: fix NULL-ptr deref in flexcop_usb_transfer_init()
Date:   Tue, 24 Sep 2019 17:49:04 +0800
Message-ID: <1569318544-56235-1-git-send-email-yangyingliang@huawei.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.78]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If usb_set_interface() failed, iface->cur_altsetting will
not be assigned and it will be used in flexcop_usb_transfer_init()
It may lead a NULL pointer dereference.

Check usb_set_interface() return value in flexcop_usb_init()
and return failed to avoid using this NULL pointer.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 1826ff8..4bf85e9 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -504,7 +504,13 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
 static int flexcop_usb_init(struct flexcop_usb *fc_usb)
 {
 	/* use the alternate setting with the larges buffer */
-	usb_set_interface(fc_usb->udev,0,1);
+	int ret = usb_set_interface(fc_usb->udev, 0, 1);
+
+	if (ret) {
+		err("set interface failed.");
+		return ret;
+	}
+
 	switch (fc_usb->udev->speed) {
 	case USB_SPEED_LOW:
 		err("cannot handle USB speed because it is too slow.");
-- 
1.8.3

