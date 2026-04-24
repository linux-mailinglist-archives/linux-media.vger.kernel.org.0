Return-Path: <linux-media+bounces-59516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPs9KYJI62mWKgAAu9opvQ
	(envelope-from <linux-media+bounces-59516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:40:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DFB45D3C4
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E65C1304CA73
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4EC37881F;
	Fri, 24 Apr 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH3FI8eo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44198371897
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026882; cv=pass; b=TW5JZ+gZxeVMDaBGc275ohfmFmMcMnK1rtKZb63S4eFi1QRzRe0i4aM4drpcMk0Q0h+o32oJKlIIv0DsAV9hkdu3E/swA+7eapTCewSfsoRWaRs90LoDH0q3SqK1uR3xn5ZL7c0NZAB4OWzNta626yM4ws7FedNp01E30Om4ocA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026882; c=relaxed/simple;
	bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6n7vxJRmh4GWFEHRvW77aGASjK8mqp46EEAmzSYB72WHVuyD6Eaas/07joe7uQDDtioud7O5OKFvF5mPAaj71CNL6JMk5ZQVLSPKRE+c9dZwOLPLd+1ts6kyXh39vI4zeqo2E5/kFSd37eS/TOP1ksmjT5coV+5nXmOcU/D8hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH3FI8eo; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso995229eec.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 03:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777026880; cv=none;
        d=google.com; s=arc-20240605;
        b=ja9yUVsbhg9whBuk+f5+WJyDc1R/4Wgjc67Cib8aiI8v7DHtFAot0rTJRlNMgGkpDG
         +DNLvlMy8dKcwvhHhsJdSFUZt3CWVQid3/oBZiaIEmKdZVJmROT1czo4xL+9Kq7Nurph
         itd6RH/Xx/Nll43Lc42QX135FTu/krQNyJ+LXQ7sBhpyovoK7GrHzNXSi2xTNa9USyqf
         R+FpfTGcqvVdsiyKeqp9NRYp5AESagq1VabPkrcXFLmhQP4AdqkOE68lL8JYADc5ceAx
         PsQ7c4LWiLGp42oqawQGnoPFO49szkNQCi7JXNeJDaRSMSX2IlAezGIZTrew5vOTM7eU
         Yx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        fh=1e+0MsWxt51NOFf+vLAyhY5Bdipc9R5rkl+m1BlkNBc=;
        b=b8lFVsHiNd/UnrHOYY7ooEAien1EvL5V7cjOt7UWKizLfKqrw+CJNbU8qpEhQ2XmO7
         CREw+hndn8BdSYr0XUz9p3SDGmEOUZEOhkR1v2jyFcFywBmz4iXd3uqxdv+AJdVVas7C
         EfjugaBY4RW7+1SmZZAJFKZ7dzWpnAJIqFDd7XPxtPCRxPCirtNPck4ea0caPGiSVTjQ
         +ubcAaaCgoGyqHR2YECQ55v+Ma6KS/JyTQTpX6JqPUPgrOChL8MdrxHcDTjbmjd06Me1
         82c9uz+DK3gjRq1uDrrQjC0+bwgSfmGxMb4hZp6t/aRHcZNxVEOTT8qOOWn/KNlgmRFW
         tVxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777026880; x=1777631680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        b=GH3FI8eoaeOISDjCG6bRh/anVmMs2qAF11E2gOV2wf/U9lrjah+oHi99lSujwadRbM
         X1NK/sKVRs5iL7VM96OJv2y/AVA6LFiYHmFW+jMFK6l7ic1uS/UEJ8Xozml+B5cXM7zF
         4dA8LT5EuwqbCdzX4uP2E+ZIlmb5Ihr16wzKydko2SpHeYL5gzxrDTAunJVNeOHNe3th
         ZfTAeNnNUSVz+UzcBmfXu3eZrrEGMjIJNoypRXCGb27uxEQXcF6GU56lmDomcACgKE0o
         59CsQhQH7oEbMTBNeflbLLkh3H5ijtdy+X3y/KHTahZjFidnQrRaxqCKyLU41ZxfGogj
         FxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026880; x=1777631680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        b=GtLFcX1lC91XBpYx/GDdu/L38uW/8zvtx02U2ZG/N+5bhB4JLrWzR7+bgpZHWsukwT
         z3PL+scrzOWPJ5EIFE6f+IowS2qUw7MEJQxCyQIz4WWUEDnX1ACdWzD7n3pmJkdvVj+2
         hnTI9n4ipNh5oGUTRiz9GoHQ9q+wdmsqELvccc3roCKHj+CHegZADUgHecdYB70Y2jbJ
         Z0jBtDyiZXJKB/E0y8Zo7t+8mChNh/0dDuiTSa/pI2+xS5FiRQpEN3RqY3GeAsxXrDua
         Z4UFAyTEuoYLqu4kDpY7lmWZz86iMSfc28aqMI1RY332VVTHaq1jMYbd84WFk4iLAnQX
         6VOw==
X-Forwarded-Encrypted: i=1; AFNElJ8J73Msi6VAZ20IvXDVJTCckTDQ0sIaDJ9oC5w4gl1VtnjIkog0z3XwlSDdAdvo/Aol38F8nDHsjxg0Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNgU1gELXgEdt4bXZKTHhXMusGUeLwR9makMRvTJROw9dau7W
	MmBlnM5CnUV7mJp4w5fkt1INNOSmjWnxr5N+6u/Cc2oPBNYEES8+4JeWFdRfhQbD1DHfk/uSPij
	7b0QuIxxEN25NS5E/SVqICjjBsoWt/ak=
X-Gm-Gg: AeBDietYDBxl9S+r+orbST3zlwW2IegJTxSg67AkyYuEogVSJ+n86cVNfj4R3ufwTux
	7NcSOS9dmIjr0o89MZ1k9E19+ncQCOGEo5dIbO+WuSCH6y6TRLilqMgC4qJG+rENkJt/zUTepsq
	iGwVZ00qR+Xg0ZiOYcI0oGg+sZFMEJCjapcj6Vjdw2LfN5vXHg4fsig5HAz8uJqdClTsPAOkT5x
	sD5kGReEe4oHpPfXey8J/3py8+3DlaSHF6GioiXdmWYt9uSX/f582t4JxMt/YJXKzCbqxcpLH/b
	eY5pzblXP305PkGvuSFU+delweDjHnD3oHiH/ezVnIcTYSSWaUnIfg2KoFadOzTS9txDSwxV2bz
	y1jGOFDVm9WTOEAAN4Zdx5pNNoCnGcmBohg==
X-Received: by 2002:a05:7300:d50e:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2e478936a32mr6682650eec.3.1777026880251; Fri, 24 Apr 2026
 03:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424054742.45832-1-mkchauras@gmail.com> <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna> <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
In-Reply-To: <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Apr 2026 12:34:27 +0200
X-Gm-Features: AQROBzBsdDZLB2GUpMgvGgFgU1KPjXwk3TMpDFKjffQGyp1lulncbpRBZafhAFU
Message-ID: <CANiq72mZGb+mTwP-8pTLe81oM0QnK-WtQeVjKPiP5m8zK_tOnw@mail.gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
To: Arnd Bergmann <arnd@arndb.de>
Cc: Link Mauve <linkmauve@linkmauve.fr>, David Laight <david.laight.linux@gmail.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, boqun@kernel.org, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, tamird@kernel.org, 
	Nicolas Schier <nsc@kernel.org>, simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 03DFB45D3C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59516-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[linkmauve.fr,gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arndb.de:email]

On Fri, Apr 24, 2026 at 12:21=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> How hard would it be to have a private copy of the parts of the core
> crate that the kernel actually needs? Since Linux is neither quite
> hosted (using a full libc) nor entirely freestanding (still using
> some library interfaces), the C implementation on most architectures
> has a small subset of the libgcc that we ship with the kernel.
>
> I assume the core crate is larger than libgcc, but I don't know how
> much of it is actually needed here.

It is fairly tied to the compiler version, so it would be a
substantial effort to support across a bunch of versions. Instead of
that, initially we asked to have some `cfg`s (i.e. conditional
compilation) to customize it in the few places we need. We already
pass `--cfg no_fp_fmt_parse` for instance.

There were concerns about combinatorial explosion of `cfg`s, so we
suggested `cfg(linux_kernel)` or similar instead, though nothing
happened so far.

The other option is to at least lint against certain operations, but I
think it would be better to have a way to tell the compiler we really
don't want them generated to begin with.

Cheers,
Miguel

