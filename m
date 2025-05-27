Return-Path: <linux-media+bounces-33461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0FAC4F9B
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04EF98A09A0
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EF8271479;
	Tue, 27 May 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOGd606e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0BD271459;
	Tue, 27 May 2025 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352118; cv=none; b=Gp25Ik/ajKx01WleCLXO48E9peEtZN0S2yBNT9yNki9oDvbcxpGQCE3hS241rlY4MBTnh4JL/7xLsIj1YeEfA30XijGdbeWMasjZFQrTEe92XpHPWMqNjXlAE1vvByGTce3gG7dcW8fD7bawKA50zRfZmPwWMO0AxmXiySJj7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352118; c=relaxed/simple;
	bh=PkDtbY9NEhKa9GACDKZJ5O4QTzYKQGEbJ1wQlG1blCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWTjyvWRA8z6QcmfsO+ML1dnAppb+T+HJ9fO0rkCWEUGwPRiOboi0R7DsvUt4MKEjq+8uvdv85JcpZ8YFdnSnCJGgAEEgRtKBZaj0sDTqfn58Q6iP1Md8YjlBEgB+vV+oLG6+PmVV6/Z3vFyN+c5cYC0+CZqDjjGTiEAXJxyGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOGd606e; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so31019061fa.2;
        Tue, 27 May 2025 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748352115; x=1748956915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8+3+XMtXOHDfLv/T+tosvnFUIfhw16R2sRDYOxTnxg=;
        b=JOGd606ea7mRURHKp7/R90Q8yW9D/+WHkMFO2ZFRQSCF3wYWYCejYI7ZeUOTsK3CKm
         kZLpmcsmQ3d7yYxxqBxPXClQcQ39mFErTkeOa/daa5HIJKC8iOfcKp3hkSc1KVC9XKU4
         l+RJx7BYSD83gzt3JMg0p4reXiNl0jsLWgzufFkVwLnnpeAYU6Yf5Mv8NICfnGXEcRcU
         uKY4TnI0Ursi+q+0hLhTd1ORUZX4nNsPwWMUL6aqOOYpYQKMXGNQtTQB83PofKCpHMHc
         kqYJZgtDEvRHnest3KX2/Ztm2IW9Yz6pslbFtTy7rBj9VHfs2aJg0MEKjCbcKg9AKvnm
         IewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352115; x=1748956915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8+3+XMtXOHDfLv/T+tosvnFUIfhw16R2sRDYOxTnxg=;
        b=JWmpA2nTpFcl+qezQAzFVQb7P7niFBaYjXz8kGgfKUBpVCxbTFZXBj/IZjXM1V/4Cc
         j6IuQdOiku9CdtOpyVnm0TBIrBMhJLxapfW61t+OogAkJVpAHGEpVadILR/+bi3uVmtD
         hO0/NpqXcrhlp31xltJ9wWfjs3VQIx6Xa2IvY4YGImkzpavNphRNt50rTR2gFO08Lkbf
         +4V3sNipo3eAtnCEDAfJYpe2WlgzMwIPALKeRaNHyOlrI+ndgfANOjhfW2wFrN4qhhI3
         RctjpbgbpxePrU5CLsk2MtO8oFf2I+z2PXZjcuNuX5oZXqNHLAZpwrvOvb+EyRxoHjCZ
         EyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4n7vInZQUSf3eLLQ0AbqYPzNP5toeVWa6gb2j+BJKfAJSZCenZSYA0aNnHjAuDNmD+QHY3YqqUXJxN3c=@vger.kernel.org, AJvYcCURBmKUEVi2N35xy5AGE15nLw1KoNzD+0vLopwX1W3frvZIn53ovxI3grQVr65WPADj47FZEZQLHZDFYhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmjATFDl6E+Ro1YjeCUhFo+Ul8z4MmBIn/Je6f5pyk8fhF4VVW
	0ZcSovwUOVbGLyXbarxgYX2JYAoUvYRK7zR3V72NWYgTQ/hP1AopUwxAfOEYbeGPu/84FArzsyf
	P+JzRmGi25u9ww/pLvDd1H38uogBen6k=
X-Gm-Gg: ASbGncs0em0Zxuy6XL3vck1/+itTvhI+V+X0mQ9q9Lt3iyHderjj3eL3HjARXt1wbr/
	QpMezIMYqjKCFIv4GQ+NYhYypvadpF8DeiqXKepM6svIoZCvc+GIiffm8KRiSqwNOZAssijZcH1
	hw1933XiKIdqqNo4hu61HuuX5fGr0KnQVV3cP8Ysy3PRoOXLaERY03ftFowCzl/nc=
X-Google-Smtp-Source: AGHT+IH+Ewdr9vonbIrOxmcRvgKd7RAjJeriFO+MISpkVPDe4B9w4hYy1Ur6cSAtblGN0SDU+7GGDJpmokKirdXlHAc=
X-Received: by 2002:a2e:be8c:0:b0:2ff:56a6:2992 with SMTP id
 38308e7fff4ca-3295ba7a1fdmr42809711fa.37.1748352114324; Tue, 27 May 2025
 06:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan> <DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com> <20250527111311.105246f2@sal.lan>
