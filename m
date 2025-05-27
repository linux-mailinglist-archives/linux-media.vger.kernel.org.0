Return-Path: <linux-media+bounces-33475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFFAC5119
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFD13AEE3E
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0118F2798F0;
	Tue, 27 May 2025 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djyVeERZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB741F941;
	Tue, 27 May 2025 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356971; cv=none; b=mKLC8+ycHDtRf0HiIDYdRXbB7m+hmG/08Z3fYwIdCvGT1OOb3tvcrQ8S/QLCFvTpWvUpOG1Ys7l4W0djkhHat/TOk+iVKtHLwNbg7lp6vrH8PnBszInadb1L9GwXUEmMviZ2TOCxaOnKOciWHh4d0GvW9jG8IKtFvDmxfOO6GUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356971; c=relaxed/simple;
	bh=8geZ4qXr1FSvl4Ew6bYQUl/LC8TNtcxxw9kuy8qjcrs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2qE3qge/IsSxWriJzlJu7lhikjRHGWfvalA04OHNW+SthnJkXkpD5OuCabzcqUVLSG5h75mcGN7RFkD+XfweNlohknnQHUbJI0cIvr99KBCiDzqUzQzMLxKdJNDS+nJXdgGF6ilh4Y6X4l4AXpaRzYiiGICjf0lycZwS/CbqPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djyVeERZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC387C4CEE9;
	Tue, 27 May 2025 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748356970;
	bh=8geZ4qXr1FSvl4Ew6bYQUl/LC8TNtcxxw9kuy8qjcrs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=djyVeERZ9tAKT02w/1kww+yWBYTOlyoJRMAcZc9ymzt7bzmMgSnPWgxqujR6yaW1q
	 fBdt1Wj2TzcQz3TFtKww8rJ9pK2diXabPC6XkEzU3WVTEZ9b4rqRCPbNFQrLm55kRt
	 /roFRZz6aqGFMwGWKi9lKmh2apG0KfRKlbXLo8mf78lZKfpYJYZeyozWemCiXhSiE2
	 jlZ3/uvDax4gDk5Q+tkMBIWy6aCTtwwIeT1vRKGrerAC1mOB8K+H7CYwLwHZHvXoqz
	 ydnG3cPmpWz/e/2eQuGbBVGi2SrPZH09UOss6GSEIQ1exbGGyoXIVJtDDaUI3quwyO
	 ZKuwFuhzItjoA==
Date: Tue, 27 May 2025 16:42:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Albert Esteve <aesteve@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, gurchetansingh@google.com,
 daniel.almeida@collabora.com, adelva@google.com, changyeon@google.com,
 nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250527164243.092e8aae@sal.lan>
In-Reply-To: <CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
	<20250527153547.6603eaf4@sal.lan>
	<CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 27 May 2025 23:03:39 +0900
Alexandre Courbot <gnurou@gmail.com> escreveu:

> On Tue, May 27, 2025 at 10:35=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Tue, 27 May 2025 22:21:42 +0900
> > Alexandre Courbot <gnurou@gmail.com> escreveu:
> > =20
> > > On Tue, May 27, 2025 at 6:13=E2=80=AFPM Mauro Carvalho Chehab
> > > <mchehab+huawei@kernel.org> wrote: =20
> > > >
> > > > Em Tue, 27 May 2025 15:14:50 +0900
> > > > "Alexandre Courbot" <gnurou@gmail.com> escreveu:
> > > > =20
> > > > > Hi Mauro,
> > > > >
> > > > > On Mon May 26, 2025 at 9:13 PM JST, Mauro Carvalho Chehab wrote: =
=20
> > > > > > Hi Michael,
> > > > > >
> > > > > > Em Sat, 12 Apr 2025 13:08:01 +0900
> > > > > > Alexandre Courbot <gnurou@gmail.com> escreveu:
> > > > > > =20
> > > > > >> Add the first version of the virtio-media driver.
> > > > > >>
> > > > > >> This driver acts roughly as a V4L2 relay between user-space an=
d the
> > > > > >> virtio virtual device on the host, so it is relatively simple,=
 yet
> > > > > >> unconventional. It doesn't use VB2 or other frameworks typical=
ly used in
> > > > > >> a V4L2 driver, and most of its complexity resides in correctly=
 and
> > > > > >> efficiently building the virtio descriptor chain to pass to th=
e host,
> > > > > >> avoiding copies whenever possible. This is done by
> > > > > >> scatterlist_builder.[ch].
> > > > > >>
> > > > > >> virtio_media_ioctls.c proxies each supported ioctl to the host=
, using
> > > > > >> code generated through macros for ioctls that can be forwarded=
 directly,
> > > > > >> which is most of them.
> > > > > >>
> > > > > >> virtio_media_driver.c provides the expected driver hooks, and =
support
> > > > > >> for mmapping and polling.
> > > > > >>
> > > > > >>  This version supports MMAP buffers, while USERPTR buffers can=
 also be
> > > > > >>  enabled through a driver option. DMABUF support is still pend=
ing. =20
> > > > > >
> > > > > > It sounds that you applied this one at the virtio tree, but it =
hasn't
> > > > > > being reviewed or acked by media maintainers.
> > > > > >
> > > > > > Please drop it.
> > > > > >
> > > > > > Alexandre,
> > > > > >
> > > > > > Please send media patches to media maintainers, c/c other subsy=
stem
> > > > > > maintainers, as otherwise they might end being merged without a
> > > > > > proper review. =20
> > > > >
> > > > > Sorry about that, I put everyone in "To:" without giving it a sec=
ond
> > > > > thought.
> > > > > =20
> > > > > >
> > > > > > In this particular case, we need to double-check if this won't =
cause
> > > > > > any issues, in special with regards to media locks and mutexes.=
 =20
