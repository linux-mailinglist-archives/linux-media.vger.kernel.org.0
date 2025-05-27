Return-Path: <linux-media+bounces-33464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E381CAC4FEB
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E26189C763
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774D12749CA;
	Tue, 27 May 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnLBVP8q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF4270572;
	Tue, 27 May 2025 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352956; cv=none; b=tHMw1Ziae/kp34BPUb6c3/X0RxIyGMMxGV1iUyW+YgKs8fU0q4KwdJ0mGsiORexQuMrHgR26p9+tE7XqQys3ETaEcL6hnOnN3mbp4+Ar7XgZQPxh9gmb9mYQXGJujtHTkUFIG4OaXEyvnD0WdeRDI0TMypDzMIsInDQaAKbOzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352956; c=relaxed/simple;
	bh=8lfh6bvcEFYdSzOgfOnnU+yhKsW3ISNP3ikpxpfHbCI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGzDxbVQXL74WwVNro0S8M4sy7KBQ1/EfJ+K5PE8tsL+7qI31tA52c+N6lXkQMN2mVA06IY0wvKX6ZGtlQq1+kSuacxZUPkZKUQ9DtyCQR4sA5BHHLLQAKbJtFtMVgwOgtY9x2n/bLY26RmguGToW3RbwOt4Sd98B0+yIJvnpaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnLBVP8q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30EBC4CEE9;
	Tue, 27 May 2025 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748352956;
	bh=8lfh6bvcEFYdSzOgfOnnU+yhKsW3ISNP3ikpxpfHbCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NnLBVP8qDQHfegA+pmu+8JlZiD4Su8VU3PPKiE+ubOZ7I0L0QwRZsjPxq0wBVd/v0
	 NLs9oYdYLVr/AYwGFRIF0N1a2ASguKEf8J2l9QZt+yQgBm8yMPVzGDQqYky0OFoWd7
	 MRUJnxoSQq/8iUixwLqnh86vuDSlCwW7Ndra+64yVv1fqMfXXEAmNdghiACN7ILknZ
	 etoKTATaDfHAQiFEqIJRqdtCQ+6PyaNN2C5Iu8ruQ7k+lmkMNjTId1jrAnCr8Rxyvv
	 Ip+AR9GMfOL3invz+sTrTdtUoTmxQLHubTzJnM9gAi/jXHUVP26UWAkWUZWAThLcWO
	 d9PPo9QxOn7TQ==
Date: Tue, 27 May 2025 15:35:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve
 <aesteve@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, gurchetansingh@google.com,
 daniel.almeida@collabora.com, adelva@google.com, changyeon@google.com,
 nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250527153547.6603eaf4@sal.lan>
In-Reply-To: <CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 27 May 2025 22:21:42 +0900
Alexandre Courbot <gnurou@gmail.com> escreveu:

> On Tue, May 27, 2025 at 6:13=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Tue, 27 May 2025 15:14:50 +0900
> > "Alexandre Courbot" <gnurou@gmail.com> escreveu:
> > =20
> > > Hi Mauro,
> > >
> > > On Mon May 26, 2025 at 9:13 PM JST, Mauro Carvalho Chehab wrote: =20
> > > > Hi Michael,
> > > >
> > > > Em Sat, 12 Apr 2025 13:08:01 +0900
> > > > Alexandre Courbot <gnurou@gmail.com> escreveu:
> > > > =20
> > > >> Add the first version of the virtio-media driver.
> > > >>
> > > >> This driver acts roughly as a V4L2 relay between user-space and the
> > > >> virtio virtual device on the host, so it is relatively simple, yet
> > > >> unconventional. It doesn't use VB2 or other frameworks typically u=
sed in
> > > >> a V4L2 driver, and most of its complexity resides in correctly and
> > > >> efficiently building the virtio descriptor chain to pass to the ho=
st,
> > > >> avoiding copies whenever possible. This is done by
> > > >> scatterlist_builder.[ch].
> > > >>
> > > >> virtio_media_ioctls.c proxies each supported ioctl to the host, us=
ing
> > > >> code generated through macros for ioctls that can be forwarded dir=
ectly,
> > > >> which is most of them.
> > > >>
> > > >> virtio_media_driver.c provides the expected driver hooks, and supp=
ort
> > > >> for mmapping and polling.
> > > >>
> > > >>  This version supports MMAP buffers, while USERPTR buffers can als=
o be
> > > >>  enabled through a driver option. DMABUF support is still pending.=
 =20
