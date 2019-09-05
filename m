Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3EEDAAA89
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 20:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbfIESFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 14:05:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42567 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfIESFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 14:05:36 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i5w8T-0003JW-0P; Thu, 05 Sep 2019 18:05:33 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: mt9m001: make array init_regs static, makes object smaller
Date:   Thu,  5 Sep 2019 19:05:32 +0100
Message-Id: <20190905180532.14093-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array init_regs on the stack but instead make it
static. Makes the object code smaller by 57 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  15935	   3600	    128	  19663	   4ccf	drivers/media/i2c/mt9m001.o

After:
   text	   data	    bss	    dec	    hex	filename
  15782	   3696	    128	  19606	   4c96	drivers/media/i2c/mt9m001.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/mt9m001.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 5613072908ac..210ea76adb53 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -167,7 +167,7 @@ static int multi_reg_write(struct i2c_client *client,
 
 static int mt9m001_init(struct i2c_client *client)
 {
-	const struct mt9m001_reg init_regs[] = {
+	static const struct mt9m001_reg init_regs[] = {
 		/*
 		 * Issue a soft reset. This returns all registers to their
 		 * default values.
-- 
2.20.1

