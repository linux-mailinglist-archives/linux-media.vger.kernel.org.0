Return-Path: <linux-media+bounces-52346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rYiKFbfjh2mCegQAu9opvQ
	(envelope-from <linux-media+bounces-52346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 02:15:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 839C41077D9
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 02:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D71A301DBAA
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 01:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8199C2FE05D;
	Sun,  8 Feb 2026 01:15:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E999C81732
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 01:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770513325; cv=none; b=OW0gJvF9jaXjZF1zk13Xx1zZxN9Vl2XPDpouxlB3FYBm1qR9POCcBzyI+Ir3YjEmExuZvTUV9GusCm22OTIrd1In4N/JsYBj3sEG3DK50gFk0xJf3+cnxuJaW2mBUYJif3Lhb79lBp0vci/St3XMe8DWbbXC2A4K13RMy2KRIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770513325; c=relaxed/simple;
	bh=xj7k+W7AVLI9518Jl8Lw4cxF9MmwkQ0ypihKrtRqQEc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=s0O2kuuJw1qDf9VVwgbzPDbHVf4l/Jy2oOWp+13LZRWizKxiS9ohgEvMeqf7iDGyuVt52x/0mspIznCs/0ZK4B6duplrDOUYVgIHUKKnA79wtJPuRtWbD7nQ2MeuhFGHns4kkupcMEqCr2G0DHm68msCYU7yvyk9ybpH9B4qNPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-3ff590953b1so11578939fac.2
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 17:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770513324; x=1771118124;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYwrasxn06P8GYL/h3tcZ43LeJttTxGEDfVNknBOOOU=;
        b=VuWTvY/ACyHKmxeVBMoalgX/wKR/tzNCF2bWGadojLwEZya9OXM/OquKZLp//JBdor
         9/5GYTtpK0VgY1cWQwzHrjJ4WuoDEB5MufcpvCduUe7eJJ1fgI+aa44nXqhJJ9irT8eY
         tY2Vp1ReMrnvE6xuqmWlrgLVYYBq6oKI/FSQqnV14PftZb3z7RVYEABlMgPoqHobUZzS
         jBDXx0meW3bgq66BcNIMztDlpu4jFVoW7cKXtRzWh7lxRS3L6o8ADEJlTSRaR49nEmNq
         GutgjGdNwErzab/d0kU6M/9O/ssYR64XDLuYu6xi5AGbjarVmrpL0O39fP/fJI+cZPyw
         jcaA==
X-Forwarded-Encrypted: i=1; AJvYcCVgWHB0KAOsV1mWU5DbtGTqsUVx/As60kghZ3zaH1cY6dJs1UNLL7VOmTlhYjq2+seqkRbbLdV/9yvAfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDndwtOB/Q2yDUfp/HtuflP2UqoiYmDThx8O6UMS64EbttPSUK
	d0/H3wT291DpNVms7bp26j0IInQhNfummK4E8vL9mQCpovc84oOosRGbmRi/LsgGXtLMQTGDYP0
	LurcxvXvagthLXTYY0Xaz3UHSAXKVPr/kzkq0JPybkzyFs+V3XxGgWgjjz60=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1745:b0:663:b2a:60e6 with SMTP id
 006d021491bc7-66d0d6dc721mr3224218eaf.81.1770513323866; Sat, 07 Feb 2026
 17:15:23 -0800 (PST)
Date: Sat, 07 Feb 2026 17:15:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6987e3ab.050a0220.3b3015.0052.GAE@google.com>
Subject: [syzbot] [media?] KMSAN: uninit-value in dvbdmx_release_ts_feed
From: syzbot <syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9682a42d8ec8b05c];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52346-lists,linux-media=lfdr.de,01d4620886bee3db0e74];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,googlegroups.com:email]
X-Rspamd-Queue-Id: 839C41077D9
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    2687c848e578 x86/vmware: Fix hypercall clobbers
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bd1402580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9682a42d8ec8b05c
dashboard link: https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1154ab22580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1566fa5a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/915713ca8484/disk-2687c848.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9b87f40abe9d/vmlinux-2687c848.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d4744727b418/bzImage-2687c848.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com

