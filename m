Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF1E6F9918
	for <lists+linux-media@lfdr.de>; Sun,  7 May 2023 17:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjEGPCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 May 2023 11:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjEGPCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 May 2023 11:02:09 -0400
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA617EF5
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1683471724;
        bh=n7UuREEmXqHiFHjjOGInWEYpCEkMk9ACdn+2SeNyNYQ=;
        h=From:To:Cc:Subject:Date;
        b=apCmSOE35XmzHYe41htw6KV6+I7gLqWcsG6Xx9+5uitCy07sUru5uqNCTF9mMT0CQ
         E2x+POWl3wxH37bVKMP2hpmjnK5ZBycy2XgwS2/3TA8fkQeMU9b9ASJlS5gJ+oNGnD
         EL7zLPdohIKzivt1VKZ1I7CsTOg7GcWXhSqb2J60=
Received: from localhost.localdomain ([113.97.34.216])
        by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
        id D31A5A07; Sun, 07 May 2023 22:52:49 +0800
X-QQ-mid: xmsmtpt1683471169tq8qlgrx3
Message-ID: <tencent_3623572106754AC2F266B316798B0F6CCA05@qq.com>
X-QQ-XMAILINFO: NZN9EEjpM45GMj+nyUkSlBUcCmn5YsDUhaXqrbohmiLLyfKUKSjLI7Xr+Xi/sL
         I+gsxFw9nzNmeWtOE1EYM9pS+14DXTVJ65Ln9p70BLUYUCQoVbnxmxCMqHjZIwKPQWf2pd9ZkRQk
         dE3RgW3JVsFvbFqUe51vgkPz9vXx+T2m5WNjVgkuFX/tKMEKZcAZgJmbtl4X6vzPrGyRXvi+RF4f
         vC95+qFVlqWF50utU80gq50Sop9mTk4LW2LWdfDVbfEo//oO5OtI9GrHYdLCPx6FPgw6uXrVGIsB
         TRyXt56ixJj3Yt4t2XWAiW2nMKHRh5IeM2UBntNtMYCEPbPEa7TIRV74OraDMM70WL50GPPMew3+
         oFHIXO3JVT8JdNlV8kIJ5qyy4kdqHxCIweUyy3epPn8yPCpXW5oGKN1e+cDdYQf/miyp5nlfty0P
         uqETs1MF0hG1e8R8vW/D+OqM0TqiihM6N0TWPawr+8Sz3ejtVU4nxoniNW0wjnGzls4IeWkC+toF
         FCjasxS3m5MGQp79O+dLfL6uHQ2utbHtFpqr6xTE8gRAfe9V31T/X/5klknN0mLADH/3lG6bIFoY
         UOtkM1DYJZGjkaAkFBt+bbs0xLKgmEpf8QyR4SEn/kt8yjFej3h6Gg+DNKg4lSSu4cC14Ew64vpE
         erRIt4mMvndI96ENy2FmdHuw9idxIskSFT954BKZczsjQ6Bhiszo6pgeUSc/pK4Mu+RNWqlemvVV
         yxO0jzr4y7Awm8Gim3mqTwbmjOBzQThFSlLyjHgJPxpZD0usGeJBodGFB/uiK6QDr5qIAUNAXVKG
         jdjcCePy6tVzoFkxpYu6YSkfvn6qPkZ1hsK6cIgNAYpdbUDWSvs3wB59F1Epj0txMKt8Oxz6t7BF
         4zBLsBzUU7nyj5KuzpcoNJt7T4PnDu5JONmRMnRpbtbKkEOjsfvm1jn+NKM8USMkPsyLn6SX5Jxq
         /Pk+GBZoSMw7ZFbiFm9l/Ee1ZkWl03rAwA6H+26DBE+3QV5X9LJQ==
From:   Zhang Shurong <zhang_shurong@foxmail.com>
To:     crope@iki.fi
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] media: dvb-usb-v2: rtl28xxu: Fix null-ptr-deref in rtl28xxu_i2c_xfer
Date:   Sun,  7 May 2023 22:52:47 +0800
X-OQ-MSGID: <20230507145247.15176-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In rtl28xxu_i2c_xfer, msg is controlled by user. When msg[i].buf
is null and msg[i].len is zero, former checks on msg[i].buf would be
passed. Malicious data finally reach rtl28xxu_i2c_xfer. If accessing
msg[i].buf[0] without sanity check, null ptr deref would happen.
We add check on msg[i].len to prevent crash.

Similar commit:
commit 0ed554fd769a
("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 795a012d4020..f7884bb56fcc 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -176,6 +176,10 @@ static int rtl28xxu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			ret = -EOPNOTSUPP;
 			goto err_mutex_unlock;
 		} else if (msg[0].addr == 0x10) {
+			if (msg[0].len < 1 || msg[1].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto err_mutex_unlock;
+			}
 			/* method 1 - integrated demod */
 			if (msg[0].buf[0] == 0x00) {
 				/* return demod page from driver cache */
@@ -189,6 +193,10 @@ static int rtl28xxu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				ret = rtl28xxu_ctrl_msg(d, &req);
 			}
 		} else if (msg[0].len < 2) {
+			if (msg[0].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto err_mutex_unlock;
+			}
 			/* method 2 - old I2C */
 			req.value = (msg[0].buf[0] << 8) | (msg[0].addr << 1);
 			req.index = CMD_I2C_RD;
@@ -217,8 +225,16 @@ static int rtl28xxu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			ret = -EOPNOTSUPP;
 			goto err_mutex_unlock;
 		} else if (msg[0].addr == 0x10) {
+			if (msg[0].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto err_mutex_unlock;
+			}
 			/* method 1 - integrated demod */
 			if (msg[0].buf[0] == 0x00) {
+				if (msg[0].len < 2) {
+					ret = -EOPNOTSUPP;
+					goto err_mutex_unlock;
+				}
 				/* save demod page for later demod access */
 				dev->page = msg[0].buf[1];
 				ret = 0;
@@ -231,6 +247,10 @@ static int rtl28xxu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				ret = rtl28xxu_ctrl_msg(d, &req);
 			}
 		} else if ((msg[0].len < 23) && (!dev->new_i2c_write)) {
+			if (msg[0].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto err_mutex_unlock;
+			}
 			/* method 2 - old I2C */
 			req.value = (msg[0].buf[0] << 8) | (msg[0].addr << 1);
 			req.index = CMD_I2C_WR;
-- 
2.40.1

