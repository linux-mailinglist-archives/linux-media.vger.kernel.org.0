Return-Path: <linux-media+bounces-30617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005BA951D2
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7042172C13
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AFF266570;
	Mon, 21 Apr 2025 13:40:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F72264FA7;
	Mon, 21 Apr 2025 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242836; cv=none; b=gI+B99KKx8RLQf7QU97l/likA9OYGbQldcLYhuvQzUiWlpM2PyzOey7B5e4SIEdEebpPM5QQep2ghfAqbxhuyICQe0O8vy3uX2rpOAHRJbalijHcNaUSSQATNFVr4vqCzUb+L8Zar9sjtlotGbCD3jsS+8LqTl0Ceocqw1yG0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242836; c=relaxed/simple;
	bh=4hoBbhyRgaULiQgIXpzqfGEXkdPMkG927Dt/QlBHqqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chgkVWm1U7qofQ6ZBcay+A9AYLzHxcbAnDqfu7XwB9l8ePBF+9rBLV+DHoEkyQ/FNIyw5nlNyqtsdGmSrGRdT3oaGL/OgWQE7rSjJDa4ktWfDhv59n3e0YnN4yKL6J5UQlCKPHBY7lsVV1cLz0ANcsyhjI4U2wOP2ef6XZ0k/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 7AA40549C1;
	Mon, 21 Apr 2025 13:40:29 +0000 (UTC)
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
Date: Mon, 21 Apr 2025 15:40:21 +0200
Message-ID: <20250421134021.155569-1-contact@arnaud-lcm.com>
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
X-PPP-Message-ID: <174524282983.3221.6184008662178631205@Plesk>
X-PPP-Vhost: arnaud-lcm.com

#syz test
diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..784cba9c15ef 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -751,6 +751,9 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	int length;
 	u8 req, addr;
 
+	if (!usb_trylock_device(d->udev))
+		return -EBUSY;
+
 	if (mutex_lock_interruptible(&st->mutex) < 0) {
+		usb_unlock_device(d->udev);
 		return -EAGAIN;
 	}
 
@@ -757,6 +760,10 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 
 	for (i = 0; i < num; i++) {
 		addr = msgs[i].addr << 1;
+		if (msgs[i].len < 1 || msgs[i].len >= sizeof(st->data) - 6) {
+			ret = -EIO;
+			goto err;
+		}
 		if (((i + 1) < num)
 		    && (msgs[i].len == 1)
 		    && ((msgs[i].flags & I2C_M_RD) != I2C_M_RD)
@@ -821,6 +828,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	}
 err:
 	mutex_unlock(&st->mutex);
+	usb_unlock_device(d->udev);
 	if (ret < 0) {
 		pr_info("%s ERROR: %i\n", __func__, ret);
 		return ret;