dvb_demux: dvb_demux_feed_del: feed not in list (type=0 state=0 pid=ffff)
=====================================================
BUG: KMSAN: uninit-value in dvbdmx_release_ts_feed+0x198/0x290 drivers/media/dvb-core/dvb_demux.c:858
 dvbdmx_release_ts_feed+0x198/0x290 drivers/media/dvb-core/dvb_demux.c:858
 dvb_dmxdev_start_feed drivers/media/dvb-core/dmxdev.c:-1 [inline]
 dvb_dmxdev_filter_start+0x1187/0x1af0 drivers/media/dvb-core/dmxdev.c:766
 dvb_dmxdev_pes_filter_set+0x810/0x860 drivers/media/dvb-core/dmxdev.c:963
 dvb_demux_do_ioctl+0x9a3/0xc80 drivers/media/dvb-core/dmxdev.c:1077
 dvb_usercopy+0x263/0x500 drivers/media/dvb-core/dvbdev.c:999
 dvb_demux_ioctl+0x46/0x70 drivers/media/dvb-core/dmxdev.c:1186
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:583
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:583
 x64_sys_call+0x18a7/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 __alloc_frozen_pages_noprof+0x6df/0xf50 mm/page_alloc.c:5263
 alloc_pages_mpol+0x328/0x860 mm/mempolicy.c:2486
 alloc_frozen_pages_noprof mm/mempolicy.c:2557 [inline]
 alloc_pages_noprof+0x101/0x280 mm/mempolicy.c:2577
 vm_area_alloc_pages mm/vmalloc.c:3649 [inline]
 __vmalloc_area_node mm/vmalloc.c:3863 [inline]
 __vmalloc_node_range_noprof+0xa97/0x2d80 mm/vmalloc.c:4051
 __vmalloc_node_noprof mm/vmalloc.c:4111 [inline]
 __vmalloc_noprof+0x128/0x1f0 mm/vmalloc.c:4127
 __vmalloc_array_noprof mm/util.c:633 [inline]
 vmalloc_array_noprof+0x48/0x80 mm/util.c:644
 dvb_dmx_init+0x121/0x930 drivers/media/dvb-core/dvb_demux.c:1253
 vidtv_bridge_dmx_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:334 [inline]
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:441 [inline]
 vidtv_bridge_probe+0x1b1f/0x2690 drivers/media/test-drivers/vidtv/vidtv_bridge.c:508
 platform_probe+0x213/0x370 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d5/0xe40 drivers/base/dd.c:661
 __driver_probe_device+0x25e/0x370 drivers/base/dd.c:803
 driver_probe_device+0x70/0x8f0 drivers/base/dd.c:833
 __driver_attach+0x53e/0xaa0 drivers/base/dd.c:1227
 bus_for_each_dev+0x33b/0x580 drivers/base/bus.c:383
 driver_attach+0x51/0x70 drivers/base/dd.c:1245
 bus_add_driver+0x54f/0xdb0 drivers/base/bus.c:715
 driver_register+0x42e/0x6a0 drivers/base/driver.c:249
 __platform_driver_register+0x65/0x80 drivers/base/platform.c:908
 vidtv_bridge_init+0x73/0x100 drivers/media/test-drivers/vidtv/vidtv_bridge.c:598
 do_one_initcall+0x22b/0xad0 init/main.c:1378
 do_initcall_level+0x157/0x2e0 init/main.c:1440
 do_initcalls+0x176/0x310 init/main.c:1456
 do_basic_setup+0x1d/0x30 init/main.c:1475
 kernel_init_freeable+0x213/0x430 init/main.c:1688
 kernel_init+0x2f/0x5e0 init/main.c:1578
 ret_from_fork+0x207/0x6f0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

CPU: 0 UID: 0 PID: 6181 Comm: syz.1.40 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
=====================================================


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

