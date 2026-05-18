Return-Path: <linux-media+bounces-61924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C5IJ2XeCmqR8wQAu9opvQ
	(envelope-from <linux-media+bounces-61924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:39:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1E569E26
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09A843037D65
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2EB800;
	Mon, 18 May 2026 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lcssmPM/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5E3E51E2;
	Mon, 18 May 2026 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096923; cv=none; b=APFBuDg772xrTUq8k9YrtFJsAiFcU72ESEXrdNarM8M9EKFeRVspUvfH2CIn8xdSQFLznhY2nm68m4nLEIZgK/+xXsT8G8QCpt//VOlT8kRYybq3rMaLRZjIj/73S/9qkiI9LYeJRhU+6anchTw/A8i6mYnWJsUBxhSO1e3WuXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096923; c=relaxed/simple;
	bh=oDlIKsmjIzcjVIcTrJ/yYYgluBpXPLUOjcadrFJxADQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEx6uCxDsoEUF6NFSXwe/dal/T9isIubNIvOarhNVP6ur2tegWOaGWFFUBgD/765EzHbl9r1KYFyXwxxKspo3daIL/mEzERrZPsV5mwgoTHXjsWWvJcgsnaYjmM7JxF/NLNva1cZzD7/96VGKdggBN5ipk/D/efjVdG4+tPIcYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lcssmPM/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779096920;
	bh=oDlIKsmjIzcjVIcTrJ/yYYgluBpXPLUOjcadrFJxADQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lcssmPM/5L8HhycTKzgHC8rkX9MHCs18A4XmTep9/XIOg98BFdjczvXpa4h9RjSkl
	 wGYfsvSeNm7CCSbJ5PyPAlC313kWX87ESBpU1Bkuq67ezhxbUYwzJyz9BqMcUuGImB
	 tuuWU1hrGElbNoyclhwqNWyQDQyYoSkDpGgo6ssifkzODeSGjh27dOzN9snUsc0hBT
	 BwB5+oheoesjdKjjBw3KCSPgSzMbZif8bJNlvgyxeHZLLP7rpwcLwjJw6nvenLeFl1
	 Ib1LNhZutAw2M5l/RPGNrzPCLV9Nh7K+u0RjAfZwZVdBZGAsZxRP7JJLMtLqV5ZebS
	 6IqC8KtYDHxRA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB35E17E0443;
	Mon, 18 May 2026 11:35:19 +0200 (CEST)
Date: Mon, 18 May 2026 11:35:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Cc: Chia-I Wu <olvaffe@gmail.com>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/6] drm: Define a conditional guard for
 drm_dev_{enter,exit}()
Message-ID: <20260518113515.794442f3@fedora>
In-Reply-To: <a872ef35-6d5b-41fd-9242-bb44902fb237@amd.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-3-f2d8c15a97ce@collabora.com>
	<CAPaKu7TULU6_-8eoygq0svBTbnX-vFvF3sH5hDzyi9kDP-9enQ@mail.gmail.com>
	<20260518102813.50555650@fedora>
	<a872ef35-6d5b-41fd-9242-bb44902fb237@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 07D1E569E26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61924-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Action: no action

On Mon, 18 May 2026 11:16:55 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 5/18/26 10:28, Boris Brezillon wrote:
> > On Thu, 14 May 2026 11:34:52 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> >  =20
> >> On Wed, May 13, 2026 at 10:24=E2=80=AFAM Boris Brezillon
> >> <boris.brezillon@collabora.com> wrote: =20
> >>>
> >>> Define a conditional drm_dev_access guard to automate the
> >>> drm_dev_{enter,exit}() sequence.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>>  include/drm/drm_drv.h | 9 +++++++++
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> >>> index 42fc085f986d..79d1958f93e4 100644
> >>> --- a/include/drm/drm_drv.h
> >>> +++ b/include/drm/drm_drv.h
> >>> @@ -490,6 +490,15 @@ void drm_dev_unplug(struct drm_device *dev);
> >>>  int drm_dev_wedged_event(struct drm_device *dev, unsigned long metho=
d,
> >>>                          struct drm_wedge_task_info *info);
> >>>
> >>> +/*
> >>> + * Only the conditional drm_dev_access guard is valid. The drm_dev o=
ne is
> >>> + * here so we can extend it with a conditional variant.
> >>> + */
> >>> +DEFINE_LOCK_GUARD_1(drm_dev, struct drm_device,
> >>> +                   { WARN_ON("Use cond guards"); _T->idx =3D -1; },
> >>> +                   drm_dev_exit(_T->idx), int idx);   =20
> >> If this is ever mis-used, drm_dev_exit(-1) seems to cause OOB access.
> >> Is BUG more appropriate than WARN_ON? =20
> >=20
> > I actually had
> >=20
> > 			if (_T->idx >=3D 0) drm_dev_exit(_T->idx),
> >=20
> > at some point, and I ditched it thinking the WARN_ON_ONCE()
> > in srcu_read_unlock() would cover for that. I can add it back, of
> > course.
> >=20
> > I'd be fine with a BUG_ON() too, but every time I tried to add one I've
> > been encouraged to handle the unexpected case instead.
> >=20
> > Ideally, we would have a DEFINE_LOCK_GUARD_COND() variant that, instead
> > of expanding a non-conditional one, would define the whole thing so
> > that the non-conditional variant is never exposed. =20
>=20
> Would it be possible to use BUILD_BUG() here?

Ah, nice! I was searching for this kind of compile-time assert that
would trigger if the code is used, and BUILD_BUG() indeed does what we
want. Thanks for the tip.

