Return-Path: <linux-media+bounces-56535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC46HLRUvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:07:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA9D2DB96C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53FF530244F2
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D496389DE0;
	Fri, 20 Mar 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="e5w9v6Bc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cWEQhjO/"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE1282F16
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774015636; cv=none; b=ov1XokIOB9Tdcv9qaE6wXHx1xn1FF7HVV4yn5VFe1LRrb3w2An6uiRKt0ywzmGf1WUGdXnfJCCL80Jd3+/WiuoBb1RgTTEd+Vi9zHD/ZKx3I8aPcfBsZrd6Vok28xXPBSHWx6kJiumAtHbvGjQ3rb5O1Fx4lzJIliCH458fS+pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774015636; c=relaxed/simple;
	bh=BpQP+ODdwe/Pd/Dp3f7SeHQh+ZYA/8XWWMtJNCxN9Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkNaEPYeW7f3GYHhE6disa7ldWWcp69zldxTqPA67IU/+H4Pxp8XxhQfY1IriZ+e7xLlJ/9gR0FALlwePYQB6/8QBh0O3YROKe7pHFJzmOWxvZl+4WR/vx8hwwqVcfSXvE6f5UhTOBLn9Ue8zoK2rGmaTAEsTzPh5NvDQDajiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=e5w9v6Bc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cWEQhjO/; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 6CAA51D001A0;
	Fri, 20 Mar 2026 10:07:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 20 Mar 2026 10:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774015633;
	 x=1774102033; bh=Q2BqdCd9QLN4/TH4yhEq2fcI6Fck3ofWAIVYrYf5TbY=; b=
	e5w9v6BclyClhChzuwWRMRTaudxrdrOD03IY5i7nOcchiwi7/3CunfsZpImA3XTS
	cW2/WnvctJsL2a6IxvvxJjw1YHlJ42SA0ZHE2Tt1idgjqlix0p5M2/D/UEKUeUdw
	ZgaKjV9Z7J4+iitwYaILRGNdJxXHgA/jytRxrnvKJqu/Zv8+YejdtX6BkvDB4BpT
	zExbdkyyH4MD7JUvK/klCIhoS76PGqZ4d3moIvnHFrnVhC70jR1g9C3ll/tTSPlD
	jv8rhknunhX/nedH0u/sZLGTH8w+Sm+Ko1SNc2Nz2nqbUPlVyrHgr7fzbPCf7Y4L
	QQDl8pf97H5MoCq2tAej9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774015633; x=1774102033; bh=Q2BqdCd9QLN4/TH4yhEq2fcI6Fck3ofWAIV
	YrYf5TbY=; b=cWEQhjO/YbDxB+LzkbShmrzGX1cNjyZi4LJkU3KB0MI8O48260z
	XIrab7BGfAtLzZq+ibMJYwDdaA/3jJlptiyVatYZOr2mL1+77lk1eqv+ePV+vIg4
	CPRHoAbRbBPqWGErqCjpK1kKS6qA6p2DRIfQHFe/e7hWVhN22f4RhMVof04UlpH0
	JEnlTPFjhEBz8HXork72opspP3E+QAPeWsluJdcTV+JrMxoQYBxYF3NOX43FqJx4
	16BqCv//89//RwkGaTQhs62j22howkmtL034U/bkduQ8jXH6HkaRfiXTgU6X4NRS
	zIM+CC7uRJnUjJt8OpyGHm4ErY1TPPXOtAw==
X-ME-Sender: <xms:kVS9aanHjLK0Vg4RSPsHCCMcnEPCSOLpACJ6JTI3VsU-kMyFrn5urw>
    <xme:kVS9aYu_SzrbjVGqr_2W-IlCmnZFrgMU-RuDRRONPMF_PBH_sSImrlSW_iRRQYSZ9
    aMUveFZORzlRjP9vmlpm33Fp5_OQ_dqUvRNkzxzfaq2M6BBBw>
