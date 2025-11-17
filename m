Return-Path: <linux-media+bounces-47219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A90C64FEC
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 16:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7EBB83590F3
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 15:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF5D29BD80;
	Mon, 17 Nov 2025 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="CkUD4nSK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx13.kaspersky-labs.com (mx13.kaspersky-labs.com [91.103.66.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274B275B05;
	Mon, 17 Nov 2025 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394918; cv=none; b=tXvEe/v8uVDICbR7+DZomPjPFoKD8gPA1qdKGdlW7pqpbtYWm4JrhTya5Ym9jxlHfmTDCDGDmQonJbKZZ1rnCKxqA4M4bm7+5aefxPdARMQckShjQg/T2JQYf8c2go2tYagwrr7B7BFS3cPb48a7WnYAgA7+ynUKJcr8OVzJufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394918; c=relaxed/simple;
	bh=hPrJDzyj8DX0fuDZDNUP+DAIWqS/5XdNO8huBQyUsLA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fNyq17ORd108ws9ftl5g2IKQLVupumRL9owgGYNHcnGYPGJ7DpU+cEc0HgybmFPaen5w8K2KzCNMwUun6kpRKYW2x8G7ZEMvjXuUsMwSGNhBLnmhZwL0p8n8qqyFX+Jeszv7lmF3qLEvTt/gZPn7BgJCn9OO9brEo+ORq229Gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=CkUD4nSK; arc=none smtp.client-ip=91.103.66.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1763394908;
	bh=16HCA9ddrIpnYG6PtakcW47alFrg1zTkrEo2ojf5Jdg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CkUD4nSKYq2qyquyvta8i15LQTPsVQlyHnSRpfHd7/9YJM1AQ8TCCPVXQ5oEQECtI
	 r8r0zjzgXS4wZkueTaGGlFH+HAvqgITwvdHzoW41KYLsBw/N+uj41KPf5Z6rrNpgf8
	 FcS+IkN+Qpi6PvupRQL5kZ7gp+fnghhDIpf8VpnUIVNo5J6JznyZx9I2DtjG2tT/gY
	 q5U72jdsl3eHB5RLKzjZaHuO44wRPq3cVdfR/YAnP1TZvrRKxDI889y4qRoKtxHQWW
	 oCmrQtBtX165S85H8c24kh6U45fmSguzCwOzQDrWxJ53sVA16SkUuCMpCrsYr7rWfB
	 Os5zDlTmC7jTQ==
Received: from relay13.kaspersky-labs.com (localhost [127.0.0.1])
	by relay13.kaspersky-labs.com (Postfix) with ESMTP id 78FFA3E1D2C;
	Mon, 17 Nov 2025 18:55:08 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id 0B7643E4FCA;
	Mon, 17 Nov 2025 18:55:06 +0300 (MSK)
Received: from Nalivayko.avp.ru (10.16.105.14) by HQMAILSRV3.avp.ru
 (10.64.57.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 17 Nov
 2025 18:54:57 +0300
From: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
To: <linux-media@vger.kernel.org>
CC: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Antoine Jacquet <royale@zerezo.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Alan Stern <stern@rowland.harvard.edu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<lvc-project@linuxtesting.org>,
	<syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] dvb-usb: dtv5100: rewrite i2c message usb_control send/recv
Date: Mon, 17 Nov 2025 18:53:56 +0300
Message-ID: <20251117155356.1912431-1-Sergey.Nalivayko@kaspersky.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV1.avp.ru (10.64.57.51) To HQMAILSRV3.avp.ru
 (10.64.57.53)
X-KSE-ServerInfo: HQMAILSRV3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/17/2025 15:26:59
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 198158 [Nov 17 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Sergey.Nalivayko@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 77 0.3.77
 32e48053defa8195f3a40f668b6fa713f8e2761b
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_one_url}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;kaspersky.com:5.0.1,7.1.1;127.0.0.199:7.1.2;syzkaller.appspot.com:5.0.1,7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/17/2025 15:28:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/17/2025 2:02:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/11/17 15:09:00
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/17 08:57:00 #27937168
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/11/17 15:09:00
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
In the current implementation, the case where the operation type is read
but the read length is zero is not handled properly, which makes no sense.

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


