Return-Path: <linux-media+bounces-47180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD4C616FB
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 15:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 387A63605E3
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 14:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876FB2EB5CD;
	Sun, 16 Nov 2025 14:41:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0721FD4;
	Sun, 16 Nov 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763304070; cv=none; b=WRfHbLcmRAuDNJ2GECLZRYIX353piMLs38UW/to+SCuxY+qfQQdRyLmUtnjf2PxeYM0ScMKuB/dPHOMdmsrkszY9nu3BhM9OuMsNZLq0+PGcEwcduULu+S5qxVWUsh9uKipsv3oJ2RvUOmwKXhX1K7jnsG53ShONrFBsJtkpUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763304070; c=relaxed/simple;
	bh=XvlBxjtGIqdV5PnTKV6WUqhPTG4tACLPzrduHW/Qm+Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=rzhBncD5OvTqySAjnfkLKp4Q51MBHwVmLSf91CMYikX2FosCyrTLY0lXokyiPTyA1nzeGyeMMQGrLh6KVX/cqIn3m6aEmeHIkJWK/br+KQTmOg3UwtPoe3X8Qpix6rI1XxEMYCrZxMG79kxBEMsC69ayy7VLmE06fxrWkE30hmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [IPV6:2001:a62:4d6:5401:ad99:51f1:12ea:ab02] (unknown [IPv6:2001:a62:4d6:5401:ad99:51f1:12ea:ab02])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zzam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0E8433410AC;
	Sun, 16 Nov 2025 14:41:05 +0000 (UTC)
Message-ID: <990eccd8-54fc-40b3-8da8-8da0d9f6e864@gentoo.org>
Date: Sun, 16 Nov 2025 15:41:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: zzam@gentoo.org
Subject: Re: [syzbot] [media?] WARNING in dtv5100_i2c_msg
To: syzbot <syzbot+a83ee2dae0e6cc6cd3aa@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <68fa8527.a70a0220.3bf6c6.00b6.GAE@google.com>
Content-Language: en-US
In-Reply-To: <68fa8527.a70a0220.3bf6c6.00b6.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 23.10.25 um 21:42 schrieb syzbot:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    1c64efcb083c Merge tag 'rust-rustfmt' of git://git.kernel...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12a9752f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9ad7b090a18654a7
> dashboard link: https://syzkaller.appspot.com/bug?extid=a83ee2dae0e6cc6cd3aa
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5e186ec77007/disk-1c64efcb.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6b834b72dada/vmlinux-1c64efcb.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/3ba22aa75c23/bzImage-1c64efcb.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a83ee2dae0e6cc6cd3aa@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> memcpy: detected field-spanning write (size 4096) of single field "st->data" at drivers/media/usb/dvb-usb/dtv5100.c:58 (size 80)
> WARNING: CPU: 1 PID: 20467 at drivers/media/usb/dvb-usb/dtv5100.c:58 dtv5100_i2c_msg+0x2ac/0x330 drivers/media/usb/dvb-usb/dtv5100.c:58
> Modules linked in:
> CPU: 1 UID: 0 PID: 20467 Comm: syz.1.4196 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
> RIP: 0010:dtv5100_i2c_msg+0x2ac/0x330 drivers/media/usb/dvb-usb/dtv5100.c:58
> Code: d1 e8 d8 5c 0b fa c6 05 1c 33 d3 07 01 90 b9 50 00 00 00 48 c7 c7 e0 7b 32 8c 4c 89 e6 48 c7 c2 60 7c 32 8c e8 c5 79 ce f9 90 <0f> 0b 90 90 e9 34 ff ff ff 44 89 e9 80 e1 07 38 c1 0f 8c e2 fe ff
> RSP: 0018:ffffc9000ff6f8a0 EFLAGS: 00010246
> RAX: dd4b062c6f0c5d00 RBX: ffff88802fb10000 RCX: 0000000000080000
> RDX: ffffc9000be3b000 RSI: 00000000000054be RDI: 00000000000054bf
> RBP: 0000000000000102 R08: 0000000000000003 R09: 0000000000000004
> R10: dffffc0000000000 R11: fffffbfff1bfa650 R12: 0000000000001000
> R13: ffff8880543d4300 R14: 00000000000000c7 R15: 0000000080007700
> FS:  0000000000000000(0000) GS:ffff888125e0d000(0063) knlGS:00000000f5436b40
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 0000000080000100 CR3: 0000000047562000 CR4: 00000000003526f0
> Call Trace:
>   <TASK>
>   dtv5100_i2c_xfer+0x269/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:81
>   __i2c_transfer+0x874/0x2170 drivers/i2c/i2c-core-base.c:-1
>   i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2317
>   i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
>   compat_i2cdev_ioctl+0x5a8/0x5c0 drivers/i2c/i2c-dev.c:575
>   __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
>   __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
>   __ia32_compat_sys_ioctl+0x543/0x840 fs/ioctl.c:638
>   do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
>   __do_fast_syscall_32+0xb6/0x2b0 arch/x86/entry/syscall_32.c:306
>   do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
>   entry_SYSENTER_compat_after_hwframe+0x84/0x8e
> RIP: 0023:0xf7f41539
> Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000f543655c EFLAGS: 00000206 ORIG_RAX: 0000000000000036
> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000000000707
> RDX: 00000000800002c0 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>   </TASK>

 From the report above it looks like the i2c-read writes to 
dtv5100_state->data:
   struct dtv5100_state {
	unsigned char data[80];
   };

If the read is longer than 80 characters it writes after the end of 
data. Limiting the read size to 80 bytes should fix this issue.

But I see more issues in that code so is it working at all?

1.
It seems to copy from the original read-target buffer (rbuf) to a 
temporary buffer on the heap (in dtv5100_state->data). Then 
usb_control_msg runs. But then the data itself seems not to be copied 
back into rbuf.

25:static int dtv5100_i2c_msg(struct dvb_usb_device *d, u8 addr,
26:			   u8 *wbuf, u16 wlen, u8 *rbuf, u16 rlen)
27:{
[...]
58:	memcpy(st->data, rbuf, rlen);
59:	msleep(1); /* avoid I2C errors */
60:	return usb_control_msg(d->udev, pipe, request,
61:			       type, value, index, st->data, rlen,
62:			       DTV5100_USB_TIMEOUT);
63:}

2. dtv5100_i2c_xfer: Single read-requests might be interpreted as single 
writes.

Regards
Matthias


