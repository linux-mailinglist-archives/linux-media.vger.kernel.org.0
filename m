Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F7C2C1837
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 23:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730654AbgKWWJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 17:09:09 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:51166 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729245AbgKWWJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 17:09:08 -0500
Received: by mail-il1-f199.google.com with SMTP id f66so15211397ilh.17
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 14:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=caP/9ExrfOY7XEzrfGGpYNPs+VW3sZCEVDpLxRF9vvo=;
        b=F0zsf9rywkETHfPpbfh3C5Mb9qcJ913UIAENBYcz1unObGZX8f6JYKqr1oM0eE9IHq
         H7vgMVI/bmh8HEMJflOmQtodH9inAohXx2k8E9J3Bju1PQyFzRfdWwqMqp2gtXX8XIRq
         v3QcDO/87Q+IcMk2jTBFe5wDaODlEv6Yyui2P0VV4Iocp4IKd3CDDH+oR4atgjjDOzdU
         CeQeha+zYi/bG+9wUzwdywkCKdBmszKVMOyWA156SnaZY7YjC2zNpDfSYYpFQ/0ac9Op
         +cKp2kU6iWnKxdx1jvWbIz9gnwQ3e3V/UiyK9b1+MdFc7uPGhJUSeG+QHbQ8l+uUQwnf
         vDgA==
X-Gm-Message-State: AOAM532V7/xwSdmD5Hc54dNQLwJ/rcrP2O9iIigu+lg1KkXtm8uQJGl0
        W245ziBUdqsc5pqoAbZbul5qu//4FXfz8aJ/FN9/bFH4Lo6T
X-Google-Smtp-Source: ABdhPJz9uC9QLjC9tYyYlazyjWcjxBpEFBELqgCffIc09+xXtVgQdrzUmXItpue7sCLglrD16A1k1hvWuqiABlD0xrg0AhdXM4XT
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:ead:: with SMTP id u13mr1689673ilj.152.1606169345612;
 Mon, 23 Nov 2020 14:09:05 -0800 (PST)
Date:   Mon, 23 Nov 2020 14:09:05 -0800
In-Reply-To: <20201123215345.GA721643@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b629f05b4cd7124@google.com>
Subject: Re: memory leak in hub_event
From:   syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in rxrpc_lookup_local

BUG: memory leak
unreferenced object 0xffff888117ab9900 (size 256):
  comm "syz-executor.0", pid 8883, jiffies 4294943811 (age 433.620s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 80 cb 17 81 88 ff ff  ................
  backtrace:
    [<000000009003383a>] kmalloc include/linux/slab.h:552 [inline]
    [<000000009003383a>] kzalloc include/linux/slab.h:664 [inline]
    [<000000009003383a>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<000000009003383a>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<00000000609410d3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000661f73ad>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<00000000e3eb5768>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<000000002c6bf109>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000009ce0aa62>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<00000000db8c8dc2>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<00000000b04b70a8>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<000000005dc01eb8>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000422ec6bd>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000042f77bee>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000042f77bee>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000042f77bee>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000e58e69f9>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000000a67195e>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888117d40d00 (size 256):
  comm "syz-executor.1", pid 8884, jiffies 4294943812 (age 433.610s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 c0 ac 17 81 88 ff ff  ................
  backtrace:
    [<000000009003383a>] kmalloc include/linux/slab.h:552 [inline]
    [<000000009003383a>] kzalloc include/linux/slab.h:664 [inline]
    [<000000009003383a>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<000000009003383a>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<00000000609410d3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000661f73ad>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<00000000e3eb5768>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<000000002c6bf109>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000009ce0aa62>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<00000000db8c8dc2>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<00000000b04b70a8>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<000000005dc01eb8>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000422ec6bd>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000042f77bee>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000042f77bee>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000042f77bee>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000e58e69f9>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000000a67195e>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888118236900 (size 256):
  comm "syz-executor.2", pid 8894, jiffies 4294943830 (age 433.430s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 00 34 18 81 88 ff ff  ..........4.....
  backtrace:
    [<000000009003383a>] kmalloc include/linux/slab.h:552 [inline]
    [<000000009003383a>] kzalloc include/linux/slab.h:664 [inline]
    [<000000009003383a>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<000000009003383a>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<00000000609410d3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000661f73ad>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<00000000e3eb5768>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<000000002c6bf109>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000009ce0aa62>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<00000000db8c8dc2>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<00000000b04b70a8>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<000000005dc01eb8>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000422ec6bd>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000042f77bee>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000042f77bee>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000042f77bee>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000e58e69f9>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000000a67195e>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff8881170d5400 (size 256):
  comm "syz-executor.3", pid 8888, jiffies 4294943833 (age 433.400s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 40 35 18 81 88 ff ff  .........@5.....
  backtrace:
    [<000000009003383a>] kmalloc include/linux/slab.h:552 [inline]
    [<000000009003383a>] kzalloc include/linux/slab.h:664 [inline]
    [<000000009003383a>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<000000009003383a>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<00000000609410d3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000661f73ad>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<00000000e3eb5768>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<000000002c6bf109>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000009ce0aa62>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<00000000db8c8dc2>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<00000000b04b70a8>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<000000005dc01eb8>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000422ec6bd>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000042f77bee>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000042f77bee>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000042f77bee>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000e58e69f9>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000000a67195e>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory


Tested on:

commit:         4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=123a6611500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29e92cdfa2687df
dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11c4e969500000

