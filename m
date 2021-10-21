Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9C5435D17
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 10:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhJUIoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 04:44:02 -0400
Received: from mx22.baidu.com ([220.181.50.185]:45266 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230385AbhJUIoC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 04:44:02 -0400
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
        by Forcepoint Email with ESMTPS id 1C23AAFA70FCA94044F1;
        Thu, 21 Oct 2021 16:41:45 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 21 Oct 2021 16:41:44 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 21 Oct 2021 16:41:44 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Erik Andren <erik.andren@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: gspca: Make use of the helper macro kthread_run()
Date:   Thu, 21 Oct 2021 16:41:42 +0800
Message-ID: <20211021084143.2077-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-EX02.internal.baidu.com (172.31.51.42) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Repalce kthread_create/wake_up_process() with kthread_run()
to simplify the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/usb/gspca/m5602/m5602_s5k83a.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c b/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
index bc4008d5d116..4504d615b1e4 100644
--- a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
+++ b/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
@@ -339,14 +339,13 @@ int s5k83a_start(struct sd *sd)
 	/* Create another thread, polling the GPIO ports of the camera to check
 	   if it got rotated. This is how the windows driver does it so we have
 	   to assume that there is no better way of accomplishing this */
-	sd->rotation_thread = kthread_create(rotation_thread_function,
-					     sd, "rotation thread");
+	sd->rotation_thread = kthread_run(rotation_thread_function,
+					  sd, "rotation thread");
 	if (IS_ERR(sd->rotation_thread)) {
 		err = PTR_ERR(sd->rotation_thread);
 		sd->rotation_thread = NULL;
 		return err;
 	}
-	wake_up_process(sd->rotation_thread);
 
 	/* Preinit the sensor */
 	for (i = 0; i < ARRAY_SIZE(start_s5k83a) && !err; i++) {
-- 
2.25.1

