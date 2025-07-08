Return-Path: <linux-media+bounces-37070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50891AFC656
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE9B4A590E
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10FD2BEC53;
	Tue,  8 Jul 2025 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pes7nKom"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A331E285A
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965009; cv=none; b=FV71xilaTAGelWLt2sMmwVc/4mqHFYlh1PfwrhCD2eS59jHMb6KNPReRHcVEF4nPT4WnecU4EdCcuaZb+efLaQNudk+7u6KqrJqMTSZU7tcfxeCaztKDYit5fF4Cp8KAFDK/qlFMq6VEvmtsJDl7cYw0LFdLspHwzSvPRhhP4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965009; c=relaxed/simple;
	bh=453kmkxe0PB5ueoJ4Kxa/sCeoINXDv7arQms6pWVaP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCPSOsWALwsEvT48ZNj33I6cI7KMurjgIGqfpu+MJIXBVvogKOYdWFGgX8mkGiZml8GiU5FdAX+r5Nw2asDmwUTSyQgU3CizrWzSkBlkYTEevjR8PoSRdVGyK4eRFnTFXe1JhERy1zMqUcZGhwGMWQ8TiwqXNLnwlMYDZdSKXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pes7nKom; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751965007; x=1783501007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=453kmkxe0PB5ueoJ4Kxa/sCeoINXDv7arQms6pWVaP8=;
  b=Pes7nKom2T6kvDQiCzyEIcrMgFoqK7+ocpvYMNciVUlP6ienfTRywi7L
   pQfkWHHjXd9lmj8oZ4oO9N0sjrIEvQhyx5YogoMun/leqpV1TonRGyffk
   uGJ7VYPagCEw06thXLEYJxxRXpfpdvcB6fguTbz99LTQzHw96L1qEOnlk
   LkUgo8dCxXtYC1vT9iEqHFq1MPn9tnEgbHxvEVy66eupSYaLXJkcu5Z8D
   dJhn/qEkf7jY0o8NhfP5ni/VHCw/ajfjpaPhKOyoEY559paUDrE7oviPL
   wfhAxQIeqmZtY9GdhskeFsXe8mRtRQcJL0HvW9p3h81mNwuXl5NjYbdy4
   Q==;
X-CSE-ConnectionGUID: jaPc8KDVRW2/nfF6Jppdag==
X-CSE-MsgGUID: CVZwdO8yQkCeNt7UQAwhtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65257979"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65257979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:56:47 -0700
X-CSE-ConnectionGUID: /0+TaXnYS9Oy64bQ4GobpA==
X-CSE-MsgGUID: voFnpFLmSMu7U3lhdt9Ihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="159710121"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.8])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:56:44 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Date: Tue, 08 Jul 2025 10:56:41 +0200
Message-ID: <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5f24f0e1-7d61-4a1a-bfea-b17fa7af4be1@amd.com>
References:
 <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <2191571.OBFZWjSADL@jkrzyszt-mobl2.ger.corp.intel.com>
 <5f24f0e1-7d61-4a1a-bfea-b17fa7af4be1@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 7 July 2025 15:14:11 CEST Christian K=C3=B6nig wrote:
> On 07.07.25 14:25, Janusz Krzysztofik wrote:
> > Hi Christian,
> >=20
> > I've taken over that old issue and have a few questions to you.
>=20
> Thanks a lot for that, something really fishy seems to be going on here.
>=20
> > On Thursday, 27 February 2025 15:11:39 CEST Christian K=C3=B6nig wrote:
> ...
> >> Question is why is the test taking 26 (busy?) seconds to complete? Tha=
t=20
> > sounds really long even for a very old CPU.
> >=20
> > The failing test case operates on a dma fence chain built of 4096 dma f=
ences.  =20
> > Am I right that a single dma_fence_signal() call may result in up to 40=
96=20
> > levels of nested sub-calls to dma_fence_chain_cb()?
>=20
> No, that could only happen if the test case is broken.
>=20
> See the test is to make sure that we don't overflow the kernel stack with=
 many elements when enable_signaling is called.
>=20
> The callback is always only installed on the first unsignaled fence. So w=
hen the last fence is signaled the dma_fence_chain_cb function it is called=
 exactly once, installs itself on the second to last fence, waits for that =