X-ME-Received: <xmr:kVS9aQ8DjqGRTEFyAYLycy3dmFFsD0c047exbpKhgZQnv9xpOsTjapi69Mb6YEbrwTNXzA4cO6Yi-OSmCiE9_xwrSjBI0S5Jnnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddttdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeluddv
    keejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehhrghrrhihrdihohhosehorhgrtghlvgdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    ohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvug
    hirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmhes
    khhvrggtkhdrohhrgh
X-ME-Proxy: <xmx:kVS9aaPxq7k_OxW_zxgDJGl6zokOLwYqnL5cgI7QASTbywRcEZX0DA>
    <xmx:kVS9aWERqNov4rKBJyf36e23GqOzxC5FBtTgHljSohmNrSEsA1RVVA>
    <xmx:kVS9aQTmlEDiQgGvIBSwMRTQPOYFVgkn6fPu2c9hqU_1OWFHiw92-w>
    <xmx:kVS9abvP9h-L6P9kmBZWsCYp16Z5b4Hh2F0QXJ1h9IYZ_U0Vc7AmQg>
    <xmx:kVS9aelnpTgEHwNXAGstjufhOOPd9aNkvXruC3WfLoskS_m2ebExdum3>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 10:07:11 -0400 (EDT)
Date: Fri, 20 Mar 2026 15:07:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?
Message-ID: <ab1Ujqcsv4Eh1vIa@mail-itl>
References: <abtAylIlW3I8s1T-@mail-itl>
 <abycbXzYupZpGkvR@hyeyoo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="//6XU5Z0NrL/kxgj"
Content-Disposition: inline
In-Reply-To: <abycbXzYupZpGkvR@hyeyoo>
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56535-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim]
X-Rspamd-Queue-Id: DAA9D2DB96C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--//6XU5Z0NrL/kxgj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Mar 2026 15:07:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?

On Fri, Mar 20, 2026 at 10:01:33AM +0900, Harry Yoo wrote:
> On Thu, Mar 19, 2026 at 01:18:18AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hello,
> >=20
> > When testing 7.0-rc4 (and also got it with 7.0-rc1), I got page
> > allocation failure in uvcvideo when using v4l2 camera in a VM. The setup
> > is rather memory constrained - it's a HVM with just 300MB of memory
> > running on Xen, with PCI passthrough of USB controllers (to which an USB
> > camera is connected). But the very same setup works just fine with older
> > kernel (last known good is 6.19.5, built with the same config).
>=20
> Could you please share what /proc/meminfo looks like on v6.19, and
> also enable memory allocation profiling feature [1] and see
> what has changed between v6.19 and v7.0?
>=20
> On v6.19, you should be able to see how much memory is allocated by
> reading /proc/allocinfo.
>=20
> On v7.0-rc4, warn_alloc() should let memory allocation profiling
> print top users.
>=20
> [1] https://docs.kernel.org/mm/allocation-profiling.html

Thanks, this got me some more info (below). That said, I think I spoke
too soon about 6.19.5 - the page allocation failure happens there too,
just without follow up crash, and v4l2 generally works afterwards (maybe
few initial frames got lost? not sure) - so, I haven't noticed it
before. So, it doesn't look like increased memory usage anymore.

The message:

