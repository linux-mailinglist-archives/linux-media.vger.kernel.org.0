Return-Path: <linux-media+bounces-37117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD3AFCE4F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B484166CAF
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB592DFA5B;
	Tue,  8 Jul 2025 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcSqfCbm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50F20766C;
	Tue,  8 Jul 2025 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986503; cv=none; b=buJ9BPzBpc1GDRIvvmCHFcIC9Be3rQioBht6Nb8fBrA8d11nXhVmp+8KbKd1VSsYqEDnl+1HTDqUKhQVneq+62toFey0jD1B7k5YJqvam1wwlX35q/cqN3eZQqA8XnMJSJAeipIrDSstZlia4JBfhY9OtC1jB1qwrhTtr6qzOVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986503; c=relaxed/simple;
	bh=5ZOYpPpQedu6fd9KO9knWw1X3RRpwMkE1UKreUlY1MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHOk23B1wAJ3UR4fnAc+O5na7Enc67KshtuFEEozVmo5IMiGoNxsLtMVSb4B+pv8iUI+0U0cqZTei8JAU6ybG4LsJNp1CUQDTA7x0JazZuxIjWEvh2u0VUe4P/AZ5/fYHTClDfW1ggQKvFO0gaCiTL/sqYm7yzRngRWBr+Gb8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcSqfCbm; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8b69a1d3abso55350276.2;
        Tue, 08 Jul 2025 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986501; x=1752591301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPvzK8TvPX5jcVxVSpM9kdKq5e8vtmE271oEINXGFR4=;
        b=NcSqfCbmHgppUNbZhlNizEiPhic+9CtZmuVemDA8CN354I+mMCGebAWKmP17PnBYjj
         FvFHEj2hlw2LrD34eiZ3sDTWiz9Rz2m5LHmTtMPBvEHwgRdKI7rNhLidgGOa0GDtD7q1
         8WJrYJ/i5Dg4A7bUnbi99p1n1z+Drf0CnlXaM3rwcZb2qmJuaeAxnSB8EnhqA85FcI5h
         xm5cUFJIbAMG/Y//gQcEajkDgbTwnQtwIH8ONyD2+EAiV/QVG2csc+LVf1CXgL0qvCpP
         qwPu3lDY+7waHiRphxkleWsUsAw9LrXrzBbFfJmZNRxC2cP8aLxHN9wC5oGN9hHewftR
         8dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986501; x=1752591301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPvzK8TvPX5jcVxVSpM9kdKq5e8vtmE271oEINXGFR4=;
        b=b2XxsabqKp3uF4j11giNdGFEMic3EaG6EEh9ZfoJwwBAJ0GNUs9DSE1Xa/EPLUFJph
         3z83hh17jZVwvbUGLa251lrlRQdCFNhVu0EjZjucBgUmA/2d53oaB0oSZrcMLs5PbkMT
         Bpr56dn/tE40diAGqPg+U4SV9PlTKEYR4iZQJ5jNSxWqGQh7oONKUcWYQ3SeP+feKTyh
         WohpZcGid3YmVukRLtn/6P/fWHT+SARVsjDEAZjPYKvoE5GBvN7OVUtrULak95ChkzRK
         O7cL0QqJ6vBVbaNYMA7Rj97Sgd1GvUWMXhjuPKC91NLuUQAnabQFuNNiSMnccy3wB7qw
         WlHA==
X-Forwarded-Encrypted: i=1; AJvYcCW20wxyfF1KENi3WkX1Hca3sPLEeok1bUxjcC7Yjp9OKy0tDTGT7fP2H8vVlV3ZbUi0hDK9tlBgwgpJLSc=@vger.kernel.org, AJvYcCWq3C9r3PRrEaoUHZTee9YBA6Hs8cR3jsuAaFG8tO2dSjn18P2NacqUqc0RwqFa8sSTB5dTRN2DXNx2Exs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbcbG1nkYXr+sVi54sYe+PNtxm+DbWxzjNEWULe+RfVzaX/3F
	JRHn6B5V3sQBethGJwwVA42lOf+6mj8ia0LlS0eQZWJmbEmxJcwsiE3ZeoMPHqYi6Wq6YUwQdbB
	Wq3kOu5tGVpGotlx6tjh2z2hOg2Eh6ZY=
X-Gm-Gg: ASbGnctVg6ocX0pZUQTkajfRs/YXxb2x2a1fRHx/psaQ04BPHd5Gti/FkLahhwHQET2
	c53y2ohiz8IEM0qw6y1uyqek3r7vf55fBoYbqsuzzQsySqoXg0/UFISktS71pcW/HVpWxLdfojJ
	VI+zKU1DF1x5TpfkgvYxe/4OiIAYJDegrTaHNMTPWolt0=
X-Google-Smtp-Source: AGHT+IE2oBamYt3hOakYR1sNMb2lnRmFna7dOvcFvV9m1Ku889Zy9F+eHEBwieaFLXPLMaC0I8ddi3qQa/yJN5UvIjk=
X-Received: by 2002:a05:690c:4b05:b0:70e:4745:33d4 with SMTP id
 00721157ae682-7166a18faf5mr102479867b3.7.1751986500865; Tue, 08 Jul 2025
 07:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-3-abdelrahmanfekry375@gmail.com> <d063964c-5ca9-4602-8338-05c46c2d2775@kernel.org>
