Return-Path: <linux-media+bounces-47573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57577C795FB
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 14:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7F89B32441
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 13:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EB22F3632;
	Fri, 21 Nov 2025 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="Pzz0o2No"
X-Original-To: linux-media@vger.kernel.org
Received: from mx13.kaspersky-labs.com (mx13.kaspersky-labs.com [91.103.66.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AD9341044;
	Fri, 21 Nov 2025 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763731462; cv=none; b=rZJeD0c3yZ/IoYAWeJWLQh5ZHA+GBqQdMpU4ZyWLkBqgdaO2Ka1eaGOzxBSjeES1DOQ2VSr79YEODiYOtY5kFVgxcRzh84B5WqEgD4F9OFfu9IrP09EGtxa4b4YRzLcWellI4X/iupiHltRp/+nKXGudVUeblfprVMjpzI8SIPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763731462; c=relaxed/simple;
	bh=gCSD/meQnl9tT4NSHRQITpayeAOwbenLsmTidzNUO1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VysC/rMkSt3Zv/qBAFdN2b4LqzKMp3XHulmbqoi8i0EfaW2qH5XpQ7ySQLNnDE01bFr84bElH5fDl1U4FVnsCAfaZXQ/XKBXieIeBtZuBEm2YO5KqK0faX2vXEsarg9wQtG5OTlivJ8Gz7SFT6jOal4p2EGsHi3JwzPvsKlAIls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=Pzz0o2No; arc=none smtp.client-ip=91.103.66.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1763731451;
	bh=DCj2AeYsx0k+Qfi2hM7PNGR5VzBYkbbO3sWKvMVCmL0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Pzz0o2NonAWX4lnqG8t6IeRh1wMz7tVi1G2tBjtW22D1wGT8Ey8mnpjQvpwgH5myO
	 PKr7uwcMAYKlkewj1MJKTEXWdi6Hiai/vkoDuNeN00DEvQPuwtH7XG7TfO6PmtjVeI
	 eUxHj3ROmbPJiiEAKd1UOSU6tYakr+EO9imzPDdKBgXPwa93xlA/iwfghW32iJ3NJw
	 rky5SABGhxe3rI1IgKDSipbom/hZ8vTTSL58bE2zho6VRQ/OaBFAYGd+LsJopOeQ/3
	 O8AkiDTcWvGazzJVaZdcYwFs+YIfIyZN9gOGVBAV0JjWknXiVjduv8Kbffbrg0Cl09
	 3VRhN2vgBqvWQ==
Received: from relay13.kaspersky-labs.com (localhost [127.0.0.1])
	by relay13.kaspersky-labs.com (Postfix) with ESMTP id CD5923E9B79;
	Fri, 21 Nov 2025 16:24:11 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id 67A373E4F07;
	Fri, 21 Nov 2025 16:24:10 +0300 (MSK)
Received: from Nalivayko.avp.ru (10.16.105.14) by HQMAILSRV3.avp.ru
 (10.64.57.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 21 Nov
 2025 16:24:09 +0300
From: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
To: <linux-media@vger.kernel.org>
CC: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Antoine Jacquet <royale@zerezo.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Alan Stern <stern@rowland.harvard.edu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<lvc-project@linuxtesting.org>,
	<syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] dvb-usb: dtv5100: rewrite i2c message usb_control send/recv
Date: Fri, 21 Nov 2025 16:23:31 +0300
Message-ID: <20251121132332.3983185-1-Sergey.Nalivayko@kaspersky.com>
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
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/21/2025 13:08:39
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 198293 [Nov 21 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: Sergey.Nalivayko@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 78 0.3.78
 468114d1894f8bd8bd24fc93d92b1fa7ecfbc0f3
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_one_url}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;syzkaller.appspot.com:7.1.1,5.0.1;kaspersky.com:7.1.1,5.0.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/21/2025 13:11:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/21/2025 11:55:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/11/21 12:51:00
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/21 08:31:00 #27956385
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/11/21 12:51:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

syzbot reports a WARNING issue as below:

usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 5833 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 0 UID: 0 PID: 5833 Comm: syz-executor411 Not tainted 6.15.0-syzkaller #0 PREEMPT(full)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 dtv5100_i2c_msg+0x250/0x330 drivers/media/usb/dvb-usb/dtv5100.c:60
 dtv5100_i2c_xfer+0x1a4/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86
 __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x105/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_send include/linux/i2c.h:109 [inline]
 i2cdev_write+0x112/0x1b0 drivers/i2c/i2c-dev.c:183
 do_loop_readv_writev include/linux/uio.h:-1 [inline]
 vfs_writev+0x4a5/0x9a0 fs/read_write.c:1057
 do_writev+0x14d/0x2d0 fs/read_write.c:1101
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

The issue occurs due to insufficient validation of data passed to the USB API.
In the current implementation, the dtv5100 driver expects two I2C non-zero 
length messages for a combined write/read request. However, when 
only a single message is provided, the driver incorrectly processes message
of size 1, passing a read data size of zero to the dtv5100_i2c_msg function.

When usb_control_msg() is called with a PIPEOUT type and a read length of
zero, a mismatch error occurs between the operation type and the expected
transfer direction in function usb_submit_urb. This is the trigger
for warning.

Replace usb_control_msg() with usb_control_msg_recv() and
usb_control_msg_send() to rely on the USB API for proper validation and
prevent inconsistencies in the future.

Reported-by: syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0335df380edd9bd3ff70
Fixes: 60688d5e6e6e ("V4L/DVB (8735): dtv5100: replace dummy frontend by zl10353")
Cc: stable@vger.kernel.org
Signed-off-by: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
---
v2: Expand problem description.

 drivers/media/usb/dvb-usb/dtv5100.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
index 3d85c6f7f6ec..05860f5d5053 100644
--- a/drivers/media/usb/dvb-usb/dtv5100.c
+++ b/drivers/media/usb/dvb-usb/dtv5100.c
@@ -26,40 +26,37 @@ static int dtv5100_i2c_msg(struct dvb_usb_device *d, u8 addr,
 			   u8 *wbuf, u16 wlen, u8 *rbuf, u16 rlen)
 {
 	struct dtv5100_state *st = d->priv;
-	unsigned int pipe;
 	u8 request;
 	u8 type;
 	u16 value;
 	u16 index;
 
+	index = (addr << 8) + wbuf[0];
+
+	memcpy(st->data, rbuf, rlen);
+	msleep(1); /* avoid I2C errors */
+
 	switch (wlen) {
 	case 1:
 		/* write { reg }, read { value } */
-		pipe = usb_rcvctrlpipe(d->udev, 0);
 		request = (addr == DTV5100_DEMOD_ADDR ? DTV5100_DEMOD_READ :
 							DTV5100_TUNER_READ);
 		type = USB_TYPE_VENDOR | USB_DIR_IN;
 		value = 0;
-		break;
+		return usb_control_msg_recv(d->udev, 0, request, type, value, index,
+			st->data, rlen, DTV5100_USB_TIMEOUT, GFP_KERNEL);
 	case 2:
 		/* write { reg, value } */
-		pipe = usb_sndctrlpipe(d->udev, 0);
 		request = (addr == DTV5100_DEMOD_ADDR ? DTV5100_DEMOD_WRITE :
 							DTV5100_TUNER_WRITE);
 		type = USB_TYPE_VENDOR | USB_DIR_OUT;
 		value = wbuf[1];
-		break;
+		return usb_control_msg_send(d->udev, 0, request, type, value, index,
+			st->data, rlen, DTV5100_USB_TIMEOUT, GFP_KERNEL);
 	default:
 		warn("wlen = %x, aborting.", wlen);
 		return -EINVAL;
 	}
-	index = (addr << 8) + wbuf[0];
-
-	memcpy(st->data, rbuf, rlen);
-	msleep(1); /* avoid I2C errors */
-	return usb_control_msg(d->udev, pipe, request,
-			       type, value, index, st->data, rlen,
-			       DTV5100_USB_TIMEOUT);
 }
 
 /* I2C */
-- 
2.39.5

