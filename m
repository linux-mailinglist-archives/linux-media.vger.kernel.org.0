Return-Path: <linux-media+bounces-59528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKhLFi1o62m2MgAAu9opvQ
	(envelope-from <linux-media+bounces-59528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:55:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1645EB84
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97423300646C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC54F3D3335;
	Fri, 24 Apr 2026 12:55:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D22E332EDE;
	Fri, 24 Apr 2026 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035297; cv=none; b=IGOqjgvEPPAHIpd36s1y/TZoZwPxnDKD2wckqQ9Wn3xGTO3efpjTLxOsZ6B2r2mje8DdOSW9QHxpnVPg4oFjyeJuqBgkjVpGQDKe1EpvVbfQ5afX4AEXftSUW78IuxvF293OJLXE0MSAf5ZI/NHEB3zdN96KHt0ZQxUQV0u/kGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035297; c=relaxed/simple;
	bh=OYGh8Sh6hpU44rJqG2G2Q/84w8jXT+xqhArC0JAHZAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrZ9KMwosIsPD5Vq1/GMc1wzAewUqyfoNG5kpQyMAcJiaXWcHWM9IkQSdYXfXcoYsbriSqLrPkfljl6QvAYqDInllFkllgf6DU3M+68hPQ9KA5pV6g1Ug4DAlS7c/3KsgEXa2YCiiJ0chxEEWzuDWkebSEWfaWqjr1MTMi6V+XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 63OCrj9o193708;
	Fri, 24 Apr 2026 07:53:45 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 63OCrhor193703;
	Fri, 24 Apr 2026 07:53:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 24 Apr 2026 07:53:43 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
        jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
        ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
        ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
        bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
        tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, tamird@kernel.org, arnd@arndb.de,
        nsc@kernel.org, simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
        Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <aetn16xR-uy7M7WA@gate>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <aetZ3VX_Y9sop-SO@gate>
 <aetamPA_SsWcwC4M@gate>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aetamPA_SsWcwC4M@gate>
X-Rspamd-Queue-Id: ABC1645EB84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59528-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	DMARC_NA(0.00)[crashing.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,linkmauve.fr];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	HAS_XAW(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[segher@kernel.crashing.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 06:57:12AM -0500, Segher Boessenkool wrote:
> On Fri, Apr 24, 2026 at 06:54:05AM -0500, Segher Boessenkool wrote:
> > Hi!
> > 
> > On Fri, Apr 24, 2026 at 11:17:40AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > > The core crate currently depends on these two functions for i64/u64/
> > > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > > the kernel so let’s panic if they are ever called.
> > > 
> > > This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
> > > CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
> > > build on PPC32.
> > 
> > GCC uses calls to functions like even __addsi3 whenever the (sub-)target
> > does not implement some RTL, doesn't have a define_insn and the like for
> > it.  When you write a new port you only *have* to implement a very few
> > things, the rest is done in libgcc (you might still have to write some
> > of that for your target, no free lunch etc.)
> > 
> > 32-bit PowerPC has no instructions for 64-bit divisions, nor
> > instructions that help implementing it in software.  It still very often
> > helps to hand-write machine code for it, it very easily can usually be
> > more than twice as fast for example (for example if the divisor is less
> > than half a word big, the common case -- it can be made tens of times
> > faster then).
> > 
> > There can be many reasons why a GCC backend decides to call a libgcc
> > routine.  For __udivdi3 on -m32 rs6000 you'll be good AFAICS :-)
> > (but poisoning functions like you do is a terrible idea in general!)
> 
> Whoopsie, I forgot to mention:
> 
> Approved for trunk.

Ugh, for some reason I thought this is a GCC patch :-(


Segher

