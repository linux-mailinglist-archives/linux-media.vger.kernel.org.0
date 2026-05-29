Return-Path: <linux-media+bounces-63069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LVJFKfuGWoX0AgAu9opvQ
	(envelope-from <linux-media+bounces-63069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 21:53:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3766080CF
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 21:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16A473096EC5
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 19:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0F83ACA5B;
	Fri, 29 May 2026 19:50:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14063D7A01
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084228; cv=none; b=lYD6O8iNj2/Qb9M4e9jtYhLHDw6/gxidQA276MPPudZW3f3tpAEvF3q2OdS908XS2KfwELOJr8fbfPTonuvWrPkZhXp3GXQaOQ57nZMBNKiLQOOZ9wfhmG06puJzrkmFF6m7lDi4hpMVB9ka/I9O2GJhl//CGVXe5BovVQ8tPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084228; c=relaxed/simple;
	bh=okeRFmu4Wkr6tCBbAkBczsru7or+CgoIJj5Gt4nYbBQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hUhwDGWrMe8EvyVAcHM73P8IYPeNa7KsjkPfGPv+PcUXcPCwgrBi98Tehzmg50Ue6HghdaRL506igxNarTNnPfHJeerBFND7tF99/jcfvhPH7tEtXIPfUZehQ9coo6YE7HtJ9AUzk0YSGLpTbBdMY8pDAh7lvWoO39/dhpVJgtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4857b690da7so9368541b6e.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 12:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780084226; x=1780689026;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeFiy9RoAews+QfJRMoGc96HJ5JINbNMGghSsA32I3w=;
        b=WmgbiceXXCJjmtvVGcnLSpAS2V8WlDK6iwYqmBUyttBoOXIeH91mKeykEqb+3hd/wX
         W7c+fiQM6nrAdNDudN7rxKmmbws8J6YRlhNVXBSAsLrUund1EgJrS+e/kRLs6dtNVc0V
         iBRkro/jC5VQZjItZN32M1ap2lUr/fndhuEzJR0WNtkcsU6hpCqRKQwQ55KHz831RETu
         g38g8jOdxsFsa9ll4vm9YjlgVCgtCMPFEt/629XYKKlLOqWGY+r3bc1CJJw90h4oKQN9
         FfWPp0+zXedkk+c4bbTTDr3KsNI2Al7oeaNbLp95j1SoMDUTpiKFzIzJHf/nwnVjYa9C
         AGAw==
X-Forwarded-Encrypted: i=1; AFNElJ9uVqQLila7bENGUY7RfNTgnrPrAAbAEI0KUUBaJIHaQ21r5kbKAuJF3MPfbmrOftnLcxXoGj07da/BXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhjS3b+faCxbGH76/+1ekiKXS0bHOhCGH9gZdYT0aWdfPGEM39
	TXpClVgaik2g427sgaTqrHLgmCtCefWPQNAwWx+lnBEy7xugl8jMzhzKKlptDADE25Gzo1du4aQ
	krU+VpifSg89v3ycDRvL2Eabd6vGqhSn1lYeuw22Fs9RQi5q2MVb5EEQ7FgM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4df9:b0:69e:2fa:a5d8 with SMTP id
 006d021491bc7-69e10305b0dmr442081eaf.18.1780084225966; Fri, 29 May 2026
 12:50:25 -0700 (PDT)
Date: Fri, 29 May 2026 12:50:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a19ee01.c16d89a8.217f2c.0007.GAE@google.com>
Subject: [syzbot] [usb?] [media?] WARNING in igorplugusb_cmd/usb_submit_urb
From: syzbot <syzbot+2599e08a22e4565ea9f9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a834c6344141a58b];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63069-lists,linux-media=lfdr.de,2599e08a22e4565ea9f9];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,storage.googleapis.com:url,goo.gl:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,googlegroups.com:email,appspotmail.com:email]
X-Rspamd-Queue-Id: CC3766080CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    4b4362973b6f Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=167361a6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a834c6344141a58b
dashboard link: https://syzkaller.appspot.com/bug?extid=2599e08a22e4565ea9f9
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174841a6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17498e2e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f69f86c90ee5/disk-4b436297.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/79fa7b33aaab/vmlinux-4b436297.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ef080156d0de/Image-4b436297.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2599e08a22e4565ea9f9@syzkaller.appspotmail.com

