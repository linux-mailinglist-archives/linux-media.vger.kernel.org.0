Return-Path: <linux-media+bounces-45485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20571C05F89
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50DAC3BD9C0
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083EA374ABC;
	Fri, 24 Oct 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MjbWpVxs"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFC319616;
	Fri, 24 Oct 2025 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303552; cv=none; b=u/Fn1b75871zFjJOZEKn7UT0g0r2Xvinj/0p+lvsS02Ap4gEKrmmLefo5a9UHpuNtg7D6rwXg62+OG0kCsylJ0FOVVTO9W/FcayO0LsXow+SYzmwybypU1RiwxVwj7wYd0vcP7ovuQ1ntZ71DDCeJi4ecPf2LVW+g+ojymyR7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303552; c=relaxed/simple;
	bh=O9ROC09iye2nO7+rvJRTS+B3PKWZzMYsyRdck60G2vg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QbljSJ400FTYJrUoQZCbxM+kPDOqm/vRVJkLtCo0MEoQe++uq4FXyeQG8gdiSdHNUWa5Us4doQAndzGiWI07afbZczrFUKa94EDRTW1MQst5aPJ9sALDtomgGdCi03k+yjsrTmHNQx+EXG0G5f4TEvdBfqNnOhtalNSvODLfato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MjbWpVxs; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ctKf13kBdz9v4c;
	Fri, 24 Oct 2025 12:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761303545; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJxxsUJGuCcgcdrm2dasSwOhBxRtwebMXYYxFSWgXo8=;
	b=MjbWpVxs789w96QavL+l2YEQIau5qBTpXOlJ46Y53ihauIlQm2cAgzG8Ia7q+72SG5XWc5
	SbKBJu6nDcaIgeRLMX1vE4qY0r9+Zs5nhQau8+ttM5CAbOBC5FZuTHp//1jGKFy4sCTLMY
	y57q7RHMpmT/Tv5095iW5WBI+F/Tt2JEAVByE2u07G34fiO2hjV1YAlcPhP0rz7my+RZJL
	7GPnI1yMxgqOMmDe3FnOLZnipjO9H3ecnLzMRJLOzipKLmdbqnY3c90uwLUNWWOjxRx48J
	Uvc+6+QkKPuMBYgaxs+CccNookE1d8m3+UXjHk6XaSSvWLJMjOE00xihjhm3FA==
Message-ID: <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo
 Padovan <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Date: Fri, 24 Oct 2025 12:59:01 +0200
In-Reply-To: <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
References: <20251024075019.162351-2-phasta@kernel.org>
	 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 38af43315007ac39358
X-MBO-RS-META: 4u1ufhoobt3yb771wkq7iq5z6jdtbn3d

On Fri, 2025-10-24 at 09:31 +0100, Tvrtko Ursulin wrote:
>=20
> On 24/10/2025 08:50, Philipp Stanner wrote:
> > To decouple the dma_fence_ops lifetime from dma_fences lifetime RCU
> > support was added to said function, coupled with using the signaled bit
> > to detect whether the fence_ops might be gone already.
> >=20
> > When implementing that a wrong string was set as a default return
> > parameter, indicating that every driver whose fence is already signalle=
d
> > must be detached, which is frankly wrong.
>=20
> Depends on how you look at it. After being signaled fence has to be=20
> detached from the driver. Ie. nothing belonging to this driver must be=
=20
> accessed via the fence.

Is that even documented btw? Many of the mysterious "dma fence rules"
are often only obtainable by asking Christian & Co

>=20
> I started with names and Christian has recently continued with ops.
>=20
> > Reported-by: Danilo Krummrich <dakr@kernel.org>
> > Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document t=
he rules")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > When this was merged, it sadly slipped by me. I think this entire RCU
> > mechanism was / is an overengineered idea.
> >=20
> > If we look at who actually uses dma_fence_driver_name() and
> > dma_fence_timeline_name() =E2=80=93 functions from which the largest sh=
are of
> > the fence_ops vs. fence lifetime issue stems from =E2=80=93 we discover=
 that
> > there is a single user:
> >=20
> > i915.
>=20

[=E2=80=A6]

>=20
>=20
> That would be nice, I also do not see much value in exporting names to=
=20
> userspace. But first more conversation around breaking the sync file ABI=
=20
> needs to happen. I think we had a little bit of it when changing the=20
> names of signalled fences and thinking was existing tools which look at=
=20
> the names will mostly survive it. Not sure if they would if unsignalled=
=20
> names would change.

I mean, what you and Christian are addressing in recent weeks are real
problems, and I was / am about to write similar solutions for our Rust
dma_fence.

In the case of those names, however, I'll likely just not support that
in Rust, saving me from adding those RCU guards and delivering output
of questionable use to users.
(could ofc be added later by someone who really needs it=E2=80=A6)

>=20
> >=20
> > P.
> > ---
> > =C2=A0 drivers/dma-buf/dma-fence.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 3f78c56b58dc..1875a0abebd3 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -1111,7 +1111,7 @@ const char __rcu *dma_fence_driver_name(struct dm=
a_fence *fence)
> > =C2=A0=C2=A0	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > =C2=A0=C2=A0		return fence->ops->get_driver_name(fence);
> > =C2=A0=C2=A0	else
> > -		return "detached-driver";
> > +		return "driver-whose-fence-is-already-signalled";
>=20
> IMHO unnecessarily verbose and whether or not changing it to anything
> different warrants a Fixes: tag is debatable.

IMO the output is just wrong and confusing. It's easy to imagine that
some user starts wondering and searching why his driver has been
unloaded, opening support tickets and so on.

Could be less verbose, though. Dunno. I let the maintainer decide.

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(dma_fence_driver_name);
> > =C2=A0=20
>=20


