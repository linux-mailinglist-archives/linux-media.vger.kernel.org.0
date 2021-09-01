Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBC73FDC68
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 15:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344446AbhIAMuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:50:46 -0400
Received: from mx20.baidu.com ([111.202.115.85]:43616 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345514AbhIAMrz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 08:47:55 -0400
Received: from BC-Mail-Ex22.internal.baidu.com (unknown [172.31.51.16])
        by Forcepoint Email with ESMTPS id 9975EBDFBB94475CD40E;
        Wed,  1 Sep 2021 20:46:56 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex22.internal.baidu.com (172.31.51.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 20:46:56 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 20:46:56 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] usb: stkwebcam: Update the reference count of the usb device structure
Date:   Wed, 1 Sep 2021 20:46:49 +0800
Message-ID: <20210901124650.31653-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use usb_get_dev() to increment the reference count of the usb device
structure in order to avoid releasing the structure while it is still in
use. And use usb_put_dev() to decrement the reference count and thus,
when it will be equal to 0 the structure will be released.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v2->v3:
*call usb_put_dev() in the error path of stk_camera_probe
*move v4l2_ctrl_handler_free/v4l2_device_unregister/kfree(dev)
 from stk_camera_disconnect() to stk_v4l_dev_release()
 
drivers/media/usb/stkwebcam/stk-webcam.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index 0e231e576dc3..9f445e6ab5fa 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1234,6 +1234,11 @@ static void stk_v4l_dev_release(struct video_device *vd)
 	if (dev->sio_bufs != NULL || dev->isobufs != NULL)
 		pr_err("We are leaking memory\n");
 	usb_put_intf(dev->interface);
+	usb_put_dev(dev->udev);
+
+	v4l2_ctrl_handler_free(&dev->hdl);
+	v4l2_device_unregister(&dev->v4l2_dev);
+	kfree(dev);
 }
 
 static const struct video_device stk_v4l_data = {
@@ -1309,7 +1314,7 @@ static int stk_camera_probe(struct usb_interface *interface,
 	init_waitqueue_head(&dev->wait_frame);
 	dev->first_init = 1; /* webcam LED management */
 
-	dev->udev = udev;
+	dev->udev = usb_get_dev(udev);
 	dev->interface = interface;
 	usb_get_intf(interface);
 
@@ -1365,6 +1370,7 @@ static int stk_camera_probe(struct usb_interface *interface,
 
 error_put:
 	usb_put_intf(interface);
+	usb_put_dev(dev->udev);
 error:
 	v4l2_ctrl_handler_free(hdl);
 	v4l2_device_unregister(&dev->v4l2_dev);
@@ -1385,9 +1391,6 @@ static void stk_camera_disconnect(struct usb_interface *interface)
 		video_device_node_name(&dev->vdev));
 
 	video_unregister_device(&dev->vdev);
-	v4l2_ctrl_handler_free(&dev->hdl);
-	v4l2_device_unregister(&dev->v4l2_dev);
-	kfree(dev);
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1

