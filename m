Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09CB2C24B2
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732852AbgKXLiv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:38:51 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47347 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731539AbgKXLiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:38:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id hWeik0w9LDuFjhWelkd1F1; Tue, 24 Nov 2020 12:38:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606217928; bh=sHbi/2KeT1EFxvwIn3BrHx507chG0pyiJyL2Q2MPja0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NCTsrmXFmTOrI+x0ciNj/VvfhemYW7gEnFu7ubjWkvLLzGIg4oRUbIEEeEU07Zunl
         lnq8V0p2E2X+tENle9rNqVP/lkG3cL/hmZfz07cP7QniSi6HTPQwWKX7oEu4CwyuQP
         Qfu7NnwvWkJOedsGYK/z3sf56u8/GCGLjnCEgD5R0786xcGCEWYN9Mk9ClipA0QXtv
         Re0EhBNwaYG8Ftr0jXmBlyq4ZQBM2+toCfnBctTyMCneH8B3meZn6E/fejoFf2Wcd2
         6LgICMKQZ4sFMJ/A1gB6k7ETD712secUQ2wadp40Q5QjfssDiBb13bWGzzkhAjcZCJ
         AokrjtOEOyFWA==
Subject: Re: memory leak in hub_event
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <20201123215345.GA721643@rowland.harvard.edu>
 <0000000000004b629f05b4cd7124@google.com>
 <20201123222428.GB721643@rowland.harvard.edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c2cf1a80-ec47-69ac-c3e2-1b0e32447ef2@xs4all.nl>
Date:   Tue, 24 Nov 2020 12:38:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123222428.GB721643@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOjyUnVEHvIHT2WcPlFP8kwIIjD1z5FINgl61SGmpqcuTCMHXKdEwCw2eRyZZU4adkiQVm6X4PpL1wZV3A/K3vaPSGKjlb90lBqjCgF/kmlsSFqcxtXj
 U2J51dMTl1RJL7jCiE/VTYxe4yvDgCZxKNJQ19QifpwDs1MCXaBlZG3dAKjOeizLgYsfpznYLEv2dVWZTSaWYH5wwQxYkJzPPg92MzyVZVxrKRzEFlVR+jPz
 0FVVD8aQIx7NqKTrBb2f2OQGqOK7Tw5ge6XBOjL+y1r9WwvMnbURdOa1bQ19b4awH0E4RTSNN8nv3cO41IWH+zLJHXhtEXIoMHKxfQ5ALw0xxNust+6SQUXP
 2YhdrS57limYwvQwK8aeqtMP8WTbS0D2dMWCICmHpkV+Sj0uffz6j+PJFRt4Q3vsRQx4r7ph
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2020 23:24, Alan Stern wrote:
> On Mon, Nov 23, 2020 at 02:09:05PM -0800, syzbot wrote:
>> Hello,
>>
>> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
>> memory leak in rxrpc_lookup_local
>>
>> BUG: memory leak
>> unreferenced object 0xffff888117ab9900 (size 256):
>>   comm "syz-executor.0", pid 8883, jiffies 4294943811 (age 433.620s)
>>   hex dump (first 32 bytes):
>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>     00 00 00 00 0a 00 00 00 00 80 cb 17 81 88 ff ff  ................
>>   backtrace:
>>     [<000000009003383a>] kmalloc include/linux/slab.h:552 [inline]
>>     [<000000009003383a>] kzalloc include/linux/slab.h:664 [inline]
>>     [<000000009003383a>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
>>     [<000000009003383a>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
>>     [<00000000609410d3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
>>     [<00000000661f73ad>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
>>     [<00000000e3eb5768>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
>>     [<000000002c6bf109>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
>>     [<000000009ce0aa62>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
>>     [<00000000db8c8dc2>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
>>     [<00000000b04b70a8>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
>>     [<000000005dc01eb8>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
>>     [<00000000422ec6bd>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
>>     [<0000000042f77bee>] __do_sys_unshare kernel/fork.c:3017 [inline]
>>     [<0000000042f77bee>] __se_sys_unshare kernel/fork.c:3015 [inline]
>>     [<0000000042f77bee>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
>>     [<00000000e58e69f9>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>>     [<000000000a67195e>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Okay, that confirms it.  This is a completely different memory leak, as 
> can be seen by comparing the stack trace with the previous one.  The 
> problem with the gspca driver is gone.
> 
> Mauro/Hans, what should I do with the patch?

Just post it to linux-media and I'll pick it up as gspca maintainer.

Regards,

	Hans
