Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71ABB7DFC9
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 18:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732780AbfHAQKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 12:10:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56303 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfHAQKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 12:10:01 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1htDeR-00046D-7L; Thu, 01 Aug 2019 16:09:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: drxj: remove redundant assignment to variable rc
Date:   Thu,  1 Aug 2019 17:09:58 +0100
Message-Id: <20190801160958.28392-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index a6876fa48753..8716a167917a 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -4201,7 +4201,7 @@ int drxj_dap_scu_atomic_read_reg16(struct i2c_device_addr *dev_addr,
 					 u16 *data, u32 flags)
 {
 	u8 buf[2] = { 0 };
-	int rc = -EIO;
+	int rc;
 	u16 word = 0;
 
 	if (!data)
-- 
2.20.1

