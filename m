Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE201CD496
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgEKJMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 05:12:22 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4388 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727873AbgEKJMW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:12:22 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 0D9E13C41AA2920C32B9;
        Mon, 11 May 2020 17:12:19 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 11 May 2020 17:12:11 +0800
From:   Xiongfeng Wang <wangxiongfeng2@huawei.com>
To:     <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wangxiongfeng2@huawei.com>
Subject: [PATCH] media: uvcvideo: add a missing newline when printing parameter 'clock'
Date:   Mon, 11 May 2020 17:06:10 +0800
Message-ID: <1589187970-39851-1-git-send-email-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When I cat module parameter 'clock' by sysfs, it displays as follows. It
is better to add a newline for easy reading.

[root@hulk-202 ~]# cat /sys/module/uvcvideo/parameters/clock
CLOCK_MONOTONIC[root@hulk-202 ~]#

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e..e4d2334 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2356,9 +2356,9 @@ static int uvc_reset_resume(struct usb_interface *intf)
 static int uvc_clock_param_get(char *buffer, const struct kernel_param *kp)
 {
 	if (uvc_clock_param == CLOCK_MONOTONIC)
-		return sprintf(buffer, "CLOCK_MONOTONIC");
+		return sprintf(buffer, "CLOCK_MONOTONIC\n");
 	else
-		return sprintf(buffer, "CLOCK_REALTIME");
+		return sprintf(buffer, "CLOCK_REALTIME\n");
 }
 
 static int uvc_clock_param_set(const char *val, const struct kernel_param *kp)
-- 
1.7.12.4