[   30.986973] v4l2src0:src: page allocation failure: order:5, mode:0xcc0(G=
FP_KERNEL), nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
[   30.987035] CPU: 1 UID: 1000 PID: 1256 Comm: v4l2src0:src Not tainted 6.=
19.5-1.qubes.42.fc41.x86_64 #1 PREEMPT(full)=20
[   30.987038] Hardware name: Xen HVM domU, BIOS 4.19.4 02/20/2026
[   30.987039] Call Trace:
[   30.987041]  <TASK>
[   30.987044]  dump_stack_lvl+0x5d/0x80
[   30.987049]  warn_alloc+0x162/0x190
[   30.987052]  ? __alloc_pages_direct_compact+0x1bc/0x220
[   30.987054]  __alloc_pages_slowpath.constprop.0+0x566/0x9b0
[   30.987056]  ? kernfs_next_descendant_post+0x1b/0xe0
[   30.987059]  __alloc_frozen_pages_noprof+0x31b/0x330
[   30.987062]  __alloc_pages_noprof+0xe/0x20
[   30.987063]  __dma_direct_alloc_pages.isra.0+0x1b2/0x3b0
[   30.987066]  dma_direct_alloc_pages+0x3f/0x190
[   30.987068]  alloc_single_sgt+0x12a/0x200
[   30.987071]  dma_alloc_noncontiguous+0x49/0x150
[   30.987074]  usb_alloc_noncoherent+0x45/0xa0
[   30.987079]  uvc_alloc_urb_buffers.part.0+0x95/0x130 [uvcvideo]
[   30.987092]  uvc_video_start_transfer+0x19d/0x4e0 [uvcvideo]
[   30.987100]  uvc_video_start_streaming+0x9c/0x140 [uvcvideo]
[   30.987107]  uvc_start_streaming_video+0x58/0x100 [uvcvideo]
[   30.987116]  vb2_start_streaming+0x63/0x130 [videobuf2_common]
[   30.987123]  vb2_core_streamon+0x98/0xf0 [videobuf2_common]
[   30.987128]  ? vb2_ioctl_streamon+0x15/0x60 [videobuf2_v4l2]
[   30.987133]  __video_do_ioctl+0x419/0x540 [videodev]
[   30.987155]  video_usercopy+0x286/0x690 [videodev]
[   30.987168]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
[   30.987181]  v4l2_ioctl+0x6b/0xa0 [videodev]
[   30.987194]  __x64_sys_ioctl+0x96/0xe0
[   30.987198]  do_syscall_64+0x84/0x6c0
[   30.987201]  ? __handle_mm_fault+0x470/0x700
[   30.987204]  ? count_memcg_events+0xdd/0x1a0
[   30.987207]  ? handle_mm_fault+0x220/0x340
[   30.987209]  ? do_user_addr_fault+0x2c3/0x7f0
[   30.987212]  ? irqentry_exit+0x7a/0x510
[   30.987214]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   30.987216] RIP: 0033:0x7953bd8838db
[   30.987219] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   30.987220] RSP: 002b:00007953abffea90 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[   30.987222] RAX: ffffffffffffffda RBX: 00007953a0008620 RCX: 00007953bd8=
838db
[   30.987224] RDX: 000000002f404da0 RSI: 0000000040045612 RDI: 00000000000=
00013
[   30.987225] RBP: 000000002f404d90 R08: 00007953a000a9e0 R09: 00000000000=
00040
[   30.987225] R10: 00007953a000aa10 R11: 0000000000000246 R12: 00000000000=
00000
[   30.987226] R13: 00007953a0008638 R14: 0000000000000004 R15: 00007953a00=
08620
[   30.987228]  </TASK>
[   30.987263] Mem-Info:
[   30.987939] active_anon:3060 inactive_anon:1925 isolated_anon:0
[   30.987939]  active_file:5208 inactive_file:3901 isolated_file:0
[   30.987939]  unevictable:0 dirty:8 writeback:0
[   30.987939]  slab_reclaimable:2569 slab_unreclaimable:12482
[   30.987939]  mapped:5743 shmem:33 pagetables:1341
[   30.987939]  sec_pagetables:0 bounce:0
[   30.987939]  kernel_misc_reclaimable:0
[   30.987939]  free:2402 free_pcp:115 free_cma:0
[   30.988045] Node 0 active_anon:12240kB inactive_anon:7700kB active_file:=
20832kB inactive_file:15604kB unevictable:0kB isolated(anon):0kB isolated(f=
ile):0kB mapped:22972kB dirty:32kB writeback:0kB shmem:132kB shmem_thp:0kB =
shmem_pmdmapped:0kB anon_thp:0kB kernel_stack:3392kB pagetables:5364kB sec_=
pagetables:0kB all_unreclaimable? no Balloon:16384kB
[   30.988123] Node 0 DMA free:904kB boost:0kB min:132kB low:164kB high:196=
kB reserved_highatomic:0KB free_highatomic:0KB active_anon:1408kB inactive_=
anon:300kB active_file:368kB inactive_file:3664kB unevictable:0kB writepend=
ing:0kB zspages:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB =
free_pcp:0kB local_pcp:0kB free_cma:0kB
[   30.988199] lowmem_reserve[]: 0 194 194 194 194
[   30.988227] Node 0 DMA32 free:8704kB boost:0kB min:1716kB low:2144kB hig=
h:2572kB reserved_highatomic:0KB free_highatomic:0KB active_anon:10832kB in=
active_anon:7400kB active_file:20464kB inactive_file:11940kB unevictable:0k=
B writepending:32kB zspages:0kB present:274148kB managed:199276kB mlocked:0=
kB bounce:0kB free_pcp:456kB local_pcp:0kB free_cma:0kB
[   30.988305] lowmem_reserve[]: 0 0 0 0 0
[   30.988319] Node 0 DMA: 4*4kB (UM) 31*8kB (UM) 16*16kB (UM) 4*32kB (UM) =
4*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 904kB
[   30.988365] Node 0 DMA32: 604*4kB (UM) 524*8kB (UM) 108*16kB (UM) 10*32k=
B (UM) 1*64kB (U) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 87=
20kB
[   30.988422] Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=
=3D0 hugepages_size=3D1048576kB
[   30.988448] Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=
=3D0 hugepages_size=3D2048kB
[   30.988472] 11692 total pagecache pages
[   30.988483] 2568 pages in swap cache
[   30.988494] Free swap  =3D 891356kB
[   30.988505] Total swap =3D 1048572kB
[   30.988516] 72535 pages RAM
[   30.988524] 0 pages HighMem/MovableOnly
[   30.988535] 18876 pages reserved
[   30.988546] 0 pages cma reserved
[   30.988557] 0 pages hwpoisoned
[   30.988768] Memory allocations (profiling is currently turned on):
[   30.988789]     38.4 MiB     5505 mm/slub.c:3075 func:alloc_slab_page
[   30.988809]     33.0 MiB     8448 drivers/block/xen-blkfront.c:322 [xen_=
blkfront] func:fill_grant_buffer
[   30.988834]     31.9 MiB     7943 mm/readahead.c:189 func:ractl_alloc_fo=
lio
[   30.988852]     16.0 MiB     4096 drivers/xen/balloon.c:445 func:decreas=
e_reservation
[   30.988873]     15.9 MiB     4064 drivers/media/common/videobuf2/videobu=
f2-vmalloc.c:47 [videobuf2_vmalloc] func:vb2_vmalloc_alloc
[   30.988905]     11.4 MiB     2924 mm/swap_state.c:439 func:__read_swap_c=
ache_async
[   30.988926]     10.5 MiB     2904 mm/execmem.c:41 func:execmem_vmalloc
[   30.988944]     7.36 MiB      116 security/apparmor/policy_unpack.c:1361=
 func:compress_zstd
[   30.988966]     5.70 MiB      171 security/apparmor/policy_unpack.c:689 =
func:unpack_perms_table
[   30.989002]     5.57 MiB     1427 mm/memory.c:1191 func:folio_prealloc


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--//6XU5Z0NrL/kxgj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm9VI4ACgkQ24/THMrX
1yxduwf/YmHCA3W4ZxuHTfGjJ+xLZldvXmp4F67FR6irIq/s0eeI58GvdyDNOW7O
KEw2Hh/3g+tkjOW9aEI7uJHmY4X9BEJdULUqm9du41JYw2xo2mKpdnlXPRmDmvux
svbR0nCm7784jx65aXr8HugqXB27ZPLUZSFRo3e2TuS9svTSZH0yxLxb+SX0Y7BF
DRuLX6YOSpHiXJsuPgsP8vFF8JRHwmB5RJDySnKwXGr9331D6VEWRPTZbnvVzqDc
Do6i3KyOx+ZNcZT6dKw0AS888tHciCY2e18j0+/ThAPySCPSUjAHj6SB6ucmy1dv
YSDsXeAhwXKj8glNM2ltyvWTgNQo6w==
=Z7xE
-----END PGP SIGNATURE-----

--//6XU5Z0NrL/kxgj--

