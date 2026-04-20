Return-Path: <linux-media+bounces-59181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gl8Al6c5ml8ywEAu9opvQ
	(envelope-from <linux-media+bounces-59181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:36:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DE2434399
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56DCA3015D22
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240493A8FE1;
	Mon, 20 Apr 2026 21:36:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EC137B033
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776720983; cv=none; b=bdPAcWlWK4x9C1akR17Z4moyq6uGGD1mYw3tCFVvX2xnlZII72cVT4Dd0OOeDplm/RU0BD0dw+nsHaj0nOFoqhUYQS/gOHUF0Rtq8jvhCdEGJ1/Y9e0PHDhOFyBMnwQ+8p6FISS8D9B7/8ZFXjhVZguH4kHNFMlH7lb/rymWkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776720983; c=relaxed/simple;
	bh=e466isemBwUITgMvfU2WA0ub+Ue4wILXBpPAwPyQOm0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=s25GOnOnjZd4H+1+InP2Sra7fzIR0HSdYWCWRK6rL/pysX/WCBy78V3RPZ7TEtJ2kotBQWwIH7MNNvujbT7hl426H/6Z8xeY75HLnCs2UbBQRgEq/8QTCR0TIod0Md7H6+GBAEC1ZtI5+ttG7r28MSCiicA0BfMuhmtDUHZsQkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-66b612efb4aso5651653eaf.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720981; x=1777325781;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCAClDFcPHoBct7DuL9YzclZZbrGy28A0KW7BVloE3k=;
        b=bPpLN4ChreqH9sFTAjQEYa/qERY5kEweG1MnuqbOqaOrf+sSqWojsjqtESVEq0/jU6
         fy69/keE8EtnckPVohLQxn3jB6418I7H2g6OwgWiAiGPpY7UPpMnZv+bEr3OopUvh4rb
         YhgSsU9SLXpRX8i2aTrAgk2SUKINd+oKKNrd4mfe1Ut23z1JTl/sVIhZGSlw4PD0zbUN
         w4RhBIFiuHEmSbgzYQ8oIDRlja19AD5oNupKIqnOn/aXk8W/FhGXr3jXIeKfRmZyhP3U
         xzQVd0PlC0J82byseToSxYnTFhzOyp0V/Cn7nz8HLth4UOq9tgJWsvAdV3OdpRWth+xE
         BBnw==
X-Forwarded-Encrypted: i=1; AFNElJ/wHR3SHG/kVMaSRESNHotmI/u6Uij8YXkf2iQwkSA9dFsNtCOOs+fzSRPB6SP5Dhe/f8PauZw2DczK5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/FExw3ndKq+A+zthlSJMRL/i6ZvJ55QPvNJNUSzvshLeJY3m
	WbaFAmOnehxuv+RR5nIywPQTK1HR3n5Ie6So4hIE1uqOW1m7L2FkxuJK32247+zVX6/3VixZ9DZ
	DREoJ4w1TYw3CARnG3y2MxA7fD5PfD07MGPwex9EoGIn5STGWSJ+RVR3KOGQ=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:5615:b0:694:63ba:7782 with SMTP id
 006d021491bc7-69463ba8144mr4890136eaf.11.1776720980818; Mon, 20 Apr 2026
 14:36:20 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:36:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69e69c54.050a0220.24bfd3.0028.GAE@google.com>
Subject: [syzbot] [media?] WARNING in trace_suspend_resume/usb_submit_urb
From: syzbot <syzbot+11f0e4f957c7c3bf3d51@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=fde9e2450560a38];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59181-lists,linux-media=lfdr.de,11f0e4f957c7c3bf3d51];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: A9DE2434399
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    8541d8f725c6 Merge tag 'mtd/for-7.1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f60836580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fde9e2450560a38
dashboard link: https://syzkaller.appspot.com/bug?extid=11f0e4f957c7c3bf3d51
compiler:       arm-linux-gnueabi-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1148ef16580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11581702580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-8541d8f7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2cff38048ad6/vmlinux-8541d8f7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/68de24d0a9c9/zImage-8541d8f7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+11f0e4f957c7c3bf3d51@syzkaller.appspotmail.com