> > > > >
> > > > > Agreed, I am not 100% confident about that part myself.
> > > > > =20
> > > > > >
> > > > > > I'll try to look on it after this merge window, as it is too la=
te
> > > > > > for it to be applied during this one. =20
> > > > >
> > > > > Appreciate that - given the high traffic on the list I was worrie=
d that
> > > > > this patch would eventually be overlooked. Not making it for this=
 merge
> > > > > window should not be a problem, so please take the time you need.=
 =20
> > > >
> > > > Provided that your patch was caught by patchwork, it won't be lost:
> > > >         https://patchwork.linuxtv.org/project/linux-media/patch/202=
50412-virtio-media-v3-1-97dc94c18398@gmail.com/
> > > >
> > > > Please notice that our CI got a number of checkpatch issues there.
> > > > Please check and fix the non-false-positive ones. =20
> > >
> > > Will do. The macro-related ones are false-positives AFAICT. Some of
> > > the "lines should not end with a '('" are actually the result of
> > > applying clang-format with the kernel-provided style... =20
> >
> > I don't know any lint tool that honors kernel style. The best one
> > is checkpatch with the auto-correcting parameter in pedantic mode,
> > but still one needs to manually review its output.
> > =20
> > > =20
> > > >
> > > > Btw, I was looking at:
> > > >
> > > >         https://github.com/chromeos/virtio-media
> > > >
> > > > (I'm assuming that this is the QEMU counterpart, right?) =20
> > >
> > > crosvm actually, but QEMU support is also being worked on. =20
> >
> > Do you have already QEMU patches? The best is to have the Kernel driver
> > submitted altogether with QEMU, as Kernel developers need it to do the
> > tests. In my case, I never use crosvm, and I don't have any Chromebook
> > anymore. =20
>=20
> IIRC Albert Esteve was working on this, maybe he can share the current st=
atus.

That would be nice.

>=20
> Note that crosvm does not require a Chromebook, you can build and run
> it pretty easily on a regular PC. I have put together a document to
> help with that:
>=20
> https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
>=20
> It also shows how to proxy a host UVC camera into the guest and use
> some of the "fake" devices I talked about earlier.

Ok, I'll look on it, thanks for the hint!

> If following these
> steps is too much friction, just reading through the document should
> give you a decent idea of what virtio-media can do.
>=20
> > =20
> > > > And I noticed something weird there:
> > > >
> > > >         "Unsupported ioctls
> > > >
> > > >          A few ioctls are replaced by other, more suitable mechanis=
ms. If being requested these ioctls, the device must return the same respon=
se as it would for an unknown ioctl, i.e. ENOTTY.
> > > >
> > > >             VIDIOC_QUERYCAP is replaced by reading the configuratio=
n area.
> > > >             VIDIOC_DQBUF is replaced by a dedicated event.
> > > >             VIDIOC_DQEVENT is replaced by a dedicated event."
> > > >
> > > > While this could be ok for cromeOS, this will be broken for guests =
with
> > > > Linux, as all Linux applications rely on VIDIOC_QUERYCAP and VIDIOC=
_DQBUF
> > > > to work. Please implement support for it, as otherwise we won't eve=
n be
> > > > able to test the driver with the v4l2-compliance tool (*). =20
> > >
> > > The phrasing was a bit confusing. The guest driver does support these
> > > ioctls, and passes v4l2-compliance. So there is no problem here. =20
> >
> > Please add v4l2-compliance output on the next patch series. =20
>=20
> Certainly. Note that the output is dependent on what the host provides
> for a device. If it e.g. proxies something that is not fully
> compliant, the guest will reflect the same errors.

Makes sense. In this case, the best is to add at the PR the v4l2-compliance
output for both the host real V4L2 driver and the guest one.

>=20
> > =20
> > > Where these ioctls are not supported is between the guest and the
> > > host, i.e. as ioctls encapsulated into a virtio request. For QUERYCAP,
> > > that's because the virtio configuration area already provides the same
> > > information. For DQBUF and DQEVENT, that's because we want to serve
> > > these asynchronously for performance reasons (hence the dedicated
> > > events).
> > >
> > > But these differences don't affect guest user applications which will
> > > be able to perform these ioctls exactly as they expect. =20
> >
> > OK. Better to let it clear then at the documentation.
> > =20
> > > >
> > > > (*) Passing at v4l2-compliance is a requirement for any media driver
> > > >     to be merged.
> > > >
> > > > With regards to testing, what's the expected testing scenario?
> > > > My guess is that, as a virtio device, a possible test scenario woul=
d be
> > > > to have the UVC camera from the host OS mapped using virtio-camera =
into
> > > > the guest OS, allowing a V4L2 application running at the guest to m=
ap the
> > > > camera from the host, right? =20
> > >
> > > That's one of the scenarios, yes. =20
> >
> > Ok, this is the easiest test scenario for media developers.
> > =20
> > > Another one is to expose an accelerated decoder on the host to the gu=
est. =20
> > =20
> > > One can also create
> > > "fake" devices backed by software on the host for testing purposes. =
=20
> >
> > That sounds interesting. It probably makes sense to have some test
> > scenario using such fake devices plus v4l2-compliance test to check
> > for regressions running on some CI engine. =20
>=20
> Yes, regression catching in a CI is one of the use-cases we thought about.
>=20
> > =20
> > > That's actually the benefit of using V4L2 as a guest/host protocol:
> > > the same guest and the same software stack on the host can be used to=
 =20
>=20
> I made a typo here: "the same guest DRIVER". That's an important point. :)

It was clear enough to me ;-)

>=20
> Cheers,
> Alex.

