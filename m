Return-Path: <linux-media+bounces-30634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC0A9541B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5CBD172F37
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E211E2606;
	Mon, 21 Apr 2025 16:33:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629661AF0AF;
	Mon, 21 Apr 2025 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253191; cv=none; b=WGplFTM4rRE3kkiP2ZLXtL3z2J2VfIKdL7AAgVwftQG7RIGQbC6Mcgtul/WhIEse4IUyE54FqvFSQG8D9zyB6y06f3VUu8mUD+xW/zS20+BgYp2+lUo2p31hE6r9nlpgSuO3tc+CTiJELFypytVPsMePutAYqv+oJWnwFS488tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253191; c=relaxed/simple;
	bh=2l2AqMqZOxpwFutfqvrhIda6aBkA7YBQ2JfUuCTrwjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Di2QrJZyNqqLZvzwB6fNv2XBv+ye2DAWD1pMmxA1ntzkNvffRWPc4YIIUqzyQUVmTXKVtTL00h1THmfU/15HTx3q5G0uyh/hFK0uFd1lvCFFYIWnhfjrfG9tw7g8M6si1eajN2M422+hwxaQMgwC+XqFQGqZ0dcrcu0OvafZHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id B525440C039;
	Mon, 21 Apr 2025 16:33:07 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Date: Mon, 21 Apr 2025 18:33:01 +0200
Subject: [PATCH 1/2] media: dvb-usbv2: add bound checking for messages
 length in i2c_xfer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-ubsan-out-of-sub-v1-1-d9239a5af007@arnaud-lcm.com>
References: <20250421-ubsan-out-of-sub-v1-0-d9239a5af007@arnaud-lcm.com>
In-Reply-To: <20250421-ubsan-out-of-sub-v1-0-d9239a5af007@arnaud-lcm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com,
 contact@arnaud-lcm.com, skhan@linuxfoundation.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745253187; l=1937;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=2l2AqMqZOxpwFutfqvrhIda6aBkA7YBQ2JfUuCTrwjE=;
 b=PwUASeQaSzSpJ3RtdDleX2ClZLoV4o8tCZjUgJ8fAUar8BbSN6dfwXspDu9cy5GcXx467Mhr4
 KU+o8ITNWGHB3YOv/lf1FSzhnoK4UDf5WHOe3zffC5/MQ9Ca7YD0Ffc
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174525318807.30871.1729452319038199590@Plesk>
X-PPP-Vhost: arnaud-lcm.com

I2C messages should not be longer than a couple of hundred bytes.
However, despite this very unlikely scenario, it can happen and in this
case, this could lead to a buffer overflow in i2c_xfer.

Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..e8ee18010346 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -757,6 +757,10 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 
 	for (i = 0; i < num; i++) {
 		addr = msgs[i].addr << 1;
+		if (msgs[i].len < 1 || msgs[i].len >= sizeof(st->data) - 6) {
+			ret = -EIO;
+			goto err;
+		}
 		if (((i + 1) < num)
 		    && (msgs[i].len == 1)
 		    && ((msgs[i].flags & I2C_M_RD) != I2C_M_RD)
@@ -788,10 +792,6 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
-				ret = -EIO;
-				goto err;
-			}
 			req = AZ6007_I2C_WR;
 			index = msgs[i].buf[0];
 			value = addr | (1 << 8);
@@ -806,10 +806,6 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
-				ret = -EIO;
-				goto err;
-			}
 			req = AZ6007_I2C_RD;
 			index = msgs[i].buf[0];
 			value = addr;
@@ -825,7 +821,6 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	}
 err:
 	mutex_unlock(&st->mutex);
-
 	if (ret < 0) {
 		pr_info("%s ERROR: %i\n", __func__, ret);
 		return ret;

-- 
2.43.0


