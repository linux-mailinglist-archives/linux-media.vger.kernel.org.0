Return-Path: <linux-media+bounces-37741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E31B05355
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B647D7B8C20
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FF0273D9C;
	Tue, 15 Jul 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6SXQkQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582AE271A9D;
	Tue, 15 Jul 2025 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564437; cv=none; b=jPi7Cm0LT1pf4ve5xJnpHDqLIXeYhlD8DrWrznZed0P4z6IA8EXEZbLZXRDOoafqZt+GZmA0jIxwzell34c3ffYck1nWuBU7Uj1jKOi0DubTWJ5qiJmrTldIusW989oxuaIFAlC7c8YfKSUD1QPO4JpaEbJOAw1zun67xICtOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564437; c=relaxed/simple;
	bh=HtC4D7tG4lYE9B3IP2Snb8X8xOANK8sSyRwAaDf5PO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb85A35l1WXKK+FXy9pexC4HWk1pD7Muf7E+bY+MV2LtmAqjBJXgURwfVSkgBKvKxcpAfD5J6s0HIljyPeQHAANjVdVveSwVq0+69vMjuUcKNbiOQLhPwSRWiqIs2sdpE/xD8mtgs8sNW+c8r4aE/BswRC9p+5jYDF+jUA5r6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6SXQkQL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad572ba1347so718907366b.1;
        Tue, 15 Jul 2025 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752564434; x=1753169234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B11Fv+/P3Vntrk0Xgb5TyfuwXVxV0wxwjtvQx2djwQ=;
        b=g6SXQkQL6yZaA62zzq6J66ZIjRsEoxwy+5uEKPqichL+FQlLMjniHfRW19qa4K5EQD
         DLB48s+C1dnVLhpzpNEvHu/d3p34qQSeAUhWWCbqcbmN6JHVnyyC3eP4Qxc+yl8Q+i5D
         vLsS1V/FGJg72BlzKl/bV2FXFf5duDR82elJRrsXizQ8JIatW+FpESrrqT4AhqhPK+Nj
         PuPzphFasQ7rjogE75fYAv05ylqvL+x5Eeqh/hCz/+fHRgutmRoUb/9ynIerHnCZeyAb
         YBUpJv1UfZdMYVC4Nk/+4BnzjYrUwoVdAq66n9IcPHax5xqo3UiUQ7TiiPaeY+Z9H/p8
         tlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564434; x=1753169234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7B11Fv+/P3Vntrk0Xgb5TyfuwXVxV0wxwjtvQx2djwQ=;
        b=KvF9tL3HrtzLznAqcj5SDLqyGwRQ5e8I09/XdSE5KCzEQwk1hwQhCXAErZ0h79Gu5F
         /ZweOChJWU1x0v405w4nz9fpU7dZHNHJKAeGXS8tEn4kfhXyyERks7RwcRjRSkSOie3c
         LMHK7krD17sQ+xDyE4mVPpyYTybCluF3BmPKNO7+MSncQLiEgFoQv+bXLOHznJxgPx9j
         btT9sBkxdQV+djPYueW8fDJhgwh0nEIWHTkqqfpkbZ0VIirWCYOfDwZc7FVo92UQcd5i
         hOlJ2r5DrfeM08c0g7DVPe9LnTuHxHKpMCARRHBCHQkWkB03v0lvLBC1yMD4X8YXdaMS
         dyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNKNiEMu6wS9z/1h7qF3qWhGFvFRhvMujIZk7qAjwCIBgzm3Kf4fMpbfYM9rIharFO2AI1bwqs95mZx7I=@vger.kernel.org, AJvYcCVFFo0EgEJz0FUFxNEtjIdV/wp5kRQS650N0a2461vbW60SNMJQAgEeLxixrQA7FtlUPnio2iO6hQGtyVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4RiHwO2beJCGuazNwvwssZ7ujN+7yhmVq7RHY7JLTHXZi2ip
	+hhe5buvvyL4cMsuZmJdCTP+2kcNR9XGz2RVgceAECR95dW+Bm4KqumQTkHIYRtcR7NQTrQxVF6
	DWDlN3wGFDk3Wn5sYBvYsVQQFb+99PVs=
X-Gm-Gg: ASbGnctlzgKTVEPrF+G1AdxKYWby4bLoPPHci++LFpz1WoIoPX21y0vsmxVhkFth/E/
	EyeTHq+QbtpPDplDdF7Coen1XktE76LGCzSFHvu8vERewbTITfR1nC17pG9UyIegdDfZEvV3BIX
	FgMbhKwICWDVFSEIZ3UGmi0JIlOebrC7F7DSWXPKFNcHwED5wGmWv4m3ra2qpkIR4oidZDmUtEe
	t34Hg5xbw==
