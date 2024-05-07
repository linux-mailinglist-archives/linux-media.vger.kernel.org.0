Return-Path: <linux-media+bounces-11108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 685CC8BEDF5
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 22:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4051F21828
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFF6187343;
	Tue,  7 May 2024 20:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv2J1IvM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76057187326;
	Tue,  7 May 2024 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715113170; cv=none; b=nmb339VsB4jkpkWKV+fxqhVZHbXQPEGs8RXMKkUdAQ+zX7x0pvrkGbZxIc5U9IaGpKd19yPueb1lUFxELjuJK+Kkg1fpMe4O1SPQmm0o37hfMEMFtUuLiKGApnv4N3deUU+srFCuzsPcA4Hy1dy9YYEdaNH3DV9Z/WzxOUZXtm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715113170; c=relaxed/simple;
	bh=7VcWNQALsFe86OTtMTrHEkMm3JW99PlcgO+5WvkqT58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFCXVvKPAgWFWMuS9tFe8UkdOkiYU6PljOk3ogum2A1SwSP+KIvnnXwnGZdgHZgYyWyXY0azCmg8J2nxmxJDHY0snBuDfX4V7vQKQJDkM5BNr3M6EjqrnNH1B0hr8NgX87wvaaYKDdEQycZIqasOs35sbAVTWfHjQZNhTVTK9R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv2J1IvM; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43ae9962c17so10773481cf.3;
        Tue, 07 May 2024 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715113168; x=1715717968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es6kOeqxgl2y45OhjVGBF/iXix85aXMFVxnvsRCztrQ=;
        b=Nv2J1IvMVYqxajjiL1jyR5xAqOD3eXj2jeoJwK5f+a5GJjr0Mew+A3Xj0rOvhxLuNF
         VItGJSLcyvmooQtD+QKmjnR2Koo+Lz9fLly7MkZK68pJFhs2sCDFU5T45Wy3N/xZdGWu
         4eEha6ctGANnYNH9yNjC7/1X3m1r9p2fGS76rHxOrdHlaPuH+gf8WWFRFmkX6VBEIJCv
         dWyTvQFG4sZ1spOvkaoYz7F4/A+0bfN7FqOF1DGqzezUQ8RbXdxAjGzeZXv+Pwu5XBHL
         U6RYcp2UjeY9V2eneuA9xxKk7rRZC4N89ElM9oErzArXmGVUqa8dv3T1uOSgqAsgs2Oc
         HCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715113168; x=1715717968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es6kOeqxgl2y45OhjVGBF/iXix85aXMFVxnvsRCztrQ=;
        b=uSUsFX3I+yOPT6/F+XflofDLtprjAPjsNUnQBPQ/maXmx8tab/Ydq2BVc2W/aFmk4Y
         WZMXRjTEUm2Ic4JPfuXv4W1qqnjW9M0PmMxSMZi09C+mYxXYQE2JsfB3u3To4OH3RyUW
         vhvA6VkxmT0vBzRTxDZR9fvvUHlpsac8+kwJTSGwQt0xK0EkZJU4R7Es5+KvQtz/Q4RZ
         4IGSeaG7aQNivvM+2Hn812kDhSjZMJ+hpY+O6oeAyv036dy6vv6eQnq8nqAJLaVvILJj
         gQ/LMGZVz4SKbUihuOfiofDqf7QBnU8J5O7H7gXOr0pweD5SXSY6Yls+ZyYzM9QOvg2v
         8B3g==
X-Forwarded-Encrypted: i=1; AJvYcCX/qFbdHnOM0YCHpyOqcvssOCN/2JNidFSAASj3SrfxxRYKIOjwlmAvOgUd2eb5nxghZu0JuHg+RzPPPXhoczG0+iYFFcuLw5BamSJLSs4yvmVbTD1vfFk9KcIJkn5sQ4F9r0jL4L34QtM=
X-Gm-Message-State: AOJu0YzyXQotqP0MuHtPyZKUkmLj0CTPLsrh40zfsnTDM1G0RCF7k5Qe
	m9gDGCUuc/Xry1MWTNbBIBVahKnahyb+AYGUmuki03BdIDmQLjak+9F5nTAYPNde4WKxhcxO4sH
	DsWI9m8LuQaOdjOMSoHw4UQDRL/w=
X-Google-Smtp-Source: AGHT+IGjQYEmujwDqITllarXLP0VSc4Xwa06HzUYmRdr1deTa3vLo/f8zZvGJuZm3wydGhy1EMQyC+TW2MVkAkeMlMU=
X-Received: by 2002:a05:622a:2990:b0:43a:e248:12d3 with SMTP id
 d75a77b69052e-43dbec0da59mr11066911cf.14.1715113168226; Tue, 07 May 2024
 13:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com> <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com> <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com> <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com> <ZjovD5WaWjknd-qv@phenom.ffwll.local>
 <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com> <CABdmKX3SpOk4BQU6i31r8jHc1f-o8sz7rXgtRyhTQZ4GJYHH=Q@mail.gmail.com>