In-Reply-To: <20250527111311.105246f2@sal.lan>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Tue, 27 May 2025 22:21:42 +0900
X-Gm-Features: AX0GCFs6w_wf6YTjIybZZwQbdYAW7uiqsMchgBmAWJsp_ED2VhKs0cAbQv4ghpY
Message-ID: <CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve <aesteve@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	gurchetansingh@google.com, daniel.almeida@collabora.com, adelva@google.com, 
	changyeon@google.com, nicolas.dufresne@collabora.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:13=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Tue, 27 May 2025 15:14:50 +0900
> "Alexandre Courbot" <gnurou@gmail.com> escreveu:
>
> > Hi Mauro,
> >
> > On Mon May 26, 2025 at 9:13 PM JST, Mauro Carvalho Chehab wrote:
> > > Hi Michael,
> > >
> > > Em Sat, 12 Apr 2025 13:08:01 +0900
> > > Alexandre Courbot <gnurou@gmail.com> escreveu:
> > >
> > >> Add the first version of the virtio-media driver.
> > >>
> > >> This driver acts roughly as a V4L2 relay between user-space and the
> > >> virtio virtual device on the host, so it is relatively simple, yet
> > >> unconventional. It doesn't use VB2 or other frameworks typically use=
d in
> > >> a V4L2 driver, and most of its complexity resides in correctly and
> > >> efficiently building the virtio descriptor chain to pass to the host=
,
> > >> avoiding copies whenever possible. This is done by
> > >> scatterlist_builder.[ch].
> > >>
> > >> virtio_media_ioctls.c proxies each supported ioctl to the host, usin=
g
> > >> code generated through macros for ioctls that can be forwarded direc=
tly,
> > >> which is most of them.
> > >>
> > >> virtio_media_driver.c provides the expected driver hooks, and suppor=
t
> > >> for mmapping and polling.
> > >>
> > >>  This version supports MMAP buffers, while USERPTR buffers can also =
be
> > >>  enabled through a driver option. DMABUF support is still pending.
> > >
> > > It sounds that you applied this one at the virtio tree, but it hasn't
> > > being reviewed or acked by media maintainers.
> > >
> > > Please drop it.
> > >
> > > Alexandre,
> > >
> > > Please send media patches to media maintainers, c/c other subsystem
> > > maintainers, as otherwise they might end being merged without a
> > > proper review.
> >
> > Sorry about that, I put everyone in "To:" without giving it a second
> > thought.
> >
> > >
> > > In this particular case, we need to double-check if this won't cause
> > > any issues, in special with regards to media locks and mutexes.
> >
> > Agreed, I am not 100% confident about that part myself.
> >
> > >
> > > I'll try to look on it after this merge window, as it is too late
> > > for it to be applied during this one.
> >
> > Appreciate that - given the high traffic on the list I was worried that
> > this patch would eventually be overlooked. Not making it for this merge
> > window should not be a problem, so please take the time you need.
>
> Provided that your patch was caught by patchwork, it won't be lost:
>         https://patchwork.linuxtv.org/project/linux-media/patch/20250412-=
virtio-media-v3-1-97dc94c18398@gmail.com/
>
> Please notice that our CI got a number of checkpatch issues there.
> Please check and fix the non-false-positive ones.

Will do. The macro-related ones are false-positives AFAICT. Some of
the "lines should not end with a '('" are actually the result of
applying clang-format with the kernel-provided style...

>
> Btw, I was looking at:
>
>         https://github.com/chromeos/virtio-media
>
> (I'm assuming that this is the QEMU counterpart, right?)

crosvm actually, but QEMU support is also being worked on.

>
> And I noticed something weird there:
>
>         "Unsupported ioctls
>
>          A few ioctls are replaced by other, more suitable mechanisms. If=
 being requested these ioctls, the device must return the same response as =
it would for an unknown ioctl, i.e. ENOTTY.
>
>             VIDIOC_QUERYCAP is replaced by reading the configuration area=
.
>             VIDIOC_DQBUF is replaced by a dedicated event.
>             VIDIOC_DQEVENT is replaced by a dedicated event."
>
> While this could be ok for cromeOS, this will be broken for guests with
> Linux, as all Linux applications rely on VIDIOC_QUERYCAP and VIDIOC_DQBUF
> to work. Please implement support for it, as otherwise we won't even be
> able to test the driver with the v4l2-compliance tool (*).

The phrasing was a bit confusing. The guest driver does support these
ioctls, and passes v4l2-compliance. So there is no problem here.

Where these ioctls are not supported is between the guest and the
host, i.e. as ioctls encapsulated into a virtio request. For QUERYCAP,
that's because the virtio configuration area already provides the same
information. For DQBUF and DQEVENT, that's because we want to serve
these asynchronously for performance reasons (hence the dedicated
events).

But these differences don't affect guest user applications which will
be able to perform these ioctls exactly as they expect.

>
> (*) Passing at v4l2-compliance is a requirement for any media driver
>     to be merged.
>
> With regards to testing, what's the expected testing scenario?
> My guess is that, as a virtio device, a possible test scenario would be
> to have the UVC camera from the host OS mapped using virtio-camera into
> the guest OS, allowing a V4L2 application running at the guest to map the
> camera from the host, right?

That's one of the scenarios, yes. Another one is to expose an
accelerated decoder on the host to the guest. One can also create
"fake" devices backed by software on the host for testing purposes.

That's actually the benefit of using V4L2 as a guest/host protocol:
the same guest and the same software stack on the host can be used to
virtualize multiple kinds of media devices, removing the need to have
e.g. virtio-camera and virtio-codec. This removes a ton of work (and
code).