In-Reply-To: <d063964c-5ca9-4602-8338-05c46c2d2775@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 8 Jul 2025 17:54:49 +0300
X-Gm-Features: Ac12FXxUw3FUwIq0kbMtrNrtA3RyDhEzzkrDs4rsXtdMfEo9vmnKvg5YOpeJoUc
Message-ID: <CAGn2d8MetzWM0bwhdnocP1kLCYcYgmzb1ggPC5Fuv6cXFDniug@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: media: atomisp: unify initialization flag
 usage in HMM
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,
Thanks for the feedback!

On Mon, Jul 7, 2025 at 5:14=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi Abdelrahman,
>
> On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> > Previously, the initialization state of the `hmm_bo_device` was tracked
> > in two places: a global `hmm_initialized` boolean in `hmm.c`, and a loc=
al
> > integer `flag` in the `hmm_bo_device` struct. This was redundant and co=
uld
> > lead to inconsistent state checks.
> >
> > - Removes the global `hmm_initialized` variable and all checks against =
it.
> > - Replaces the `int flag` in `struct hmm_bo_device` with a strongly-typ=
ed
> >  `enum hmm_bo_device_init_flag flag` (values: UNINITED =3D 0, INITED =
=3D 1).
> > - Initializes `flag` to `HMM_BO_DEVICE_UNINITED` at declaration to
> >   ensure a well-defined starting state.
> > - Removes a redundant `hmm_init()` call inside `__hmm_alloc()` since it=
s
> >   always called after hmm_init()
> >
> > This change improves type safety, consistency, and readability when
> > handling the HMM initialization state.
> >
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > ---
> >  .../staging/media/atomisp/include/hmm/hmm_bo.h   |  9 +++++++--
> >  drivers/staging/media/atomisp/pci/hmm/hmm.c      | 16 ++++------------
> >  2 files changed, 11 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drive=
rs/staging/media/atomisp/include/hmm/hmm_bo.h
> > index e09ac29ac43d..155f9d89b365 100644
> > --- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> > +++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> > @@ -58,7 +58,10 @@
> >  #define      ISP_VM_SIZE     (0x7FFFFFFF)    /* 2G address space */
> >  #define      ISP_PTR_NULL    NULL
> >
> > -#define      HMM_BO_DEVICE_INITED    0x1
> > +enum hmm_bo_device_init_flag {
> > +     HMM_BO_DEVICE_INITED    =3D 0x1,
> > +     HMM_BO_DEVICE_UNINITED  =3D 0x2,
> > +};
> >
> >  enum hmm_bo_type {
> >       HMM_BO_PRIVATE,
> > @@ -86,7 +89,9 @@ struct hmm_bo_device {
> >
> >       /* list lock is used to protect the entire_bo_list */
> >       spinlock_t      list_lock;
> > -     int flag;
> > +
> > +     /* flag to indicate whether the bo device is inited or not */
> > +     enum hmm_bo_device_init_flag flag;
>
> Please just replace this with a "bool initialized"; data
> member taking `true` and `false as values instead of
> introducing a new type for this.
>
Okay , will do this.

> >
> >       /* linked list for entire buffer object */
> >       struct list_head entire_bo_list;
> > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/stag=
ing/media/atomisp/pci/hmm/hmm.c
> > index c2ee9d2ec0d5..767a3a24f8e5 100644
> > --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > @@ -24,9 +24,10 @@
> >  #include "mmu/isp_mmu.h"
> >  #include "mmu/sh_mmu_mrfld.h"
> >
> > -struct hmm_bo_device bo_device;
> > +struct hmm_bo_device bo_device =3D {
> > +     .flag =3D HMM_BO_DEVICE_UNINITED,
> > +};
> >  static ia_css_ptr dummy_ptr =3D mmgr_EXCEPTION;
> > -static bool hmm_initialized;
> >
> >  int hmm_init(void)
> >  {
> > @@ -38,8 +39,6 @@ int hmm_init(void)
> >               dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> >               return ret;
> >
> > -     hmm_initialized =3D true;
> > -
> >       /*
> >        * As hmm use NULL to indicate invalid ISP virtual address,
> >        * and ISP_VM_START is defined to 0 too, so we allocate
> > @@ -62,7 +61,7 @@ void hmm_cleanup(void)
> >       dummy_ptr =3D 0;
> >
> >       hmm_bo_device_exit(&bo_device);
> > -     hmm_initialized =3D false;
> > +     bo_device.flag =3D HMM_BO_DEVICE_UNINITED;
>
> This clearing of the flag / setting `initialized =3D false` belongs insid=
e bo_exit()
> not here.
>
okay, moving it in v2
>
> >  }
> >
> >  static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
> > @@ -72,13 +71,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm=
_bo_type type,
> >       struct hmm_buffer_object *bo;
> >       int ret;
> >
> > -     /*
> > -      * Check if we are initialized. In the ideal world we wouldn't ne=
ed
> > -      * this but we can tackle it once the driver is a lot cleaner
> > -      */
> > -
> > -     if (!hmm_initialized)
> > -             hmm_init();
> >       /* Get page number from size */
> >       pgnr =3D size_to_pgnr_ceil(bytes);
> >
>
>
> Regards,
>
> Hans
>
>

