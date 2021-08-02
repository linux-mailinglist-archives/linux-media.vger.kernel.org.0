Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522E63DD0B6
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 08:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhHBGl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 02:41:59 -0400
Received: from mx21.baidu.com ([220.181.3.85]:44996 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229734AbhHBGl7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 02:41:59 -0400
Received: from BC-Mail-Ex25.internal.baidu.com (unknown [172.31.51.19])
        by Forcepoint Email with ESMTPS id 3E76DE22E9583B483994;
        Mon,  2 Aug 2021 14:41:42 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex25.internal.baidu.com (172.31.51.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 2 Aug 2021 14:41:42 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 14:41:41 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <paskripkin@gmail.com>
CC:     <linux-media@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] media: stkwebcam: Use usb_get_dev() for the reference count of udev
Date:   Mon, 2 Aug 2021 14:41:34 +0800
Message-ID: <20210802064134.1068-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
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
 drivers/media/usb/stkwebcam/stk-webcam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index 0e231e576dc3..b54a23c6842e 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1234,6 +1234,7 @@ static void stk_v4l_dev_release(struct video_device *vd)
 	if (dev->sio_bufs != NULL || dev->isobufs != NULL)
 		pr_err("We are leaking memory\n");
 	usb_put_intf(dev->interface);
+	usb_put_dev(dev->udev);
 }
 
 static const struct video_device stk_v4l_data = {
@@ -1309,7 +1310,7 @@ static int stk_camera_probe(struct usb_interface *interface,
 	init_waitqueue_head(&dev->wait_frame);
 	dev->first_init = 1; /* webcam LED management */
 
-	dev->udev = udev;
+	dev->udev = usb_get_dev(udev);
 	dev->interface = interface;
 	usb_get_intf(interface);
 
-- 
2.25.1

