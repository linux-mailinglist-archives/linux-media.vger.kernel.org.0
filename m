Return-Path: <linux-media+bounces-59491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPISFJck62kYJAAAu9opvQ
	(envelope-from <linux-media+bounces-59491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:06:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C301345B2AC
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D137300FB69
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF2B386429;
	Fri, 24 Apr 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtZ3YEC/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF980378D86
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017997; cv=none; b=NN63kjk9yKImP9kxEkfRkForjH3zFhuL2hKMo1ha3UHvFe3dFazL1W7GUKtEl6jSm7IXNQv3/YJrq3L10af/NovYg7lB8dXTU/uLA7DKqzET2NzJDpVa9w8e8bmXQ8h/6+qLYntu7lkHymDaZ25n+OLnJqfLWmam6dZe91/OG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017997; c=relaxed/simple;
	bh=pjNgn7D5+4A3j37DfrD6Q1pdbqZ6bsh85OABrwuUgno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ppq+VxVP+hPNWYLaycycu9LUd7xiDaYAh2JpXJ6jj6KpaHAkLVab7Fe0JQNzitaOrKEaWJr8LWqMmccAoafkxiOhlQz7GUymoi1/uw+E3RdFALzLnChhKnes5ivXjQLOS51o1U60nEE99pBkVLupaqj7OyvJD/5tqT/dMIfVH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtZ3YEC/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35e576110adso5257624a91.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777017994; x=1777622794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RCpdNlcyc5wjzZkBzWIIC1nFpk179iwlYkDekoHWOw=;
        b=jtZ3YEC/lWF+JQwlXQ2Zk0Gk4G99alfHjKscAIf3Wz5uExt+7fvWxioqinkIPIPmmM
         HJE3gGzYubtfNKgbUF1bLIoHVsXy2izDHM9JFhltEkTT1RhA/vL8t7e+jbGXbQdyjGAr
         m4pTcH/6SHi/8wwxBH7auq22zVKX3PnQBmlVfBkJUjYxpKuBhWfpfwdqN14ELi+0M9LZ
         5exFeqOyZ8nC0QVEU9Abfe6x1i02sjhA1cEdSwNHTRKkoybY6qO/Rpv5c76TlF/nbwo1
         /e0V+vueRXQ0ZztcSh2DCIY7yVeZX+kII940dqVrJFSfi5NkrfuNHhA7yTiu3tpPSTYt
         KOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017994; x=1777622794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RCpdNlcyc5wjzZkBzWIIC1nFpk179iwlYkDekoHWOw=;
        b=ZkIpkwCajMfSZ1fuMAjD+hmUNpHLp2v6ztSqOB2QXt40K90zSr1wO1WELB2Lt8K8Kg
         keJ1n7d3VjYAMGw8zKE2Hk5YzyzgvFjzgJLRsWl3n3EnbD0o6fTN4yBU3MtgCHdEMmWO
         cVGdQbC075ezHzZP8Xw+HveeZXukYiVnfQylECRiSVWSCtSKk/9abIGjjGiP+SGbkBR2
         NtN2LqPSZuBxQt+JrtXzEVG99KnDgol2q6/tpSgK/nYb1Ff2pEID26/9o/zjO670wXP8
         69RlY9uRbNBgKSnMgX9dc2XNv0vcn/AZfRjZrTc3XQrX9aaFyWbEcr4wsGy9Xg9qWyBq
         kWPA==
X-Forwarded-Encrypted: i=1; AFNElJ9I8j0ewUzpOBQJbEjUOITg1fPFbGcfk++FL4ikzSgskHkhz4tgtdQOP09qm8z1P68dzTffD916McyiLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Dmp4RHC7aShsjJUTmAXTfKumSFp2pjAEi9JOVNGC16kA9+GH
	JODQ3nGbsFZTGVoWPjUBnIHyoOLt6Rz8ZxyW+wiHuF4gdLvrQCDKqco7
X-Gm-Gg: AeBDietDJPGzNWcif97mDrHYbGcKJgnA8Wj3Gmx0uoShHlHVDJ/QICLl4djkcXlTZ6L
	+vrdA88SOR6tlvmT7hxoakxawm/Svu4FvhhPuHW7lpgjl+/HuKqfgtlxVD7xMx/pZpT3UsQEI+i
	pnllV44ENgqSn/fpy5Uihfsht05RuzkSg7MIZHUGeKwF3wue1tOVFlZTD5exS/uEblMSIAaKoJX
	1pEeQHTYNbUQSoKrEKGkBGgk7KGVk8XJwYFbAJR4rPRz6yz6Nqk4JG+95Xr1Ja42PHCccP/BI6p
	Z8Gz+1VtUzD+nnogin4kYWueGqj2bkhYI1geFuIK/uCUDHLzBMxPpb3rTZR49G73nLIDP+rU3jH
	1qAeBsC6MHKDOgvhrtkbecBW/Sgq5n79QA5qRxVOgmlINnNwTEwmamNykanhm1jZNcuiqN4upHz
	Tnx+MGJ4tPgrXa5Plh91w6UBim2woYuslgh3gH93wJidxKSeL5ICw1vUrLUwQd8U6Q4/602V5pf
	sMhTA==
X-Received: by 2002:a17:90b:3ec5:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-361402ee818mr23969038a91.13.1777017993532;
        Fri, 24 Apr 2026 01:06:33 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361419739dfsm23565688a91.13.2026.04.24.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:06:32 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:36:18 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, 
	simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V13 2/7] dma-resv: Fix undefined symbol when
 CONFIG_DMA_SHARED_BUFFER is disabled