one to signal and so on.
>=20
>=20
> What could be is that test case calls enable_signaling on each of the 409=
6 dma_fence_chain elements individually and so each of the elements registe=
rs a dma_fence_chain_cb function, but then the test case would be rather br=
oken and should probably be fixed.
>=20
> > The test case signals=20
> > each fence of the chain in a loop, starting from the last one.  Then, =
=20
> > dma_fence_chain_cb() is called 4096 * (4096 + 1) / 2 (an arithmetic ser=
ies) ~=3D=20
> > 8.4 milion times, isn't it?
>=20
> When the test case indeed enables signaling on all 4096 elements then yes.
>=20
> >=20
> > On most powerful gen12 machines used in CI, that test case takes slight=
ly less=20
> > than 3s, on low end few years old machines -- ~ 10s.  Should we be surp=
rised=20
> > that it takes over 20s on the least powerful one (gen3 PineView Atom)? =
 And,=20
> > while reproducing the issue, I've never seen any unrecoverable deadlock=
s.  It=20
> > just takes time to complete the loop.
> >=20
> > Does that address your doubts?
>=20
> No, not really.
>=20
> > Assuming the commit message will be extended and provide the above=20
> > explanation, I can still imagine a few ways of "fixing" that issue.  We=
 can=20
> > just limit the chain length and still execute all those dma_fence_signa=
l()=20
> > calls without taking a breath, but why?  Or we can somehow measure expe=
cted=20
> > processing speed before running the exercise and limit the chain size=20
> > accordingly at runtime, which in turn seems an overcomplication to me. =
 Or, we=20
> > can agree that there is no point in avoiding that process being potenti=
ally=20
> > swapped out from the CPU and take the approach proposed by Nitin, perha=
ps=20
> > limited to this particular problematic test case.  And, I can see=20
> > cond_resched() still used in recent patches.
> >=20
> > Would any of those options be acceptable for you?
>=20
> No, if the test case really does what you describe here then the test is =
just broken and should potentially be fixed instead.
>=20
> There is no reason to test enabling signaling each of the element in a lo=
op. So there should be something like 4096 calls to the dma_fence_chain_cb =
function each jumping to the next unsignaled fence and re-installing the ca=
llback.

So how building a chain should look like in real use cases?  When a user=20
builds a chained link of her fence with another fence then may she enable=20
signaling on the new chain link?  If that other fence occurs a chain link t=
hen=20
who should take care of disabling signaling on it so signaling is enabled o=
nly=20
on the last link of the chain, not leading to a situation similar to what w=
e=20
have now in the test case?  IOW, what's a correct use pattern of=20
dma_fence_chain?  I can't find that documented anywhere, neither in inline=
=20
docs nor in commit descriptions.

Thanks,
Janusz

