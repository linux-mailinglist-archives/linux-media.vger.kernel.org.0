Return-Path: <linux-media+bounces-11411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DBA8C4262
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F391F23E87
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 13:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA3153813;
	Mon, 13 May 2024 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O4TIXMfh"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96715359D;
	Mon, 13 May 2024 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715607730; cv=none; b=N0h3r1aAsTrANKtl9ahHiOoPkS8YfZ0O7D3X3bfN4Ikr/2GslPIZoXzdsIwDpDMoauH4TmOhMI3zVlrvfiCRW2afDVhzG4Y7R8fWHSDUQHS8dvwOJAFqM3hTaBZJJptv8q5MJBZGPQIjUb5dm449neC5AD0uWqAcLwDsN4MtlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715607730; c=relaxed/simple;
	bh=g7hFnEia5voiR/AdbTlubgSrmLdAszS7Bi3Riyp0VbA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dE3/hymDlBn+GJ/heO1XS85fXTFsWgfnnzEpExw1S8BcdQYkEOPeyBU+JtXkQ08N5a1oANMfyFcYE5eNbM+mBFgeYZtWBEFRxGn7A7rIu1BpMsD5kH6MIm0nPHcSs/hrLRB2jPt3zUHBDqr82Huto9szr6HJYKQLAxVYulRdd10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O4TIXMfh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715607727;
	bh=g7hFnEia5voiR/AdbTlubgSrmLdAszS7Bi3Riyp0VbA=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=O4TIXMfhYTAUhHgRvELChpeG6lzSc9I/IdBSDHZ3X/PGYZzpQ/tEWY5mrxcN0yLzw
	 GUJSJnN1tVQb6XNsTeFvoswqpUR7ct5Z/SRbp3Tn/zv8KsQ2xdZ/jnjOBEqYeReeXb
	 tsvNoKUL1tX2CUUTkplnMTIco+w8t15Kr8AJcyTWpTGkW0LMVeizHmQfshES6kB0/I
	 TMYuzDoL8lSxGBqp9maFg9gyDQgVKvF7LGc+61mRYFjrYY696h+nW0ky1fvV8pL8ZZ
	 Oz5XZNHOuQ2KGUWNGtxTY8HX5Q6aPxndId1ewus+DjRzELY+36yn23DbUNIqMr9hkR
	 mNrTMdOnBg6ag==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 707C23782167;
	Mon, 13 May 2024 13:42:04 +0000 (UTC)
Message-ID: <dacacb862275cd7a588c5fcc56fd6c1d85538d12.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Maxime Ripard <mripard@redhat.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Bryan O'Donoghue
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
Date: Mon, 13 May 2024 09:42:00 -0400
In-Reply-To: <20240513-heretic-didactic-newt-1d6daf@penduick>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
	 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
	 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
	 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
	 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
	 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
	 <20240507183613.GB20390@pendragon.ideasonboard.com>
	 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
	 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
	 <20240513-heretic-didactic-newt-1d6daf@penduick>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 13 mai 2024 =C3=A0 10:29 +0200, Maxime Ripard a =C3=A9crit=C2=A0:
> On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> > On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > > Hi,
> > >=20
> > > Le mardi 07 mai 2024 =C3=A0 21:36 +0300, Laurent Pinchart a =C3=A9cri=
t=C2=A0:
> > > > Shorter term, we have a problem to solve, and the best option we ha=
ve
> > > > found so far is to rely on dma-buf heaps as a backend for the frame
> > > > buffer allocatro helper in libcamera for the use case described abo=
ve.
> > > > This won't work in 100% of the cases, clearly. It's a stop-gap meas=
ure
> > > > until we can do better.
> > >=20
> > > Considering the security concerned raised on this thread with dmabuf =
heap
> > > allocation not be restricted by quotas, you'd get what you want quick=
ly with
> > > memfd + udmabuf instead (which is accounted already).
> > >=20
> > > It was raised that distro don't enable udmabuf, but as stated there b=
y Hans, in
> > > any cases distro needs to take action to make the softISP works. This
> > > alternative is easy and does not interfere in anyway with your future=
 plan or
> > > the libcamera API. You could even have both dmabuf heap (for Raspbian=
) and the
> > > safer memfd+udmabuf for the distro with security concerns.
> > >=20
> > > And for the long term plan, we can certainly get closer by fixing tha=
t issue
> > > with accounting. This issue also applied to v4l2 io-ops, so it would =
be nice to
> > > find common set of helpers to fix these exporters.
> >=20
> > Yeah if this is just for softisp, then memfd + udmabuf is also what I w=
as
> > about to suggest. Not just as a stopgap, but as the real official thing=
.
> >=20
> > udmabuf does kinda allow you to pin memory, but we can easily fix that =
by
> > adding the right accounting and then either let mlock rlimits or cgroup=
s
> > kernel memory limits enforce good behavior.
>=20
> I think the main drawback with memfd is that it'll be broken for devices
> without an IOMMU, and while you said that it's uncommon for GPUs, it's
> definitely not for codecs and display engines.

In the context of libcamera, the allocation and the alignment done to the v=
ideo
frame is done completely blindly. In that context, there is a lot more then=
 just
the allocation type that can go wrong and will lead to a memory copy. The u=
pside
of memfd, is that the read cache will help speeding up the copies if they a=
re
needed.

Another important point is that this is only used if the application haven'=
t
provided frames. If your embedded application is non-generic, and you have
permissions to access the right heap, the application can solve your specif=
ic
issue. But in the generic Linux space, Linux kernel API are just insufficie=
nt
for the "just work" scenario.

Nicolas

