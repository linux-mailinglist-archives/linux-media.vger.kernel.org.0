Return-Path: <linux-media+bounces-59505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMJWGHw062nQJwAAu9opvQ
	(envelope-from <linux-media+bounces-59505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:14:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C245BFF2
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F7C63002B3B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31138386C37;
	Fri, 24 Apr 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THlHo0Gb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3D830F7F8
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022070; cv=none; b=ATA1oFX7qz6WAyNTuR+adK1pufXaHLUzDt1leeduN8gjW/7R2eSQFPpp+2bw+EHSdbEZqM5IPvab9NvSPBVwd+GUglbZKlghaBva5EcmYMopNDYkTkq5/cX7GHG8UnXGDR5E35TwEbANDXNUL/YmtUmmZXBLamzpXWJtqsk8YeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022070; c=relaxed/simple;
	bh=hLKUufOKq2/TL+pONPnhEwc3yGdP/dz3A/DBg3KQZ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ft7UNwaTuRDM22RrnC4XqgL+wiEvl3EBP63La3hQjF2kRJ9Xt8SM70gpwS7Mf4DD/uHxEDy5BqyVK8wmjkFIDjLLFKDftNski6s45lAe7RlrseC2hJlTj21JI5YHaUH7TjVUeRW2rnncUnTPeCe/48wZte3bq8zM5J6lz+Ef6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THlHo0Gb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso4996764f8f.3
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022068; x=1777626868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSmDvRkfSjghcrtIGnXq0grda+xm9HI4mnGbjcUNF0k=;
        b=THlHo0GbGR13/Zx5CTXsKXIHLyGZDJ3J5YBN7qbf6XpcMJiGDZfDBS4ofdxF1jpbZ1
         n2f9Cek4RmVOeiFAkFjI91lX+uSXSeLL1iXDtmKNi+KV7y6SPRj/hRIdvBEhIWzkxoAy
         XnsYFVrrrplmfJQ9B3sduLBsrz7pKF8zV5EZ1JHvRs9wIRSxOfQpa5th2Pn4B9JEakhb
         CnVknD/IINyhwkiQ++JiUSUrxHSm5FcR0mRKm9JVkHvl2nHlCW2Td7aC/X9qN3UFnqfS
         Nl2FjXB4xtd3+18lDweR2w/J2Qo1moGnkduchcVN7AifnrdnKgQoPn8HRixe9h7l0ps5
         ytCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022068; x=1777626868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSmDvRkfSjghcrtIGnXq0grda+xm9HI4mnGbjcUNF0k=;
        b=alxRi+CwXZlKHK3e3QRhptAcI5djHegh31VJVS1i1XHxuT/9ua18sVNkjzoHY/DJ4T
         tychRYcuD3rXmsDvI4X14ZzjtvR9voiHQ8wQN2ntI8eLcCq8MKYzUw2zf7I9US22n2xb
         mw0Deiogg+MS4O6mcIit500fmOS7pSIgRQnC7RpQFo1CZCCTZTlYGPHRdahdjCnOaWcd
         oHFvwOUDIUv3T0Mj3/YyZUxaxZbs7gMFubeyPKQ6uhlzPXUwp+5rBazOs2FicjsPJQ0K
         IJNQkjyWs8HtZfXPQBnB9iaIrDGQnc7l0fbKnitmeWuCj5wYzgoZhoWThGysNurOtE5Q
         zBEA==
X-Forwarded-Encrypted: i=1; AFNElJ9aAjmo1vdjqXAlXaTwzcDkHKIKgnK/TzJcbIFbjdLe26zFLO9JmqjzLNKI2N+ZEKH2atqH6X56PyizGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxppRqgUe2k19NOxsH6Z4MEWIS4G6AYuvd1H2UxeCa13N1qYQ3x
	19xt3Ti7uD4UOQdF7HGXz6YglGKpu2/eNLtkBmpKPMcB56xEKahhLuHW
X-Gm-Gg: AeBDietKi+KoOA6SdG09F5LUJgSF2u0Z9XbXfEpQfK5T8u7CewnZPmIhu95Zv/JjysD
	4QG8rSyLO84kGnmK/QTHu4tzOmf5WqdqRT1R/Ko/hK2B1IBZIv2p7bJGAoWD1ckv5sXQO4vFPzQ
	olo0REL80RuTujanjcp/fxmq+yLbvY2Y+vG00M6nwGs2DsutqVPFTp4LCd7D3w/NfrArC2KfI72
	c6Alxn8o4wziUKWnzlkNS7CCp29G2EDe8O8w9g3F1DZqk48EAl1iGO5xK3qL9CIqdoCbfQKci2H
	OFWqOR09U+//AOfN7/vG08HbubLuIRbLfbIWyXKJEvPxtzZ2swOmNZumfSnPQ5InqvPnaFPAx0t
	01K8zkYaod/0Euwen3u0jbT0YTLdNBwRPBCrPEO6occrV7Gaw/LSMfaj4dSf9WhO+iXIRQtm5za
	nViB3sDaEXfNFl34USDMvmwlvgT9MHFDgL/m94/T3Hus9ek6SbVABgG2hTXlnO8HMaVbpFz1XRs
	eI=
X-Received: by 2002:a5d:5f84:0:b0:43d:7783:c684 with SMTP id ffacd0b85a97d-43fe3e1e092mr49352860f8f.43.1777022067498;
        Fri, 24 Apr 2026 02:14:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a092sm23750898f8f.23.2026.04.24.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:14:27 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:14:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260424101425.6bde0e17@pumpkin>
In-Reply-To: <20260424054742.45832-6-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 158C245BFF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59505-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,linkmauve.fr];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linkmauve.fr:email]

On Fri, 24 Apr 2026 11:17:40 +0530
"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:

> From: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.

Ugg.
Surely you can make it a link-time failure?
Or change the underlying code to avoid the divide.

	David

>=20
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi3 w=
hen
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the kernel
> build on PPC32.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/Makefile             | 4 ++++
>  rust/compiler_builtins.rs | 6 ++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index 2a5428a5503d..ee11fba7a03d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(=
CONFIG_64BIT))),)
>  		__ashrti3 \
>  		__ashlti3 __lshrti3
>  endif
> +ifdef CONFIG_PPC32
> +	redirect-intrinsics +=3D \
> +		__udivdi3 __umoddi3
> +endif
> =20
>  ifdef CONFIG_MODVERSIONS
>  cmd_gendwarfksyms =3D $(if $(skip_gendwarfksyms),, \
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index dd16c1dc899c..fc6b54636dd5 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
>      __aeabi_uldivmod,
>  });
> =20
> +#[cfg(target_arch =3D "powerpc")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> +    __udivdi3,
> +    __umoddi3,
> +});
> +
>  // NOTE: if you are adding a new intrinsic here, you should also add it =
to
>  // `redirect-intrinsics` in `rust/Makefile`.


