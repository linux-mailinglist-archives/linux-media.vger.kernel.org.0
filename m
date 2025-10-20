Return-Path: <linux-media+bounces-45066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81995BF2F3D
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1EFC3B51D0
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A82F23C4E9;
	Mon, 20 Oct 2025 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="avomBbiu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38797A926
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985371; cv=none; b=AHBnuZQ2BPgpICpDQqFxdSkHu5pUihicKATJkP3Ru51ScLjMPKXqpXrrE2lU81QgmKgcHO2mWAfoJOUkY4OpUhCf5Qn4O0bYyEyaa+kRqcA8mjt8Mifv6ZnrgsVzsaUS+s8vXah+VtE1Y8WaGtOuhLbSERBosEdw6G4+/5SPzmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985371; c=relaxed/simple;
	bh=0/AVc8dyviWOP9aStkksVfSHILg73Le+KW3RZ9mknZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3fgRSkRG3qJ1SCdKkHo4hWXlpqiJJ4x4e6iYBjeHomSyvjqFTIELKh+SlmBZ9eHP+9p8d7f8/NUbSBp//bEdD+hgiGRUUmTloqbcAQ3nDCR8J3g1Eko7ovmGM6xFsudK/qbN5iPlJVF9GNQX2AthFVSTFD+FFJrr0lB5ltLmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=avomBbiu; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36a6a397477so47983731fa.3
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760985367; x=1761590167; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AJPDwplFeSk8txr/JVZT1GTqUUhaxVYkPrM3fufocfc=;
        b=avomBbiuj0msbzU8yz+kiyLhiFCyVVu+NHkQBbRd4uND2gqnkSAsDDRKy17lBExXW4
         ElilWI9XWdx0bJEJsCc3+VEfYsRL6wHNlCXBqlmI5SeUi97Wwu/De/Ug3iSU/6wzqVsp
         5vyLdEgBkqknmfVJ6jvidv9JHHuWQcif4Eh5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760985367; x=1761590167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJPDwplFeSk8txr/JVZT1GTqUUhaxVYkPrM3fufocfc=;
        b=UAml40WyJ6SqDDW4QGWsvH2doY+F+ltss3N+qO0dWXyAW9POM6HwjrSOAYEEp6diZk
         46+4fWxf4iqnOaehvGYfFideyOgbRwQHU1+RvmbfIEwr38RafgqGCG+Lb7W0I9Hevcwg
         MGAHae/Hk3Ch06y6eCAU106is2Q7kAhNPv+n85n3/NcVUzZjfCatsmuXXMFuQhdZVy1L
         iDeXN5/iT05/QmbTO10dy0m7cqcnpJVQcG0M9TovEq7yz5zA5WsnLD7q38aX9moGHA4I
         RlUIxxHgcsBzDLBylw29wNmNUK1obp7OIWxFeQdfahxWLc0ztUBd02+XbjpsArsn9KFH
         s6zw==
X-Forwarded-Encrypted: i=1; AJvYcCUQM3VFnwNwVp1m6aNeOkinfvPKwUJLiyDuOgHDq8srsgaoITlseSLbWVNdne64fvgQDg1gs9lGAYgCNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBiuT8Qkp0UTpJWpioqDBJqM2IdBonZ1MVZoEd31btQEpebuLU
	h4+T5orCsFhs5nJZwdkyycjqXMI4N37oAuRz9TCUr6+g1DMrwADay0fBj6UkGWDHEJbNHQOCTIR
	7zts=
X-Gm-Gg: ASbGnctt6Q+Gb36yED875PTU0fMfRAbAkHYVQPppkY5xUwrmNDF4uPQU7BatSQXmHuo
	QOVumunXgED5btWYeSwyncKFJdYnZNlccareEd3n42kWy2GSiYvGfPVvtl9ntsKAVEyPy3BKWQj
	E0Y2shxgan7Va2LYg5vfwuDjLr5aZF/bfZy5gbXuPT9MJrBdvTDBYVBs9v84mkrz0JfwUs1yZ7a
	n2ivxWn8IWzeGV0/o+kFCViUisVE6lGPUiLZIRU29LGkVc+KWKhHS8/IrZlTdydBK+yRBNQt7JN
	72K6y4bsVW8NjjB4eSraJgX3EPr/huWWYKL6bHhv6X2empkbhV+VBxbA6ioQ0WwBuxrJqwhNh5U
	E0MEIRp91N5ZuTDreb219DgC2PaTUbK0zHT5mSUXOKzozof4/JWdVe5e8kDgFALjiqgkj8L2FGV
	Vwavmk2KY0nIX6nZnPkHNlmJ12K7/uDPZwah3xEJFptyqGBceC
