Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E722C185A
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 23:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbgKWWYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 17:24:30 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49565 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728161AbgKWWYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 17:24:30 -0500
Received: (qmail 725082 invoked by uid 1000); 23 Nov 2020 17:24:28 -0500
Date:   Mon, 23 Nov 2020 17:24:28 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: memory leak in hub_event
Message-ID: <20201123222428.GB721643@rowland.harvard.edu>
References: <20201123215345.GA721643@rowland.harvard.edu>
 <0000000000004b629f05b4cd7124@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000004b629f05b4cd7124@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 23, 2020 at 02:09:05PM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> memory leak in rxrpc_lookup_local
> 
> BUG: memory leak
> unreferenced object 0xffff888117ab9900 (size 256):
>   comm "syz-executor.0", pid 8883, jiffies 4294943811 (age 433.620s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 0a 00 00 00 00 80 cb 17 81 88 ff ff  ................
>   backtrace:
>     [<000000009003383a>] kmalloc include/linux/slab.h:552 [inline]
>     [<000000009003383a>] kzalloc include/linux/slab.h:664 [inline]
>     [<000000009003383a>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
>     [<000000009003383a>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
>     [<00000000609410d3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
>     [<00000000661f73ad>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
>     [<00000000e3eb5768>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
>     [<000000002c6bf109>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
>     [<000000009ce0aa62>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
>     [<00000000db8c8dc2>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
>     [<00000000b04b70a8>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
>     [<000000005dc01eb8>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
>     [<00000000422ec6bd>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
>     [<0000000042f77bee>] __do_sys_unshare kernel/fork.c:3017 [inline]
>     [<0000000042f77bee>] __se_sys_unshare kernel/fork.c:3015 [inline]
>     [<0000000042f77bee>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
>     [<00000000e58e69f9>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>     [<000000000a67195e>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Okay, that confirms it.  This is a completely different memory leak, as 
can be seen by comparing the stack trace with the previous one.  The 
problem with the gspca driver is gone.

Mauro/Hans, what should I do with the patch?

Alan Stern
