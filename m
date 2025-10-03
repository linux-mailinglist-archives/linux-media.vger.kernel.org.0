Return-Path: <linux-media+bounces-43702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6EBB5B72
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 03:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E6FE19E6369
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 01:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED9D1F09AD;
	Fri,  3 Oct 2025 01:12:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B1D54774;
	Fri,  3 Oct 2025 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759453938; cv=none; b=JMAQPm0ZlUkjXaoyI3jwCj7z6yOaytdVHfcSulpbaHyWqi0brsypjeaGZbwjE/DbMHaxo1SXHhZUQ9ukfCLi6eFSNluveyw40XbcgRprR3R5ahq+/U0Zbrs7vsuu8FVOVdDBEpda0YesDFYTst9n4IsCMFc8Onx/zzMD7eA/bgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759453938; c=relaxed/simple;
	bh=jqNbqnfs7B8WuSF26Geu0v/uXfznc4Wl0LNfRtCJUUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIu+zWINX7xDtEZI9/fn7eiOhgaTz3WSqy7bqGUba/lvd0k2iTBOcA6+PT/dXD0ascGHeUnFHeuJlgXmZmBc4m93Kf/Cb3IS6nZ29gYEH5RhPoAoQXpOAtoJJmsruDGzB0yXtY3lhePjNUpfFC2lpwvH5rMvi7aBNfXBOL4YO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-92-68df22e72a30
Date: Fri, 3 Oct 2025 10:12:01 +0900
From: Byungchul Park <byungchul@sk.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
	torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
	will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
	joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
	duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
	tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
	amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
	minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
	sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
	ngupta@vflare.org, linux-block@vger.kernel.org,
	josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, jack@suse.cz,
	jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
	djwong@kernel.org, dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
	hamohammed.sa@gmail.com, harry.yoo@oracle.com,
	chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
	max.byungchul.park@gmail.com, boqun.feng@gmail.com,
	longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com,
	yeoreum.yun@arm.com, netdev@vger.kernel.org,
	matthew.brost@intel.com, her0gyugyu@gmail.com, corbet@lwn.net,
	catalin.marinas@arm.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	sumit.semwal@linaro.org, gustavo@padovan.org,
	christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, surenb@google.com, mcgrof@kernel.org,
	petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
	paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	qiang.zhang@linux.dev, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	chuck.lever@oracle.com, neil@brown.name, okorniev@redhat.com,
	Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org,
	anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, mark.rutland@arm.com, ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com, wangkefeng.wang@huawei.com,
	broonie@kernel.org, kevin.brodsky@arm.com, dwmw@amazon.co.uk,
	shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
	yuzhao@google.com, baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com, joel.granados@kernel.org,
	richard.weiyang@gmail.com, geert+renesas@glider.be,
	tim.c.chen@linux.intel.com, linux@treblig.org,
	alexander.shishkin@linux.intel.com, lillian@star-ark.net,
	chenhuacai@kernel.org, francesco@valla.it,
	guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
	masahiroy@kernel.org, brauner@kernel.org,
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v17 08/47] x86_64, dept: add support
 CONFIG_ARCH_HAS_DEPT_SUPPORT to x86_64
