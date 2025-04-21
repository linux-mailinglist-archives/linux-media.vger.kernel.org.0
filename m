Return-Path: <linux-media+bounces-30619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1646FA951E3
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7829E3B2186
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17EB266585;
	Mon, 21 Apr 2025 13:46:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65330261372;
	Mon, 21 Apr 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243172; cv=none; b=VXccmXih8xZGSYjdPtnbEtC4U732JQWE2oLfDUN7X9l9JX3CgI6zaisBPCUDFDddVEnwwNSvmMs1eGsI/x1PrijdhcUcGZFOQ7Mx4SS+9pBTnfEK0hf8lVP84a1Y2pyP6+tbKHeJuvl6uzxMMJBr1AQuVo2i/7MiHEwxGqpYaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243172; c=relaxed/simple;
	bh=HoDQuPfe307RhflBSAzIgoCJi6w/7f9tcPWlDqKLcWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOGr5bPuFKrikusIQk8ETpwJP02c+ZDk47GGVFqixoUhpNfqV2JE6xu09nJ4oTKjJ8NMy2TuiZdpg9iem3pBn+CgOBI3SJOSL9oBVGy7v5Uyp/nV+a+uo1D7FzbZd0eqZETq2liMEXsrdtxe4WYGtprRKKsw1gVKJi3oFlOvdI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 3654D549DF;
	Mon, 21 Apr 2025 13:46:07 +0000 (UTC)
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
Date: Mon, 21 Apr 2025 15:46:02 +0200
Message-ID: <20250421134602.155962-1-contact@arnaud-lcm.com>
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
X-PPP-Message-ID: <174524316760.9360.5302019345465363057@Plesk>
X-PPP-Vhost: arnaud-lcm.com

#syz test
diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..784cba9c15ef 100644
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


