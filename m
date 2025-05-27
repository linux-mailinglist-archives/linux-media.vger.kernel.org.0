Return-Path: <linux-media+bounces-33466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E821DAC5078
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3C3189EAF3
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF88127703D;
	Tue, 27 May 2025 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THm8f57x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6001C3F02;
	Tue, 27 May 2025 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354637; cv=none; b=l9mV4ppC5bd42cT5YQfuXv4L11q6EkiLyuCtGBDv3YXMd8dm7NqhE744Y432WAtuYQ6IClhnVKGMsuMBo7GHaA0NNMs7K0dg6w0038g7ezfNIJyWNkI+xjFow6olcAyHtpyNJqU8RyjM1bOBbG0nvazVq5SvjxCnzAB3833HueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354637; c=relaxed/simple;
	bh=PfYHN7ZvbjqF1SZrJiDI+N31npoIF2JXnH9nV3P+NF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnIDKo5x/+lulZR6S/tX8q9S83HNXDKKiAfztJkr2Rad/GLDHD7PYbMoewv534ZnfHXQJM/BqGI/iZ4kiNObosoljWKGFKqlrQ7j+kBGyQeoZyxs2d8PvPS6KuOJeXLY9UA4p4tvT4HN2QXWRQoAZgEIF5hFK6qskpYyhl9BIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THm8f57x; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e7967cf67so4151248e87.0;
        Tue, 27 May 2025 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748354631; x=1748959431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsFURRaAVAF5NyqQux52FKE+IWC38BqGr/pMMame8ds=;
        b=THm8f57xi8E9vNggMn5YenWYpSbnT/7nnofbS0LdBHgpkZ8aSqnXbSy799JVHTg8Sv
         6j0QBP3iUnO+cLetBFeAAXqVQ3aH7twi7fQ+m8XCNeZ+dCXMhkETE2JDNcJJkhir9F0F
         93zZ1bMOIhJijkDG3NWW+qXspI1HLTw+B5suOdJC63XbRTp+YPrK69fZkoldiu24XgQY
         EhiEoeoQffVukXeSup/zB5pjA18Zmy7V+wG4mA12SDsxA2WpRlLrOPAU0L7OQ8oSrKPI
         fUEpYoKVZZUNAkg7/CF79d4omzQlMwkwMkwTn2jcKx8jN1cYlFn/LYGdavh4skF09p/8
         yy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354631; x=1748959431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsFURRaAVAF5NyqQux52FKE+IWC38BqGr/pMMame8ds=;
        b=IcwCp1cGQifek75TNE+WMYUndf041J5/5RN4c+HeeL5YsOiNUrOr8pVXuMDeIffx44
         RaE4blSK4Kp3aeTUd9rFEyaXlmUo1aR3H+aamsyCIobSPeaI1wfmRuQ0ATPWQ4Kb8YnH
         kTUFD+mub9UVUIrYHAhP988XP4Mu47yd08TSGmq8eR/uKwXJpVyZgXkqLO1DPf+GLJ71
         0XzeqOkIxmigBpbOaKmfO+P0VBdytkClovOotltl+2Mjp0TN5bqEG12qX9fJj5Ovb2Wz
         JzFOTrUytrMxyiRhZyOgrsp6vESsGNvC+8YUFZqoBzO9s1Js3vJ61sx8Ih2OQ74OnmeU
         PRUA==
X-Forwarded-Encrypted: i=1; AJvYcCWe6zgdg3YxuC6aC4fFtG0aND121H2f/C8o2NQccZYt1VRCoQhCq8qUL+9ZZr38IMYp0qoMmIpJdbb85ws=@vger.kernel.org, AJvYcCX49V/agAhvy8yqKKRISwc4bTDNG4FcrIKxgemy6ZLVojP+VUJoThDZCgXuOtDX30Z1/b7bk0Ho75mDVCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJuVmZ1r4d+pd82ug9+S/UFPqLruqQkjTE9Irj6teSCTL7muum
	6p/wT0lopfBVk5f4IGxlugUNL0M32LHY+PpotlMKwK97OMNHZT5NLzGWctgfOHEISUaBXnonHJP
	sHcwu5xyFs2f8R/GjVJWo62RPVWg9SGRL/NIdgY4=
