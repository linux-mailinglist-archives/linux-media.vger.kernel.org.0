Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5213DD0DF
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 08:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhHBG7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 02:59:43 -0400
Received: from mx20.baidu.com ([111.202.115.85]:39726 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232331AbhHBG7m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 02:59:42 -0400
Received: from BC-Mail-Ex24.internal.baidu.com (unknown [172.31.51.18])
        by Forcepoint Email with ESMTPS id 1DACA614DDDD6CB801DF;
        Mon,  2 Aug 2021 14:59:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex24.internal.baidu.com (172.31.51.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 2 Aug 2021 14:59:31 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 14:59:31 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <sakari.ailus@linux.intel.com>, <gustavoars@kernel.org>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: smsusb: Use usb_get_dev() for the reference count of udev
Date:   Mon, 2 Aug 2021 14:59:24 +0800
Message-ID: <20210802065924.1163-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex19.internal.baidu.com (172.31.51.13) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use usb_get_dev() to increment the reference count of the usb device
structure in order to avoid releasing the structure while it is still in
use. And use usb_put_dev() to decrement the reference count and thus,
when it will be equal to 0 the structure will be released.

Reported-by: Salah Triki <salah.triki@gmail.com>
Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/usb/siano/smsusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index df4c5dcba39c..86e0a25f8dba 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -351,6 +351,7 @@ static void smsusb_term_device(struct usb_interface *intf)
 	}
 
 	usb_set_intfdata(intf, NULL);
+	usb_put_dev(dev->udev);
 }
 
 static void *siano_media_device_register(struct smsusb_device_t *dev,
@@ -398,7 +399,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 
 	memset(&params, 0, sizeof(params));
 	usb_set_intfdata(intf, dev);
-	dev->udev = interface_to_usbdev(intf);
+	dev->udev = usb_get_dev(interface_to_usbdev(intf));
 	dev->state = SMSUSB_DISCONNECTED;
 
 	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
-- 
2.25.1

