Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE93354ACA
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 04:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242289AbhDFCPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 22:15:31 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:54863 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232976AbhDFCP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Apr 2021 22:15:26 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UUeS7-i_1617675317;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UUeS7-i_1617675317)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 06 Apr 2021 10:15:18 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] media: uvc: remove unused including <linux/version.h>
Date:   Tue,  6 Apr 2021 10:15:15 +0800
Message-Id: <1617675315-10453-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following versioncheck warning:
./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3..9f9473d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -16,7 +16,6 @@
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
-#include <linux/version.h>
 #include <asm/unaligned.h>
 
 #include <media/v4l2-common.h>
-- 
1.8.3.1

