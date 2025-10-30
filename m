Return-Path: <linux-media+bounces-46020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED4C20E6E
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 16:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD896427A7A
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3453363377;
	Thu, 30 Oct 2025 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XsRvY6ir"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A63208;
	Thu, 30 Oct 2025 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837835; cv=none; b=IthFLXBFNZQ5LuaIaV906FCitUB0vlA/g3HMT6Zne9bs7wwC16zbfFUC6z4MiXSFn2Q/kGNKAlr8d+68opyq519zMhwX4PfzRxhOR9UOwBDi8mzEGqUGsSsXiLvlKFSdQiSGFfP6DvPaPqcjet/KYzP4VcfA03bcTauzelUk7YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837835; c=relaxed/simple;
	bh=+70wsxsUKt4UILi1sS3Hkbru1yirfCe5Hv9sXg1ElVc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nVQLsxB+F8IaSOaXklQ1yF55UgtbRSrWThlaKWLnEOuC2/YIZcjttcFdOmbWgAxiNTiG9AMUhmouZ+kZZbCLTrY7G6LnBejrU2IFTKBT4h6VlZAhdkf5apMuYDpWapbk9s/0+MUiO8uRk1dXnOqYCRE4aE/Cu3KxZlET+6arf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XsRvY6ir; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cy7Dg6lDvz9t3b;
	Thu, 30 Oct 2025 16:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761837828; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5e1e008gbO1/zsprlDyPBCZ7fdZFhj66DGzzytqzuQ=;
	b=XsRvY6irrdPrD8d9dBP1MABjFGs0HiyFQN9u9P6b0Gjz/HyMS39KS4Q93VFvX5Kj+D7Yy4
	Xc05edZos7ptFMRZx2iiwIx+HzLNpHAlGyJg8UDpJ0ECb3AibH4JzU/8nG5KDWOJOMXGe/
	fZDPS/bM9b3z+0cZM6UDSCKIiqOA3Cen7w/QXZJIBBqAOijyyAKPi1zVwbyZmtaK21lFCl
	/LxVJEeSTn3SvyPYlmxYmmRb1ktth1teMz9ct2Gc3YU3TVzg5ZewN5XQwuTbQ8nL0ev+4x
	glEHsar9iCtFJqSg0P0VtbV/ZuqPSiQIGrK9s2DP2TQALstbLTgLktb1rXAbzg==
Message-ID: <015c204472811734b1e2a12d044ac3b13926c617.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/sched: Add warning for removing hack in
 drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Thu, 30 Oct 2025 16:23:44 +0100
In-Reply-To: <20251023123429.139848-2-phasta@kernel.org>
References: <20251023123429.139848-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 50bb01bfe4d79271fe0
X-MBO-RS-META: wd5awe31de8g61xfb6fczuxkck9e7365

On Thu, 2025-10-23 at 14:34 +0200, Philipp Stanner wrote:
> The assembled developers agreed at the X.Org Developers Conference 2025
> that the hack added for amdgpu in drm_sched_fini() shall be removed. It
> shouldn't be needed by amdgpu anymore.
>=20
> As it's unclear whether all drivers really follow the life time rule of
> entities having to be torn down before their scheduler, it is reasonable
> to warn for a while before removing the hack.
>=20
> Add a warning in drm_sched_fini() that fires if an entity is still
> active.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Can someone review this?

At XDC we agreed on removing the hack, but wanted to add a warning
print first for a few releases, to really catch if there are no users
anymore.

Thx
P.

> ---
> Changes in v3:
> =C2=A0 - Add a READ_ONCE() + comment to make the warning slightly less
> =C2=A0=C2=A0=C2=A0 horrible.
>=20
> Changes in v2:
> =C2=A0 - Fix broken brackets.
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 9 ++++++++-
> =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 46119aacb809..31039b08c7b9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1419,7 +1419,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
)
> =C2=A0		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> =C2=A0
> =C2=A0		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> +		list_for_each_entry(s_entity, &rq->entities, list) {
> =C2=A0			/*
> =C2=A0			 * Prevents reinsertion and marks job_queue as idle,
> =C2=A0			 * it will be removed from the rq in drm_sched_entity_fini()
> @@ -1440,8 +1440,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sche=
d)
> =C2=A0			 * For now, this remains a potential race in all
> =C2=A0			 * drivers that keep entities alive for longer than
> =C2=A0			 * the scheduler.
> +			 *
> +			 * The READ_ONCE() is there to make the lockless read
> +			 * (warning about the lockless write below) slightly
> +			 * less broken...
> =C2=A0			 */
> +			if (!READ_ONCE(s_entity->stopped))
> +				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n=
");
> =C2=A0			s_entity->stopped =3D true;
> +		}
> =C2=A0		spin_unlock(&rq->lock);
> =C2=A0		kfree(sched->sched_rq[i]);
> =C2=A0	}