X-Gm-Gg: ASbGncvKeSjX0+cHYpEY8kITOIwmIRAeB8XnSGQ8R0SrJ3BBgC7DjCx95kiZvIep+TX
	BMQpssbALkdZNsUNgYVQC6DddGjONn7hLJk8ThNWqQme1YhW8zRP9sOtmxGKNWCxOiHZ0pMxaD6
	ODr3qlqBHrCLfV42z8yRWENzEC1ErS2MxjX3FVzC/dFIXvodr/7TiWJl3fhK9Wj/ZBvJThbX5+U
	Q==
X-Google-Smtp-Source: AGHT+IE3sOdVMBPm6Ph+lDBvdIisLgXQVbeEI/OwtwfoXYAZvm9V6hdGhNRWj6AmrFGMfg3LNZwv9XRpjINn0fwcvBE=
X-Received: by 2002:a05:651c:f01:b0:32a:664e:a932 with SMTP id
 38308e7fff4ca-32a664eaa5bmr18000161fa.37.1748354631031; Tue, 27 May 2025
 07:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan> <DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
 <20250527111311.105246f2@sal.lan> <CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
 <20250527153547.6603eaf4@sal.lan>
In-Reply-To: <20250527153547.6603eaf4@sal.lan>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Tue, 27 May 2025 23:03:39 +0900
X-Gm-Features: AX0GCFsjbpsQ1gE__bp7WHcbUJ9r5cDGiNxMBHIwTxLbUSGCpF8_YZBzNIeqr7k
Message-ID: <CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Albert Esteve <aesteve@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	gurchetansingh@google.com, daniel.almeida@collabora.com, adelva@google.com, 
	changyeon@google.com, nicolas.dufresne@collabora.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 10:35=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Tue, 27 May 2025 22:21:42 +0900
> Alexandre Courbot <gnurou@gmail.com> escreveu:
>
> > On Tue, May 27, 2025 at 6:13=E2=80=AFPM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Em Tue, 27 May 2025 15:14:50 +0900
> > > "Alexandre Courbot" <gnurou@gmail.com> escreveu:
> > >
> > > > Hi Mauro,
> > > >
> > > > On Mon May 26, 2025 at 9:13 PM JST, Mauro Carvalho Chehab wrote:
> > > > > Hi Michael,
> > > > >
> > > > > Em Sat, 12 Apr 2025 13:08:01 +0900
> > > > > Alexandre Courbot <gnurou@gmail.com> escreveu:
> > > > >
> > > > >> Add the first version of the virtio-media driver.
> > > > >>
> > > > >> This driver acts roughly as a V4L2 relay between user-space and =
the
> > > > >> virtio virtual device on the host, so it is relatively simple, y=
et
> > > > >> unconventional. It doesn't use VB2 or other frameworks typically=
 used in
