Return-Path: <linux-media+bounces-59635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QADSC+SL7mk+vQAAu9opvQ
	(envelope-from <linux-media+bounces-59635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 00:04:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C86F46B58C
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 00:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2C7A3001CDF
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 22:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B6E30C63A;
	Sun, 26 Apr 2026 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYX3tGe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8030BB8C
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777241053; cv=none; b=IgqgZU+uxqRkKBzQS6Vj8vokeEVn2Ylk91PJzVIqavikAbbm9mJ6+VqqtVfcocMWlo/9MoXOIgfPS4PcRdHaEgK6WZbszBt9Z2oI11Y9Ly+NNMjvfXKwToGproXyGcW6jsVczBf5Vr3yWMnVYb5WR8siXa6Xih6NOTcWbLwtgoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777241053; c=relaxed/simple;
	bh=bchPTyFZ9H1PCbGJT7Y+DuDtB6LGefR0py0MYE/4h2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EswaSzsqMFHpz5AhGnQ+cyEo40dMh4exa8ENvy+yA5Hp6NcrrdteBYXNnEH5DZkc8f2SNekuffNR8yQcrZyuf8p9HQrYPxbxLgZDPrPANBVxZsLJ44zyJr3kPsYQ6zV/72H0ULX2QNP3oyRUFzbxL5hPxRi2NM353fCvoXYf5kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYX3tGe9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso95849755e9.1
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777241050; x=1777845850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOSUyfe/TldkyeaDzXd5HdT1X+MuNFQMhpVSGu+NHxw=;
        b=ZYX3tGe9yoe1nOTlatjRQOQc61ib2Tm7S+GZGqjBRtWe95krlLqihRJLAnw55Z20Gj
         fYOUqBLpNt9/rx96m/8jaGHe0uGf2j6QOR3g5PORyWAuKv8Ujh39LUCy5va7LUWmV2GC
         agB0bUO11Mx/D3ScJlsYEqvGfu7JH9ZgqD2bC7nPGEmKfac/uIqu7J5xVd7IDqzfpU0S
         PhpvDFg06y1L8eqdkre4eam/hRzVIEi/nc5dtS5WvqiqxESXnZW5AUdtfjL0poJ5x5HC
         smTDPldQEIoJe9L8ESElcy2drGo5jbQ0dZ1GYsEuolSFImlEhiaJpjVzbp/75MfQzrGO
         rKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777241050; x=1777845850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOSUyfe/TldkyeaDzXd5HdT1X+MuNFQMhpVSGu+NHxw=;
        b=Dje11e8OOl5mHOq0izt0DPZUz65YYw4CYwoxLKaLH1bb8mXsSorw/GbI8yDQUFrgG2
         Lo9pyvemdPWrr+A0/ptiyA9RWC7UwEOyYO3UP45foS1nN8v27UKSfOpt9fJe3qZas60T
         ZiOxqHEIaQltC7UOofqilrx9j2+6ShVinUQxzCk/JOsIOglmNMb2w7nH0oU2t56UsvQe
         b6R7ciBscAvl4sdGnCGhNvoGFJSQdHmm0/5VfQ/P+pnDAdA9t69ZtPEmrCluEjAeKrzy
         x/9ExeMwPywSeCDeqQpUu8IYW/9eweTpVV6GHs6qBjepC6+eGSPgbFEQe18rn86jCof8
         4aTA==
X-Forwarded-Encrypted: i=1; AFNElJ8eEc0MQAyn2nQU4VfQD1ivj09CaMBiBFu5Jx7kQPTqyFWPuH1NO/n138OOrVVisbfafKbd6HCfux+zAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzobOENY4VXIIx1Hta5mNlZUL04K30PxsJsnCOiI06WNWT4kb4
	NJPwFZWoqqGLtkjpkgZweR8+0Y1WPP3rIwpDF3z51DhhWCu9NznwrUo+
X-Gm-Gg: AeBDietobcv54eH/K9/boj/XeIRzniR525KJWdoRxkRwBG1Di57uESnIO+yRygM0kTp
	CCAihUMJ+R9jwj/mA5K96FELRsXq2NbJoZlp0th6vFrXEMxqTpn4rdqXUHA3BSdFmDN4Z7daJuM
	KNNWxNiZX9i66cpeE/sUdyDJiezTMe1Xsznnt0hkak6EizD9v6Shimtk5dvfqRkDDPVilmpon3x
	gzbNnn2kz6HiSaA1T8J1eaUrX/WPgxA5CtEw/EkKQ83sgS2lhFjeszuZ9SACuhariN/zc2j0InE
	TwNjZspxuRvIT0Bs4VEnzI+jzCh0d7dZ3JP14B2UKBDhnGLgUFwmilf4G02VFR61am8GHwRg2lF
	9XuLgcsZvJJiBWb4DQtZr7K8qT+TEb/tHj/r3PouZ3uS+HOvIbhVNTm/bQ36tCOuC0NPgpwm44m
	bXB9ie8NlRoQwGBJq96dWtUIen3sxKA4zbvQEWoFB+ez8gKR0YJGhxaVT96jn8Mr6PSCsMqssv8
	Rw=
X-Received: by 2002:a05:600c:3150:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488fb8b9debmr118860245e9.13.1777241050182;
        Sun, 26 Apr 2026 15:04:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55743c06sm137051075e9.2.2026.04.26.15.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 15:04:09 -0700 (PDT)
Date: Sun, 26 Apr 2026 23:04:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, <maddy@linux.ibm.com>,
 <mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
 <peterz@infradead.org>, <jpoimboe@kernel.org>, <jbaron@akamai.com>,
 <aliceryhl@google.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>, <tamird@kernel.org>, <arnd@arndb.de>,
 <nsc@kernel.org>, <simona.vetter@ffwll.ch>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, "Link Mauve" <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260426230408.489c68c3@pumpkin>
In-Reply-To: <DI35IFD8M019.2WGRH5ADW6NOG@garyguo.net>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
	<DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
	<ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
	<DI35IFD8M019.2WGRH5ADW6NOG@garyguo.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2C86F46B58C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59635-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,linkmauve.fr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,garyguo.net:email]

