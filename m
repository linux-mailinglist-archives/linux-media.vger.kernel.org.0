Return-Path: <linux-media+bounces-11457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9968C5C83
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 22:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B120E1C2177A
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 20:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC2717BB0D;
	Tue, 14 May 2024 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iXEz4+77"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FAD1DDD6;
	Tue, 14 May 2024 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715719972; cv=none; b=MQhzR/W3NWjsMMOlZ8GXUc9xs9F1xIO5cjMnTfXg5789W1oQLIyRo+MePJ6LFSEOuplXQYmX45H+5WONOSvCFmaVwZuaOcZAu0D447jcyEPYU8mfmaHHZEn/sx58H2wFSsW5K6snQCFSdsuncB5S0htwbM9U8UR1VmQwz+B2nc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715719972; c=relaxed/simple;
	bh=qsQGlGLL57EANB+PD3QWFhzfQ0h2NlQAwY4ihQBaf84=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iWLvEDJ01rK9flMbKkB59Qm0ZwJiJUJ3ENPvFxfAplUqeiPbS5SJJXCtjgwPbZbOxnVvHgY1r5qaSrc9R1EKVpGA99aYsYdWNQE3ttI9Ffc1mRi0o+brmjRmwPzC3BVV3ClSprZ/CH88zO1vgwOYN8polQPhndWzs2tz9yB0h14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iXEz4+77; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715719969;
	bh=qsQGlGLL57EANB+PD3QWFhzfQ0h2NlQAwY4ihQBaf84=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iXEz4+77kjBQZcqLz2JN2TfJQ3s3IcQceYBD2VJL4NRlL/yj80BDCJBkJsBLXRu0L
	 aJv9Njy0cFiflekirHQ0F6kNKlfzIW4P2nHOParnFoDnpXhn+V+tYR6KHPMib8bEwD
	 SFJ7qPZi99LI5QScwrvueXarRnFbNLGsMcQH52XEdKJ54L0tpdlF5yRMEl1T/xhj92
	 Pqgjiw4sX/f1THvCnxu/OsBTJFrPdQ2ZeQnSL+YXDRHdy8F/pGwt80r/FJ8XKzXsCC
	 krLF/OfYAQFCCVdFDgVGBn8fZbOCGj6Ja+frzw6P7IRtqSZ+/pg6M2pK1zWM0Mxnub
	 bmtwnmaNxkKQg==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9700B37810EF;
	Tue, 14 May 2024 20:52:46 +0000 (UTC)
Message-ID: <a3a5852587a3a463068b5d45e89e9624e50eb3fe.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@redhat.com>, Bryan O'Donoghue
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
Date: Tue, 14 May 2024 16:52:40 -0400
In-Reply-To: <20240514204500.GO32013@pendragon.ideasonboard.com>
References: 
	<e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
	 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
	 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
	 <20240507183613.GB20390@pendragon.ideasonboard.com>
	 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
	 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
	 <20240513-heretic-didactic-newt-1d6daf@penduick>
	 <dacacb862275cd7a588c5fcc56fd6c1d85538d12.camel@collabora.com>
	 <20240513-auspicious-toucanet-from-heaven-f313af@penduick>
	 <643c6d3da9c7f45c32e01dd7179681117557ed4d.camel@collabora.com>
	 <20240514204500.GO32013@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mardi 14 mai 2024 =C3=A0 23:45 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> > And finally, none of this fixes the issue that the heap allocation are =
not being
> > accounted properly and allow of an easy memory DoS. So uaccess should b=
e granted
> > with care, meaning that defaulting a "desktop" library to that, means i=
t will
> > most of the time not work at all.
>=20
> I think that issue should be fixed, regardless of whether or not we end
> up using dma heaps for libcamera. If we do use them, maybe there will be
> a higher incentive for somebody involved in this conversation to tackle
> that problem first :-) And maybe, as a result, the rest of the Linux
> community will consider with a more open mind usage of dma heaps on
> desktop systems.

The strict reality is that if libcamera offer no alternatives, some OS will
enable it and reduce their security. I totally agree this issue needs to be
fixed regardless of libcamera, or even dma heaps. DMABuf allocation should =
be
accounted and limited to quotas whether it comes from a GPU, Display, V4L2 =
or
other type of supported devices. I would also not recommend dropping your h=
eap
support (or preventing it from being merged) in libcamera.

Nicolas

