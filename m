Return-Path: <linux-media+bounces-59497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNmrESIr62keJgAAu9opvQ
	(envelope-from <linux-media+bounces-59497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:34:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155F45B8C3
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 641F4300680E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D21332637;
	Fri, 24 Apr 2026 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpxLti0H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3333AD9A
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019669; cv=none; b=JMNFi/dIQHKHHUTVkhfK2rjoz1lD1fPDab6a2xfTYcnbJydG2thxsuslGqYeybyXy90FGeCkpbQj1g3h8hc7Ke4M1esUoOudxjLrmDtBDAVzwPzsrHovcrqQ7WQPi/iJu7dhIm57Kj5ma+uDsrJRit/4FQ1MDOjPOWQnLst0tKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019669; c=relaxed/simple;
	bh=Mfhq/vAXtT555zh15dRrAo1ZaBJeR2OSCmV2iuRarqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgsBvRtVojQMmwaaWHM4Z5/A+jVfx2T7/BywcwpPRE0MhT45uyH5qZlmppgkG3XdkvRbFrY/pZsg8rIaHOG9bxIWpeROysWJ+Ox06Q6HXuzFNcoppsU4/W717djI+f4gtTiAjXaKUVRqsjmD8LEGWRL5Gpf23OwyPJQ30MQInxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpxLti0H; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82748257f5fso4613206b3a.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019668; x=1777624468; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LSr35TcIMW6wVIpT4GYu71Od3lJHQ6iIOnrBrPvpf8=;
        b=LpxLti0H7oV3GY8UbwUDzo1e/ji9t2xeDbc/3CA7XnY2v5jyCxHns6iua3JCjX3QM4
         uSFM555ANvCV+ypqiM85Jrv4KatirZLuE1sFAzsbVc4tjLOdTa9zOAj7NkrgsbqbNPr2
         3PrURHnmku1p+B5pLZQnkoNlBdqhqtWVOA/RqNgQyhpQ+uunrVJJANn04+CbXBcZn1mY
         cqV9EFPdIrjE52+K3W+JLhQjKwkyGk+XfSVW70VU74nCUlSRQMgROym76hRncE7pzpOV
         EwM/oURLLPp+EKc1RoWDG9WbXGiTvSk4jx8eVxBOcnEq6NpWCawWed7T1fbCw/cfEZ82
         97Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019668; x=1777624468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LSr35TcIMW6wVIpT4GYu71Od3lJHQ6iIOnrBrPvpf8=;
        b=q9SQMmwh4I8I5X6uZEDxLD/ChhfBzznbOqib7zfDGXogGKIMATf9dZIJemLECu4vpj
         2JTUDF7Pq5mq4q5Iew3idO9Ucn4LKyReNrm217Ny6MQUx99a8M97kMuhkVZ3SYaZYuCU
         +tk/6/brx4GVBjPAvueWYkQgs/eonlUBEx6othr2klEWyoJsfk+jbNDH0XxO8UjH0f06
         Acpq9mgJMackG73Dge21xoFwfY32hBq0PFmKNLDoc52Ae6yK5hq26CRJ6hPxl7kaQcFs
         L2NxGd06HorzvFb29dY8sH7tl9qSnQn63I9oSMv5N5YLrKh9vl14R2mHl+gQqVFtoEGW
         gNyg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y7jSbOYnuZGzZQcHyc9/vtsnipxNG9mYMWV6eN3XX3rYQA9PMx38VU/q8e1HmpCzqCdrKXzAEQiaEwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Bbtp1vnIbfU94WPVnoMvUQNVWBLRk4+le/OmC4UYSLM1UNCy
	ELGz4ihMv1iSqEquDNSCQJ3BNxW7feN/B2f38Az+Oma16BZ1A5bAf4JR
X-Gm-Gg: AeBDiesn3vzTA9d+87JAyfaGLPRdQIPhlLRbjOpKD2DiO1xIl4T3nylbuevmkFuUNuB
	zM9JpM3IW+YWJGsmOoSOx1/n/IZ+zdHW/LVRPt1rLB8qB+ziZ5QYUaOoryUlGwWh0TRdr2Q3h0a
	Dz3zH5EhRAl1wonSdPxHhSmbU1bcZTgkgqF85fc+l0gccCsu5XSWir17Rr9C+OHg11A6CLhQ2xL
	uGN447ni8cf+CGp1uwDpBVVxGh0BcOuwCRLYImTY8IV9gfu63MolxELy4Ro4MxLTOXvokIJcIh1
	tXJawzoPbw97LiT2F/1yzlvqNFSltpVmnQqlTkhpccmjLucS+MQuk178O08jiOapC1443u3QnDw
	VoD5yG2HdNVjgazUmcNhjDlvh2oC+qSAX/qCRNDeV5jGvwaZ0KV5uiprcV7vIEagaQguxz/9fNR
	M4Lu6jFZZouWzTei9aNMOi90TM8Ki6hKdv+lgoRVmDqX5ogVC+bBco1UMSY6i1H+dsxjedEdoc2
	91kmg==
X-Received: by 2002:a05:6a00:3e09:b0:82f:456c:29f1 with SMTP id d2e1a72fcca58-82f8b385c38mr26954369b3a.12.1777019663822;
        Fri, 24 Apr 2026 01:34:23 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm22485595b3a.44.2026.04.24.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:34:23 -0700 (PDT)
Date: Fri, 24 Apr 2026 14:04:10 +0530
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
Message-ID: <aesqe2NKWhkT4kc2@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-3-mkchauras@gmail.com>
 <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
 <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <a2241936-579f-4fa6-a9ec-49325d44413f@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2241936-579f-4fa6-a9ec-49325d44413f@amd.com>
X-Rspamd-Queue-Id: 5155F45B8C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59497-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 10:25:25AM +0200, Christian König wrote:
> On 4/24/26 10:06, Mukesh Kumar Chaurasiya wrote:
> > [Sie erhalten nicht häufig E-Mails von mkchauras@gmail.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Fri, Apr 24, 2026 at 09:56:16AM +0200, Christian König wrote:
> >> On 4/24/26 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
> >>> When building with LLVM=1 for architectures like powerpc where
> >>> CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
> >>>
> >>>   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
> >>>   >>> referenced by helpers.c
> >>>   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
> >>>
> >>> The issue occurs because:
> >>> 1. CONFIG_DEBUG_MUTEXES=y is enabled
> >>> 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> >>> 3. dma_resv_reset_max_fences() is declared in the header when
> >>>    CONFIG_DEBUG_MUTEXES is set
> >>> 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
> >>>    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> >>> 5. Rust helpers call dma_resv_unlock() which calls
> >>>    dma_resv_reset_max_fences(), causing an undefined symbol
> >>>
> >>> Fix this by making the function declaration conditional on both
> >>> CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
> >>> disabled, use a static inline stub instead.
> >>
> >> Well we are clearly missing something here, but of hand that doesn't looks like the right fix.
> >>
> >> When CONFIG_DMA_SHARED_BUFFER isn't enabled then the whole dma-resv.h header can't be used at all.
> >>
> >> So you also can't call dma_resv_unlock() from the Rust helpers. Which means that we need to make the Rust helpers somehow depend on CONFIG_DMA_SHARED_BUFFER.
> >>
> >> Alternative would be to provide dummies for the functions in dma-resv.h when CONFIG_DMA_SHARED_BUFFER isn't set, but that looks a bit like it just hides the issue.
> >>
> >> Regards,
> >> Christian.
> >>
> > What about something like this:
> > 
> > diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> > index 71914d8241e2..53c119f1b144 100644
> > --- a/rust/helpers/dma-resv.c
> > +++ b/rust/helpers/dma-resv.c
> > @@ -2,6 +2,7 @@
> > 
> >  #include <linux/dma-resv.h>
> > 
> > +#ifdef CONFIG_DMA_SHARED_BUFFER
> >  __rust_helper
> >  int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
> >  {
> > @@ -12,3 +13,4 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> >  {
> >         dma_resv_unlock(obj);
> >  }
> > +#endif
> > 
> > This seems to fix the issue and makes sense, whoever wants to use the
> > dma shared buffer will anyway enable the config
> 
> Yeah that directions makes sense.
> 
> I would maybe go a step further and don't even compile rust/helpers/dma-resv.c when CONFIG_DMA_SHARED_BUFFER isn't set.
> 
This makes sense.
> But if that is not possible for some reason then this solution is perfectly fine with me as well.
> 
> The general goal is to make the error messages when you haven't set CONFIG_DMA_SHARED_BUFFER and still try to use the DMA-buf functions easy to understand and not something cryptic.
> 
> Thanks,
> Christian.
>

What about this one?

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..09ee5cac600d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,7 +57,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "err.c"
 #include "irq.c"

Regards,
Mukesh

> > 
> > Regards,
> > Mukesh
> >>>
> >>> Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> >>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> >>> ---
> >>>  include/linux/dma-resv.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> >>> index c5ab6fd9ebe8..23c8db0b5214 100644
> >>> --- a/include/linux/dma-resv.h
> >>> +++ b/include/linux/dma-resv.h
> >>> @@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> >>>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> >>>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> >>>
> >>> -#ifdef CONFIG_DEBUG_MUTEXES
> >>> +#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
> >>>  void dma_resv_reset_max_fences(struct dma_resv *obj);
> >>>  #else
> >>>  static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
> >>> --
> >>> 2.53.0
> >>>
> >>
> 