On Sun, 26 Apr 2026 15:20:31 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Sun Apr 26, 2026 at 8:52 AM BST, Mukesh Kumar Chaurasiya wrote:
> > On Fri, Apr 24, 2026 at 01:43:43PM +0100, Gary Guo wrote: =20
> >> On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrot=
e: =20
> >> > From: Link Mauve <linkmauve@linkmauve.fr>
> >> >
> >> > The core crate currently depends on these two functions for i64/u64/
> >> > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t =
use that in
> >> > the kernel so let=E2=80=99s panic if they are ever called.
> >> >
> >> > This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udiv=
di3 when
> >> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the =
kernel
> >> > build on PPC32. =20
> >>=20
> >> Can we always build libcore with `-C opt-level=3D2` even if
> >> `CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix=
 than
> >> stubbing things out.
> >>=20
> >> Best,
> >> Gary
> >>  =20
> > The issue is not coming from libcore itself. It's the driver that's
> > causing this. =20
>=20
> Sorry. I quoted the wrong part. I was asking if compiling libcore with O2=
 gets
> rid of its use of the builtins, as that's what the change this commit is =
for.
>=20
> Formatting of u64 will be needed, so we should make sure that these works=
 as
> intended.

This code (from nolibc) will convert u64 to ascii in any base:

#define _U64TOA_RECIP(base) ((base) & 1 ? ~0ull / (base) : (1ull << 63) / (=
(base) / 2))
static int _u64toa_base(u64 in, char *buffer, unsigned int base, u64 recip)
{
	unsigned int digits =3D 0;
	unsigned int dig;
	u64 q;
	char *p;
=20
	/* Generate least significant digit first */
 	do {

#if defined(__SIZEOF_INT128__) && !defined(__mips__)
		q =3D ((unsigned __int128)in * recip) >> 64;
#else
		u64 p =3D (u32)in * (recip >> 32);
		q =3D (in >> 32) * (recip >> 32) + (p >> 32);
		p =3D (u32)p + (in >> 32) * (u32)recip;
		q +=3D p >> 32;
#endif
		dig =3D in - q * base;
		/* Correct for any rounding errors */
		if (dig >=3D base) {
			dig -=3D base;
			q++;
 		}

		if (dig > 9)
			dig +=3D 'a' - '0' - 10;
		buffer[digits++] =3D '0' + dig;
	} while ((in =3D q));
=20
 	buffer[digits] =3D 0;

	/* Order reverse to result */
	for (p =3D buffer + digits - 1; p > buffer; buffer++, p--) {
		dig =3D *buffer;
		*buffer =3D *p;
		*p =3D dig;
	}

	return digits;
}

int u64toa_r(u64 in, char *buffer)
{
	return _u64toa_base(in, buffer, 10, _U64TOA_RECIP(10));
}

Not hard to do without any divides at all.

	David

