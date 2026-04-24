Return-Path: <linux-media+bounces-59518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAi9Oo1P62nkKwAAu9opvQ
	(envelope-from <linux-media+bounces-59518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:10:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ABC45D823
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E863D301601A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3877B39A7F8;
	Fri, 24 Apr 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZQhFnen"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01D3A168C
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028995; cv=none; b=dTTK6SdkI31A0/tF13dtr1MXtx0LSJm4rlpXKEjHfRIQ85e2+LxDM59gScFOPklRvpR0PsQh3RCBZ3pFdAe+YbR9e3aj2ohPJIvq8/SQcKT47AU4022L9GN435GyRcQ2SlPFniQXRAbvWEmrEKXz5KNXzrUkpNlh/BQ4WoVFTIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028995; c=relaxed/simple;
	bh=2m/skchHwc5eR3DekHbks6y2/UhAgeRXG9eMAJvaWJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1ws2/ejEJEksoIWZvIB2a0F7xnnwtKNbHvFZhF/AlWjFZ6MpnqhGU5YUt/dPRwRpTgoF0v0ZD62uHua5clt3DHaiHqzWgKzbi3vdom+QMFyeK0leep22NyVD4VlRg39RRU+jsNzPVDEAvy0FSjrVC1lO4hBEwNqLuXBQ879R6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZQhFnen; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so6063521f8f.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777028992; x=1777633792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDKNX6OzlxA7jl/VimGCsLSHmvQn0nEFxj0ZFcUDDEc=;
        b=WZQhFnenLpFmoian4wDUgJpJo0bgM8tJx9QmVT6XTuGZXb0nlyWyqBkgr7MPXk4vre
         AUQqhNYjqusSl/EaTewN3KUmXEfmdjFE3TSjWy3NyQ+3Z9vGMIXmNIhmvRyVyv6we20z
         yEPiVgtA9tuoghJV1jGo9ku6H69MEas9tQRs6WN06VTPAvFaB+QDWtkUjGXIHnZ9ru4A
         b8AjgmPLwkMNqDNlel6MKlzsjlXfi/nFbZHK1PCoc0IX+2KCppmW2NBvE1qYue7wa8sv
         UosYi3Xag3aKKUNjw0HNRXPWbjF+5Wo3AmcsnPSIBIqPR7BoSko4EONk2MOeBYmxcOJQ
         AmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028992; x=1777633792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDKNX6OzlxA7jl/VimGCsLSHmvQn0nEFxj0ZFcUDDEc=;
        b=BqSoCFOQt5U1jhKoW+4mZIWelycJQ/9BYZ/UQIltG2ykHu5Wj+8DEJjh5AtBQkfY2Q
         TC5nvM6R7ol5CZYQx7NLsxKKFj+Rqrg80q7r8h6ybv3+pYqqC60vCIA484NcU5V5xp+k
         FyjH2E8/BidE2cSaJc1kb/sKzHMtQfesaUCv2K4QpeNSbCupld6SU3N8YwP5MGA20KZW
         a/+l8UQPkK/WtxGovcc9raEbfwcYGfZllRt8riqXod8Au9Aovx6DFPHodN+BiEz6huDT
         EMXyLomvp7zM3q0U9/GZzea9uhdBGaVKDsoB240bYWCGIeVIbhixaVuMFiKNPCr0bJoO
         W66g==
X-Forwarded-Encrypted: i=1; AFNElJ9l60iKbKTgDHPBNVhf/caYaDeWLhk2E4bBkVqqqYWZYJe8rK/QiE+WJo09JBUpSOfeGF+p+hGcgZn61w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5zoOEcxSmDS2BPyaiCzfkbiLkPAA4TAcuXEQNY3OS+dsE2m5
	l9uZezIKHpw8sQXWvIaosfFKcl/rauZw+M6vHs5zgUfejDdrrNrZtqMU
X-Gm-Gg: AeBDieuYrdR27Yrw7ilpy3gqrpGiaC7QsmKJzdOtmgUxN7GvdFYEBvEUOgcvTz3Y/nB
	gOGNBE6HQwuAhbe4zOb9jEmdAWgXUgiYn05kDJG6HIlJY4kPpK0vZYlMcUo0eelM4JBHCZAdPNE
	8TwgnkD5d6OCTdtSuUT6EtPWg2U8GW2Yv7aWH4nuUDjGmrn7sBbwMmfTLyu1TUmtzlmMi829fFz
	K/GD2SBpRB5kszJXEfbgsl1BKTLpcGmI2KZtfcEcKaSZ3mir+MBW5wdL4vDgVTzyijSZYTit3nR
	hXp0gsGgFa007qLXqvJS3ufyba+vHGdXA6KT5Nmp+lb4GRTPKDH1RjngO9IvTc6+v8O055mgQ8D
	tf03GHBOlul4fs0K/1+fyfnYNF2I3KqplFXQz1rX3+NknWDBVIv8II43CkZ9PbTQrQsgOReN/HP
	E/AESe851PFv8WS33+x3Djjg7bNS+tUNAYV9JgajcV6/G4SXS6zOdTM6uc9zwORjO/IOUze+0v1
	oCSDRL1ZO2a3A==
X-Received: by 2002:a05:6000:1863:b0:43e:a69b:d818 with SMTP id ffacd0b85a97d-43fe3e0ab5dmr49306229f8f.38.1777028991633;
        Fri, 24 Apr 2026 04:09:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0f31sm59174867f8f.12.2026.04.24.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:09:51 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:09:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
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
 llvm@lists.linux.dev
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260424120943.4a65dd69@pumpkin>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
	<20260424101425.6bde0e17@pumpkin>
	<aes7L3M1d_LvvGKa@luna>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 60ABC45D823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59518-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]

On Fri, 24 Apr 2026 11:43:11 +0200
Link Mauve <linkmauve@linkmauve.fr> wrote:

> On Fri, Apr 24, 2026 at 10:14:25AM +0100, David Laight wrote:
> > On Fri, 24 Apr 2026 11:17:40 +0530
> > "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
> >  =20
> > > From: Link Mauve <linkmauve@linkmauve.fr>
> > >=20
> > > The core crate currently depends on these two functions for i64/u64/
> > > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t u=
se that in
> > > the kernel so let=E2=80=99s panic if they are ever called. =20
> >=20
> > Ugg.
> > Surely you can make it a link-time failure?
> > Or change the underlying code to avoid the divide. =20
>=20
> This is currently a link-time failure, which means if any of the core
> crate or drm_panic_qr are linked in, the kernel will fail to link.
>=20
> And since we rely on core, that means no kernel can be built on PowerPC
> without this patch.
>=20
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite figur=
e out
> how to do formatting without it, maybe I will just open an issue against
> Rust.

If the problematic code is (effectively) printf("%lld", val) there are much
better ways to generate the digit string than repeated 64bit divides.
On particular you can use 'multiply by reciprocal' instead.
For example see the latest (I think it'll be in 7.1-rc) version of
tools/include/nolibc/stdlib.h

	David

