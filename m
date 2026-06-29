Return-Path: <linux-media+bounces-65838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZwZcLnoQQmqQzgkAu9opvQ
	(envelope-from <linux-media+bounces-65838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:28:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E86D655F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:28:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XUoHVk1I;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65838-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65838-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 861B1301186B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 06:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6378396D03;
	Mon, 29 Jun 2026 06:27:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DDA389107;
	Mon, 29 Jun 2026 06:27:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782714475; cv=none; b=KN6eS0hUuiTJLd9cvNyHJYY/L4js3Cx76DYzCZTNbQDmwIn44BumrqbRXxGcju3J0/KXhQ1PCk/CsTEzfCytWNzOOkxV4CALlSiKShhFHwf2YMy/fUjKhMq3TpSjDsIylCorYWLGUnJzt32tCSu10GlkSNSRkvASPJSft7EgFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782714475; c=relaxed/simple;
	bh=CEoNdJbM+G0EYznPjnQPpoh429ZsOMIvdd62gxFGavs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMVOXBIFbFl0+XbG4Ubb1MafbF+8KiFN5j/MqP/punyjIKqtulCpcuf+AH1HMkBHce3nn6RvxbYhlrtHjh2V/uazwlwdwl1HZRtbNX1HTpEtwaWn/YNnDD1pkp0PPJOilz2R4l2MXBB1yscKBO05cZ6BbzbNPGnSA2E2TqjczMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUoHVk1I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E361F000E9;
	Mon, 29 Jun 2026 06:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782714473;
	bh=8diiuVvstmh7e4zfvwC2TUp3d+EiAMlelXELW0j1hjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XUoHVk1IkDHpBf/rl1gBmvmCwGQXinaUwLcSEq8EvP3XGURvE/T00WCGDMaDt9/Ha
	 ClQlj6YrvXnwFi6pa2mQYOM69K0jgcIK24NBAjAk1+JOm9DWkAutR2dsUeNNtxdbOS
	 gq6WMK/Zz9vb8+mVM4lzCx0LF/BC84Lgwd/AsqDWo8s/l9nG/cgz1D+Fus+SQXB8qq
	 dQ3FWrXaWWDEyfbHi5nHuqSMBPSjfaebnbmkQU+g27mXs33Jn4cPRbf/4AiRWt25Ro
	 LeieO9Rj3+pCr4LnifXrjcDB2MgHMmur19W0Ki1FDuerhlZKi1gNC92u45zL7+GBLo
	 4azJoKnYhHOwQ==
Message-ID: <85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
Date: Mon, 29 Jun 2026 08:27:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING in usb_free_urb
To: sanan.hasanou@gmail.com, vbabka@suse.cz, akpm@linux-foundation.org,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: syzkaller@googlegroups.com, contact@pgazz.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sanan.hasanou@gmail.com,m:vbabka@suse.cz,m:akpm@linux-foundation.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:harry.yoo@oracle.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,m:contact@pgazz.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:sananhasanou@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vbabka@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,suse.cz,linux-foundation.org,gentwo.org,google.com,linux.dev,oracle.com,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65838-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 305E86D655F

On 6/26/26 23:27, sanan.hasanou@gmail.com wrote:
> Good day, dear maintainers,
> 
> We found a bug using a modified version of syzkaller.

Subject says "usb_free_urb" but you only CC'd slab maintainers, where slab
slab is most likely a victim here of e.g. double kfree() or a kfree() of
otherwise broken pointer.

Ccing USB and EM28XX maintainers. But they can feel free to ignore this per
the next point.

> Kernel Branch: 7.0-rc1

Why use such a version for fuzzing? rc1 will have many bugs that are already
fixed in 7.0 final. And it's not even latest, 7.1 was released 2 weeks ago too.

> Kernel Config: <https://drive.google.com/open?id=1zJHAs5GUroGFBkxAlzfDaWAd_NVPZTfJ>
> Unfortunately, we don't have any reproducer for this bug yet.
> Thank you!
> 
> Best regards,
> Sanan Hasanov
> 
> 179683 pages reserved
> 0 pages cma reserved
> Memory cgroup min protection 0kB -- low protection 0kB
> ------------[ cut here ]------------
> !PageLargeKmalloc(page)
> WARNING: mm/slub.c:6352 at free_large_kmalloc+0xb3/0x160 mm/slub.c:6352, CPU#1: kworker/1:4/12317

A kfree() was attempted on a pointer that's neither from a slab page nor a
large kmalloc page. Might be double free or corrupted.

> Modules linked in:
> CPU: 1 UID: 0 PID: 12317 Comm: kworker/1:4 Tainted: G             L      7.0.0-rc1 #1 PREEMPT(full) 
> Tainted: [L]=SOFTLOCKUP
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: events request_module_async
> RIP: 0010:free_large_kmalloc+0xb3/0x160 mm/slub.c:6352
> Code: 25 00 00 00 ff 3d 00 00 00 f8 0f 85 a6 00 00 00 c7 43 30 ff ff ff ff 48 89 df 44 89 f6 e8 45 d9 fc ff 5b 41 5e 41 5f 5d c3 90 <0f> 0b 90 48 89 df 48 c7 c6 b7 4c 72 8d e8 cb e8 08 ff eb e4 90 0f
> RSP: 0018:ffffc900028e76f8 EFLAGS: 00010287
> RAX: 00000000f0000000 RBX: ffffea00019a5c00 RCX: ffff888067550001
> RDX: 0000000000000000 RSI: ffff888066970000 RDI: ffffea00019a5c00
> RBP: ffffc900028e7710 R08: ffff888049c40603 R09: 1ffff110093880c0
> R10: dffffc0000000000 R11: ffffed10093880c1 R12: ffff888066970000
> R13: ffffffff870bc0f1 R14: 0000000000000000 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8880ef136000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fba7e4bf008 CR3: 000000005776b000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  kfree+0xae/0x630 mm/slub.c:6437
>  urb_destroy drivers/usb/core/urb.c:25 [inline]

static void urb_destroy(struct kref *kref)
{
        struct urb *urb = to_urb(kref);

        if (urb->transfer_flags & URB_FREE_BUFFER)
                kfree(urb->transfer_buffer);  <--- this one

        kfree(urb);
}

>  kref_put include/linux/kref.h:65 [inline]
>  usb_free_urb+0xd1/0x120 drivers/usb/core/urb.c:96

USB layer itself is likely also not the root cause.

>  em28xx_uninit_usb_xfer+0x165/0x310 drivers/media/usb/em28xx/em28xx-core.c:833
>  em28xx_alloc_urbs+0xf2a/0x1130 drivers/media/usb/em28xx/em28xx-core.c:-1
>  em28xx_dvb_init+0x2b0/0x4a20 drivers/media/usb/em28xx/em28xx-dvb.c:-1
>  em28xx_init_extension+0x121/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1117

So it might be this driver doing something wrong?

>  request_module_async+0x5e/0x80 drivers/media/usb/em28xx/em28xx-cards.c:3457
>  process_one_work kernel/workqueue.c:3275 [inline]
>  process_scheduled_works+0xae1/0x1800 kernel/workqueue.c:3358
>  worker_thread+0xa0f/0xf70 kernel/workqueue.c:3439
>  kthread+0x37d/0x470 kernel/kthread.c:467
>  ret_from_fork+0x507/0xb90 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245
>  </TASK>
> 
> <<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>
> 
> Modules linked in:
> CPU: 1 UID: 0 PID: 12317 Comm: kworker/1:4 Tainted: G             L      7.0.0-rc1 #1 PREEMPT(full) 
> Tainted: [L]=SOFTLOCKUP
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: events request_module_async
> RIP: 0010:free_large_kmalloc+0xb3/0x160
> Code: 25 00 00 00 ff 3d 00 00 00 f8 0f 85 a6 00 00 00 c7 43 30 ff ff ff ff 48 89 df 44 89 f6 e8 45 d9 fc ff 5b 41 5e 41 5f 5d c3 90 <0f> 0b 90 48 89 df 48 c7 c6 b7 4c 72 8d e8 cb e8 08 ff eb e4 90 0f
> RSP: 0018:ffffc900028e76f8 EFLAGS: 00010287
> RAX: 00000000f0000000 RBX: ffffea00019a5c00 RCX: ffff888067550001
> RDX: 0000000000000000 RSI: ffff888066970000 RDI: ffffea00019a5c00
> RBP: ffffc900028e7710 R08: ffff888049c40603 R09: 1ffff110093880c0
> R10: dffffc0000000000 R11: ffffed10093880c1 R12: ffff888066970000
> R13: ffffffff870bc0f1 R14: 0000000000000000 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8880ef136000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fba7e4bf008 CR3: 000000005776b000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  kfree+0xae/0x630
>  usb_free_urb+0xd1/0x120
>  em28xx_uninit_usb_xfer+0x165/0x310
>  em28xx_alloc_urbs+0xf2a/0x1130
>  em28xx_dvb_init+0x2b0/0x4a20
>  em28xx_init_extension+0x121/0x1d0
>  request_module_async+0x5e/0x80
>  process_scheduled_works+0xae1/0x1800
>  worker_thread+0xa0f/0xf70
>  kthread+0x37d/0x470
>  ret_from_fork+0x507/0xb90
>  ret_from_fork_asm+0x11/0x20
>  </TASK>
> Kernel panic - not syncing: kernel: panic_on_warn set ...
> CPU: 1 UID: 0 PID: 12317 Comm: kworker/1:4 Tainted: G             L      7.0.0-rc1 #1 PREEMPT(full) 
> Tainted: [L]=SOFTLOCKUP
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: events request_module_async
> Call Trace:
>  <TASK>
>  __dump_stack+0x21/0x30
>  dump_stack_lvl+0x2b/0x150
>  dump_stack+0x19/0x20
>  vpanic+0x53e/0xa20
>  panic+0xb9/0xc0
>  __warn+0x320/0x500
>  __report_bug+0x28d/0x500
>  report_bug+0x175/0x220
>  handle_bug+0x9c/0x200
>  exc_invalid_op+0x1f/0x50
>  asm_exc_invalid_op+0x1f/0x30
> RIP: 0010:free_large_kmalloc+0xb3/0x160
> Code: 25 00 00 00 ff 3d 00 00 00 f8 0f 85 a6 00 00 00 c7 43 30 ff ff ff ff 48 89 df 44 89 f6 e8 45 d9 fc ff 5b 41 5e 41 5f 5d c3 90 <0f> 0b 90 48 89 df 48 c7 c6 b7 4c 72 8d e8 cb e8 08 ff eb e4 90 0f
> RSP: 0018:ffffc900028e76f8 EFLAGS: 00010287
> RAX: 00000000f0000000 RBX: ffffea00019a5c00 RCX: ffff888067550001
> RDX: 0000000000000000 RSI: ffff888066970000 RDI: ffffea00019a5c00
> RBP: ffffc900028e7710 R08: ffff888049c40603 R09: 1ffff110093880c0
> R10: dffffc0000000000 R11: ffffed10093880c1 R12: ffff888066970000
> R13: ffffffff870bc0f1 R14: 0000000000000000 R15: dffffc0000000000
>  kfree+0xae/0x630
>  usb_free_urb+0xd1/0x120
>  em28xx_uninit_usb_xfer+0x165/0x310
>  em28xx_alloc_urbs+0xf2a/0x1130
>  em28xx_dvb_init+0x2b0/0x4a20
>  em28xx_init_extension+0x121/0x1d0
>  request_module_async+0x5e/0x80
>  process_scheduled_works+0xae1/0x1800
>  worker_thread+0xa0f/0xf70
>  kthread+0x37d/0x470
>  ret_from_fork+0x507/0xb90
>  ret_from_fork_asm+0x11/0x20
>  </TASK>
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
> 
> <<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>


