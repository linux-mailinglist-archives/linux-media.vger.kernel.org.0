Return-Path: <linux-media+bounces-61909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lk7JNzPCmru8QQAu9opvQ
	(envelope-from <linux-media+bounces-61909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:37:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E0568F43
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D74CD307AFC9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 08:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552EA3E2AD5;
	Mon, 18 May 2026 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oeSn3ga4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6570330DD2A;
	Mon, 18 May 2026 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092900; cv=none; b=oMSMOiN9n968/j93Z2RcsUCqrb5l7CFY4ZoN/wQWAyWGoZqLTrzTvwqIIJiB/x/aVK7TcmMo3QJN5iRebVDgkvV8Muhtbm3ioKNAwexwA9cIefZ2D7JErPbiCl/5Z2XAs4DzhxUz+fboyrE8NC02Zc6plp0xkVZIGlaIwEaE1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092900; c=relaxed/simple;
	bh=RNTN0WeIA9v1VLUEI3zBpSvdu6mZejOVXTXs7aIWWFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZiXBEudfd6NjyjZSw1wVsEDayRnJrjx4F19XGzvs4QTi2ajLwKfY1qjQSRg10rjgCDWC2pbbDylJRYJMnLesfULPhf7Tl6V3yZeYEWAyRXrylrjbIevqEfgF5L4vRkSeyX/8hKN2oCNV4Bd0Ez68UoyOqErcd2hyZnVMRfR5to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oeSn3ga4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779092897;
	bh=RNTN0WeIA9v1VLUEI3zBpSvdu6mZejOVXTXs7aIWWFg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oeSn3ga4EJtfzucef4b1MZT11bwWm8YBoKn38FWkFMGN0j+jFBIcwxoP3j88YGfi7
	 ioVFXfWtFkG2rx/o9zpVDo7T//JaiP4LCywUY17A2HRaeRXsvx5TnLK3sG0YuTXwQU
	 0gK4Q+Fp0WJXgrayBmqYDjfg+gM2qt/ACrDncwI+4uwvmwC+4sjqaUzV92j9BjhYxk
	 I//EY1TmWEJCw3BfOR2Z0vvnT0AtecSJLdZjFia1v1zsSUOZKvTv5uMRRVcu5m9P9D
	 ArMhnGv1kB1UkITKo46JKC8b63MUE9OExqFQAOttSweWKd/e85GKcbtJCVQocu/sI6
	 7aEBjd3PXoa6Q==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1609D17E040C;
	Mon, 18 May 2026 10:28:17 +0200 (CEST)
Date: Mon, 18 May 2026 10:28:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] drm: Define a conditional guard for
 drm_dev_{enter,exit}()
Message-ID: <20260518102813.50555650@fedora>
In-Reply-To: <CAPaKu7TULU6_-8eoygq0svBTbnX-vFvF3sH5hDzyi9kDP-9enQ@mail.gmail.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-3-f2d8c15a97ce@collabora.com>
	<CAPaKu7TULU6_-8eoygq0svBTbnX-vFvF3sH5hDzyi9kDP-9enQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: 4D6E0568F43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61909-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 14 May 2026 11:34:52 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Wed, May 13, 2026 at 10:24=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Define a conditional drm_dev_access guard to automate the
> > drm_dev_{enter,exit}() sequence.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  include/drm/drm_drv.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > index 42fc085f986d..79d1958f93e4 100644
> > --- a/include/drm/drm_drv.h
> > +++ b/include/drm/drm_drv.h
> > @@ -490,6 +490,15 @@ void drm_dev_unplug(struct drm_device *dev);
> >  int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> >                          struct drm_wedge_task_info *info);
> >
> > +/*
> > + * Only the conditional drm_dev_access guard is valid. The drm_dev one=
 is
> > + * here so we can extend it with a conditional variant.
> > + */
> > +DEFINE_LOCK_GUARD_1(drm_dev, struct drm_device,
> > +                   { WARN_ON("Use cond guards"); _T->idx =3D -1; },
> > +                   drm_dev_exit(_T->idx), int idx); =20
> If this is ever mis-used, drm_dev_exit(-1) seems to cause OOB access.
> Is BUG more appropriate than WARN_ON?

I actually had

			if (_T->idx >=3D 0) drm_dev_exit(_T->idx),

at some point, and I ditched it thinking the WARN_ON_ONCE()
in srcu_read_unlock() would cover for that. I can add it back, of
course.

I'd be fine with a BUG_ON() too, but every time I tried to add one I've
been encouraged to handle the unexpected case instead.

Ideally, we would have a DEFINE_LOCK_GUARD_COND() variant that, instead
of expanding a non-conditional one, would define the whole thing so
that the non-conditional variant is never exposed.

>=20
> > +DEFINE_LOCK_GUARD_1_COND(drm_dev, _access, drm_dev_enter(_T->lock, &_T=
->idx));
> > +
> >  /**
> >   * drm_dev_is_unplugged - is a DRM device unplugged
> >   * @dev: DRM device
> >
> > --
> > 2.54.0
> > =20