Message-ID: <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-3-mkchauras@gmail.com>
 <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
X-Rspamd-Queue-Id: C301345B2AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59491-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 09:56:16AM +0200, Christian König wrote:
> On 4/24/26 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
> > When building with LLVM=1 for architectures like powerpc where
> > CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
> > 
> >   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
> >   >>> referenced by helpers.c
> >   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
> > 
> > The issue occurs because:
> > 1. CONFIG_DEBUG_MUTEXES=y is enabled
> > 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> > 3. dma_resv_reset_max_fences() is declared in the header when
> >    CONFIG_DEBUG_MUTEXES is set
> > 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
> >    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> > 5. Rust helpers call dma_resv_unlock() which calls
> >    dma_resv_reset_max_fences(), causing an undefined symbol
> > 
> > Fix this by making the function declaration conditional on both
> > CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
> > disabled, use a static inline stub instead.
> 
> Well we are clearly missing something here, but of hand that doesn't looks like the right fix.
> 
> When CONFIG_DMA_SHARED_BUFFER isn't enabled then the whole dma-resv.h header can't be used at all.
> 
> So you also can't call dma_resv_unlock() from the Rust helpers. Which means that we need to make the Rust helpers somehow depend on CONFIG_DMA_SHARED_BUFFER.
> 
> Alternative would be to provide dummies for the functions in dma-resv.h when CONFIG_DMA_SHARED_BUFFER isn't set, but that looks a bit like it just hides the issue.
> 
> Regards,
> Christian.
> 
What about something like this:

diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
index 71914d8241e2..53c119f1b144 100644
--- a/rust/helpers/dma-resv.c
+++ b/rust/helpers/dma-resv.c
@@ -2,6 +2,7 @@
 
 #include <linux/dma-resv.h>
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
 __rust_helper
 int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
 {
@@ -12,3 +13,4 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
 {
        dma_resv_unlock(obj);
 }
+#endif

This seems to fix the issue and makes sense, whoever wants to use the
dma shared buffer will anyway enable the config

Regards,
Mukesh
> > 
> > Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  include/linux/dma-resv.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index c5ab6fd9ebe8..23c8db0b5214 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> >  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> >  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> > 
> > -#ifdef CONFIG_DEBUG_MUTEXES
> > +#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
> >  void dma_resv_reset_max_fences(struct dma_resv *obj);
> >  #else
> >  static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
> > --
> > 2.53.0
> > 
> 