In-Reply-To: <CABdmKX3SpOk4BQU6i31r8jHc1f-o8sz7rXgtRyhTQZ4GJYHH=Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 May 2024 13:19:15 -0700
Message-ID: <CAF6AEGvZTc10nfjEZHWXXYa5AVSNQCOgXsY4H05fcsFkTsdzFg@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Charan Teja Kalla <quic_charante@quicinc.com>, zhiguojiang <justinjiang@vivo.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 11:17=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Tue, May 7, 2024 at 7:04=E2=80=AFAM Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> >
> > Am 07.05.24 um 15:39 schrieb Daniel Vetter:
> > > On Tue, May 07, 2024 at 12:10:07PM +0200, Christian K=C3=B6nig wrote:
> > >> Am 06.05.24 um 21:04 schrieb T.J. Mercier:
> > >>> On Mon, May 6, 2024 at 2:30=E2=80=AFAM Charan Teja Kalla
> > >>> <quic_charante@quicinc.com> wrote:
> > >>>> Hi TJ,
> > >>>>
> > >>>> Seems I have got answers from [1], where it is agreed upon epoll()=
 is
> > >>>> the source of issue.
> > >>>>
> > >>>> Thanks a lot for the discussion.
> > >>>>
> > >>>> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@goog=
le.com/
> > >>>>
> > >>>> Thanks
> > >>>> Charan
> > >>> Oh man, quite a set of threads on this over the weekend. Thanks for=
 the link.
> > >> Yeah and it also has some interesting side conclusion: We should pro=
bably
> > >> tell people to stop using DMA-buf with epoll.
> > >>
> > >> The background is that the mutex approach epoll uses to make files d=
isappear
> > >> from the interest list on close results in the fact that each file c=
an only
> > >> be part of a single epoll at a time.
> > >>
> > >> Now since DMA-buf is build around the idea that we share the buffer
> > >> representation as file between processes it means that only one proc=
ess at a
> > >> time can use epoll with each DMA-buf.
> > >>
> > >> So for example if a window manager uses epoll everything is fine. If=
 a
> > >> client is using epoll everything is fine as well. But if *both* use =
epoll at
> > >> the same time it won't work.
> > >>
> > >> This can lead to rather funny and hard to debug combinations of fail=
ures and
> > >> I think we need to document this limitation and explicitly point it =
out.
> > > Ok, I tested this with a small C program, and you're mixing things up=
.
> > > Here's what I got
> > >
> > > - You cannot add a file twice to the same epoll file/fd. So that part=
 is
> > >    correct, and also my understanding from reading the kernel code.
> > >
> > > - You can add the same file to two different epoll file instaces. Whi=
ch
> > >    means it's totally fine to use epoll on a dma_buf in different pro=
cesses
> > >    like both in the compositor and in clients.
> >
> > Ah! Than I misunderstood that comment in the discussion. Thanks for
> > clarifying that.
> >
> > >
> > > - Substantially more entertaining, you can nest epoll instances, and =
e.g.
> > >    add a 2nd epoll file as an event to the first one. That way you ca=
n add
> > >    the same file to both epoll fds, and so end up with the same file
> > >    essentially being added twice to the top-level epoll file. So even
> > >    within one application there's no real issue when e.g. different
> > >    userspace drivers all want to use epoll on the same fd, because yo=
u can
> > >    just throw in another level of epoll and it's fine again and you w=
on't
> > >    get an EEXISTS on EPOLL_CTL_ADD.
> > >
> > >    But I also don't think we have this issue right now anywhere, sinc=
e it's
> > >    kinda a general epoll issue that happens with any duplicated file.
> >
> > I actually have been telling people to (ab)use the epoll behavior to
> > check if two file descriptors point to the same underlying file when
> > KCMP isn't available.
> >
> > Some environments (Android?) disable KCMP because they see it as
> > security problem.
> >
> Didn't know about this so I checked. Our kernel has CONFIG_KCMP, but
> seccomp does look like it's blocking kcmp for apps.
> https://cs.android.com/android/platform/superproject/main/+/main:bionic/l=
ibc/SYSCALLS.TXT

Getting a bit off the original topic, but fwiw this is what CrOS did
for CONFIG_KCMP:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
3501193

Ie. allow the kcmp syscall, but block type =3D=3D KCMP_SYSVSEM, which was
the more specific thing that android wanted to block.

BR,
-R

