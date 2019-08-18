Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B0E918EF
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2019 20:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfHRSgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 14:36:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42559 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfHRSgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 14:36:13 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hzQ2D-0006ts-06; Sun, 18 Aug 2019 18:36:09 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: hdpvr: remove redundant assignment to retval
Date:   Sun, 18 Aug 2019 19:36:08 +0100
Message-Id: <20190818183608.12821-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable retval is initialized to a value that is never read
so this assignment is redundant.  Clean up the code by removing
retval completely and just return the error return from the
call to i2c_add_adapter.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index bc5975b17c0c..785c8508a46e 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -193,8 +193,6 @@ static int hdpvr_activate_ir(struct hdpvr_device *dev)
 
 int hdpvr_register_i2c_adapter(struct hdpvr_device *dev)
 {
-	int retval = -ENOMEM;
-
 	hdpvr_activate_ir(dev);
 
 	dev->i2c_adapter = hdpvr_i2c_adapter_template;
@@ -202,9 +200,7 @@ int hdpvr_register_i2c_adapter(struct hdpvr_device *dev)
 
 	i2c_set_adapdata(&dev->i2c_adapter, dev);
 
-	retval = i2c_add_adapter(&dev->i2c_adapter);
-
-	return retval;
+	return i2c_add_adapter(&dev->i2c_adapter);
 }
 
 #endif
-- 
2.20.1

