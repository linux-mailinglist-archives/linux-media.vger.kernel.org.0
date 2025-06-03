Return-Path: <linux-media+bounces-34017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6DACC7CE
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 15:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81DC3166F24
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 13:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C0D231832;
	Tue,  3 Jun 2025 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hvdmvmCC"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B70230D35;
	Tue,  3 Jun 2025 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957361; cv=none; b=lAI186tBv9w8JrC0dFgSoKww0CGhWjt3piofenhAHnI6FnIEOCy2a94wYBtWF+EMBkhjnrfmT4bZ5dViYtAR8Kdd3iiIf3H4PYbLLozsTXg4ej+KmzPnxUlYtvgPe5+tn9TMoZ7675QkJejVfGEhU5/cUDbpaJn3mbO7LeYjI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957361; c=relaxed/simple;
	bh=9rC9wfImtJeRRZMvS7a471KH44YhZ50t9581jq7fj9c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D4HcpFp7XhL11fz2myG4YQoxrVNSRJjuqf2U3Ll9TO7f/ig0WOWEVFyJdPe6pM1Viifn1a5GpnCN77w18RWbP3ofvR1SNRr4OFi6oAfAyWI/o6VbHnbUYK+we6Lu6DIY49qhtESO+USdomsspvdv5dlhZf+1qiXDS5KP6Nc6V90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hvdmvmCC; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bBWcs5tVRz9tKm;
	Tue,  3 Jun 2025 15:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748957021; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9rC9wfImtJeRRZMvS7a471KH44YhZ50t9581jq7fj9c=;
	b=hvdmvmCCcNvGJiQxq49aEEttREH4Kcrp00Q7oSW5mNn41hphEgaWVBESxXsuO5aLcOxeI4
	kBM4mKnPCkCpILWBTpCb6PSo3UGOA+WYMyTD//w0wKhPFbYt1rm2rqPCM7fePX1e77+jeK
	kv5IJ7Ownc7Dgpvx8uJo+/FcwWZmxQxZ+QK9mNCUhxYGb7VbR2kDeUM77ay0lrytJaqx4R
	4SCb4ZpTWKItU4FjMCurdR/mZNHHzUKq2NzhZwWbMNcyepX4SgeUKnkMq9GlypG6hp6kIo
	B9BjVXFnlWUpYZE2CKHcoYfQpuLKVrbvXTmLo6RyC2AdjTwFneDRnaIzGGX+Ug==
Message-ID: <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 03 Jun 2025 15:23:36 +0200
In-Reply-To: <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
References: <20250603093130.100159-2-phasta@kernel.org>
	 <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: cdf397ce994b2e274e3
X-MBO-RS-META: oepr7uqp6e6ppxxyqmaoqq5ms8qeqiiz

On Tue, 2025-06-03 at 13:27 +0100, Tvrtko Ursulin wrote:
>=20
> On 03/06/2025 10:31, Philipp Stanner wrote:
> > An alternative version to [1], based on Tvrtko's suggestion from
> > [2].
> >=20
> > I tested this for Nouveau. Works.
> >=20
> > I'm having, however, bigger problems properly porting the unit
> > tests and
> > have seen various explosions. In the process I noticed that some
> > things
> > in the unit tests aren't right and a bit of a larger rework will be
> > necessary (for example, the timedout job callback must signal the
> > timedout fence, remove it from the list and so on).
>=20
> General approach I follow when implementing any mock component is to=20
> implement only as much is needed for a test to pass. Only add more
> and=20
> rework when a test/functionality is added which requires it.
>=20
> Specifically for timedout callback signaling I see that I had exactly
> that added in the patch you linked as [2].
> =C2=A0 > Anyways. Please comment on the general idea.
>=20
> I am obviously okay with it. :) Especially now that you verified it=20
> works well for nouveau.
>=20
> What I am not that ecstatic about is only getting the Suggested-by=20
> credit in 1/6. Given it is basically my patch with some cosmetic
> changes=20
> like the kernel doc and the cancel loop extracted to a helper.

Sign the patch off and I give you the authorship if you want.

>=20
> > @Tvrtko: As briefly brainstormed about on IRC, if you'd be willing
> > to
> > take care of the unit tests patch, I could remove that one (and,
> > maaaaybe, the warning print patch) from the series and we could
> > merge
> > this RFC's successor version %N once it's ready. What do you think?
>=20
> Okay in principle but the first thing I would suggest you could try
> is=20
> to take my unit tests adaptations from [2] verbatim. Benefit of
> keeping=20
> everything in one series is more confidence we are merging a solid=20
> thing. But I can take it on myself as a follow up too if you want.
>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > P.
> >=20
> > [1]
> > https://lore.kernel.org/dri-devel/20250522082742.148191-2-phasta@kernel=
.org/
> > [2]
> > https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin=
@igalia.com/
> >=20
> > Philipp Stanner (6):
> > =C2=A0=C2=A0 drm/sched: Avoid memory leaks with cancel_job() callback
> > =C2=A0=C2=A0 drm/sched/tests: Implement cancel_job()
> > =C2=A0=C2=A0 drm/sched: Warn if pending list is not empty
> > =C2=A0=C2=A0 drm/nouveau: Make fence container helper usable driver-wid=
e
> > =C2=A0=C2=A0 drm/nouveau: Add new callback for scheduler teardown
> > =C2=A0=C2=A0 drm/nouveau: Remove waitque for sched teardown
> >=20
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 35 +++++----
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 7 ++
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 35 +++++----
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 9 +--
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_uvmm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +--
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 37 ++++++----
> > =C2=A0 .../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 71 +++++++-=
------
> > -----
> > =C2=A0 drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 4 +-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 +++
> > =C2=A0 9 files changed, 115 insertions(+), 100 deletions(-)
> >=20
>=20