X-Google-Smtp-Source: AGHT+IHc6lgZfbA7fC+NFYqMltDafM7DrSpWNhba5a2hu84a8ZU7f6xlon5rtXN1IcXuXE/zj5UAEA==
X-Received: by 2002:a2e:b8c1:0:b0:376:39eb:21d8 with SMTP id 38308e7fff4ca-3779789b7a5mr41736221fa.15.1760985366969;
        Mon, 20 Oct 2025 11:36:06 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9674e68sm22905561fa.57.2025.10.20.11.36.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:36:06 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so5547577e87.1
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:36:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYIiSL0Ny0sMxcrBn/dQUsylQDgzGF65TxHO90hCUSd/WkI+qsZhxqM89OSTR+fN8LXURNk7ZghOmsuA==@vger.kernel.org
X-Received: by 2002:a05:6512:3e04:b0:58a:f865:d7a6 with SMTP id
 2adb3069b0e04-591d857844bmr4431396e87.48.1760985365864; Mon, 20 Oct 2025
 11:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010030348.it.784-kees@kernel.org> <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org> <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
 <202510141344.E0ABCD2C7@keescook> <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>
 <202510201127.D97BCF2@keescook>
In-Reply-To: <202510201127.D97BCF2@keescook>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 20:35:53 +0200
X-Gmail-Original-Message-ID: <CANiDSCtbrM4Fg_p56EdV09ts_j8HnMCc1hGH31-BZvv03Z0DjQ@mail.gmail.com>
X-Gm-Features: AS18NWDey1sqFu2xz3u2ZIcGnzmT-sAit71ah5vb53sUxvrTvQTFzPL0UMIGIwI
Message-ID: <CANiDSCtbrM4Fg_p56EdV09ts_j8HnMCc1hGH31-BZvv03Z0DjQ@mail.gmail.com>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL characters
To: Kees Cook <kees@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kees

On Mon, 20 Oct 2025 at 20:29, Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 15, 2025 at 09:33:40AM +0200, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > On Tue, 14 Oct 2025 at 22:45, Kees Cook <kees@kernel.org> wrote:
> > >
> > > On Tue, Oct 14, 2025 at 08:24:00AM +0200, Ricardo Ribalda wrote:
> > > > Hi Kees
> > > >
> > > > Thanks for the report.
> > > >
> > > >
> > > > On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> > > > > >Dear Kees Cook:
> > > > > >
> > > > > >Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > >issues:
> > > > > >
> > > > > ># Test static:test-smatch
> > > > > >
> > > > > >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
> > > > >
> > > > > Where can I find what this test actually does?
> > > > >
> > > > > >For more details, check the full report at:
> > > > > >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
> > > > >
> > > > > This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.
> > > >
> > > > I will follow-up with fdo maintainers to figure out what happened.
> > > > there. On the meantime you can use these url that seems to work:
> > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
> > > > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398
> > > >
> > > > Basically sparse/smatch do not seem to understand the constant.
> > >
> > > Yeah, I managed to find the actual scripts that are run for the
> > > static-sparse/smatch tests. It looks like those tools aren't correctly
> > > handling string literals for __builtin_strlen(), which is a constant for
> > > constant arguments.
> > >
> > > So, that's a C parsing bug in those tools (GCC and Clang are fine).
> >
> > Could you take a look at this patch:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20251010030610.3032147-3-kees@kernel.org/
> >
> > Seems that sparse/smatch are not very happy about __builtin_strlen()
> >
> > Could you fix support for __builtin_strlen() in your tool?
> >
> > Once Kees lands his patch it will break all the CIs using
> > sparse/smatch, including media-ci.
> >
> > Eg:
> >
> > drivers/media/pci/zoran/zr36060.c:33:1: error: bad constant expression
> > drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
> > drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
>
> We've waited a decade to get the embedded-NUL check into the modinfo
> macros, so I'm happy to wait until we can get the CI tooling updated.

For media-ci. It will probably be after 6.19rc1

Basically, when
https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#t
lands in media-committers.

How did you plan to land this series? via which tree?

if Chris have not landed his fix yet, maybe you can include that patch
in your series as 1/X.... That will make every ci happy

Regards!


>
> Please keep me posted on when the sparse and smatch have been updated
> and I'll re-send the modinfo patch.
>
> Thanks!
>
> -Kees
>
> --
> Kees Cook



-- 
Ricardo Ribalda

