Return-Path: <linux-media+bounces-56265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAzsJ/tAu2l6hgIAu9opvQ
	(envelope-from <linux-media+bounces-56265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:19:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC562C4124
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81B1830CD43D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9A91EE033;
	Thu, 19 Mar 2026 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="GXSW+aHD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PfCtjg6O"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E11F03D9
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 00:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773879505; cv=none; b=Xm6//S3I4NWZ6ewOGDzSqKGElIi7MS9D3dewbBmSW1pdPDH7Mfq3idNUAmlqZMxbe0G4oDdOBNrQuPHbw1ZzvHNnGrzYpyuT6gqedkfv1KIVxgE/g0GjU+3TEXBWx47ivHOwKvlJVEMymOMHFigP9Njqrs+QkH6LCASeTzbCkm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773879505; c=relaxed/simple;
	bh=rb7ieTPUZHZbljaJeXs7Ic0fLgCqnmmt7lqEIjsK1hA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGkTsT5MUfd5FRgxilaDa2rE8PutlJwJ8DL0XLGyIsb4wi/2pChdtX4Gf4afP/D/2/c/Q+rDR+v/zs/f0xgE/dtMGSmPUZxJwUKE0GRWlSzuGzpQDu7Y8NaTRZ4CZEx7kGs9Gm6pJcVeU3zJ366SiE+EGJZgLbdCSIjh7wtXpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=GXSW+aHD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PfCtjg6O; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DF96D7A0132;
	Wed, 18 Mar 2026 20:18:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 20:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1773879501; x=1773965901; bh=vo
	gDOcaouUKjSOrkTjKXRc3v47J5s1RdsAeBUjwoEug=; b=GXSW+aHDSiE7c6VIxh
	wNuWLKtGtfaE9sjV8xTfpgLlpcPxqtCV+fAnGdqEphe6/dOe049S9N4TW1iA4zib
	nnLnM0T1jvB2+Ad3uCXBEykXPv5z7mWSM+sGLuQnH68jlTnxsFE7A7UGExZvL5Yt
	Iu5g2OMN1Uv0W7fztKy5eo1XFszqmqA7Y93OTCSq7Gailf+Xj5QQPsgf6C/7FdP4
	8NZkO+gAl1hQRJ4eY8xb0A5llqDoqXDTsItwdw8qb4qF/psRogn+xY8s3sEO81Jp
	vt0wyiq/OP669tBSUit4YoniaL5hZzHdnIiCeOy458Me+2lP9M2aNuSp2fX/Y9Fl
	a+Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773879501; x=
	1773965901; bh=vogDOcaouUKjSOrkTjKXRc3v47J5s1RdsAeBUjwoEug=; b=P
	fCtjg6OB8V36//4vSwZDfxGdPUNJ91uzZMXP24ra2alVdtr0oPnv+/4CcvZlgPza
	EpcgOPho93VZt84x8b6f54qDufCbfwy/BI6Cg0lZQXg62+T8OMF4cpdqnN60JlA2
	K+9BYtIVm9BzuX/Zh1QuhVZ440HkmoP5ol5h+KI1nLfKH5rV6jlXUcubWX1t+nc5
	NusGPEwpHeiBd4gJEJx4CePhnWeYqn0a0fkheIVJbA2Mq96jesV4SifW3FX0SlBn
	us/Bmyas9+6fGoKW5yb/eaco1Z+wRT29qTJUdlAEnamcK0/DF/vNJ3TlO4jEqdfL
	cZrgighYV0oExmIzryGIw==
X-ME-Sender: <xms:zUC7aUih41nhw1keHEHTdNjcCRQ1lkMOkzDRwyu4ZEM5eVqK2QNQTA>
    <xme:zUC7aUAcYUohXmGR1M5nWQwFIUFRtYSx_q9KyRPDaqi0ecCYvOqekqHatBysosJg1
    TIVTqY01LuL77C9JV01dnFNzvLg6Xl1Q51B7XOuwf_jJWVCt5o>
X-ME-Received: <xmr:zUC7aRGVpOMweOMTwwcvvkKXmg9xzn23TbcB6X6CD-NY5Pw8iYQRmrFiLK57YCtfvLczHe525MaAajNhmZ3P6LAZ6WDZ9W3767M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdehheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfetuefhiefg
    tddtlefggffggeevhedtvdefffeugfeiieeiheefteefgefggeejnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhmmheskhhvrggtkhdrohhrgh
X-ME-Proxy: <xmx:zUC7aULMzM0ksn_VXfyPXkkJEz8YL6Ms5DtUnomxF5ZLWjjdFcapZw>
    <xmx:zUC7adl5z9X-hGxPCxfZSrLbozRicsrxAuLVrMwqfCriyf4AEMC0qA>
    <xmx:zUC7aUQlckFFyvyYs4emDwh9W-R2aiSRfjSwyaXYAmsajDJourG8KQ>
    <xmx:zUC7aXIJsEUMCmMvOpoEIBTikaoEyGIMWEGzLHO8hv5tWXhHijK-bw>
    <xmx:zUC7aZSO6wyJwWrfuvWjgDq0vZ3GykHrd9PYvLPnzppE8rJYdkQxDZZ4>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 20:18:20 -0400 (EDT)
Date: Thu, 19 Mar 2026 01:18:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?
Message-ID: <abtAylIlW3I8s1T-@mail-itl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3KD19i2MxeWtKiZr"
Content-Disposition: inline
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56265-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DCC562C4124
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3KD19i2MxeWtKiZr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Mar 2026 01:18:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?

Hello,

When testing 7.0-rc4 (and also got it with 7.0-rc1), I got page
allocation failure in uvcvideo when using v4l2 camera in a VM. The setup
is rather memory constrained - it's a HVM with just 300MB of memory
running on Xen, with PCI passthrough of USB controllers (to which an USB
camera is connected). But the very same setup works just fine with older
kernel (last known good is 6.19.5, built with the same config).

I'm not exactly sure if uvcvideo is really to blame here, or is it just
a victim of something else using more memory. Any advice how to check
for that?

The specific error is:

    [  739.040844] systemd-journald[251]: Under memory pressure, flushing c=
aches.
    [  739.193589] v4l2src0:src: page allocation failure: order:5, mode:0xc=
c4(GFP_KERNEL|GFP_DMA32), nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
    [  739.193645] CPU: 0 UID: 1000 PID: 1305 Comm: v4l2src0:src Not tainte=
d 7.0.0-0.rc4.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
    [  739.193648] Hardware name: Xen HVM domU, BIOS 4.19.4 03/17/2026
    [  739.193649] Call Trace:
    [  739.193652]  <TASK>
    [  739.193656]  dump_stack_lvl+0x5d/0x80
    [  739.193661]  warn_alloc+0x162/0x190
    [  739.193665]  ? __alloc_pages_direct_compact+0x1bc/0x220
    [  739.193669]  __alloc_pages_slowpath.constprop.0+0x4ea/0xb30
    [  739.193672]  ? kernfs_activate+0x4c/0x60
    [  739.193676]  __alloc_frozen_pages_noprof+0x2ff/0x340
    [  739.193679]  __alloc_pages_noprof+0xe/0x20
    [  739.193682]  __dma_direct_alloc_pages.isra.0+0x183/0x310
    [  739.193688]  dma_direct_alloc_pages+0x3f/0x190
    [  739.193693]  dma_alloc_noncontiguous+0xdd/0x290
    [  739.193698]  ? usb_create_ep_devs+0xab/0x100
    [  739.193701]  usb_alloc_noncoherent+0x45/0xa0
    [  739.193709]  uvc_alloc_urb_buffers.part.0+0x93/0x130 [uvcvideo]
    [  739.193722]  uvc_video_start_transfer+0x19d/0x4e0 [uvcvideo]
    [  739.193735]  uvc_video_start_streaming+0xab/0x100 [uvcvideo]
    [  739.193744]  uvc_start_streaming_video+0xec/0x110 [uvcvideo]
    [  739.193752]  vb2_start_streaming+0x63/0x130 [videobuf2_common]
    [  739.193761]  vb2_core_streamon+0x98/0xf0 [videobuf2_common]
    [  739.193767]  ? vb2_ioctl_streamon+0x15/0x60 [videobuf2_v4l2]
    [  739.193773]  __video_do_ioctl+0x419/0x540 [videodev]
    [  739.193799]  video_usercopy+0x23b/0x630 [videodev]
    [  739.193819]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
    [  739.193836]  v4l2_ioctl+0x6b/0xa0 [videodev]
    [  739.193851]  __x64_sys_ioctl+0x96/0xe0
    [  739.193855]  do_syscall_64+0x120/0x6c0
    [  739.193859]  ? do_read_fault+0xf5/0x220
    [  739.193863]  ? do_fault+0x148/0x270
    [  739.193865]  ? __handle_mm_fault+0x470/0x6c0
    [  739.193868]  ? count_memcg_events+0xeb/0x1b0
    [  739.193871]  ? handle_mm_fault+0x220/0x340
    [  739.193873]  ? do_user_addr_fault+0x1e5/0x7f0
    [  739.193876]  ? arch_exit_to_user_mode_prepare.isra.0+0x9f/0xe0
    [  739.193880]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [  739.193883] RIP: 0033:0x738e787000ed
    [  739.193886] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7=
 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05=
 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
    [  739.193888] RSP: 002b:0000738e730e6a00 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000010
    [  739.193890] RAX: ffffffffffffffda RBX: 0000738e64008850 RCX: 0000738=
e787000ed
    [  739.193892] RDX: 000059d3df721cf0 RSI: 0000000040045612 RDI: 0000000=
000000010
    [  739.193893] RBP: 0000738e730e6a50 R08: 0000738e6400ae40 R09: 0000000=
000000000
    [  739.193894] R10: 0000738e6400ae30 R11: 0000000000000246 R12: 0000000=
000000000
    [  739.193895] R13: 0000738e640012d0 R14: 0000738e64008850 R15: 0000000=
000000002
    [  739.193897]  </TASK>
    [  739.193907] Mem-Info:
    [  739.194897] active_anon:362 inactive_anon:3172 isolated_anon:0
    [  739.194897]  active_file:2498 inactive_file:11687 isolated_file:1
    [  739.194897]  unevictable:0 dirty:0 writeback:4
    [  739.194897]  slab_reclaimable:3707 slab_unreclaimable:10022
    [  739.194897]  mapped:4710 shmem:9 pagetables:1021
    [  739.194897]  sec_pagetables:0 bounce:0
    [  739.194897]  kernel_misc_reclaimable:0
    [  739.194897]  free:3452 free_pcp:1 free_cma:0
    [  739.195008] Node 0 active_anon:1448kB inactive_anon:12688kB active_f=
ile:9992kB inactive_file:46748kB unevictable:0kB isolated(anon):0kB isolate=
d(file):4kB mapped:18840kB dirty:0kB writeback:16kB shmem:36kB shmem_thp:0k=
B shmem_pmdmapped:0kB anon_thp:0kB kernel_stack:2416kB pagetables:4084kB se=
c_pagetables:0kB all_unreclaimable? no Balloon:16384kB
    [  739.195097] Node 0 DMA free:2828kB boost:0kB min:132kB low:164kB hig=
h:196kB reserved_highatomic:0KB free_highatomic:0KB active_anon:224kB inact=
ive_anon:940kB active_file:1360kB inactive_file:2408kB unevictable:0kB writ=
epending:0kB zspages:0kB present:15992kB managed:15360kB mlocked:0kB bounce=
:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
    [  739.195186] lowmem_reserve[]: 0 195 195 195 195
    [  739.196280] Node 0 DMA32 free:14880kB boost:3856kB min:5572kB low:60=
00kB high:6428kB reserved_highatomic:0KB free_highatomic:0KB active_anon:12=
24kB inactive_anon:11728kB active_file:8632kB inactive_file:40024kB unevict=
able:0kB writepending:16kB zspages:0kB present:274348kB managed:200080kB ml=
ocked:0kB bounce:0kB free_pcp:316kB local_pcp:236kB free_cma:0kB
    [  739.196372] lowmem_reserve[]: 0 0 0 0 0
    [  739.196388] Node 0 DMA: 193*4kB (UM) 213*8kB (UM) 22*16kB (UM) 0*32k=
B 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 2828kB
    [  739.196433] Node 0 DMA32: 1631*4kB (UME) 764*8kB (UME) 138*16kB (UME=
) 8*32kB (UM) 3*64kB (M) 1*128kB (M) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*40=
96kB =3D 15420kB
    [  739.196487] Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_=
surp=3D0 hugepages_size=3D2048kB
    [  739.196514] 14914 total pagecache pages
    [  739.196527] 2073 pages in swap cache
    [  739.196539] Free swap  =3D 961672kB
    [  739.196551] Total swap =3D 1048572kB
    [  739.196563] 72585 pages RAM
    [  739.196572] 0 pages HighMem/MovableOnly
    [  739.196584] 18725 pages reserved
    [  739.196596] 0 pages cma reserved
    [  739.196608] 0 pages hwpoisoned
    [  739.196620] Memory cgroup min protection 0kB -- low protection 0kB
    [  739.196627] ------------[ cut here ]------------

Additionally, this failure isn't handled gracefully, it's followed with:

    [  739.196672] UBSAN: shift-out-of-bounds in /builddir/build/BUILD/kern=
el-latest-7.0-build/kernel-latest-7.0/linux-7.0-rc4/mm/page_alloc.c:1403:22
    [  739.196710] shift exponent 52 is too large for 32-bit type 'int'
    [  739.196730] CPU: 1 UID: 1000 PID: 1305 Comm: v4l2src0:src Not tainte=
d 7.0.0-0.rc4.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
    [  739.196733] Hardware name: Xen HVM domU, BIOS 4.19.4 03/17/2026
    [  739.196734] Call Trace:
    [  739.196737]  <TASK>
    [  739.196739]  dump_stack_lvl+0x5d/0x80
    [  739.196744]  ubsan_epilogue+0x5/0x2b
    [  739.196746]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xe6
    [  739.196749]  __free_pages_ok.cold+0x13/0xa8
    [  739.196753]  dma_free_noncontiguous+0xbf/0xe0
    [  739.196756]  ? usb_free_noncoherent+0x3a/0x60
    [  739.196761]  uvc_free_urb_buffers+0x38/0x90 [uvcvideo]
    [  739.196773]  uvc_alloc_urb_buffers.part.0+0xe6/0x130 [uvcvideo]
    [  739.196781]  uvc_video_start_transfer+0x19d/0x4e0 [uvcvideo]
    [  739.196789]  uvc_video_start_streaming+0xab/0x100 [uvcvideo]
    [  739.196797]  uvc_start_streaming_video+0xec/0x110 [uvcvideo]
    [  739.196806]  vb2_start_streaming+0x63/0x130 [videobuf2_common]
    [  739.196813]  vb2_core_streamon+0x98/0xf0 [videobuf2_common]
    [  739.196819]  ? vb2_ioctl_streamon+0x15/0x60 [videobuf2_v4l2]
    [  739.196824]  __video_do_ioctl+0x419/0x540 [videodev]
    [  739.196847]  video_usercopy+0x23b/0x630 [videodev]
    [  739.196863]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
    [  739.196880]  v4l2_ioctl+0x6b/0xa0 [videodev]
    [  739.196895]  __x64_sys_ioctl+0x96/0xe0
    [  739.196898]  do_syscall_64+0x120/0x6c0
    [  739.196902]  ? do_read_fault+0xf5/0x220
    [  739.196906]  ? do_fault+0x148/0x270
    [  739.196908]  ? __handle_mm_fault+0x470/0x6c0
    [  739.196911]  ? count_memcg_events+0xeb/0x1b0
    [  739.196914]  ? handle_mm_fault+0x220/0x340
    [  739.196916]  ? do_user_addr_fault+0x1e5/0x7f0
    [  739.196920]  ? arch_exit_to_user_mode_prepare.isra.0+0x9f/0xe0
    [  739.196924]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [  739.196926] RIP: 0033:0x738e787000ed
    [  739.196929] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7=
 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05=
 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
    [  739.196930] RSP: 002b:0000738e730e6a00 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000010
    [  739.196933] RAX: ffffffffffffffda RBX: 0000738e64008850 RCX: 0000738=
e787000ed
    [  739.196934] RDX: 000059d3df721cf0 RSI: 0000000040045612 RDI: 0000000=
000000010
    [  739.196935] RBP: 0000738e730e6a50 R08: 0000738e6400ae40 R09: 0000000=
000000000
    [  739.196936] R10: 0000738e6400ae30 R11: 0000000000000246 R12: 0000000=
000000000
    [  739.196937] R13: 0000738e640012d0 R14: 0000738e64008850 R15: 0000000=
000000002
    [  739.196939]  </TASK>
    [  739.196940] ---[ end trace ]---
    [  739.197835] BUG: Bad page state in process v4l2src0:src  pfn:009a0
    [  739.198028] page: refcount:0 mapcount:0 mapping:0000000000000000 ind=
ex:0x2a pfn:0x9a0
    [  739.198054] flags: 0x7ffffc0000000(node=3D0|zone=3D0|lastcpupid=3D0x=
1fffff)
    [  739.198074] page_type: f0(buddy)
    [  739.198088] raw: 0007ffffc0000000 fffffac1c0026a08 fffffac1c0025e08 =
0000000000000000
    [  739.198111] raw: 000000000000002a 0000000000000002 00000000f0000000 =
0000000000000000
    [  739.198133] page dumped because: nonzero mapcount
    [  739.198149] Modules linked in: nft_reject_ipv6 nf_reject_ipv6 nft_re=
ject_ipv4 nf_reject_ipv4 nft_reject nft_ct nft_masq nft_chain_nat nf_nat nf=
_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables uvcvideo ath3k btusb btm=
tk uvc videobuf2_vmalloc btrtl videobuf2_memops videobuf2_v4l2 cdc_mbim btb=
cm cdc_ncm videobuf2_common btintel cdc_ether usbnet videodev bluetooth mii=
 cdc_wdm mc rfkill cdc_acm joydev intel_rapl_msr intel_rapl_common ghash_cl=
mulni_intel xhci_pci xhci_hcd ehci_pci ehci_hcd pcspkr i2c_piix4 ata_generi=
c pata_acpi i2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xe=
n_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop =
nfnetlink overlay xen_blkfront
    [  739.198472] CPU: 1 UID: 1000 PID: 1305 Comm: v4l2src0:src Not tainte=
d 7.0.0-0.rc4.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
    [  739.198475] Hardware name: Xen HVM domU, BIOS 4.19.4 03/17/2026
    [  739.198477] Call Trace:
    [  739.198479]  <TASK>
    [  739.198480]  dump_stack_lvl+0x5d/0x80
    [  739.198485]  bad_page.cold+0x7a/0x91
    [  739.198488]  __free_pages_ok+0x481/0x680
    [  739.198491]  dma_free_noncontiguous+0xbf/0xe0
    [  739.198494]  ? usb_free_noncoherent+0x3a/0x60
    [  739.198497]  uvc_free_urb_buffers+0x38/0x90 [uvcvideo]
    [  739.198507]  uvc_alloc_urb_buffers.part.0+0xe6/0x130 [uvcvideo]
    [  739.198515]  uvc_video_start_transfer+0x19d/0x4e0 [uvcvideo]
    [  739.198523]  uvc_video_start_streaming+0xab/0x100 [uvcvideo]
    [  739.198531]  uvc_start_streaming_video+0xec/0x110 [uvcvideo]
    [  739.198539]  vb2_start_streaming+0x63/0x130 [videobuf2_common]
    [  739.198546]  vb2_core_streamon+0x98/0xf0 [videobuf2_common]
    [  739.198551]  ? vb2_ioctl_streamon+0x15/0x60 [videobuf2_v4l2]
    [  739.198555]  __video_do_ioctl+0x419/0x540 [videodev]
    [  739.198574]  video_usercopy+0x23b/0x630 [videodev]
    [  739.198590]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
    [  739.198607]  v4l2_ioctl+0x6b/0xa0 [videodev]
    [  739.198622]  __x64_sys_ioctl+0x96/0xe0
    [  739.198625]  do_syscall_64+0x120/0x6c0
    [  739.198629]  ? do_read_fault+0xf5/0x220
    [  739.198632]  ? do_fault+0x148/0x270
    [  739.198635]  ? __handle_mm_fault+0x470/0x6c0
    [  739.198637]  ? count_memcg_events+0xeb/0x1b0
    [  739.198640]  ? handle_mm_fault+0x220/0x340
    [  739.198642]  ? do_user_addr_fault+0x1e5/0x7f0
    [  739.198645]  ? arch_exit_to_user_mode_prepare.isra.0+0x9f/0xe0
    [  739.198648]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [  739.198651] RIP: 0033:0x738e787000ed
    [  739.198653] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7=
 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05=
 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
    [  739.198654] RSP: 002b:0000738e730e6a00 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000010
    [  739.198656] RAX: ffffffffffffffda RBX: 0000738e64008850 RCX: 0000738=
e787000ed
    [  739.198657] RDX: 000059d3df721cf0 RSI: 0000000040045612 RDI: 0000000=
000000010
    [  739.198658] RBP: 0000738e730e6a50 R08: 0000738e6400ae40 R09: 0000000=
000000000
    [  739.198659] R10: 0000738e6400ae30 R11: 0000000000000246 R12: 0000000=
000000000
    [  739.198660] R13: 0000738e640012d0 R14: 0000738e64008850 R15: 0000000=
000000002
    [  739.198662]  </TASK>
    [  739.198663] Disabling lock debugging due to kernel taint

And eventually kernel panic:

    [  740.464422] BUG: unable to handle page fault for address: fffffac1c0=
800000
    [  740.464454] #PF: supervisor read access in kernel mode
    [  740.464471] #PF: error_code(0x0000) - not-present page
    [  740.464488] PGD 11be0067 P4D 11be0067 PUD 1148f067 PMD 0=20

Full console log is at: https://gist.github.com/marmarek/5d839f419b1d56e71a=
48e74ae66f0e7a

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3KD19i2MxeWtKiZr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm7QMoACgkQ24/THMrX
1yyGugf9Eob8mrb+VDgR0aA6r1OOAMCP2unTnLXJ+UJNUXb5iIEw9DugG+1c4y5u
zLmGOtn1QP6wFlReCGWfszB08uKxPH6WeeiLOE0ddHFlFw4bF87UONf0cJrxA7Zq
UirTNlt8ZSJzlh0/DTBNGNw1nU2OMO+sDfeymS+uTyNxT6fNGZAbO53pq3PDZOfj
9czrE0hBD15UqMvbjSuER/1zFHILqxmAORYAuceC0rha2AEXasc6ZFkia5o2Ykp1
DpYd+gWF5pQRlDQcOrWAdJPG0Slt8qsJsmzgVefLMwRoP04qAvSExQaqGQrj1Fna
pWl3qbTNtm9/Pa2oNCrcvZJR85ONng==
=kLK/
-----END PGP SIGNATURE-----

--3KD19i2MxeWtKiZr--

