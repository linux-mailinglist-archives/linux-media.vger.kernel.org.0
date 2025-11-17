Return-Path: <linux-media+bounces-47210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 542CCC6416F
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 13:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD4D44F282B
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 12:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E570332E724;
	Mon, 17 Nov 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="hnJWdQG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx12.kaspersky-labs.com (mx12.kaspersky-labs.com [91.103.66.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA732D0ED;
	Mon, 17 Nov 2025 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382706; cv=none; b=DzRN9i3hrD5ir9UY1VoH9blhZX5C6YdNPrVgWfYoaJlsQuvbgoVlaSKup6t3VjpfkkAaxQj+ayxQoocAuVwvAAyXsh6iszCTKkZryDiXhKHarXE64CX8nGK6hbPzGZkOeYMjbwpg8sMBWXQeEtTF+LlM+KAzvOzv53Euoblazbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382706; c=relaxed/simple;
	bh=1nSiGgeUb15drNu5JFJPqa6zU+fyxeK70YZetTcKsck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBvYSgHgAmWU+B71HjVaruc4QvqzwWipZaYg00vPBbXmw0pzLttdfnyrZY/JQeyq6rBB0KPWIpIzTF79z/mYB3MtANA/ZvZuj/F9DBGsbzgcZIwSawvPfthRpo5QXkygRklD/Z2pYe0ZOz4wWd6MNSdmrlN+fI7NgmPhRHp+LUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=hnJWdQG9; arc=none smtp.client-ip=91.103.66.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1763382695;
	bh=1pInTKFz1cx999q16HOPczNE62eICWJDGWgZtItV2Sc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hnJWdQG9xRezE8lk/jDUXJIplXZwHiWN8uec6ccE02vEVt/lvnVx3jDNmeHa2tlLf
	 4TyAGR+fo7+kWHgp/PyTMiqyjgmtUdXgl6zENehN5cKDcMICXa5wVPB19LMJnHto3d
	 CBGKRMlCf2ZJZzPO3nw87yrGAbdWV9CvjrwyNhinpG/JnTdOmy8GgqS+k8nxYUJjyf
	 5rupyW/g4dX4esrRT3bzC0Ktk791TaaIRZnwknrIA8ipyYmsDGC153d8FTlK9fixVh
	 L3T3TwrME0808vF2vd7S5HOl6zvGIe3b3o1Uc8/eZTqb9fXf4pU80NNAwtesYihFQx
	 +b7Y2T3MazMAQ==
Received: from relay12.kaspersky-labs.com (localhost [127.0.0.1])
	by relay12.kaspersky-labs.com (Postfix) with ESMTP id A61AE5A43EC;
	Mon, 17 Nov 2025 15:31:35 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id 1E3B55A47E8;
	Mon, 17 Nov 2025 15:31:35 +0300 (MSK)
Received: from Nalivayko.avp.ru (10.16.105.14) by HQMAILSRV3.avp.ru
 (10.64.57.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 17 Nov
 2025 15:31:27 +0300
From: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
To: <linux-media@vger.kernel.org>
CC: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>,
	<linux-kernel@vger.kernel.org>, <mchehab@kernel.org>,
	<lvc-project@linuxtesting.org>,
	<syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] media: az6007: validate I2C message length
Date: Mon, 17 Nov 2025 15:31:01 +0300
Message-ID: <20251117123101.1641065-1-Sergey.Nalivayko@kaspersky.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV3.avp.ru (10.64.57.53) To HQMAILSRV3.avp.ru
 (10.64.57.53)
X-KSE-ServerInfo: HQMAILSRV3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/17/2025 12:18:17
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 198144 [Nov 17 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Sergey.Nalivayko@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 76 0.3.76
 6aad6e32ec76b30ee13ccddeafeaa4d1732eef15
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_one_url}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;kaspersky.com:5.0.1,7.1.1;syzkaller.appspot.com:5.0.1,7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/17/2025 12:20:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/17/2025 11:12:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/11/17 11:46:00
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/17 08:57:00 #27937168
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/11/17 11:47:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

syzbot reports a UBSAN issue as below:

UBSAN: array-index-out-of-bounds in drivers/media/usb/dvb-usb-v2/az6007.c:821:30
index 4096 is out of range for type 'unsigned char [4096]'
CPU: 1 UID: 0 PID: 5832 Comm: syz-executor328 Not tainted 6.15.0-rc2-syzkaller-00493-gac71fabf1567 #0 PREEMPT(full)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x11c/0x160 lib/ubsan.c:453
 az6007_i2c_xfer+0x549/0xc30 drivers/media/usb/dvb-usb-v2/az6007.c:821
 __i2c_transfer+0x6b3/0x2190 drivers/i2c/i2c-core-base.c:2259
 i2c_transfer drivers/i2c/i2c-core-base.c:2315 [inline]
 i2c_transfer+0x1da/0x380 drivers/i2c/i2c-core-base.c:2291
 i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x111/0x280 drivers/i2c/i2c-dev.c:155
 do_loop_readv_writev fs/read_write.c:845 [inline]
 do_loop_readv_writev fs/read_write.c:833 [inline]
 vfs_readv+0x6bc/0x8a0 fs/read_write.c:1018
 do_preadv+0x1af/0x270 fs/read_write.c:1130
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

The issue occurs because the az6007 driver does not validate the length
of the received I2C message. While iterating over st->data, the index 'j'
may exceed the maximum buffer size of 4096 elements.

Add validation of msgs.len based on buffer length value passed
to __az6007_read/write functions to prevent out-of-bounds access.

Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d8913f1760bc090ee46e\
Fixes: 71d676345698 ("[media] dvb: Add a new driver for az6007")
Cc: stable@vger.kernel.org
Signed-off-by: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..c966de4ea6e1 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -770,6 +770,10 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C W/R addr=0x%x len=%d/%d\n",
 				       addr, msgs[i].len, msgs[i + 1].len);
+			if (msgs[i + 1].len + 6 > ARRAY_SIZE(st->data)) {
+				ret = -EIO;
+				goto err;
+			}
 			req = AZ6007_I2C_RD;
 			index = msgs[i].buf[0];
 			value = addr | (1 << 8);
@@ -788,7 +792,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 || msgs[i].len - 1 > ARRAY_SIZE(st->data)) {
 				ret = -EIO;
 				goto err;
 			}
@@ -806,7 +810,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 || msgs[i].len + 6 > ARRAY_SIZE(st->data)) {
 				ret = -EIO;
 				goto err;
 			}
-- 
2.39.5


