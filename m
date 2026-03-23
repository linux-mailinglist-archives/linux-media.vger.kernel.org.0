Return-Path: <linux-media+bounces-56652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOToL4vFwGn+KgQAu9opvQ
	(envelope-from <linux-media+bounces-56652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 05:46:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA192EC87C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 05:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD2E3014676
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 04:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE2728BA95;
	Mon, 23 Mar 2026 04:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkfZ9gbN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134EB6F2F2
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 04:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241156; cv=none; b=GgwpVIuqLXv9H6qexD3KY8M/m3MQCgI0rFAd4BdQDXphpe4nCaink9TLXNhNjexXF0KVL8lCXTqBsQpFRAGAkmEsA9eHEReVggRv8JZWrr8ZeOK6E7DOTfzZr24JlJzLROi3sdQueAwXdf9taIsSZxvjtHFQP67LLT3mEBswOj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241156; c=relaxed/simple;
	bh=mMWNhNHzevdtgAYdabxVTnPKHePb+cvfQX+mJe9KXqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3ejrMWcTRzNr5vZp/2Xh4IXl1F8mOVYRLhWkdNgj4igBLQ4WYVVqDo9sQlrXhklLKQiVN3/RI9yYaCKeV0eM8Xlpuu2QGzddmNUYPCypDPBjcWI8UYKQY0KY0Z1usK1/29sJ9LPpAAC1szs8B7ilfKb4tac9uXJpSJdSn7gRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkfZ9gbN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D473C4CEF7;
	Mon, 23 Mar 2026 04:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774241155;
	bh=mMWNhNHzevdtgAYdabxVTnPKHePb+cvfQX+mJe9KXqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkfZ9gbNu+FxInAGdJFtfKAXvrSKb39fBw67qvvZmqm8Roz8h3U1tMfNuKPGulr73
	 QeQSjmzOH+k8scP+YM5+du/v8zeH6m8gboYnfOzdnc9mnL/RUUdE/HlNC7zDR+LphQ
	 ZVthCy3wpI4JTTcgyu/QqZHjVrULsA3W8MUGJt32k+8HO2xqym+8ZVcAtep5hmWZGl
	 E9GDlVP1ePZhe8saxvhmTVRaW+20cPFPPGV09WxsZ0GslFys3ZtVGvUwQNOZN2GzcL
	 0F7pmctuG5eL/ZgeafqKViffyL+hA9irQLD8tHxX8VkHLQVSIClatDtCvW/sUCWnAY
	 Rw2qgwqT84z4w==
Date: Mon, 23 Mar 2026 13:45:53 +0900
From: Harry Yoo <harry@kernel.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org
Subject: Re: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?
Message-ID: <acDFSf04Gqmk8lva@hyeyoo>
References: <abtAylIlW3I8s1T-@mail-itl>
 <abycbXzYupZpGkvR@hyeyoo>
 <ab1Ujqcsv4Eh1vIa@mail-itl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab1Ujqcsv4Eh1vIa@mail-itl>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56652-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EA192EC87C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 03:07:10PM +0100, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 20, 2026 at 10:01:33AM +0900, Harry Yoo wrote:
> > On Thu, Mar 19, 2026 at 01:18:18AM +0100, Marek Marczykowski-Górecki wrote:
> > > Hello,
> > > 
> > > When testing 7.0-rc4 (and also got it with 7.0-rc1), I got page
> > > allocation failure in uvcvideo when using v4l2 camera in a VM. The setup
> > > is rather memory constrained - it's a HVM with just 300MB of memory
> > > running on Xen, with PCI passthrough of USB controllers (to which an USB
> > > camera is connected). But the very same setup works just fine with older
> > > kernel (last known good is 6.19.5, built with the same config).
> > 
> > Could you please share what /proc/meminfo looks like on v6.19, and
> > also enable memory allocation profiling feature [1] and see
> > what has changed between v6.19 and v7.0?
> > 
> > On v6.19, you should be able to see how much memory is allocated by
> > reading /proc/allocinfo.
> > 
> > On v7.0-rc4, warn_alloc() should let memory allocation profiling
> > print top users.
> > 
> > [1] https://docs.kernel.org/mm/allocation-profiling.html
> 
> Thanks, this got me some more info (below). That said, I think I spoke
> too soon about 6.19.5 - the page allocation failure happens there too,
> just without follow up crash, and v4l2 generally works afterwards (maybe
> few initial frames got lost? not sure) - so, I haven't noticed it
> before. So, it doesn't look like increased memory usage anymore.

Oh ok. So the allocation failure has already been there and the only new
part is handling of the failure.

> The message:
> 
> [   30.986973] v4l2src0:src: page allocation failure: order:5, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
> [   30.987035] CPU: 1 UID: 1000 PID: 1256 Comm: v4l2src0:src Not tainted 6.19.5-1.qubes.42.fc41.x86_64 #1 PREEMPT(full) 
> [   30.987038] Hardware name: Xen HVM domU, BIOS 4.19.4 02/20/2026
> [   30.987039] Call Trace:
> [   30.987041]  <TASK>
> [   30.987044]  dump_stack_lvl+0x5d/0x80
> [   30.987049]  warn_alloc+0x162/0x190
> [   30.987052]  ? __alloc_pages_direct_compact+0x1bc/0x220
> [   30.987054]  __alloc_pages_slowpath.constprop.0+0x566/0x9b0
> [   30.987056]  ? kernfs_next_descendant_post+0x1b/0xe0
> [   30.987059]  __alloc_frozen_pages_noprof+0x31b/0x330
> [   30.987062]  __alloc_pages_noprof+0xe/0x20
> [   30.987063]  __dma_direct_alloc_pages.isra.0+0x1b2/0x3b0
> [   30.987066]  dma_direct_alloc_pages+0x3f/0x190
> [   30.987068]  alloc_single_sgt+0x12a/0x200
> [   30.987071]  dma_alloc_noncontiguous+0x49/0x150
> [   30.987074]  usb_alloc_noncoherent+0x45/0xa0
> [   30.987079]  uvc_alloc_urb_buffers.part.0+0x95/0x130 [uvcvideo]
> [   30.987092]  uvc_video_start_transfer+0x19d/0x4e0 [uvcvideo]
> [   30.987100]  uvc_video_start_streaming+0x9c/0x140 [uvcvideo]
> [   30.987107]  uvc_start_streaming_video+0x58/0x100 [uvcvideo]
> [   30.987116]  vb2_start_streaming+0x63/0x130 [videobuf2_common]
> [   30.987123]  vb2_core_streamon+0x98/0xf0 [videobuf2_common]
> [   30.987128]  ? vb2_ioctl_streamon+0x15/0x60 [videobuf2_v4l2]
> [   30.987133]  __video_do_ioctl+0x419/0x540 [videodev]
> [   30.987155]  video_usercopy+0x286/0x690 [videodev]
> [   30.987168]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
> [   30.987181]  v4l2_ioctl+0x6b/0xa0 [videodev]
> [   30.987194]  __x64_sys_ioctl+0x96/0xe0
> [   30.987198]  do_syscall_64+0x84/0x6c0
> [   30.987201]  ? __handle_mm_fault+0x470/0x700
> [   30.987204]  ? count_memcg_events+0xdd/0x1a0
> [   30.987207]  ? handle_mm_fault+0x220/0x340
> [   30.987209]  ? do_user_addr_fault+0x2c3/0x7f0
> [   30.987212]  ? irqentry_exit+0x7a/0x510
> [   30.987214]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   30.987216] RIP: 0033:0x7953bd8838db
> [   30.987219] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [   30.987220] RSP: 002b:00007953abffea90 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   30.987222] RAX: ffffffffffffffda RBX: 00007953a0008620 RCX: 00007953bd8838db
> [   30.987224] RDX: 000000002f404da0 RSI: 0000000040045612 RDI: 0000000000000013
> [   30.987225] RBP: 000000002f404d90 R08: 00007953a000a9e0 R09: 0000000000000040
> [   30.987225] R10: 00007953a000aa10 R11: 0000000000000246 R12: 0000000000000000
> [   30.987226] R13: 00007953a0008638 R14: 0000000000000004 R15: 00007953a0008620
> [   30.987228]  </TASK>
> [   30.987263] Mem-Info:
> [   30.987939] active_anon:3060 inactive_anon:1925 isolated_anon:0
> [   30.987939]  active_file:5208 inactive_file:3901 isolated_file:0
> [   30.987939]  unevictable:0 dirty:8 writeback:0
> [   30.987939]  slab_reclaimable:2569 slab_unreclaimable:12482
> [   30.987939]  mapped:5743 shmem:33 pagetables:1341
> [   30.987939]  sec_pagetables:0 bounce:0
> [   30.987939]  kernel_misc_reclaimable:0
> [   30.987939]  free:2402 free_pcp:115 free_cma:0