>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Janusz
> >=20
> >>
> >> Do we maybe have an udelay() here which should have been an usleep() o=
r=20
> > similar?
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Andi
> >>>
> >>>> ---
> >>>> Hi,
> >>>>
> >>>> For reviewer reference, adding here watchdog issue seen on old machi=
nes
> >>>> during dma-fence-chain subtests testing. This log is retrieved from=
=20
> > device
> >>>> pstore log while testing dam-buf@all-tests:
> >>>>
> >>>> dma-buf: Running dma_fence_chain
> >>>> Panic#1 Part7
> >>>> <6> sizeof(dma_fence_chain)=3D184
> >>>> <6> dma-buf: Running dma_fence_chain/sanitycheck
> >>>> <6> dma-buf: Running dma_fence_chain/find_seqno
> >>>> <6> dma-buf: Running dma_fence_chain/find_signaled
> >>>> <6> dma-buf: Running dma_fence_chain/find_out_of_order
> >>>> <6> dma-buf: Running dma_fence_chain/find_gap
> >>>> <6> dma-buf: Running dma_fence_chain/find_race
> >>>> <6> Completed 4095 cycles
> >>>> <6> dma-buf: Running dma_fence_chain/signal_forward
> >>>> <6> dma-buf: Running dma_fence_chain/signal_backward
> >>>> <6> dma-buf: Running dma_fence_chain/wait_forward
> >>>> <6> dma-buf: Running dma_fence_chain/wait_backward
> >>>> <0> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [dmabuf:2263]
> >>>> Panic#1 Part6
> >>>> <4> irq event stamp: 415735
> >>>> <4> hardirqs last  enabled at (415734): [<ffffffff813d3a1b>]=20
> > handle_softirqs+0xab/0x4d0
> >>>> <4> hardirqs last disabled at (415735): [<ffffffff827c7e31>]=20
> > sysvec_apic_timer_interrupt+0x11/0xc0
> >>>> <4> softirqs last  enabled at (415728): [<ffffffff813d3f8f>]=20
> > __irq_exit_rcu+0x13f/0x160
> >>>> <4> softirqs last disabled at (415733): [<ffffffff813d3f8f>]=20
> > __irq_exit_rcu+0x13f/0x160
> >>>> <4> CPU: 2 UID: 0 PID: 2263 Comm: dmabuf Not tainted 6.14.0-rc2-drm-
> > next_483-g7b91683e7de7+ #1
> >>>> <4> Hardware name: Intel corporation NUC6CAYS/NUC6CAYB, BIOS=20
> > AYAPLCEL.86A.0056.2018.0926.1100 09/26/2018
> >>>> <4> RIP: 0010:handle_softirqs+0xb1/0x4d0
> >>>> <4> RSP: 0018:ffffc90000154f60 EFLAGS: 00000246
> >>>> <4> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> >>>> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> >>>> <4> RBP: ffffc90000154fb8 R08: 0000000000000000 R09: 0000000000000000
> >>>> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000000a
> >>>> <4> R13: 0000000000000200 R14: 0000000000000200 R15: 0000000000400100
> >>>> <4> FS:  000077521c5cd940(0000) GS:ffff888277900000(0000)=20
> > knlGS:0000000000000000
> >>>> Panic#1 Part5
> >>>> <4> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>> <4> CR2: 00005dbfee8c00c4 CR3: 0000000133d38000 CR4: 00000000003526f0
> >>>> <4> Call Trace:
> >>>> <4>  <IRQ>
> >>>> <4>  ? show_regs+0x6c/0x80
> >>>> <4>  ? watchdog_timer_fn+0x247/0x2d0
> >>>> <4>  ? __pfx_watchdog_timer_fn+0x10/0x10
> >>>> <4>  ? __hrtimer_run_queues+0x1d0/0x420
> >>>> <4>  ? hrtimer_interrupt+0x116/0x290
> >>>> <4>  ? __sysvec_apic_timer_interrupt+0x70/0x1e0
> >>>> <4>  ? sysvec_apic_timer_interrupt+0x47/0xc0
> >>>> <4>  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
> >>>> <4>  ? handle_softirqs+0xb1/0x4d0
> >>>> <4>  __irq_exit_rcu+0x13f/0x160
> >>>> <4>  irq_exit_rcu+0xe/0x20
> >>>> <4>  sysvec_irq_work+0xa0/0xc0
> >>>> <4>  </IRQ>
> >>>> <4>  <TASK>
> >>>> <4>  asm_sysvec_irq_work+0x1b/0x20
> >>>> <4> RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
> >>>> <4> RSP: 0018:ffffc9000292b8f0 EFLAGS: 00000246
> >>>> <4> RAX: 0000000000000000 RBX: ffff88810f235480 RCX: 0000000000000000
> >>>> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> >>>> <4> RBP: ffffc9000292b900 R08: 0000000000000000 R09: 0000000000000000
> >>>> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
> >>>> <4> R13: 0000000000000000 R14: 0000000000000246 R15: 000000000003828c
> >>>> Panic#1 Part4
> >>>> <4> dma_fence_signal+0x49/0xb0
> >>>> <4> wait_backward+0xf8/0x140 [dmabuf_selftests]
> >>>> <4> __subtests+0x75/0x1f0 [dmabuf_selftests]
> >>>> <4> dma_fence_chain+0x94/0xe0 [dmabuf_selftests]
> >>>> <4> st_init+0x6a/0xff0 [dmabuf_selftests]
> >>>> <4> ? __pfx_st_init+0x10/0x10 [dmabuf_selftests]
> >>>> <4> do_one_initcall+0x79/0x400
> >>>> <4> do_init_module+0x97/0x2a0
> >>>> <4> load_module+0x2c23/0x2f60
> >>>> <4> init_module_from_file+0x97/0xe0
> >>>> <4> ? init_module_from_file+0x97/0xe0
> >>>> <4> idempotent_init_module+0x134/0x350
> >>>> <4> __x64_sys_finit_module+0x77/0x100
> >>>> <4> x64_sys_call+0x1f37/0x2650
> >>>> <4> do_syscall_64+0x91/0x180
> >>>> <4> ? trace_hardirqs_off+0x5d/0xe0
> >>>> <4> ? syscall_exit_to_user_mode+0x95/0x260
> >>>> <4> ? do_syscall_64+0x9d/0x180
> >>>> <4> ? do_syscall_64+0x9d/0x180
> >>>> <4> ? irqentry_exit+0x77/0xb0
> >>>> <4> ? sysvec_apic_timer_interrupt+0x57/0xc0
> >>>> <4> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >>>> <4> RIP: 0033:0x77521e72725d
> >>>>
> >>>>
> >>>>  drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
> >>>>  1 file changed, 11 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/=
st-
> > dma-fence-chain.c
> >>>> index ed4b323886e4..328a66ed59e5 100644
> >>>> --- a/drivers/dma-buf/st-dma-fence-chain.c
> >>>> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> >>>> @@ -505,6 +505,7 @@ static int signal_forward(void *arg)
> >>>> =20
> >>>>  	for (i =3D 0; i < fc.chain_length; i++) {
> >>>>  		dma_fence_signal(fc.fences[i]);
> >>>> +		cond_resched();
> >>>> =20
> >>>>  		if (!dma_fence_is_signaled(fc.chains[i])) {
> >>>>  			pr_err("chain[%d] not signaled!\n", i);
> >>>> @@ -537,6 +538,7 @@ static int signal_backward(void *arg)
> >>>> =20
> >>>>  	for (i =3D fc.chain_length; i--; ) {
> >>>>  		dma_fence_signal(fc.fences[i]);
> >>>> +		cond_resched();
> >>>> =20
> >>>>  		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
> >>>>  			pr_err("chain[%d] is signaled!\n", i);
> >>>> @@ -587,8 +589,10 @@ static int wait_forward(void *arg)
> >>>>  	get_task_struct(tsk);
> >>>>  	yield_to(tsk, true);
> >>>> =20
> >>>> -	for (i =3D 0; i < fc.chain_length; i++)
> >>>> +	for (i =3D 0; i < fc.chain_length; i++) {
> >>>>  		dma_fence_signal(fc.fences[i]);
> >>>> +		cond_resched();
> >>>> +	}
> >>>> =20
> >>>>  	err =3D kthread_stop_put(tsk);
> >>>> =20
> >>>> @@ -616,8 +620,10 @@ static int wait_backward(void *arg)
> >>>>  	get_task_struct(tsk);
> >>>>  	yield_to(tsk, true);
> >>>> =20
> >>>> -	for (i =3D fc.chain_length; i--; )
> >>>> +	for (i =3D fc.chain_length; i--; ) {
> >>>>  		dma_fence_signal(fc.fences[i]);
> >>>> +		cond_resched();
> >>>> +	}
> >>>> =20
> >>>>  	err =3D kthread_stop_put(tsk);
> >>>> =20
> >>>> @@ -663,8 +669,10 @@ static int wait_random(void *arg)
> >>>>  	get_task_struct(tsk);
> >>>>  	yield_to(tsk, true);
> >>>> =20
> >>>> -	for (i =3D 0; i < fc.chain_length; i++)
> >>>> +	for (i =3D 0; i < fc.chain_length; i++) {
> >>>>  		dma_fence_signal(fc.fences[i]);
> >>>> +		cond_resched();
> >>>> +	}
> >>>> =20
> >>>>  	err =3D kthread_stop_put(tsk);
> >>>> =20
> >>
> >>
> >=20
> >=20
> >=20
> >=20
>=20
>=20





