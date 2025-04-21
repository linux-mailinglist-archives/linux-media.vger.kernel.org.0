Return-Path: <linux-media+bounces-30623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E527A952D5
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E1AD7A31FC
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3487619E97A;
	Mon, 21 Apr 2025 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="eQTeObu4"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7B2905;
	Mon, 21 Apr 2025 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245934; cv=none; b=bgX3RierjpSiNlb6TvI4+jj5/GvYIYy0UPSDqQ1szTNrZRXSkTn30R5rUGiuXb1YAIF4IcgYbOWY9RGJqmKNhz0JDkVwtiTvWQnKA087tpavNJRaC4MdYxarOyoEttIZ7hfomcHS6/AuDFdwdgt8X/h7g9/MSBcbnqCTJtkE814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245934; c=relaxed/simple;
	bh=Z+S9eHf9/wqNoLRF4hWQ88+VPLnFVCb3FpbJphuVF/U=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RkmlnALyWZNmcGK4h8QzMQv43gl/dWDJ09TlHs8GqWev2jU2wrlwyBEDeFl5eIlUUYvBF0NMINgEmG/irzdtWdUN90JKRVdCbmv15IsWHdboSKHsRX/vEkSlltrvTYtsX173/cPjwOdH0XKnawcn4AtaMp5Dct0Xto8YgoQwrPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=eQTeObu4; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745245922; bh=6eXqKYUutXENtnDpmaxLPdOoYJJXdLFbAthrsL6H9FU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eQTeObu47aOCDcD2QJkiCqJEETcXyOQxxMIqYjcIR1+yR/7muroihG3/KYLdUrJK9
	 IcVPtAkv8HxS5HSHEg8ke1YsCJU0tkD1SP+vIe4MRsN8yVMDrcoPrEsBwph8p76Pj/
	 P4zq7zmPCnqFq0xTi6FMEBYIVCFsUZcqcklIxa3M=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 7F93A2A7; Mon, 21 Apr 2025 22:31:57 +0800
X-QQ-mid: xmsmtpt1745245917t2dv8uoxg
Message-ID: <tencent_93C4465D499DEEDF6EE60CB667DC46D0D206@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkyMB3X34qFTf82JRI6mTinyGHLW/dR+aCXw9U5XiXR0SQvNgTBw
	 f0+43DWZdLWuULnmZOll4L5FrcH8MEdHE7oiIPUmuM5X044USavdSZJvAeNevVStSpBWMg+PzJsF
	 5DAtHtlulGRU6TP7d46ho7huCvJuVIkQTByvBbZ17eIwI/pjxTTFNbwsb2LO2r53sSesBadO/JA0
	 QcW6q+SwWyRF7SOQMbzK704nu1mGMpK66NJyPucuyAGrTHC0hxsboga/x+H+IpZKmywkVK6FFsrz
	 Y7zY6hK3q+9KhwA9107RAwrkeQV7fH1vz2DW1sqnhSIUkP5HzJX6BJ8ztSvQ05pYQl8OuTPnbqtw
	 sl8Uj1BZmqJ5t4ZAPEVd0zVSgILx003ZOY8w7/Ed4I8fGhDWoYSbVo1eI7i0Gjby8PtE6IQthv5h
	 IKFY9Kq1PqpBxwU17dOise2YU18e+panZFthp3bbx2xg8/vmNR32nnWyboH1Jxq3DUMPybWh6X9e
	 lQ84FJ0NoxL8PtuFvt1iRBp6TGjFz0A7ccVuzpn6v4osvYobBBKjl9NCVMkdHfJh8498gvcs5ho1
	 T9JuqqeG5utFoBuVIJn1wVLKTUIhZhnmctMUIW11/ujDMotU0RgXQy1079JK92lriLO/FK53cW9t
	 Da8GVHKPz34zA4K8EVB73ZbCE442Q0Ui9v3bNCqe9xqdDMBanqBmGswdZCtsr7aaNEjgFoCJNbB+
	 9PSY5WCng17FZ/EP5tMqmdI19d/vsf75ORN6AJrpmvyYL9I8XwYZA5bVRjWMNmWCFYaIXjuo0l1R
	 3VkJcpeOzmxxmedQNXB2eqf949lqVxVPhPrL22mJ/nF/dCahfrEgHP+RblXzamJzKgR8g2TT/N5M
	 MdInrHed/S+prffUW71qh7ZPLcuEEqmrmUV1YmAYtsZr7VEswuYt7U5hYvxT+AIvZYdh9M+n65t/
	 Jf/6YRBubEeih491Mu0akKkF6ryqMwCIUlMyQ8LHc+FpNFFC3hWA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: az6007: Add upper bound check to the data of device state
Date: Mon, 21 Apr 2025 22:31:56 +0800
X-OQ-MSGID: <20250421143155.1019130-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6805a24c.050a0220.4e547.000b.GAE@google.com>
References: <6805a24c.050a0220.4e547.000b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a corrupted list in az6007_i2c_xfer. [1]

Before accessing the member data of the struct az6007_device_state, only
the lower boundary of data is checked, but the upper boundary is not checked.
When the value of msgs[i].len is damaged or too large, it will cause out
of bounds access to st->data.

[1]
UBSAN: array-index-out-of-bounds in drivers/media/usb/dvb-usb-v2/az6007.c:821:30
index 4096 is out of range for type 'unsigned char [4096]'
CPU: 1 UID: 0 PID: 5832 Comm: syz-executor328 Not tainted 6.15.0-rc2-syzkaller-00493-gac71fabf1567 #0 PREEMPT(full)
Call Trace:
 <TASK>
 az6007_i2c_xfer+0x549/0xc30 drivers/media/usb/dvb-usb-v2/az6007.c:821
 i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2343
 i2cdev_read+0x111/0x280 drivers/i2c/i2c-dev.c:155
 do_loop_readv_writev fs/read_write.c:833 [inline]
 do_preadv+0x1af/0x270 fs/read_write.c:1130
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94

Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..6322894eda27 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -806,7 +806,8 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 ||
+			    msgs[i].len > ARRAY_SIZE(st->data) - 5) {
 				ret = -EIO;
 				goto err;
 			}
-- 
2.43.0