> > > > >> a V4L2 driver, and most of its complexity resides in correctly a=
nd
> > > > >> efficiently building the virtio descriptor chain to pass to the =
host,
> > > > >> avoiding copies whenever possible. This is done by
> > > > >> scatterlist_builder.[ch].
> > > > >>
> > > > >> virtio_media_ioctls.c proxies each supported ioctl to the host, =
using
> > > > >> code generated through macros for ioctls that can be forwarded d=
irectly,
> > > > >> which is most of them.
> > > > >>
> > > > >> virtio_media_driver.c provides the expected driver hooks, and su=
pport
> > > > >> for mmapping and polling.
> > > > >>
> > > > >>  This version supports MMAP buffers, while USERPTR buffers can a=
lso be
> > > > >>  enabled through a driver option. DMABUF support is still pendin=
g.
> > > > >
> > > > > It sounds that you applied this one at the virtio tree, but it ha=
sn't
> > > > > being reviewed or acked by media maintainers.
> > > > >
> > > > > Please drop it.
> > > > >
> > > > > Alexandre,
> > > > >
> > > > > Please send media patches to media maintainers, c/c other subsyst=
em
> > > > > maintainers, as otherwise they might end being merged without a
> > > > > proper review.
> > > >
> > > > Sorry about that, I put everyone in "To:" without giving it a secon=
d
> > > > thought.
> > > >
> > > > >
> > > > > In this particular case, we need to double-check if this won't ca=
use
> > > > > any issues, in special with regards to media locks and mutexes.
> > > >
> > > > Agreed, I am not 100% confident about that part myself.
> > > >
> > > > >
> > > > > I'll try to look on it after this merge window, as it is too late
> > > > > for it to be applied during this one.
> > > >
> > > > Appreciate that - given the high traffic on the list I was worried =
that
> > > > this patch would eventually be overlooked. Not making it for this m=
erge
> > > > window should not be a problem, so please take the time you need.
> > >
> > > Provided that your patch was caught by patchwork, it won't be lost:
> > >         https://patchwork.linuxtv.org/project/linux-media/patch/20250=
412-virtio-media-v3-1-97dc94c18398@gmail.com/
> > >
> > > Please notice that our CI got a number of checkpatch issues there.
> > > Please check and fix the non-false-positive ones.
> >
> > Will do. The macro-related ones are false-positives AFAICT. Some of
> > the "lines should not end with a '('" are actually the result of
> > applying clang-format with the kernel-provided style...
>
> I don't know any lint tool that honors kernel style. The best one
> is checkpatch with the auto-correcting parameter in pedantic mode,
> but still one needs to manually review its output.
>
> >
> > >
> > > Btw, I was looking at:
> > >
> > >         https://github.com/chromeos/virtio-media
> > >
> > > (I'm assuming that this is the QEMU counterpart, right?)
> >
> > crosvm actually, but QEMU support is also being worked on.
>
> Do you have already QEMU patches? The best is to have the Kernel driver
> submitted altogether with QEMU, as Kernel developers need it to do the
> tests. In my case, I never use crosvm, and I don't have any Chromebook
> anymore.

IIRC Albert Esteve was working on this, maybe he can share the current stat=
us.

Note that crosvm does not require a Chromebook, you can build and run
it pretty easily on a regular PC. I have put together a document to
help with that:

https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

It also shows how to proxy a host UVC camera into the guest and use
some of the "fake" devices I talked about earlier. If following these
steps is too much friction, just reading through the document should
give you a decent idea of what virtio-media can do.

>
> > > And I noticed something weird there:
> > >
> > >         "Unsupported ioctls
> > >
> > >          A few ioctls are replaced by other, more suitable mechanisms=
. If being requested these ioctls, the device must return the same response=
 as it would for an unknown ioctl, i.e. ENOTTY.
> > >
> > >             VIDIOC_QUERYCAP is replaced by reading the configuration =
area.
> > >             VIDIOC_DQBUF is replaced by a dedicated event.
> > >             VIDIOC_DQEVENT is replaced by a dedicated event."
> > >
> > > While this could be ok for cromeOS, this will be broken for guests wi=
th
> > > Linux, as all Linux applications rely on VIDIOC_QUERYCAP and VIDIOC_D=
QBUF
> > > to work. Please implement support for it, as otherwise we won't even =
be
> > > able to test the driver with the v4l2-compliance tool (*).
> >
> > The phrasing was a bit confusing. The guest driver does support these
> > ioctls, and passes v4l2-compliance. So there is no problem here.
>
> Please add v4l2-compliance output on the next patch series.

Certainly. Note that the output is dependent on what the host provides
for a device. If it e.g. proxies something that is not fully
compliant, the guest will reflect the same errors.

>
> > Where these ioctls are not supported is between the guest and the
> > host, i.e. as ioctls encapsulated into a virtio request. For QUERYCAP,
> > that's because the virtio configuration area already provides the same
> > information. For DQBUF and DQEVENT, that's because we want to serve
> > these asynchronously for performance reasons (hence the dedicated
> > events).
> >
> > But these differences don't affect guest user applications which will
> > be able to perform these ioctls exactly as they expect.
>
> OK. Better to let it clear then at the documentation.
>
> > >
> > > (*) Passing at v4l2-compliance is a requirement for any media driver
> > >     to be merged.
> > >
> > > With regards to testing, what's the expected testing scenario?
> > > My guess is that, as a virtio device, a possible test scenario would =
be
> > > to have the UVC camera from the host OS mapped using virtio-camera in=
to
> > > the guest OS, allowing a V4L2 application running at the guest to map=
 the
> > > camera from the host, right?
> >
> > That's one of the scenarios, yes.
>
> Ok, this is the easiest test scenario for media developers.
>
> > Another one is to expose an accelerated decoder on the host to the gues=
t.
>
> > One can also create
> > "fake" devices backed by software on the host for testing purposes.
>
> That sounds interesting. It probably makes sense to have some test
> scenario using such fake devices plus v4l2-compliance test to check
> for regressions running on some CI engine.

Yes, regression catching in a CI is one of the use-cases we thought about.

>
> > That's actually the benefit of using V4L2 as a guest/host protocol:
> > the same guest and the same software stack on the host can be used to

I made a typo here: "the same guest DRIVER". That's an important point. :)

Cheers,
Alex.

