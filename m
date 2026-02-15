Return-Path: <linux-media+bounces-52832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHJVOIwykmmjrwEAu9opvQ
	(envelope-from <linux-media+bounces-52832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 21:54:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6A13FB61
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 21:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9FF930058CA
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 20:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17317307AF2;
	Sun, 15 Feb 2026 20:54:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323F2D322E
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771188867; cv=none; b=Oncq9fZtxWumcNKKFfm/G/INgkznAC+5MBU9lKm9EWkTMXrczgyl8ZNKFYtdNs39hdNRSeeGYau20QQGfNjpeUVB3hHTA2YTPbqtKiHb+1dXLk78m/3jmFIv+gTAgLrdcUZhtn1tSGP1gVmhlyXQlh61FX+B4Qo5y8ptI9Sue7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771188867; c=relaxed/simple;
	bh=lDWR3c/tJ4dXT3Cptqc0motAsdZWp6WyqJlXzOvK5gY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WwEQnwU43MplXIzTlormvzDcPKlkeaAKYkEZJZ7T06DkQOXVHqRublRx35COwEkDq1hFpHdvGQdceAjPUjunZ8Us3PepXdb2KvzOmVkDrz1BjnXb+CMnskUNWl/2tyZhg/K/WXhiEbLR1WgipJh5Sp7IXeJimSciezo7lcpOxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-663006e4c3cso22778678eaf.2
        for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 12:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771188865; x=1771793665;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SthyVk+loO4we8rx52goP+aY7WRzJJrIQsA3i2rsE4c=;
        b=t/E7nfDTHi00S/ThwI3Ui+tv6WuQcyB9SkZpf+26bsNqeqKxgMNu46V0luHk3tqth1
         nxuqZUZ3NezMCV3TLtwRy/f3DwPANWVPjVi3r2XpfSVAeVAKtsS38PhCuug67Pid3N9g
         CNaQ0i2WfsEv0WfZ5WDuQIiiWq46IimqGtdP4BVm6frxndZ0pQLrdfZaSze51lSSOIYh
         XD81fDJMJ8cNzp/u3j/RZFj2KjZCENBfcUjEkZnB43+x8a4LIf2DG6psXjrC03OQQTbn
         ChopoqRkhth51jkXrBnatDJ9eT4TM78d6uSL6f1iXCubeiOer9VoLEWUssf2wid7orsX
         Y2CA==
X-Forwarded-Encrypted: i=1; AJvYcCUG2wyw2m2MN38VKxYI5BanbqIaA8zZf1RQFmGgKcckYnuaQHgu92lFHOFb7bVqa7oGW0SzWKv9FhCJuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qrpV68SS/SRUWRFF+PIJflRk/PJ+Sq4CU0CsGVhC39s5k6rs
	/PGLiTulXV/Aomzws+XhKWs88irMYOCBKMYpfl5WwK8eiv8ar0pKbo9Z33zIkXtDw5TWOuwawri
	Q8FK/xAo39+ox/j4M8/XQvAFqXgORd3nks3j8lpUKGWZ996IZCgMnryeji6s=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c94:b0:676:aeb2:648 with SMTP id
 006d021491bc7-677666f6ecbmr4146251eaf.2.1771188865649; Sun, 15 Feb 2026
 12:54:25 -0800 (PST)
Date: Sun, 15 Feb 2026 12:54:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69923281.050a0220.340abe.038f.GAE@google.com>
Subject: [syzbot] [media?] [usb?] memory leak in dvb_register_device
From: syzbot <syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=1ee062e17a57772f];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52832-lists,linux-media=lfdr.de,d37184d9d8cc34602616];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,goo.gl:url,appspotmail.com:email,googlegroups.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75D6A13FB61
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    ca4ee40bf13d Partly revert "drm/hyperv: Remove reference t..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e5c722580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ee062e17a57772f
dashboard link: https://syzkaller.appspot.com/bug?extid=d37184d9d8cc34602616
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1403fe5a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d58652580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aa62e1942b0d/disk-ca4ee40b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6bec89136564/vmlinux-ca4ee40b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ab4c41bad9dd/bzImage-ca4ee40b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88812b704d80 (size 192):
  comm "kworker/0:10", pid 6154, jiffies 4294943581
  hex dump (first 32 bytes):
    00 01 00 00 00 00 ad de 22 01 00 00 00 00 ad de  ........".......
    01 00 00 00 00 00 00 00 00 ec 21 04 81 88 ff ff  ..........!.....
  backtrace (crc 5efd1503):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4464 [inline]
    slab_alloc_node mm/slub.c:4788 [inline]
    __kmalloc_cache_noprof+0x377/0x480 mm/slub.c:5292
    kmalloc_noprof include/linux/slab.h:962 [inline]
    kzalloc_noprof include/linux/slab.h:1204 [inline]
    dvb_register_device+0x116/0xaa0 drivers/media/dvb-core/dvbdev.c:475
    dvb_dmxdev_init+0x116/0x1d0 drivers/media/dvb-core/dmxdev.c:1425
    dvb_usbv2_adapter_dvb_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:484 [inline]
    dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:801 [inline]
    dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:866 [inline]
    dvb_usbv2_probe.cold+0xc63/0xfa9 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:981
    usb_probe_interface+0x246/0x540 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:583 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:661
    __driver_probe_device+0xc7/0x160 drivers/base/dd.c:803
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:833
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:961
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1033
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1088
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:574
    device_add+0x97c/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x73/0xb0 drivers/usb/core/generic.c:250

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