From 7.0.0:
    [  739.193907] Mem-Info:
    [  739.194897] active_anon:362 inactive_anon:3172 isolated_anon:0
    [  739.194897]  active_file:2498 inactive_file:11687 isolated_file:1
    [  739.194897]  unevictable:0 dirty:0 writeback:4
    [  739.194897]  slab_reclaimable:3707 slab_unreclaimable:10022
    [  739.194897]  mapped:4710 shmem:9 pagetables:1021
    [  739.194897]  sec_pagetables:0 bounce:0
    [  739.194897]  kernel_misc_reclaimable:0
    [  739.194897]  free:3452 free_pcp:1 free_cma:0

6.19.0->7.0.0:
{active,inactive,isolate}_anon: 4985 -> 3534 pages (- 5,804 KiB)
{active,inactive,isolated}_file: 9109 -> 13729 pages (+ 18,480 KiB)
anon+file: 14094 -> 17263 pages (+ 12,676 KiB)
slab_{reclaimable,unreclaimable}: 15051 -> 13729 pages (- 5,288 KiB)
free{,_pcp,_cma}: 2517 -> 3453 pages (+ 3,744 KiB)

Nothing surprising here.

-- 
Cheers,
Harry / Hyeonggon

> [   30.988045] Node 0 active_anon:12240kB inactive_anon:7700kB active_file:20832kB inactive_file:15604kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:22972kB dirty:32kB writeback:0kB shmem:132kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0kB kernel_stack:3392kB pagetables:5364kB sec_pagetables:0kB all_unreclaimable? no Balloon:16384kB
> [   30.988123] Node 0 DMA free:904kB boost:0kB min:132kB low:164kB high:196kB reserved_highatomic:0KB free_highatomic:0KB active_anon:1408kB inactive_anon:300kB active_file:368kB inactive_file:3664kB unevictable:0kB writepending:0kB zspages:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> [   30.988199] lowmem_reserve[]: 0 194 194 194 194
> [   30.988227] Node 0 DMA32 free:8704kB boost:0kB min:1716kB low:2144kB high:2572kB reserved_highatomic:0KB free_highatomic:0KB active_anon:10832kB inactive_anon:7400kB active_file:20464kB inactive_file:11940kB unevictable:0kB writepending:32kB zspages:0kB present:274148kB managed:199276kB mlocked:0kB bounce:0kB free_pcp:456kB local_pcp:0kB free_cma:0kB
> [   30.988305] lowmem_reserve[]: 0 0 0 0 0
> [   30.988319] Node 0 DMA: 4*4kB (UM) 31*8kB (UM) 16*16kB (UM) 4*32kB (UM) 4*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 904kB
> [   30.988365] Node 0 DMA32: 604*4kB (UM) 524*8kB (UM) 108*16kB (UM) 10*32kB (UM) 1*64kB (U) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 8720kB
> [   30.988422] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
> [   30.988448] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
> [   30.988472] 11692 total pagecache pages
> [   30.988483] 2568 pages in swap cache
> [   30.988494] Free swap  = 891356kB
> [   30.988505] Total swap = 1048572kB
> [   30.988516] 72535 pages RAM
> [   30.988524] 0 pages HighMem/MovableOnly
> [   30.988535] 18876 pages reserved
> [   30.988546] 0 pages cma reserved
> [   30.988557] 0 pages hwpoisoned
> [   30.988768] Memory allocations (profiling is currently turned on):
> [   30.988789]     38.4 MiB     5505 mm/slub.c:3075 func:alloc_slab_page
> [   30.988809]     33.0 MiB     8448 drivers/block/xen-blkfront.c:322 [xen_blkfront] func:fill_grant_buffer
> [   30.988834]     31.9 MiB     7943 mm/readahead.c:189 func:ractl_alloc_folio
> [   30.988852]     16.0 MiB     4096 drivers/xen/balloon.c:445 func:decrease_reservation
> [   30.988873]     15.9 MiB     4064 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47 [videobuf2_vmalloc] func:vb2_vmalloc_alloc
> [   30.988905]     11.4 MiB     2924 mm/swap_state.c:439 func:__read_swap_cache_async
> [   30.988926]     10.5 MiB     2904 mm/execmem.c:41 func:execmem_vmalloc
> [   30.988944]     7.36 MiB      116 security/apparmor/policy_unpack.c:1361 func:compress_zstd
> [   30.988966]     5.70 MiB      171 security/apparmor/policy_unpack.c:689 func:unpack_perms_table
> [   30.989002]     5.57 MiB     1427 mm/memory.c:1191 func:folio_prealloc

