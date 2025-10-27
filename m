Return-Path: <linux-media+bounces-45657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E987EC0DBB1
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8EE6650149F
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 12:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48A125CC79;
	Mon, 27 Oct 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bvnrc8GI"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90869243956;
	Mon, 27 Oct 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569443; cv=none; b=Fb6c3l1F58eoK9OyDhau6yAQbT+T+hQw6lt/bFo9tLd8sOrzHqVi9xt0iUC0qpwNY6DZdNpon71CknRogSlULowJ9ARvr6m64ciU6kUGkP0EgzWkFPVYLFI591P79+wKUMQQaq3ujizfFaARLZIINqqR8Rz701FWRVjk9tk0Tuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569443; c=relaxed/simple;
	bh=0JjotIZCc+V6m9L82dNlypasORKHXE2YpABpYKkWXy4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pb6V6omk4ljw3Q+nxv5nAKpp04FP0xHGIVlMlQpTj5OqfFUlXbmCYHPbVCKFcibDdXOkzZSpJtdS9vK1BK4WnngHC/BBirmQxf6bJqxDnHhNpMzJwF0eR2oZjnoX/GwfX5tWxQGgArS3yh4X9bVvdAYJYlxGGD0ep1BlSOLMC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bvnrc8GI; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwCzD20qkz9t55;
	Mon, 27 Oct 2025 13:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761569432; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2I23fNm6Em+ctcxbQMJZKQTH8OTHmjmStiPodBpgGs=;
	b=bvnrc8GIxDY0DiOz7djBKG2iILJBXISfM3GS+Zy4gm/Rto4icOyGMsA/LpMkukPbthdsAY
	NK/IHVQCUfJnxQ1ZUdYP2P9u1fkxK38wdOb+VkIIkZ2N9MdhacBfZPonOOOO4MR7aHcNk4
	ef7mYf008NLUGDJa/e6/xPma7bLQuNvNA/UZqwLeg/a494AIU8NXRzFZ4hXZzuexCiEZ1J
	MCUQyFQbQBFn0GZet8wWBvBbGuvjtKQPi9/T34m9V6j5BYZPRb/fiNnn4BjhjED2wWyvaU
	pAOrTe0W3ALs9GjUmSftFdDyTuflsp/2NNVN9Ozp1+JkBC0wcBHAMhaOz09EFg==
Message-ID: <19a92d6d0ee730074139a36c38cc2fe16c72c588.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix race in drm_sched_entity_select_rq()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 27 Oct 2025 13:50:28 +0100
In-Reply-To: <26eef700-7997-42e5-b0b9-c03361e05814@igalia.com>
References: <20251022063402.87318-2-phasta@kernel.org>
	 <26eef700-7997-42e5-b0b9-c03361e05814@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: g5fne6skcrqj8jyzt6atkcpbxyy5t5cu
X-MBO-RS-ID: 5e63914fdaa7d966411

On Wed, 2025-10-22 at 08:16 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/10/2025 07:34, Philipp Stanner wrote:
> > In a past bug fix it was forgotten that entity access must be protected
> > by the entity lock. That's a data race and potentially UB.
> >=20
> > Move the spin_unlock() to the appropriate position.
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v5.13+
> > Fixes: ac4eb83ab255 ("drm/sched: select new rq even if there is only on=
e v3")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
> > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 5a4697f636f2..aa222166de58 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -552,10 +552,11 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> > =C2=A0=C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> > =C2=A0=C2=A0		entity->rq =3D rq;
> > =C2=A0=C2=A0	}
> > -	spin_unlock(&entity->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (entity->num_sched_list =3D=3D 1)
> > =C2=A0=C2=A0		entity->sched_list =3D NULL;
> > +
> > +	spin_unlock(&entity->lock);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
>=20
> Agreed, unlock at the end is correct.
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Applied to drm-misc-fixes.

Thx
P.


>=20
> Luckily only amdgpu calls drm_sched_entity_modify_sched(), and I am not=
=20
> sure if with hypothetical multi-threaded submit it could be possible to=
=20
> hit it or not.
>=20
> One thread would have to clear the sched_list, while another would have=
=20
> to have passed the !sched_list at the beginning of the function, and the=
=20
> job_queue count and last_scheduled completed guards. Which would mean
> job has to get completed between the unlock and clearing the pointer.
>=20
> Also, take a look at this when you can please:
>=20
> https://lore.kernel.org/dri-devel/20240719094730.55301-1-tursulin@igalia.=
com/
>=20
> This would also have fixed this issue by removing clearing of=20
> entity->sched_list. Latter being just a hack to work around the issue of=
=20
> confused container ownership rules.
>=20
> Regards,
>=20
> Tvrtko
>=20


