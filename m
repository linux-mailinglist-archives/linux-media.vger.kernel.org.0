Return-Path: <linux-media+bounces-11101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 254898BEC44
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 21:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69651F23920
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 19:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E028816DEBD;
	Tue,  7 May 2024 19:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UQ4COlZi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8616D9CC
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 19:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715108853; cv=none; b=lsEq5my9+aSKSwJa+A0QZGrNPc9vKJ0vlOC3PWs1q7KB3mcFbCrG00NM/gdIzICWgDMBlXAelJIIljGi6hekpijXZHJlKB3t+Bq/tQi+ezoyC/SidEykAjHAfSy6iwJompC87B/XZ1ojuusT3J2v6jpwlCyXuVlFKiCAhUKMUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715108853; c=relaxed/simple;
	bh=pui840tsR5Yet33PCWgvY2wZoLY0nvaSbhvNkKxiwJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0sSao7P2CG0t9PjOBvXBHO+jdMj4C/i+lCpXX6Rk5644UqkxZaDvPBH2UfXOL17EuqIT0bPMrzRO6TByozXYE9iSr/+n5HFQI4Oa3AZc8S8cwAK0P4cDo8/0PBH3+oedcoK3sDgb40AFR9fn0htIZUE5OPYmYAp3l+A9XYALCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UQ4COlZi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a599af16934so887774166b.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 12:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715108849; x=1715713649; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JwU1IWNzhlSP5EH9iyMHaFmRpSbbE8IFJCVgZMlAkcM=;
        b=UQ4COlZi1wjGRec1vXSHfd/ePwofzv5i+nayllj0aKOQVMkogpronwS7fiNKGmJYdc
         REVt1UaVKAKyPpoa8plwTreCFTeU3qc2gfW4ylySKcUh3P80ZgAPmXXBjy+U3z68P0a7
         6wtqLOMLsQfLwo6VHZ4W8c4W0n2CIrr86nD1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715108849; x=1715713649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwU1IWNzhlSP5EH9iyMHaFmRpSbbE8IFJCVgZMlAkcM=;
        b=jt6waS/Eow9bH/Ixs9o5togl/r4fHVZFs28kYfK98kpx81Bmf57gBBPKwreda6BK8Z
         RrwqFkIZuDY7/mPdt4VsYOoaaCXRRKWrjebB551vYghSduQBw4Wi6GwivHb8vJfvXkG6
         sd36+2pSnGpzfsexJsaul05Gd9I+I5jYqfDF5utUQ+QcTZ52ZaKHCrY9rBOYOWfJj7Bh
         QMwKhBOMRghaqck5xyjQdQDU2p/T42Jvq9jRRVfIJx/5rYF6i9tujb2CHodMpzt36MfK
         v2+GeR14rpviCsVZ/oiCrX0D8IiRYwJjWuJYnEkxsI9gawOQMkXdcS2/SYUSZBHQTHnI
         IECw==
X-Forwarded-Encrypted: i=1; AJvYcCWK6TeOgnNXjkQuNwiEdC9n84LYZXDnVTRVcYbXHj8WOb42TGIfCw+p77AT6JzBunVrtIOtGJyi4DmHxP2dkweTz5nBtR/NHnA6xF8=
X-Gm-Message-State: AOJu0YyGxciRj2jcr6MhJwYbNjcZr5KzQjs++jsu4K3FHRXXIgkxIHkE
	SXtZu2EZ6whQws289OlikVEU68gq9jHUJBJEPzt3pw3G4jxncYD2sjjAHAu8TMYhAgDAnTVkBOL
	I1T2PQw==
X-Google-Smtp-Source: AGHT+IHF/1eXRvRhpPkJ3NLeacHjNRJxtgNRl/3Im6KnU6w+xx8DEoZWDbxQby2LscWI4Oi1AFUuHw==
X-Received: by 2002:a50:c04b:0:b0:570:cd6:8ef with SMTP id 4fb4d7f45d1cf-5731da68e1cmr434961a12.29.1715108849056;
        Tue, 07 May 2024 12:07:29 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id eo4-20020a056402530400b00571d5c4a220sm6614348edb.7.2024.05.07.12.07.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 12:07:28 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a599af16934so887766466b.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 12:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJgOmpSbm52+itwq8m6za9s3sEsMfWHnKVVLVD6bzadlj3gqvME/B2Ioh+qRsX2x6Msin1HYkIouD/nzxF/CXGueUVR/bxN3I9fok=
X-Received: by 2002:a17:906:1957:b0:a59:a977:a157 with SMTP id
 a640c23a62f3a-a59fb9f209dmr23097766b.73.1715108847432; Tue, 07 May 2024
 12:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com> <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com> <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
In-Reply-To: <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 May 2024 12:07:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
Message-ID: <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>, Pekka Paalanen <pekka.paalanen@collabora.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
	axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 11:04, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
>
> > I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> > too, if this is possibly a more common thing. and not just DRM wants
> > it.
> >
> > Would something like that work for you?
>
> Yes.
>
> Adding Simon and Pekka as two of the usual suspects for this kind of
> stuff. Also example code (the int return value is just so that callers know
> when kcmp isn't available, they all only care about equality):
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239

That example thing shows that we shouldn't make it a FISAME ioctl - we
should make it a fcntl() instead, and it would just be a companion to
F_DUPFD.

Doesn't that strike everybody as a *much* cleaner interface? I think
F_ISDUP would work very naturally indeed with F_DUPFD.

Yes? No?

                       Linus

