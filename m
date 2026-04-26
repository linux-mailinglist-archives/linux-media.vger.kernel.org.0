Return-Path: <linux-media+bounces-59623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COL9OkzE7WmmnQAAu9opvQ
	(envelope-from <linux-media+bounces-59623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 09:52:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE8468FB9
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 09:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EC4F300D68D
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 07:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7BB2EA173;
	Sun, 26 Apr 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTB+Nd3T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654EE2AE78
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777189960; cv=none; b=goM/Su2S4bZBsY6YfXNfWAWjbUaMk0WmB4esyq/gYZ7CGNxXI+bZXLab9RY4MyzwZIUlXvkPvGj1GLqm9vnDKgwrvKnI/5hlBAOdYIhHQtpMMXwQ5o6+uPoYjbr2L2ugrIucLtx22BfIdGwxANZl1ycZagt/ff7NDzPvwhCL/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777189960; c=relaxed/simple;
	bh=DXQYJ4tGTxVmhBiqN0e9ilWp/OFflVfJWy26XX2xBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmZfBSMpdfoilJS/pCchkFIQTZBorcgSUW+AJyWR8zqoPJkdJBba9FW3LU24CcUP8xdwY6EiDE1v320ll8nRTziXgZCe6uOoqysWcj3Et0WeY9zNVdWWVhlQNoVq5xah6uCIoPAPuaeYpkAw8MgZT3n/eJX83/gQ8UObfsQTg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTB+Nd3T; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so3189112a12.3
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777189959; x=1777794759; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8zTG+Dw6oqSR8kg/1RMP0Ayk7RcQFqZXb8XQS8VS+9A=;
        b=FTB+Nd3THylA89BIaNmnrcb8kMxGC13bZLxdzJ2vnA+V5QRCXRoHfaGGJK+SvTFiEZ
         vVpWks+Pl5znyFf4xlCKLew3038Z6w7ZlIqL0YOaWwpde4nLn8UbKby6Z4Q78DtqxNyP
         BpGqXbPqU6iAKGXlnzkIBH6JcgRHc7YEvpHyP9Yn/CL1RR0JIJ2OQitEPTJ3amhhax7x
         2SqBlyhX5AeJbD3fFoZeYXCyOFqa10qyBuXNSb7izDwj5h4g+xJ2oi8XaTvOLUIHU63m
         mr2MCHxI15LF+BkJ11qe2zcddMGOf3cfiFJx6dFX/WT5SyQqSt8AscLJH4J+iQFngTF7
         I14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777189959; x=1777794759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zTG+Dw6oqSR8kg/1RMP0Ayk7RcQFqZXb8XQS8VS+9A=;
        b=kyh4SF7NAvWybYOvqzBTRtWqgkoYx9TcEJ/mcti210Ol4gu3mJvXHxIXuTgs+5gDnb
         X+aD8KWj5g7G0pE4a31eyQRMWgTlmW8uobjPUdYWnfG935GbDQmWQQ0+EZV0qKkxNiQY
         G4dEN2vskA7b+lrbP36zoVrXraPTzluajWb4l3tWLqsomgTOoMjFMoBxFNGW6K9EQTCt
         CQzBKFhORxlV6HWcArEMb3X5WuV4dj+tAkludz87mHTlhamHKqR1W7VyrmUNRwixV1Fp
         4mJkVYoDTywJeF28nhHNDR5huxQYOvnPoJpGwEfz5kN9iW+/XHXYQslHWcCN6OgIo4ar
         wdUA==
X-Forwarded-Encrypted: i=1; AFNElJ/dlJorN9L+WYpben6Hm/pg7pWrWH6fUT6LvJbcK2r4Sfd7JcBJlZlfBbSDH6VBH3POiE3FdbKigoYPig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtLTTW9m1ADfOwwB5Qh7ZoqY2JVKuioiPmfUVd9oJ1WVMiBwz+
	1Nj7OLMUug042xK5h8FfzcwjXJ9hrcXMyxvjconXH1UNg5RCsYZ7Lx6k
X-Gm-Gg: AeBDieuM0mpZmIMqQjt2JrSuoosFZ7QPY44uZNwQwIihP5EgJDVrKhFPJMXszBjIvMy
	meKNobE/JAxgBqfNL5zW27SHh5fTWugjYDS9DfmhGRFR0ReNxUDms6a25X9UJN3tnvm9JV8IZ3B
	daf+4UFG8VzEQtMlhbDeTaI7Fk7jFgvcRGPPalm+UuVIgkeDAHF7XtTxfitqbLhzYV/g4Ut2QYy
	TbsKhj4ULiVEWjehB58H0s3aIYOBE7bgHBHSkA1LK0fOJjCNzbTXuNAzlnACs2zrnYIM8rV8kp5
	itnmk1UW5zbnXhWjPR6ru+7Qq7+/MylktGEwZ9ph/QoF02FUS00++DQ0pBrE5zPJiriIYRjqq7b
	ZY1pq8ZTyNEVlBx6jC4rooz7Kb2HNap1azLMESd+ZPAj8VERDT3eV88unbAA+BVIFqsqMvlHlLl
	60bbWMssNMB4ZMX0pKFI2HkxFtSEREyg+2MaPC79tA9QWXuCQKgldQfUu0XcIWJ0Df2x5eSJ2IV
	IGaRYuRSA==
X-Received: by 2002:a17:90b:52cf:b0:35e:577c:c9f with SMTP id 98e67ed59e1d1-361403fb305mr37768192a91.9.1777189958672;
        Sun, 26 Apr 2026 00:52:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1436sm10396034a91.11.2026.04.26.00.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 00:52:38 -0700 (PDT)
Date: Sun, 26 Apr 2026 13:22:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, 
	simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
X-Rspamd-Queue-Id: 6AAE8468FB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59623-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,linkmauve.fr];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[36];
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

On Fri, Apr 24, 2026 at 01:43:43PM +0100, Gary Guo wrote:
> On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> > From: Link Mauve <linkmauve@linkmauve.fr>
> >
> > The core crate currently depends on these two functions for i64/u64/
> > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > the kernel so let’s panic if they are ever called.
> >
> > This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
> > build on PPC32.
> 
> Can we always build libcore with `-C opt-level=2` even if
> `CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix than
> stubbing things out.
> 
> Best,
> Gary
> 
The issue is not coming from libcore itself. It's the driver that's
causing this.

Regards,
Mukesh
> >
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/Makefile             | 4 ++++
> >  rust/compiler_builtins.rs | 6 ++++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 2a5428a5503d..ee11fba7a03d 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
> >  		__ashrti3 \
> >  		__ashlti3 __lshrti3
> >  endif
> > +ifdef CONFIG_PPC32
> > +	redirect-intrinsics += \
> > +		__udivdi3 __umoddi3
> > +endif
> >  
> >  ifdef CONFIG_MODVERSIONS
> >  cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
> > diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> > index dd16c1dc899c..fc6b54636dd5 100644
> > --- a/rust/compiler_builtins.rs
> > +++ b/rust/compiler_builtins.rs
> > @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
> >      __aeabi_uldivmod,
> >  });
> >  
> > +#[cfg(target_arch = "powerpc")]
> > +define_panicking_intrinsics!("`u64` division/modulo should not be used", {
> > +    __udivdi3,
> > +    __umoddi3,
> > +});
> > +
> >  // NOTE: if you are adding a new intrinsic here, you should also add it to
> >  // `redirect-intrinsics` in `rust/Makefile`.
> 