> > > >
> > > > It sounds that you applied this one at the virtio tree, but it hasn=
't
> > > > being reviewed or acked by media maintainers.
> > > >
> > > > Please drop it.
> > > >
> > > > Alexandre,
> > > >
> > > > Please send media patches to media maintainers, c/c other subsystem
> > > > maintainers, as otherwise they might end being merged without a
> > > > proper review. =20
> > >
> > > Sorry about that, I put everyone in "To:" without giving it a second
> > > thought.
> > > =20
> > > >
> > > > In this particular case, we need to double-check if this won't cause
> > > > any issues, in special with regards to media locks and mutexes. =20
> > >
> > > Agreed, I am not 100% confident about that part myself.
> > > =20
> > > >
> > > > I'll try to look on it after this merge window, as it is too late
> > > > for it to be applied during this one. =20
> > >
> > > Appreciate that - given the high traffic on the list I was worried th=
at
> > > this patch would eventually be overlooked. Not making it for this mer=
ge
> > > window should not be a problem, so please take the time you need. =20
> >
> > Provided that your patch was caught by patchwork, it won't be lost:
> >         https://patchwork.linuxtv.org/project/linux-media/patch/2025041=
2-virtio-media-v3-1-97dc94c18398@gmail.com/
> >
> > Please notice that our CI got a number of checkpatch issues there.
> > Please check and fix the non-false-positive ones. =20
>=20
> Will do. The macro-related ones are false-positives AFAICT. Some of
> the "lines should not end with a '('" are actually the result of
> applying clang-format with the kernel-provided style...

I don't know any lint tool that honors kernel style. The best one
is checkpatch with the auto-correcting parameter in pedantic mode,
but still one needs to manually review its output.

>=20
> >
> > Btw, I was looking at:
> >
> >         https://github.com/chromeos/virtio-media
> >
> > (I'm assuming that this is the QEMU counterpart, right?) =20
>=20
> crosvm actually, but QEMU support is also being worked on.

Do you have already QEMU patches? The best is to have the Kernel driver
submitted altogether with QEMU, as Kernel developers need it to do the
tests. In my case, I never use crosvm, and I don't have any Chromebook
anymore.

> > And I noticed something weird there:
> >
> >         "Unsupported ioctls
> >
> >          A few ioctls are replaced by other, more suitable mechanisms. =
If being requested these ioctls, the device must return the same response a=
s it would for an unknown ioctl, i.e. ENOTTY.
> >
> >             VIDIOC_QUERYCAP is replaced by reading the configuration ar=
ea.
> >             VIDIOC_DQBUF is replaced by a dedicated event.
> >             VIDIOC_DQEVENT is replaced by a dedicated event."
> >
> > While this could be ok for cromeOS, this will be broken for guests with
> > Linux, as all Linux applications rely on VIDIOC_QUERYCAP and VIDIOC_DQB=
UF
> > to work. Please implement support for it, as otherwise we won't even be
> > able to test the driver with the v4l2-compliance tool (*). =20
>=20
> The phrasing was a bit confusing. The guest driver does support these
> ioctls, and passes v4l2-compliance. So there is no problem here.

Please add v4l2-compliance output on the next patch series.

> Where these ioctls are not supported is between the guest and the
> host, i.e. as ioctls encapsulated into a virtio request. For QUERYCAP,
> that's because the virtio configuration area already provides the same
> information. For DQBUF and DQEVENT, that's because we want to serve
> these asynchronously for performance reasons (hence the dedicated
> events).
>=20
> But these differences don't affect guest user applications which will
> be able to perform these ioctls exactly as they expect.

OK. Better to let it clear then at the documentation.

> >
> > (*) Passing at v4l2-compliance is a requirement for any media driver
> >     to be merged.
> >
> > With regards to testing, what's the expected testing scenario?
> > My guess is that, as a virtio device, a possible test scenario would be
> > to have the UVC camera from the host OS mapped using virtio-camera into
> > the guest OS, allowing a V4L2 application running at the guest to map t=
he
> > camera from the host, right? =20
>=20
> That's one of the scenarios, yes.=20

Ok, this is the easiest test scenario for media developers.

> Another one is to expose an accelerated decoder on the host to the guest.=
=20

> One can also create
> "fake" devices backed by software on the host for testing purposes.

That sounds interesting. It probably makes sense to have some test
scenario using such fake devices plus v4l2-compliance test to check
for regressions running on some CI engine.

> That's actually the benefit of using V4L2 as a guest/host protocol:
> the same guest and the same software stack on the host can be used to
> virtualize multiple kinds of media devices, removing the need to have
> e.g. virtio-camera and virtio-codec. This removes a ton of work (and
> code).

Makes sense.

Regards,
Mauro

