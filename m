Return-Path: <linux-media+bounces-59514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBrKIB9G62kmKgAAu9opvQ
	(envelope-from <linux-media+bounces-59514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:29:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCB45D11B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88BB43021B3F
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2873C364923;
	Fri, 24 Apr 2026 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXk35PTm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4335AC16
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026404; cv=pass; b=btSeEvEaTdaGGlJknxaVs8ouFAUBuumcp42x9uqzLQtz+bHwjF5As5LRy4YMuWrlel1gj3pZeNCJChLlCG60H7zhZ9yHS6CJEnl2nAFmRzDde0l3ChxSQNeQN937eRYSHA62JDLQ4yIFG9ej0Sg4Ap31NEEdDhJWe90TzxOtSHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026404; c=relaxed/simple;
	bh=akrD/7yNgCJ2hr9qe1CwVyZoBGQGlAkQEpZNlJzWaec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9qI4YviLSP4/uzXGFxR/BAmdU5asW3ls0F1rpk3MNFt1YRE9n/RdErtWvEPrdnPDQIABq98Q3pHkgbh/75eOpZs60WBiUWRL9GC4GZ7bvjMNOkM7NtMCk3HfoYivuz5ShV9kLXqWpxAE6vX8Gp5UuT96v0t8UuF2K7kjfAVT1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXk35PTm; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2e6b6167d7cso355587eec.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 03:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777026402; cv=none;
        d=google.com; s=arc-20240605;
        b=UFGkzPc8kdjfI9PD2ZRnjFGIZd780bEotsxGE/3FL2ZUN1yqWH6BKRwG8Xu3lBGv2c
         T34Fzo9Z9awj3PuJ4phsNCV1gyPFlVXHJ3z45c4rKcI6WoPUL8KcNoi6VjuNqUxN07FD
         qjC8C29oVdegVAo3dGd58Rrre8PR6UtVWPF85tWbDS3T+vXQUvKWn+m42mOxlDbBMgsS
         Q+6kz5RaCPQzRa0beqO7E2BOmZuWOggBCaPO500gUcXbicrt1rb71M65+wooZjDPaWEa
         9iHcqz4KtPys/xe110YT0gDJWlaJ2yWELHd5XQtjH/Mx7gGUhCeHrW6p48Y5uL2aPEuz
         DUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        fh=Xt0jww0/VrwOD8HZdqwfuTbruZvGblnSDBlkJqC0Hp0=;
        b=NeWbZYwzbMEY7ALaeWAmWZ7xhqObpykrKUd82ZiotY9b8wN3fYl0scc9AnXk3UTDP7
         qFmngING9KWJleeNankSN2BFSHUJOgCCT/qrtR7zeHKVizky/MDkEGTsq9XdDVpciCAp
         gRaVqnAkIfRdIWX6L9he5W9UnBBXWImOhbbdS66A/oP5T3Yl7OmJ0qsv8iB7nQYxLpo0
         FkuQ5dv1GQf8VcYuCRX4zAu+D77hPDyNXdcqwN/T+cAzIWxfUQ0/fNitjqwQhOoy/0fA
         mkourQrvU1sTV3HGi3Gb+IK3IFCqFniZTukvd/XbXqIF4XIkVF7PHoUP/qog+jDr+/Es
         JBbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777026402; x=1777631202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        b=TXk35PTmOto1JDc3Q1rbc/04vhm9RddZYPrM819AtuB5kgXpiM89UnxX6el9HA1noK
         OQMjQUi/1sEYGokkhixaLGe7Vwr4ptfTyEPpzl4Oi0MGgYa4qiufzeE7RG+faJC/QcDd
         JvYgGobTBu3EU5zD1LPdpEuHYHW5VWT8aBK9zmAlge2PVCBcwldMIfFHA9JBX/0g3fZ5
         Rv1fWslvAxfc+3hpgnsg2Psod7FCfV6lG3l+PX0XsyQzaQBqiGMDZjR9TvQDJ7i+Sj6J
         jSUGeb6OafRzzPZutXosUMR4RiExEs/w2YB28XKTABpjJpotpyKi2R4YJeL9GynhhPyQ
         1jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026402; x=1777631202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        b=Oie7Z8SuiNUO7fyFIh/yaI9DBNZnAUj0nRIiGOChfvl12IhThMp05Ulr2NclXg/jux
         gJQWlVkU+vrRNISmW+8PtSoNbW3hkA+o+VaBc5z/KAsGUJ882/JmkuuYesjlLD9mEkyH
         IX7ttah/XT/5+Jxer5ZfMHibuaNvflnfHuD8Orm8XgiD9T5zrJXCh4Dg51++lRkntMbZ
         oa/EO3hKjvNXRG/mGQFAdxjtxofVn12IQbQ5sVNC/Gv+B9LEgf5wcGa1sUB0cu7y3BpB
         FfDoykJVKsyhCnxWapMrub2l49FcX3l+uz3MlBS5cIzZYcdMphldKzuagSV+HaLAouQ9
         hs3g==
X-Forwarded-Encrypted: i=1; AFNElJ8WuJ6rQEV2txcbq7fG9Cbrt7z2PyA0+QShhQQjwhWPwJ/kY38xrqKZ2swluC/6dtfagLAlVRokvBJOAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Yhe/XSgstXuDfUwEeB8O7wvnhHl9q5xnML05GEgqrv0x5Ib1
	SBTTf0feKH26S2xy52c/T43vZ/+bZnEDC204wb/LLilNRRvAdbdwmw/1Q9d4rNGbn6pQrzxsjUI
	ib+fJdWUVw9nEQPfgP6ezK+GpaUsP0aw=
X-Gm-Gg: AeBDievKY2J/tHyxhDK6CiJmawo1snMAj/ls0MsKgLwXjiODbTQYwayGEWOLIenF9Y7
	miYUtApaTJG5QmlzMwsMLO2dA+t9ktu9JFnSX6ZSOWonm6Ybx/nO02yIzBAK7qifzLmcT1+7LOk
	T7Kdsodh/bKxwBppUAlCtinFmK/9WZkkpi47O+xU2ddiJeL8qNVT9fyIcrvHcOUNkNEygx6hK1v
	wQQVMy0GQs+/1U+ESOJRr3riiOkuparb0cvkY6wdsoImUizoAdwreLbn/PUNvAAgRLMWfOOAVZE
	XapidL/YO/BrYV/5RWnrHhMsEbz2VFvbSFIEtf/0xaHVVWY+O+WP8Rks3u3/dlCs/5x7/KSa1ic
	X0jbxB0swh5+4AmLiWvefAQImyXS3oFRXAA==
X-Received: by 2002:a05:7301:9f03:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2e478a2e850mr6554300eec.3.1777026402324; Fri, 24 Apr 2026
 03:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424054742.45832-1-mkchauras@gmail.com> <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Apr 2026 12:26:28 +0200
X-Gm-Features: AQROBzDET6d-0hjNl0HV899j9TcLUcNjD1kIJArKfIFhDWI5iKiWhVLnvOkXFjo
Message-ID: <CANiq72nsYy-EUSMynykb=6QyR62M7hT61RoTO3F0-vw1oBMh+w@mail.gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: David Laight <david.laight.linux@gmail.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D9BCB45D11B
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
	TAGGED_FROM(0.00)[bounces-59514-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linkmauve.fr:email]

On Fri, Apr 24, 2026 at 11:43=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite figur=
e out
> how to do formatting without it, maybe I will just open an issue against
> Rust.

Yeah, I have some context at:

  https://github.com/Rust-for-Linux/linux/issues/2 ->
feature(compiler_builtins) and a way to avoid certain intrinsics (f32,
f64, i128, u128 and 64-bit divisions/modulos).

We have discussed it at some points with upstream Rust (including
related discussions about having more `cfg`s in `core` or a
`cfg(linux_kernel)` etc.). I don't think we have an open issue
concretely for it, apart from the Clippy one to flag the use the use
of the 64-bit division, but if you open a more general one with some
details, that would be great.

Thanks!

Cheers,
Miguel

