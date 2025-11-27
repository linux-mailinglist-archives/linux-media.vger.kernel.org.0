Return-Path: <linux-media+bounces-47821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CBC8DB7A
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 156F33AFF5B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030EC327C0C;
	Thu, 27 Nov 2025 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="raC6aTam"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971F3009E2;
	Thu, 27 Nov 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238602; cv=none; b=QpRwjC5Wj9tn9b8aO6A7DTRV8D/KyTJJZ3WHCZCca1CR//R2dOzzDb9OkBbb2JFl4sPXYSMusAvLZvpUnABeG7lW9wxphmHemXYrwqQJtrp4+rmzo7mp8Y7cCZ+oe1YPTW7DsQDtiTSvvy7sQVvsc/Li7FiEPeBNqQ4PRyeBCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238602; c=relaxed/simple;
	bh=NchD2gi6ef2FY1TjDSrMJBPfKbKkbkm1EDhkSMqLyWc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B/rQS+CJ6j8qgWFao8Lqo9n4Wx21o/iOXE7Ql2FM/R2Lv+CHYh8zqtxx1C+cDSXGAMFo0NaJoZ75QIpKOeVnNLyF8pMrqCWBQFjG+IFoFcDT7Wywi91dwwUxXpLXbbMCWimpq8qd/PGzCb6Lfa0yg5PEXQBMyYfV3F8aYyrAFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=raC6aTam; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dHC5J3Srfz9t5M;
	Thu, 27 Nov 2025 11:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764238596; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LwMaXtJBDLXQXsCQXnsteb1mtiqvJkilJ+dHEkj54k=;
	b=raC6aTamMxW3XjfgydWAdK4gvLHYOWYg89ZahO46b/L2hJ73UNWoB23IOUuy6deSE87H2x
	gLKD+aF4bvPXisVcAZwug5eUHK/cGm2GfGUsFGsk212L3JVrzXrc4tdNBxR30B+P7OwYKd
	1HZU1boijNknhlg/InkP09RyDOiqqdhmza522BYaqiacCFTGGvUHVzmOiBcYEqtUilZoA9
	6owl1co+7Wkf5nGrOCEuG8ZResFMNoaECA2zEkWgZngSNfOO5UMCUbLDhWDijZ8kwMsFCY
	qSNRytCNexkzAcgGNAuuIvkdIyXOrYvtLQoWA4CRnxVFQQEHBqdG3/17b1Gt3Q==
Message-ID: <89c04c8b3ca0fadf73452ca20ffd61cb106d762a.camel@mailbox.org>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add
 dma_fence_test_signaled_flag()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
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
Date: Thu, 27 Nov 2025 11:16:26 +0100
In-Reply-To: <adfd840e-fcc8-4cdb-8fd8-d0e48ee32247@amd.com>
References: <20251126131914.149445-2-phasta@kernel.org>
	 <20251126131914.149445-3-phasta@kernel.org>
	 <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
	 <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
	 <f1864f6d-8403-406d-81a0-00a71495cae8@amd.com>
	 <35189892c0cb774155e2012d41371b4d3f8e7d0f.camel@mailbox.org>
	 <adfd840e-fcc8-4cdb-8fd8-d0e48ee32247@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: bc88f92c2f8974133ff
X-MBO-RS-META: yz6764qr1bhitjd3f1i7yofkkz7wzuth

On Thu, 2025-11-27 at 11:01 +0100, Christian K=C3=B6nig wrote:
> On 11/27/25 10:16, Philipp Stanner wrote:
> > On Thu, 2025-11-27 at 09:11 +0100, Christian K=C3=B6nig wrote:
> > > On 11/26/25 17:55, Matthew Brost wrote:
> > > > On Wed, Nov 26, 2025 at 08:41:27AM -0800, Matthew Brost wrote:
> > > > > On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
> > > > > > The dma_fence framework checks at many places whether the signa=
led flag
> > > > > > of a fence is already set. The code can be simplified and made =
more
> > > > > > readable by providing a helper function for that.
> > > > > >=20
> > > > > > Add dma_fence_test_signaled_flag(), which only checks whether a=
 fence is
> > > > > > signaled. Use it internally.
> > > > > >=20
> > > > > > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > >=20
> > > > > This is a nice cleanp:
> > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > >=20
> > > > > > ---
> > > > > > =C2=A0drivers/dma-buf/dma-fence.c | 19 +++++++++----------
> > > > > > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 24 ++++++++++++++=
++++++++--
> > > > > > =C2=A02 files changed, 31 insertions(+), 12 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-=
fence.c
> > > > > > index 39e6f93dc310..25117a906846 100644
> > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struc=
t dma_fence *fence,
> > > > > > =C2=A0
> > > > > > =C2=A0	lockdep_assert_held(fence->lock);
> > > > > > =C2=A0
> > > > > > -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> > > >=20
> > > > I need to read a little better, I think this change isn't quite rig=
ht.
> > > > The original code is test and set, the updated code is test only (i=
.e.,
> > > > you are missing the set step). So maybe just leave this line as is.
> > >=20
> > > Oh, good point! I've totally missed that as well.
> >=20
> > Oh dear; I also just saw it when opening the mail client ._.
> >=20
> > >=20
> > > But that means that this patch set hasn't even been smoke tested.
> >=20
> > I've built it and did some basic testing with my Nouveau system. Any
> > suggestions? Do you have a CI that one can trigger?
>=20
> DMA-buf has CONFIG_DMABUF_SELFTESTS which should be able to catch things =
like that.
>=20
> But even running Nouveau should have found this since basically no fence =
at would signal any more.

They will signal and execute their callbacks, but all is_signaled()
checks are then broken.

Thx for the feedback, I'll be more careful with changes like those and
test more extensively.

P.