Message-ID: <20251003011201.GD75385@system.software.com>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-9-byungchul@sk.com>
 <cd056d80-aadd-4f8a-8aad-c34b55686fac@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd056d80-aadd-4f8a-8aad-c34b55686fac@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SXUyTZxTH87zf7ax7LSx7gOxincbFbDiU6DFTx7zZs0ySZV6YuCzjzfrG
	NpbCWkEhshULHSDbus7OWCNT0LZUjLVQhvELcWIgU4sLrDFYdCDSmfoBBQbabu3UzJuTX87/
	f/7nXByBVofZbEFv3C6bjJJBwykZZWxB89t3NSO6d+YuvgVD1d0MTMfrGEg4enlo66imYMqf
	5MB5e4yDB+5GBK7xAzw8vnKNhn3OEILJ6C0EE/5vEHT0RhCc9e7m4I49SMPvYwvB2nKCgwP7
	rFSqTFAw5/bx8FvLMANuyxK4+b2TgZHLNhbaGsdpCIwOsdDb9ScFjf4gC32uVgZCP3zLwvH7
	zRzcm3HTEDxfm1p4ZIYB21SSBduRkxScq7tFwVFvjIW7roMUtAecNAw5fuZg3nMJwbEBBoKX
	ZnnwP/JwUD01guBv/ygLB+N5cDwxhAryyGztdwxpa2pD5PG8A5H4UStNatp3kPnpQY70N2Ny
	ynWTJzXnbvDkUKCM1PwaY0nLmShFDk9OsyTgq+fI/atXeXLY4qQ/ztqiXKuVDfpy2bR8fZFS
	1xdKUKU/Zu607U9yFmR/uQEpBCzm4/bhEPWcbf31KM2MuBjPnuz6r8+JS3E4PEenOTPF/a0e
	vgEpBVr8JQcPdIymBEHIECU8Prg07VGJgO1XjnFpj1rci7CjeYR/KizCffvHmDTT4jIcTkap
	9Cwt5mBPUkijQlyHO8+8lHa8Ir6BuzsvPzstosANrZufcha+4A0zdiS6Xgh1vRDq+j/0EKJ9
	SK03lhdLekN+rq7CqN+Z+0VJcQCl/s1d9eTTLjQZ2tSDRAFpFqhIaUSnZqVyc0VxD8ICrclU
	FXmHdWqVVqqolE0ln5vKDLK5B+UIjOZV1YqZHVq1uFXaLm+T5VLZ9FylBEW2Ba2xriuqX++z
	ONWrNzZFHn72Qe5WQ+27GwrNkQLtRGVB2XXHh4mMf/7o9DasdH4dTRTG3vvyp4WS+80bde93
	L6lYw3kGK7VPHp7+JMe6Kx64c69EsydbUVhwjcnKX6VjejaWbFgVqXptd99Xxi0K+65o0LfY
	/Fc8Y+/rKwfEtR/F8qqaNIxZJ+Uto01m6V88HssYawMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxbZRTHfe69fe6lrnpX67gBP1UXMpZtLvHlTDddNJEnJhK/kTgj3Gx3
	tgItayeOJTMwKOJ8oRTbhpa5yrKCwAaDiiBjYTSyAGsEYY4orLAVWDOQbCuU8lLsjTHuy8nv
	5P/7J+fD4Wj1uiKF0xuOSyaDmKfFSkaZ+XrprjltUPdiiz8J/ijpZWApUsFAbUszhoq2GgUM
	X2pCEFyqQBBdc9Ng6dpkYMPWz0Ik9hcLmz39CBwjNhqafSUUPGqNY7jvf4jAPh3C4AyXMLDo
	/RqBa9bNQvjXDFgIditgc3KOglvL8wi8oTgFod4vEGw4cuFcXTuGtcBvNDjtwwh+mJ6k4WF4
	CsG91oTh67+NoKfhNIYZ6080jIaegrGlRQwD9q8wLIzUUvB3KwbP6R4FnHXbEJSeb8HgONvG
	QNfULyyM3F+nYMJho6Cp7T0IemcZGLLWUYkjE9blZHA7S6nEuEeB/WI3BTFvIws3zk8w4C3e
	Du7AqALuNLhYWJ/eC5seI/Q3zbEwWWlnDjoQiVq+ZUhjewdFLL9vYNL8fTMia6s2RCIXSmli
	sSZW//wiTcraPyMXhuYxWV26iUnPsochg3UCqQrsIl2uSZaUXf2Tff+1D5T7j0h5+kLJtOeN
	HKVuYHiDKqjWnCivieNiZH36DEriBP4loXzwSyQzw78gRC93UjJjPk0YH4/RMmsSPPhjPXsG
	KTma/zlVGPHdTQQc9wwvCrM302RHxYNgDTRh2VHz3yHBVhdk/w22CgM1IUZmmk8XxuNhSu7S
	fKpQH+dkTOIPCB1XnpSNZ/nnhd6O65QVqVyPlV2PlV3/lz2IbkQavaEwX9TnvbzbnKsrMuhP
	7D5szG9DiZ/0nlqv6kSR0Yw+xHNIu0VFCm7r1Aqx0FyU34cEjtZqVDkNEzq16ohYdFIyGbNN
	n+ZJ5j6UyjHaZNW7WVKOmv9YPC7lSlKBZPovpbiklGL0+cyHHdcisU+iD7jgmwaDfVv4Wpbx
	HW9a7luDW/btq88m16PPKX3dEf+NU+LBsnFjdWwl+eITH1UGZtPT9vi5ZRgdW3DGdmRGs1Nq
	pjKPDe089vahVysOvbIy1b7jlm9mNStc2deycrRz9ZtqV7hkTOPMliyXarfXejLCuNxapdUy
	Zp24N502mcV/AI9Fdl+PAwAA
X-CFilter-Loop: Reflected

On Thu, Oct 02, 2025 at 08:22:29AM -0700, Dave Hansen wrote:
> On 10/2/25 01:12, Byungchul Park wrote:
> > dept needs to notice every entrance from user to kernel mode to treat
> > every kernel context independently when tracking wait-event dependencies.
> > Roughly, system call and user oriented fault are the cases.
> 
> "Roughly"?

I will change it to a better one.

> >  #define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
> >  #define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __x64_##sym(const struct pt_regs *);
> > @@ -86,6 +87,12 @@ static __always_inline bool do_syscall_x32(struct pt_regs *regs, int nr)
> >  /* Returns true to return using SYSRET, or false to use IRET */
> >  __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
> >  {
> > +     /*
> > +      * This is a system call from user mode.  Make dept work with a
> > +      * new kernel mode context.
> > +      */
> > +     dept_update_cxt();
> > +
> >       add_random_kstack_offset();
> >       nr = syscall_enter_from_user_mode(regs, nr);
> 
> Please take a look in syscall_enter_from_user_mode(). You'll see the
> quite nicely-named function: enter_from_user_mode(). That might be a
> nice place to put code that you want to run when the kernel is entered
> from user mode.

I wanted to put dept_update_cxt() to the very beginning of c code but..
yeah enter_from_user_mode() looks fine or even better.  Thanks a lot.

> > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> > index 998bd807fc7b..017edb75f0a0 100644
> > --- a/arch/x86/mm/fault.c
> > +++ b/arch/x86/mm/fault.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/mm_types.h>
> >  #include <linux/mm.h>                        /* find_and_lock_vma() */
> >  #include <linux/vmalloc.h>
> > +#include <linux/dept.h>
> >
> >  #include <asm/cpufeature.h>          /* boot_cpu_has, ...            */
> >  #include <asm/traps.h>                       /* dotraplinkage, ...           */
> > @@ -1219,6 +1220,12 @@ void do_user_addr_fault(struct pt_regs *regs,
> >       tsk = current;
> >       mm = tsk->mm;
> >
> > +     /*
> > +      * This fault comes from user mode.  Make dept work with a new
> > +      * kernel mode context.
> > +      */
> > +     dept_update_cxt();
> No, this fault does not come from user mode. That's why we call it "user
> addr" fault, not "user mode" fault. You end up here if, for instance,
> the kernel faults doing a copy_from_user().

My bad.  Thank you.  I will fix it.  Thank you very much.

	Byungchul

