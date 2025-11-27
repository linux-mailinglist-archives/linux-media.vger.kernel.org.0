Return-Path: <linux-media+bounces-47808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A709C8D7C3
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EAC8234F962
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 09:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC976328253;
	Thu, 27 Nov 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oMA0l5GF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF3288CA6;
	Thu, 27 Nov 2025 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234984; cv=none; b=ShPu95JxtInScmscMfBNDjM9QunU8ggiTAlNNMd0U6Co9AFZOwIO2AlinCVzVWAygKGx5rWRDozqnxLaThxCX/UNA1Lfs7BShBPK1qqs0JJJoRFElQKGHfgJ+WYdox5X+uChoOvUDK8BSbWp/wxi260p3fBhpZOi8HpoYiS4hYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234984; c=relaxed/simple;
	bh=LSTWpZ694gmrqMwIjxj3UrOdrcrNuYsAYGwhIa5HCXk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F7U4tDKlmoBIR2ec/QT/soVb2lFLZmmFEqn9xYoY/256V7sWCVj34VBBIqKhJVn81uh0P7aVlL1UJcTofwQ5Hc984DgWQ24WIzwMbXswUtRC0JQoOR3o37eYXq7eo6WrrEkXOiLm4j8BQnvVe+cczdJzqhiXTweFvlk10/FpKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oMA0l5GF; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dH9ld1kxhz9tZ4;
	Thu, 27 Nov 2025 10:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764234973; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFgdH560T3YiZGXpnSavHS2fNWjlZmWfX61HED3oDlY=;
	b=oMA0l5GF20+89bOALj2AZEzZ3KIYCQ0sQV3nKIuCRZQwgA60GoBHIUvo5JRwMguBCc9aZn
	F5inZjQemfWXADIy+1xs76rtlYJFo92RNRet6w4peIdc++GW6ttRGWxsCSXZqLLJ1K10VW
	QLkDmrkejRTh1VxfNJZ4pklrXpAKF9HotuRSmTJqVuPBFkros9P2+ivH/W1otk+mQpr0t9
	mnTm79fYRIiStVef/JAOqBwscFVop7s6hLDvpyU/Arc28NFYHaNpXsDjbYT9vMO0+bOAVO
	gzwkxgjeZWdYc3mg70heVVNEMMx2BkFm+1Edzdqkw9Qv9hGCakXTyIbg4+8BCQ==
Message-ID: <35189892c0cb774155e2012d41371b4d3f8e7d0f.camel@mailbox.org>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add
 dma_fence_test_signaled_flag()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org,  amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Thu, 27 Nov 2025 10:16:01 +0100
In-Reply-To: <f1864f6d-8403-406d-81a0-00a71495cae8@amd.com>
References: <20251126131914.149445-2-phasta@kernel.org>
	 <20251126131914.149445-3-phasta@kernel.org>
	 <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
	 <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
	 <f1864f6d-8403-406d-81a0-00a71495cae8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: bgpghhhhrg9u5u445qr6ka3upg67j9jx
X-MBO-RS-ID: a7092e291bad71bbc06

On Thu, 2025-11-27 at 09:11 +0100, Christian K=C3=B6nig wrote:
> On 11/26/25 17:55, Matthew Brost wrote:
> > On Wed, Nov 26, 2025 at 08:41:27AM -0800, Matthew Brost wrote:
> > > On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
> > > > The dma_fence framework checks at many places whether the signaled =
flag
> > > > of a fence is already set. The code can be simplified and made more
> > > > readable by providing a helper function for that.
> > > >=20
> > > > Add dma_fence_test_signaled_flag(), which only checks whether a fen=
ce is
> > > > signaled. Use it internally.
> > > >=20
> > > > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > >=20
> > > This is a nice cleanp:
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > >=20
> > > > ---
> > > > =C2=A0drivers/dma-buf/dma-fence.c | 19 +++++++++----------
> > > > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 24 ++++++++++++++++++=
++++--
> > > > =C2=A02 files changed, 31 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fenc=
e.c
> > > > index 39e6f93dc310..25117a906846 100644
> > > > --- a/drivers/dma-buf/dma-fence.c
> > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dm=
a_fence *fence,
> > > > =C2=A0
> > > > =C2=A0	lockdep_assert_held(fence->lock);
> > > > =C2=A0
> > > > -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> >=20
> > I need to read a little better, I think this change isn't quite right.
> > The original code is test and set, the updated code is test only (i.e.,
> > you are missing the set step). So maybe just leave this line as is.
>=20
> Oh, good point! I've totally missed that as well.

Oh dear; I also just saw it when opening the mail client ._.

>=20
> But that means that this patch set hasn't even been smoke tested.

I've built it and did some basic testing with my Nouveau system. Any
suggestions? Do you have a CI that one can trigger?

Thx
P.

