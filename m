Return-Path: <linux-media+bounces-11419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3C8C43B5
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B671C213C0
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316C25240;
	Mon, 13 May 2024 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GsuZy88N"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC321EB37;
	Mon, 13 May 2024 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715612796; cv=none; b=RqE68C2C2+8dLzDiulSi0+JATXl1sGV62FxB0cgzzel2T5tNoXq0H98s65Py1CTrobqF23WwhqNAwccyK0mYxi+70lbTGDCB5UtYVHAu43VGFOUPuWaMsc5SwABN5YgVMI3cT6Vs26NK0hsKeFrIz1XswX5EvCfEgMXIcuOczUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715612796; c=relaxed/simple;
	bh=Fp6l7gDpfWs9xGGx42gII/k4cl2sl/wIfZtbJSF28SM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PdoxXz/cN9npCzyHZDikGGCotJmFIJWhXpPebF/lRRxMxq+fEOBo9OuItUkxajqWB87YoBe3X8TiPMFm53b/NK0yoIMd6SjHhVekKz94XrwWvNHLjaF2P2rcDt127EODfwJlz96aShWMBZReuvbMG3rUFan1AT5j2MJg65R1Plc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GsuZy88N; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715612793;
	bh=Fp6l7gDpfWs9xGGx42gII/k4cl2sl/wIfZtbJSF28SM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GsuZy88Noq7vMkeM1qyjbQd6Zcdbn9oOtTeSdOQO/QzLQUs9UuVcDFyDFDNxeyKYt
	 OtSkNtmaXAkJ9qG5DsonOLK9f1Lxh3nEJNmKt25m9WQSLXr2Ji7DEyrNqYU4hCMFMw
	 CV/unHCuhb5q5YGrwHPFl6JDgROMRK8yC0ItrbRjwu0pgwwX1SM8TwGlEZJAEzKXsX
	 qhS8/n5300q1MTAAUt2rymboalD32Ah18a9qywtotm2fSwCJNsdkMZfJDGGk8NNCvc
	 x17FKAhr1VvTfcSZNB+oW4rLZPG1NkqLzWBG4Vk3D2jG/kuZcqR3jm4Brn4DeQDHYg
	 bKOvOV38fWJHg==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 72F1E378216D;
	Mon, 13 May 2024 15:06:30 +0000 (UTC)
Message-ID: <643c6d3da9c7f45c32e01dd7179681117557ed4d.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Mon, 13 May 2024 11:06:24 -0400
In-Reply-To: <20240513-auspicious-toucanet-from-heaven-f313af@penduick>
References: 
	<ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
	 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
	 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
	 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
	 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
	 <20240507183613.GB20390@pendragon.ideasonboard.com>
	 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
	 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
	 <20240513-heretic-didactic-newt-1d6daf@penduick>
	 <dacacb862275cd7a588c5fcc56fd6c1d85538d12.camel@collabora.com>
	 <20240513-auspicious-toucanet-from-heaven-f313af@penduick>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 13 mai 2024 =C3=A0 15:51 +0200, Maxime Ripard a =C3=A9crit=C2=A0:
> On Mon, May 13, 2024 at 09:42:00AM -0400, Nicolas Dufresne wrote:
> > Le lundi 13 mai 2024 =C3=A0 10:29 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> > > On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> > > > On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > > > > Hi,
> > > > >=20
> > > > > Le mardi 07 mai 2024 =C3=A0 21:36 +0300, Laurent Pinchart a =C3=
=A9crit=C2=A0:
> > > > > > Shorter term, we have a problem to solve, and the best option w=
e have
> > > > > > found so far is to rely on dma-buf heaps as a backend for the f=
rame
> > > > > > buffer allocatro helper in libcamera for the use case described=
 above.
> > > > > > This won't work in 100% of the cases, clearly. It's a stop-gap =
measure
> > > > > > until we can do better.
> > > > >=20
> > > > > Considering the security concerned raised on this thread with dma=
buf heap
> > > > > allocation not be restricted by quotas, you'd get what you want q=
uickly with
> > > > > memfd + udmabuf instead (which is accounted already).
> > > > >=20
> > > > > It was raised that distro don't enable udmabuf, but as stated the=
re by Hans, in
> > > > > any cases distro needs to take action to make the softISP works. =
This
> > > > > alternative is easy and does not interfere in anyway with your fu=
ture plan or
> > > > > the libcamera API. You could even have both dmabuf heap (for Rasp=
bian) and the
> > > > > safer memfd+udmabuf for the distro with security concerns.
> > > > >=20
> > > > > And for the long term plan, we can certainly get closer by fixing=
 that issue
> > > > > with accounting. This issue also applied to v4l2 io-ops, so it wo=
uld be nice to
> > > > > find common set of helpers to fix these exporters.
> > > >=20
> > > > Yeah if this is just for softisp, then memfd + udmabuf is also what=
 I was
> > > > about to suggest. Not just as a stopgap, but as the real official t=
hing.
> > > >=20
> > > > udmabuf does kinda allow you to pin memory, but we can easily fix t=
hat by
> > > > adding the right accounting and then either let mlock rlimits or cg=
roups
> > > > kernel memory limits enforce good behavior.
> > >=20
> > > I think the main drawback with memfd is that it'll be broken for devi=
ces
> > > without an IOMMU, and while you said that it's uncommon for GPUs, it'=
s
> > > definitely not for codecs and display engines.
> >=20
> > In the context of libcamera, the allocation and the alignment done to t=
he video
> > frame is done completely blindly. In that context, there is a lot more =
then just
> > the allocation type that can go wrong and will lead to a memory copy. T=
he upside
> > of memfd, is that the read cache will help speeding up the copies if th=
ey are
> > needed.
>=20
> dma-heaps provide cacheable buffers too...

Yes, and why we have cache hints in V4L2 now. There is no clue that softISP=
 code
can read to make the right call. The required cache management in undefined
until all the importer are known. I also don't think heaps currently care t=
o
adapt the dmabuf sync behaviour based on the different importers, or the
addition of a new importer. On top of which, there is insufficient informat=
ion
on the device to really deduce what is needed.

>=20
> > Another important point is that this is only used if the application ha=
ven't
> > provided frames. If your embedded application is non-generic, and you h=
ave
> > permissions to access the right heap, the application can solve your sp=
ecific
> > issue. But in the generic Linux space, Linux kernel API are just insuff=
icient
> > for the "just work" scenario.
>=20
> ... but they also provide semantics around the memory buffers that no
> other allocation API do. There's at least the mediatek secure playback
> series and another one that I've started to work on to allocate ECC
> protected or unprotected buffers that are just the right use case for
> the heaps, and the target frameworks aren't.

Let's agree we are both off topic now. The libcamera softISP is currently p=
urely
software, and cannot write to any form of protected memory. As for ECC, I w=
ould
hope this usage will be coded in the application and that this application =
has
been authorized to access the appropriate heaps.

And finally, none of this fixes the issue that the heap allocation are not =
being
accounted properly and allow of an easy memory DoS. So uaccess should be gr=
anted
with care, meaning that defaulting a "desktop" library to that, means it wi=
ll
most of the time not work at all.

Nicolas

