Return-Path: <linux-media+bounces-30621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960DA952A8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37352173738
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5601819007F;
	Mon, 21 Apr 2025 14:22:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D918D626;
	Mon, 21 Apr 2025 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245349; cv=none; b=MvWTS+yl7mk5BfYjIoroZ7E36X8LiSz7Kj8JjV92GtLnjTbcTWH+UTXnp9hR0YWmtMV+sj3VgDK04VBawfXbk22QYd7Hy9njxvSrresSjhYnj2U+CbhFF6gvB5z9iiOkaMTTf8CuhOezdt/GREFzl49pgOrDRZ7OLzoGfHaF4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245349; c=relaxed/simple;
	bh=tLOaeXQjamGXUmaO+khLO7IIPlnvyFm+641tHCVKG8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJh7Y3Uh6mcTC1qr419xeRUXxwjxrTlDC6VEQvl1kmS+NfL/GrV9Mu+Kneelaq1jbtFG6USZ4gEkIPXXMo03aLBoainQ4Yiu9nTRjQNVMu08eCod0FZN47PQQXPwGvM90vwDOczCHbVX81IH7blcdQsozf+mZzTkwjGInO6NKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id A85B654A1A;
	Mon, 21 Apr 2025 14:22:24 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: syz test
Date: Mon, 21 Apr 2025 16:22:19 +0200
Message-ID: <20250421142219.158593-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6805a24c.050a0220.4e547.000b.GAE@google.com>
References: <6805a24c.050a0220.4e547.000b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174524534502.13352.15342260960621311676@Plesk>
X-PPP-Vhost: arnaud-lcm.com

#syz test

--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -752,11 +752,18 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
        int length;
        u8 req, addr;
 
+       if(!usb_trylock_device(d->udev))
+               return -EBUSY;
+
        if (mutex_lock_interruptible(&st->mutex) < 0)
                return -EAGAIN;
 
        for (i = 0; i < num; i++) {
                addr = msgs[i].addr << 1;
+               if (msgs[i].len < 1 || msgs[i].len >= sizeof(st->data) - 6) {
+                       ret = -EIO;
+                       goto err;
+               }
                if (((i + 1) < num)
                    && (msgs[i].len == 1)
                    && ((msgs[i].flags & I2C_M_RD) != I2C_M_RD)
@@ -788,10 +795,6 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
                        if (az6007_xfer_debug)
                                printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
                                       addr, msgs[i].len);
-                       if (msgs[i].len < 1) {
-                               ret = -EIO;
-                               goto err;
-                       }
                        req = AZ6007_I2C_WR;
                        index = msgs[i].buf[0];
                        value = addr | (1 << 8);
@@ -806,10 +809,6 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
                        if (az6007_xfer_debug)
                                printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
                                       addr, msgs[i].len);
-                       if (msgs[i].len < 1) {
-                               ret = -EIO;
-                               goto err;
-                       }
                        req = AZ6007_I2C_RD;
                        index = msgs[i].buf[0];
                        value = addr;
@@ -825,7 +824,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
        }
 err:
        mutex_unlock(&st->mutex);
-
+       usb_unlock_device(d->udev);
        if (ret < 0) {
                pr_info("%s ERROR: %i\n", __func__, ret);
                return ret;
--

