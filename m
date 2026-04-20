Return-Path: <linux-media+bounces-59117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK3LFhPJ5WlIoAEAu9opvQ
	(envelope-from <linux-media+bounces-59117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:34:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A94273FC
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13B193005154
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF9C382394;
	Mon, 20 Apr 2026 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkkhNoIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7627B32C
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666886; cv=pass; b=B7OmlhFme2AicCbzyIsDYC3yARlSZKIJo0HQGHLF5N1E7HemXSw7U1fmd/euOWVPiNIQ/5Ht7iNVWkQJBYWYz7nsw6ENUyOsc44p3jb9+A11lgS1EG9HZDhofro2Eh/+VyidOmlbIIhC2Gsml2ScqjRS2HyDyDXlqaN70wJSQ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666886; c=relaxed/simple;
	bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsS0o+Eqg1FhJQjG9FBtiglBo6z08ud9/SMHoEbybHRb55S6affz415Zk/UMaBPbIxyZIlmveAM4qpTLWPQJfFVLX/qXFlLZ9mT8BFG556A/0+ANqLBO3rrClzmi9FZk4IyrRwomONqgBJ+8r82WXMLa+XiGvvwFwvdZ4PdGAvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkkhNoIC; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba6b39871a3so164281666b.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 23:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776666883; cv=none;
        d=google.com; s=arc-20240605;
        b=kF6oDU5esvtcq8jim0VO1OPG3VNhQY47HpRR2eFbWBKrPj4RnbzdLuISctlY/AeQpY
         XolqQXHEG/h5sbM2caImDwKuCD1q+zCplnjVYDQGqT9V9dRYwLmOzOE1IBia0gO1k624
         Cee/ji0Pmdq5q3VfeSfuEmTo2/fmQcC0E9UKpK+QCy6XJSXxxMK32IX8UVouoP7IjCyi
         zmMDchILHiezzhY6Fe41izkt08tr7sFw0w0NDHe9Wk/lqNoFvylcNSkElkb5yWWkypny
         zZgvepzlHe1Oy7AgbBgiQgM1JEv3ROYfkX/LpD9m1UAv6OCEsZ9Yh9k5BU2r2yMAHP0i
         veEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
        fh=vUvXfJVceHFgWUpRt3hdStg8WNBVvvze/3gUGoS31Bc=;
        b=FxJxOVyi7DnHy/6uVnKN7SaptJ4Fw3rEPPb91pKeQzVSytSU2DPsuOLjqv2BEKo+Jh
         2eV8bYGMDXTL0FtYTLT7ACmMaG+CuBJ9Kw7TkiTPQySq5Zfcpf7Lli+lmshLj3rrcYUx
         9CRFfEThAbFwXta6M0Hg5ajKnFzTcUbk6iiqIRqar8GPPKmxKJpoCDgNNZ4HCsknyKXH
         phX2NPXj8EV7hu30pGNVqaEOd5YJ7rMGzWn7PuaRjFa0C3eiK3P2qEXSvhxnmHlars/0
         e4QjTOUd/MASnITJFPXI1oTKqTnt3YdeLmYPq+yfSKzqkZ+pq1Mn5cflTMiZoaXp40En
         MEgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666883; x=1777271683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
        b=kkkhNoICaD3FlCu1la2bUdGwojNDkLhrcno7cnQ19k+R9aHpg13ymMdsMjtazQpHQr
         2LQbjbSGQ3hRnoSEhk04W78+R6gL147FWTo65CQyGZU3DBvbB/24NXkRiowTPMf6baMN
         jlZXZxMpbUy3+W+2CHR6Ws0hnT4hrilYELdZFxFs4YgCRNJSm/YxBrsw1zkBl1dKYJ8p
         nVqUlN3k1R8IyT/cJTjW6ntIY3DIrAhHR5B3zKDPsEqbhMdKLvylVIJRsfJ/hb48GbtH
         BTsXhWZtQ/vDBYt7bPmOvKTECh2cSrR+9vDcFDyyHVhIC8SkXW1NwlV7eVJXdiwPlxkR
         QBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666883; x=1777271683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
        b=Vb+vAnSjnw2JWLEHeW1zR94kp7FJD/BqdCHGYRwPgG+cWryz8KkwL1naQN5VdIxvy2
         d25N3KBkc7CKKFxGu4218v3Yp6OfaV4rIf722ffQrfsBTcTWnU1bRVSyIFuDVYLOhaa1
         jH2+aehpx8ZZalTfoYOxsZZCVzj2L01tlEDiWtCa9i64RINcUDIXDJ53YJk6q2QgljJ0
         pu3anyMYolnMKdl2pVKhR1OIS9ySB3EoqzhNvioJVzmBBt+SReFfTIS1vkCnBe0M2Bdc
         mam9jAiYBWYSCyqGW2Ed00Y2b5ILz6uPmgf9h5op4V4OOvnGxdYA5EWCnX2VS9KOzXwu
         5MkA==
X-Forwarded-Encrypted: i=1; AFNElJ8t2ImG8PqlcNvtq6Ta1qIIAve8SCBJBVKz/GgMOf+oWBABEAL5U+JChvJWbz2b+gF7ODcfkZiyStO/ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+xbBGGnV4SJYDmhhEWZ3zO+OShYfjZjJ4b3HhSfNiCydc7BE
	q09ofC0ZOHw3tqQe/+88MgJBKSIlbMsE3/7QMl5UgjZ5zPJEzNrlZUoufotDhiO3JTfmN1ZmyNk
	D5ffftGeASQ9SlRylmvs3nQe0dCKC+S8=
X-Gm-Gg: AeBDieuik4aB1vOPRuX5s52S6qKbV7A0Y7LDF3Bm05IzV75A+1yUIWsl1iTGzkLMTk+
	QGg1KAjOc0GYqOTu2dDUuhQqgq1vrLn+Bmv0a6CN63q1CDHaMHpFlbmoxJr+AhNpM5Pkshz7eW8
	3rLSDt2xFXkJVVFzrOzwdEvNakR4/D3Duj+rIZ0Yqtz3APZwdIRn2ddRROxBkcWtigJ9MgxzQ7B
	JhmwJfw23zO6RmsR11WloOv1l4In0cL9WppXFnCpmqP9zMtw7LcX8ogmYnQ0f3WRdViDtP7jtwA
	03kx+PsbokVwHvy6y9HK9WlKl63fVQuPTc4xBbqCpOGegGSK/5P2tApzbGys0OZcu4cdnbD4fm/
	57vaYL0vOEbHF3PVjRHGTIEQlVtBjKQ==
X-Received: by 2002:a17:906:c102:b0:b97:b88c:386b with SMTP id
 a640c23a62f3a-ba4229d7784mr517181366b.29.1776666882701; Sun, 19 Apr 2026
 23:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126190026.37436-1-ayushkr0s@gmail.com> <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
 <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com> <aeTOgEq9X192XPgG@valkosipuli.retiisi.eu>
In-Reply-To: <aeTOgEq9X192XPgG@valkosipuli.retiisi.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Apr 2026 09:34:06 +0300
X-Gm-Features: AQROBzBewWjAdKOSwG5n3rKZavdSyvwChWgRt8qbEPE0icMpjbHA5j266FgrIVg
Message-ID: <CAHp75VcHXFr3PrmxyE7FxvzTwkCrPpHKc+6e=ziXCGFrBY269g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements to
 next line
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Ayush Kumar <ayushkr0s@gmail.com>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, ribalda@chromium.org, abdelrahmanfekry375@gmail.com, 
	santiagorr@riseup.net, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	kernel-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59117-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,chromium.org,riseup.net,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 614A94273FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 3:46=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:
> On Sun, Apr 19, 2026 at 11:32:45AM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 19, 2026 at 1:20=E2=80=AFAM Sakari Ailus <sakari.ailus@iki.=
fi> wrote:
> > > On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> > > > Adhering to Linux kernel coding style guidelines (Chapter 3: Indent=
ation).
> > > >
> > > > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> > >
> > > This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658=
fde0b
> > > in my atomisp branch.
> >
> > Btw, can you rebase your branch and drop "staging" word from the
> > Subject in all current patches?
>
> Good question. The staging: prefix has been used in the past for atomisp
> patches and a lot of the rest appears to be doing that as well but
> definitely not all. I don't really have an opinion but we should do that
> consistently whichever is chosen.

I believe you were Cc'ed to the (private) email response from Hans
where he explained why it should be dropped. Let me find if I still
have it and bounce to you.


--=20
With Best Regards,
Andy Shevchenko