rc rc0: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.1/usb2/2-1/2-1:0.0/rc/rc0
input: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.1/usb2/2-1/2-1:0.0/rc/rc0/input3
------------[ cut here ]------------
WARNING: drivers/usb/core/urb.c:411 at usb_submit_urb+0x518/0x63c drivers/usb/core/urb.c:411, CPU#1: kworker/1:1/3087
usb 2-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType 0
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 1 UID: 0 PID: 3087 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
Workqueue: usb_hub_wq hub_event
Call trace: 
[<80201a14>] (dump_backtrace) from [<80201b08>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:82a1e6fc r6:00000000 r5:8231ad74 r4:00000001
[<80201af0>] (show_stack) from [<8021e2fc>] (__dump_stack lib/dump_stack.c:94 [inline])
[<80201af0>] (show_stack) from [<8021e2fc>] (dump_stack_lvl+0x5c/0x70 lib/dump_stack.c:120)
[<8021e2a0>] (dump_stack_lvl) from [<8021e328>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r7:82a1e6fc r6:00000000 r5:83808c40 r4:82c7bd3c
[<8021e310>] (dump_stack) from [<8020260c>] (vpanic+0x114/0x320 kernel/panic.c:650)
[<802024f8>] (vpanic) from [<8020284c>] (trace_suspend_resume+0x0/0x104 kernel/panic.c:787)
 r7:80f16014
[<80202818>] (panic) from [<802506a8>] (check_panic_on_warn kernel/panic.c:524 [inline])
[<80202818>] (panic) from [<802506a8>] (get_taint+0x0/0x1c kernel/panic.c:519)
 r3:82a0b544 r2:00000001 r1:8230185c r0:8230913c
[<80250630>] (check_panic_on_warn) from [<80250824>] (__warn+0x98/0x1ac kernel/panic.c:1103)
[<8025078c>] (__warn) from [<80250b20>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:1138)
 r8:00000009 r7:8240b1a0 r6:eabd18c4 r5:83808c40 r4:00000000
[<8025093c>] (warn_slowpath_fmt) from [<80f16014>] (usb_submit_urb+0x518/0x63c drivers/usb/core/urb.c:411)
 r10:8530cf4c r9:00000000 r8:00000000 r7:00000001 r6:85fdf844 r5:85fdf800
 r4:85311000
[<80f15afc>] (usb_submit_urb) from [<81168dac>] (igorplugusb_cmd drivers/media/rc/igorplugusb.c:127 [inline])
[<80f15afc>] (usb_submit_urb) from [<81168dac>] (igorplugusb_probe+0x250/0x31c drivers/media/rc/igorplugusb.c:225)
 r10:00000027 r9:00000000 r8:00000000 r7:85fdfa8c r6:852a5800 r5:00000000
 r4:8530cf40
[<81168b5c>] (igorplugusb_probe) from [<80f1b004>] (usb_probe_interface+0x15c/0x3d8 drivers/usb/core/driver.c:396)
 r10:82d280d4 r9:82bb52f0 r8:82bb52f8 r7:85fdf888 r6:81dec46c r5:852a5830
 r4:ffffffed
[<80f1aea8>] (usb_probe_interface) from [<80bac3cc>] (call_driver_probe drivers/base/dd.c:631 [inline])
[<80f1aea8>] (usb_probe_interface) from [<80bac3cc>] (really_probe+0xd8/0x40c drivers/base/dd.c:709)
 r10:8240b678 r9:82b5dc44 r8:00000014 r7:00000000 r6:82bb52f8 r5:00000000
 r4:852a5830
[<80bac2f4>] (really_probe) from [<80bac794>] (__driver_probe_device+0x94/0x1ec drivers/base/dd.c:851)
 r8:00000014 r7:852a5830 r6:eabd1ab4 r5:82bb52f8 r4:852a5830
[<80bac700>] (__driver_probe_device) from [<80bac9cc>] (driver_probe_device+0x3c/0xd8 drivers/base/dd.c:881)
 r9:82b5dc44 r8:00000014 r7:852a5830 r6:eabd1ab4 r5:82d203bc r4:82d203ac
[<80bac990>] (driver_probe_device) from [<80bacb08>] (__device_attach_driver+0xa0/0x138 drivers/base/dd.c:1009)
 r9:82b5dc44 r8:831fa940 r7:852a5830 r6:eabd1ab4 r5:82bb52f8 r4:00000001
[<80baca68>] (__device_attach_driver) from [<80baa000>] (bus_for_each_drv+0x98/0xec drivers/base/bus.c:500)
 r7:831fa900 r6:80baca68 r5:eabd1ab4 r4:00000000
[<80ba9f68>] (bus_for_each_drv) from [<80bacf24>] (__device_attach+0xb0/0x1e4 drivers/base/dd.c:1081)
 r7:831fa900 r6:852a587c r5:00000001 r4:852a5830
[<80bace74>] (__device_attach) from [<80bad218>] (device_initial_probe+0x44/0x48 drivers/base/dd.c:1136)
 r6:831fa900 r5:852a5830 r4:831fa900
[<80bad1d4>] (device_initial_probe) from [<80bab080>] (bus_probe_device+0x30/0x84 drivers/base/bus.c:613)
 r5:852a5830 r4:852a5830
[<80bab050>] (bus_probe_device) from [<80ba82e8>] (device_add+0x5f0/0x814 drivers/base/core.c:3691)
 r9:82b5dc44 r8:81da2ef0 r7:85fdf888 r6:00000000 r5:00000000 r4:852a5830
[<80ba7cf8>] (device_add) from [<80f190b8>] (usb_set_configuration+0x5d8/0x938 drivers/usb/core/message.c:2266)
 r10:8240b678 r9:82c2d4c0 r8:85fdf888 r7:8649d050 r6:00000000 r5:8649d050
 r4:852a5800
[<80f18ae0>] (usb_set_configuration) from [<80f262d0>] (usb_generic_driver_probe+0x48/0x84 drivers/usb/core/generic.c:250)
 r10:8435c128 r9:82b5dc44 r8:00000014 r7:85fdf800 r6:82b84e9c r5:00000000
 r4:85fdf800
[<80f26288>] (usb_generic_driver_probe) from [<80f1a468>] (usb_probe_device+0x44/0x14c drivers/usb/core/driver.c:291)
 r5:00000001 r4:85fdf888
[<80f1a424>] (usb_probe_device) from [<80bac3cc>] (call_driver_probe drivers/base/dd.c:631 [inline])
[<80f1a424>] (usb_probe_device) from [<80bac3cc>] (really_probe+0xd8/0x40c drivers/base/dd.c:709)
 r7:00000000 r6:82b84e9c r5:00000000 r4:85fdf888
[<80bac2f4>] (really_probe) from [<80bac794>] (__driver_probe_device+0x94/0x1ec drivers/base/dd.c:851)
 r8:00000014 r7:85fdf888 r6:eabd1d1c r5:82b84e9c r4:85fdf888
[<80bac700>] (__driver_probe_device) from [<80bac9cc>] (driver_probe_device+0x3c/0xd8 drivers/base/dd.c:881)
 r9:82b5dc44 r8:00000014 r7:85fdf888 r6:eabd1d1c r5:82d203bc r4:82d203ac
[<80bac990>] (driver_probe_device) from [<80bacb08>] (__device_attach_driver+0xa0/0x138 drivers/base/dd.c:1009)
 r9:82b5dc44 r8:831fa940 r7:85fdf888 r6:eabd1d1c r5:82b84e9c r4:00000001
[<80baca68>] (__device_attach_driver) from [<80baa000>] (bus_for_each_drv+0x98/0xec drivers/base/bus.c:500)
 r7:831fa900 r6:80baca68 r5:eabd1d1c r4:00000000
[<80ba9f68>] (bus_for_each_drv) from [<80bacf24>] (__device_attach+0xb0/0x1e4 drivers/base/dd.c:1081)
 r7:831fa900 r6:85fdf8d4 r5:00000001 r4:85fdf888
[<80bace74>] (__device_attach) from [<80bad218>] (device_initial_probe+0x44/0x48 drivers/base/dd.c:1136)
 r6:831fa900 r5:85fdf888 r4:831fa900
[<80bad1d4>] (device_initial_probe) from [<80bab080>] (bus_probe_device+0x30/0x84 drivers/base/bus.c:613)
 r5:85fdf888 r4:85fdf888
[<80bab050>] (bus_probe_device) from [<80ba82e8>] (device_add+0x5f0/0x814 drivers/base/core.c:3691)
 r9:82b5dc44 r8:00000000 r7:84709088 r6:00000000 r5:00000000 r4:85fdf888
[<80ba7cf8>] (device_add) from [<80f0d030>] (usb_new_device+0x28c/0x6b8 drivers/usb/core/hub.c:2695)
 r10:8435c128 r9:00000003 r8:ffffffff r7:00000001 r6:86314f40 r5:85fdf888
 r4:85fdf800
[<80f0cda4>] (usb_new_device) from [<80f0f8e4>] (hub_port_connect drivers/usb/core/hub.c:5567 [inline])
[<80f0cda4>] (usb_new_device) from [<80f0f8e4>] (hub_port_connect_change drivers/usb/core/hub.c:5707 [inline])
[<80f0cda4>] (usb_new_device) from [<80f0f8e4>] (port_event drivers/usb/core/hub.c:5871 [inline])
[<80f0cda4>] (usb_new_device) from [<80f0f8e4>] (hub_event+0x11ec/0x1b80 drivers/usb/core/hub.c:5953)
 r10:8435c128 r9:85fdf800 r8:84709000 r7:00000001 r6:8435cc00 r5:00000000
 r4:8435cc1c
[<80f0e6f8>] (hub_event) from [<80276360>] (process_one_work+0x1c8/0x5a0 kernel/workqueue.c:3302)
 r10:8302fa05 r9:83808c40 r8:01800000 r7:ddde4e00 r6:8302fa00 r5:8435c128
 r4:83112e00
[<80276198>] (process_one_work) from [<80277124>] (process_scheduled_works kernel/workqueue.c:3385 [inline])
[<80276198>] (process_one_work) from [<80277124>] (worker_thread+0x16c/0x318 kernel/workqueue.c:3466)
 r10:00000000 r9:83112e30 r8:83808c40 r7:82a03d80 r6:ddde4e20 r5:ddde4e00
 r4:83112e00
[<80276fb8>] (worker_thread) from [<8028117c>] (kthread+0x11c/0x154 kernel/kthread.c:436)
 r10:00000000 r9:df879e88 r8:8489f580 r7:83112e00 r6:80276fb8 r5:83808c40
 r4:85c05400
[<80281060>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xeabd1fb0 to 0xeabd1ff8)
1fa0:                                     00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80281060 r4:85c05400
Rebooting in 86400 seconds..


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

