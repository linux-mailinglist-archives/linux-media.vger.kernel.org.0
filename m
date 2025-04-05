Return-Path: <linux-media+bounces-29431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F9A7C907
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 14:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12413173E44
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 12:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9961E5211;
	Sat,  5 Apr 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ARHxiVY/"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E331CD214;
	Sat,  5 Apr 2025 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743854514; cv=none; b=MPKXgpsgHVcgDUOT75tMNNIlm7cgYMfVtSYnySaSttFQjlYm2w0BZHLjogGp3VZHO17W4zInxmO2slKZzzbk0C0shv4P4n+EDIzKKJCFuiV7pELxAyr7j0s1j/pHkHum49TSRkgER5iNrZw+SVsd2B1kFKc5QQOslbnCMXibvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743854514; c=relaxed/simple;
	bh=6EgSyRMcEGqP4MEsuH9QR2SAFAp5pShyBpqZNMMRBao=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=eHImoi/7Y/dO+V9Eiz27s4HWJVnv56Ck+w59Snzz5k9LEUOYPG6aP+ow+gTH+t8+qL5c+up4ZPa4ZEa1kk0QNwYtIFcg0ms26i8dTXJt89XAkcpbVLhkGGSRsnu2ODS3mryY7sIlUa5mwhp3omIzlfokldY8ai429aRi4y0xKzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ARHxiVY/; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743854203; bh=7v0YQDAhkBk5atcWCctMfqVcEUPpo3+PMG0K6Qjjqug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ARHxiVY/SdcUOEY6cNwyxd8vINpnJzPSfcxBrQ6c6xB85MHWZxSz6WzOlsHU83ZZS
	 VBxJBuUrGCWtC9UKEBMtLYjHOKtcj72dzY+65+wo4eyI1tc3s8JMS4Tqa7wp9d+m8V
	 AhPSmc4iF44XnCx+QlW6dM/oxuVmHVOCYsicSbIk=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id E2920ABA; Sat, 05 Apr 2025 19:56:41 +0800
X-QQ-mid: xmsmtpt1743854201tirvyekva
Message-ID: <tencent_DCC6C1B37B437AC965C3A2845B5779D76305@qq.com>
X-QQ-XMAILINFO: MesT5uKpDagV62TDMYu9XmaSM4yrHPkuCTbYg/gNWsUcY7gpdwI3Sxdcx+yW/x
	 4cErvqVx5fnOCT9uuGgq0V4v4Hj4PrQuz4nnaJi2UlKsujwsqRfzrYQEA90qsx01qFrsZW8Iji2O
	 0z4FI02ogodC88/L6UugkRTmJjNtgLV0mjL1J7iq0bLruwuEN1GYULjqJur3GrwiwST9Euv5xVCV
	 +XJAICy/AvM+8NCSc63mvCmpXTqa6Jj3NGpMoJkWkjDs9sRHA4djodQLXU4IjC+91U5YLKAl2PGz
	 DR+E6VuzEt3PY3k8jUMJs4jFdFFz9nJ6FYhv0PRS+KcRZNAyjOO/IwxLVLwyNTYO1B/L0Wf4lrWp
	 SEekAbA70Z2PMC3aMsYin30IGid4eSMd1oOeKaNmb4s3DHi5z72P5kMnznb/WFKrbbIri+sKcFjR
	 Na8S5bDiNZXEPG/Y2JXEzNAvG57D+7/HC9BVtuQ5IgdF48RxLL8DWQyUoARpXT8XPPpYkLvHbKxD
	 P5C5Ky3DmmyYJqGxlqnU2auZTGQ1DIC2441cahRj/xWHhJgRXBnL5EaUsmqMNeavMEEPlooVNOV7
	 oUa7SJ2SvD97jIj0fTrwAxbEXsBfCh2RdfSokyYTBED7AZOgpNkP0GfT9794O1KkOd2Z5vUUr09h
	 AsCLy9IWb7nE99Gh6PrkL0c00fGTSPEnS2mddeJs4KfhPZ4bbSndoVD/O6NII8/TfSIFI8/fqcwc
	 bSj71JMFCYxjNq1iHDJdfNvsuBdBz+2JNy2Yo7MJ4525JcZGhFkviPInFsBkpfnjzqwRJzHqCpSG
	 hK9EsmSqGvv/mEUOBeAJ+iRVqFmsIL5qyWrS5bK6ry+1qIsFlBWdSCEIUrAK8+dXR/Ff3krZDClB
	 1uX9cyUSZb2xYS2Yarbcc7u5F/PQq4zcSq1kPLkT0unx+uc4mVpFQ=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	mkrufky@linuxtv.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: cxusb: no longer judge rbuf when the write fails
Date: Sat,  5 Apr 2025 19:56:41 +0800
X-OQ-MSGID: <20250405115640.3875245-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67f092b5.050a0220.0a13.0229.GAE@google.com>
References: <67f092b5.050a0220.0a13.0229.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a uninit-value in cxusb_i2c_xfer. [1]

Only when the write operation of usb_bulk_msg() in dvb_usb_generic_rw()
succeeds and rlen is greater than 0, the read operation of usb_bulk_msg()
will be executed to read rlen bytes of data from the dvb device into the
rbuf.

In this case, although rlen is 1, the write operation failed which resulted
in the dvb read operation not being executed, and ultimately variable i was
not initialized.

[1]
BUG: KMSAN: uninit-value in cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:124 [inline]
BUG: KMSAN: uninit-value in cxusb_i2c_xfer+0x153a/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:124 [inline]
 cxusb_i2c_xfer+0x153a/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 __i2c_transfer+0xe25/0x3150 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x317/0x4a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x125/0x1e0 drivers/i2c/i2c-core-base.c:2343
 i2c_master_send include/linux/i2c.h:109 [inline]
 i2cdev_write+0x210/0x280 drivers/i2c/i2c-dev.c:183
 do_loop_readv_writev fs/read_write.c:848 [inline]
 vfs_writev+0x963/0x14e0 fs/read_write.c:1057
 do_writev+0x247/0x5c0 fs/read_write.c:1101
 __do_sys_writev fs/read_write.c:1169 [inline]
 __se_sys_writev fs/read_write.c:1166 [inline]
 __x64_sys_writev+0x98/0xe0 fs/read_write.c:1166
 x64_sys_call+0x2229/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:21
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=526bd95c0ec629993bf3
Tested-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/usb/dvb-usb/cxusb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f44529b40989..d0501c1e81d6 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -119,9 +119,8 @@ static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 
 	o[0] = GPIO_TUNER;
 	o[1] = onoff;
-	cxusb_ctrl_msg(d, CMD_GPIO_WRITE, o, 2, &i, 1);
 
-	if (i != 0x01)
+	if (!cxusb_ctrl_msg(d, CMD_GPIO_WRITE, o, 2, &i, 1) && i != 0x01)
 		dev_info(&d->udev->dev, "gpio_write failed.\n");
 
 	st->gpio_write_state[GPIO_TUNER] = onoff;
-- 
2.43.0