input: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0/input5
------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000580 doesn't match bRequestType 20
WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1190/0x1454 drivers/usb/core/urb.c:411, CPU#1: kworker/1:3/4432
Modules linked in:
CPU: 1 UID: 0 PID: 4432 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Workqueue: usb_hub_wq hub_event
pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : usb_submit_urb+0x1190/0x1454 drivers/usb/core/urb.c:411
lr : usb_submit_urb+0x1190/0x1454 drivers/usb/core/urb.c:411
sp : ffff800099ce6d00
x29: ffff800099ce6d40 x28: 0000000080000580 x27: ffff0000cdd9a058
x26: ffff0000d1d95898 x25: ffff800087065dc0 x24: dfff800000000000
x23: ffff0000d04fbf40 x22: ffff0000d04a0fe0 x21: 1fffe0001a3b2b13
x20: 0000000000000820 x19: ffff0000d04fbf00 x18: 1fffe00035c23420
x17: ffff8000888eb000 x16: ffff80008899dba0 x15: ffff0001ae11a10c
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000ff0100 x9 : 2212e0c7e7291f00
x8 : 2212e0c7e7291f00 x7 : ffff80008047caa0 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000802f1374
x2 : 0000000100000000 x1 : ffff0000d3d68000 x0 : 0000000000000000
Call trace:
 usb_submit_urb+0x1190/0x1454 drivers/usb/core/urb.c:411 (P)
 igorplugusb_cmd+0xa0/0x144 drivers/media/rc/igorplugusb.c:127
 igorplugusb_probe+0x5fc/0x940 drivers/media/rc/igorplugusb.c:225
 usb_probe_interface+0x2fc/0x788 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x2a8/0x7e8 drivers/base/dd.c:709
 __driver_probe_device+0x1e0/0x33c drivers/base/dd.c:871
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:901
 __device_attach_driver+0x194/0x2f4 drivers/base/dd.c:1029
 bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
 __device_attach+0x250/0x394 drivers/base/dd.c:1101
 device_initial_probe+0x90/0xcc drivers/base/dd.c:1156
 bus_probe_device+0x58/0x120 drivers/base/bus.c:613
 device_add+0x6c4/0x9e4 drivers/base/core.c:3706
 usb_set_configuration+0x1170/0x1588 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8c/0x144 drivers/usb/core/generic.c:250
 usb_probe_device+0x118/0x2b8 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x2a8/0x7e8 drivers/base/dd.c:709
 __driver_probe_device+0x1e0/0x33c drivers/base/dd.c:871
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:901
 __device_attach_driver+0x194/0x2f4 drivers/base/dd.c:1029
 bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
 __device_attach+0x250/0x394 drivers/base/dd.c:1101
 device_initial_probe+0x90/0xcc drivers/base/dd.c:1156
 bus_probe_device+0x58/0x120 drivers/base/bus.c:613
 device_add+0x6c4/0x9e4 drivers/base/core.c:3706
 usb_new_device+0x7a8/0x1214 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1f7c/0x3b20 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0x79c/0x1098 kernel/workqueue.c:3397
 worker_thread+0x754/0xba0 kernel/workqueue.c:3478
 kthread+0x2f8/0x3c8 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:842
irq event stamp: 36390
hardirqs last  enabled at (36389): [<ffff80008048000c>] vprintk_store+0x900/0xb70 kernel/printk/printk.c:2385
hardirqs last disabled at (36390): [<ffff80008673aac0>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:429
softirqs last  enabled at (36334): [<ffff800084ac3a58>] __alloc_skb+0x1c0/0x5f8 net/core/skbuff.c:696
softirqs last disabled at (36332): [<ffff800084ac3a40>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (36332): [<ffff800084ac3a40>] __alloc_skb+0x1a8/0x5f8 net/core/skbuff.c:695
---[ end trace 0000000000000000 ]---
igorplugusb 1-1:0.0: submit urb failed: -53
usb 1-1: new high-speed USB device number 7 using dummy_hcd
usb 1-1: config index 0 descriptor too short (expected 23569, got 27)
usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has invalid wMaxPacketSize 0
usb 1-1: New USB device found, idVendor=03eb, idProduct=0002, bcdDevice=ba.c0
usb 1-1: New USB device strings: Mfr=5, Product=0, SerialNumber=0
usb 1-1: Manufacturer: syz
usb 1-1: config 0 descriptor??
Registered IR keymap rc-hauppauge
rc_core: Loaded IR protocol module ir-rc5-decoder, but protocol rc-5 still not available
rc rc0: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0
input: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0/input7
igorplugusb 1-1:0.0: submit urb failed: -53


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