X-Google-Smtp-Source: AGHT+IEc62LOFeD7pGkpvhpMjAwjKjNczYiC4ILDPjuHqWZVZg/7cqp2v5qHEQ0GWDq7Lr9pHCbo89FE3T81Uk1eWwo=
X-Received: by 2002:a17:907:97cc:b0:ae3:8c9b:bd6a with SMTP id
 a640c23a62f3a-ae6fcac624bmr1739057566b.40.1752564433429; Tue, 15 Jul 2025
 00:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc> <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
 <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc> <CAHp75Veovvxbr_6EuubDa7x8P5j12WjER=ar7E69A4r=sGONsw@mail.gmail.com>
 <2025071510-skeleton-squealer-f9bc@gregkh>
In-Reply-To: <2025071510-skeleton-squealer-f9bc@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 10:26:36 +0300
X-Gm-Features: Ac12FXyukFhvmA5YCNgVbhBFeadAZfG3STdKDZJGa1rWbijyqXDBvzvvFyfES5U
Message-ID: <CAHp75Vd9hHgjuavkjnWEi3y6YoY+WggGZtupeno7O322crykcA@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Martin Weidenauer <martin@weidenauer.cc>, Woohee Yang <woohee9527@gmail.com>, 
	Jongmin Kim <jmkim@debian.org>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 10:04=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
> On Tue, Jul 15, 2025 at 09:57:19AM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 15, 2025 at 12:54=E2=80=AFAM Martin Weidenauer <martin@weid=
enauer.cc> wrote:
> > > On 14 July 2025 23:38:47 CEST, Andy Shevchenko <andy.shevchenko@gmail=
.com> wrote:
> > > >On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@w=
eidenauer.cc> wrote:
> > > >> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gm=
ail.com> wrote:
> > > >
> > > >> >Guys, please, coordinate and issue only one (or a few) patch(es) =
per
> > > >> >an issue. No need to send zillions patches for the same problem
> > > >> >file-by-file.
> > > >
> > > >> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin=
@weidenauer.cc> wrote:
> > > >> >>
> > > >> >> Fix checkpatch error "ERROR: that open brace { should be on the=
 previous line"
> > > >> >> in ia_css_dvs.host.c:277.
> > > >
> > > >> I deeply apologize, however this was the instruction of our worksh=
op in DebConf by Helen Koike <koike@igalia.com>
> > > >
> > > >This may be okay for the driver that consists of let's say less than
> > > >10 files, AtomISP consists of dozens of files in several (nested)
> > > >folders. It's not a good example for such an approach.
> > > >
> > > >> Here is the link to the exact workshop:
> > > >> <https://debconf25.debconf.org/talks/55-submit-your-first-contribu=
tion-to-the-linux-kernel/>
> > > >
> > > >Hmm... this really needs an update to explain how to work with the
> > > >drivers that contain many files and literally tens of thousands line=
s
> > > >of code.
> > > >
> > > >In any case the problem with your contribution is not the code, the
> > > >absence of coordination and possibility to clash with somebody else.
> > > >Also it looks like a DDoS attack against maintainers capacity. The
> > > >smaller patches are and the more of them --- the less the usefulness
> > > >of all this activity as at some point that floods the maintainer's
> > > >mailbox.
> > > >
> > > >TL:DR; (always) Use common sense!
> > >
> > > To be honest, such a contribution also seemed to me a bit useless but=
 I thought all of this had been discussed with you maintainers beforehand.
> > >
> > > As it seems this was not the case, although the workshop has shown us=
 how easy it is to make contributions and for my part I will use the knowle=
dge to make meaningful changes.
> > > So you can scrap this commit and I'll make a few commits in the next =
days which make more sense.
> >
> > The problem is not the code, the contribution is okay and appreciated.
> > The problem is that for _the same_ issue there are tons of patches
> > from _different_ people. Just discuss who does what and send "one
> > contributer =3D=3D one issue" (under one issue, I mean class of the iss=
ues
> > checkpatch or other tools report, for instance, the "if (foo)
> > return;"-like which are on one line and needs to be two or more lines,
> > do _all_ of them by _a single_ contributor.
>
> No, that's not necessary at all, really.  Just take them in the order
> they come in and review/apply them as normal.  Don't expect people to
> coordinate together, especially for staging stuff, that's crazy.

It might become hard to review, when there are many patches with the
(almost the) same subject and same comment and the only difference is
the file that is fixed. But fine, we can survive for now.

> This is just part of staging, it's the maintainers job to help guide new
> contributors like this.  If you don't want to do this, that's fine, just
> delete these media drivers out of staging then.  And don't blame the
> submitters, it's not their fault at all.

It's not blaming, it's advice on how to make a flow easier to follow.

--=20
With Best Regards,
Andy Shevchenko

