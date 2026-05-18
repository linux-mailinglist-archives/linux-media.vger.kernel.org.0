Return-Path: <linux-media+bounces-61911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE4TCKPRCmou8gQAu9opvQ
	(envelope-from <linux-media+bounces-61911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:45:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E35690F7
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 593EA3031810
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 08:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890913815F3;
	Mon, 18 May 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PJx2YWKH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2091448E0;
	Mon, 18 May 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093845; cv=none; b=M5G4/8TP2/x/OMBLad9jLULGmht2XOq0c/y34JRBkixqoPdcuSeAaGWqKwTwHZiK/ueuNykrmnw2rOMz+9PgZnYPg2SDMHNkEe6TmZVOD2EZXJVuZ47rESmsFHiGM6r33qsJGh183eLSN0Ek8eG9wh2wZKKQ5I64JvBHnZC7nlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093845; c=relaxed/simple;
	bh=B79O7RG3AtnruxEHjLBPiA2D63Yfw5SoWz2V+Qe6Of8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdrX6SgUmKv6j2r1vP/rwl+AgEt4jiJRCresiXPp+w3xwhW4XYs/+bNjDnKkrto3UbSmYtsNMjoq9sp0IAX9zKIg46fnGUFNyRilvtPBnq6yr8dV0C5gJdgeHkz8irqrHF1F7Jrq2GUIyL10QRTq+ZLm6h3t9uKJPnKooXiSy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PJx2YWKH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779093841;
	bh=B79O7RG3AtnruxEHjLBPiA2D63Yfw5SoWz2V+Qe6Of8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PJx2YWKHwhOIdvHGUdsJgaIqUiIz2lLg65VhYe7GMEqd3oG0MUf2pvP7PEKyX68sZ
	 7q7iv95x4TF90kW8m4I6rclc9kQ8jBNl2h8JTVaA1Zy0n1Jvb3jq9kvoYs4zo72Bmn
	 NNiNda+hKWmSmbZqnPxP6IubnDiCqodq790fP/Vvtt7oSq36kbjvshIjD2WU8GQQq2
	 xirCPv1dQZ63nE1kpCEhWS74tc260aUIeN8dSVBBXPA3DNWNmpp7hMhxfqru9Z8kxo
	 kiY/4BbAqIlcLj+Di8NScsq4/vs+WS0GaXlUa71CfO1RD5TQyXQsXhUIgK48HgeMxm
	 7efXIsZ7C1ZfQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2420217E02A3;
	Mon, 18 May 2026 10:44:01 +0200 (CEST)
Date: Mon, 18 May 2026 10:43:56 +0200
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
Subject: Re: [PATCH 1/6] drm/panthor: Driver-wide xxx_[un]lock ->
 [scoped_]guard replacement
Message-ID: <20260518104356.71827224@fedora>
In-Reply-To: <CAPaKu7S9WMbJERrWa=bj5qyQg72no9MPex6S1MY6t8nXoMbB-Q@mail.gmail.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
	<5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
	<CAPaKu7S9WMbJERrWa=bj5qyQg72no9MPex6S1MY6t8nXoMbB-Q@mail.gmail.com>
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
X-Rspamd-Queue-Id: 6B1E35690F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61911-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

On Thu, 14 May 2026 10:09:10 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Thu, May 14, 2026 at 6:24=E2=80=AFAM Steven Price <steven.price@arm.co=
m> wrote:
> >
> > On 13/05/2026 17:58, Boris Brezillon wrote: =20
> > > Right now panthor is mixed bag of manual locks and guards. Let's
> > > make that more consitent and thus encourage new submissions to go
> > > for guards. =20
> >
> > I'm fine with encouraging guards for future code - but I'm a little wary
> > of a big change like this - it's hard to review it and check that
> > everything works the same. And it's a little dubious that the mechanical
> > refactoring produces more readable code in some cases. =20
> I agree with Steven in general, although I am in favor of landing now
> that you've gone through the trouble.

Honestly, I agree with you. The only reason I went for it is
because the mix we have right now is pretty confusing. This has to do
with the fact the scopes are often loosely defined unless you used
scoped_guard(), so it's pretty easy to mess up the lock/unlock
ordering. For instance,

	mutex_lock(locka);
	guard(lockb);
	mutex_unlock(locka);

	...

once expanded, turns into inconsistent locked sections, where the inner
lock (lockb) is released after the outer one (locka).

>=20
> I also have mixed feelings about some of the non-scoped guards. Their
> scopes are extended slightly than before, supposedly to avoid adding
> another level of indentation. But other than slightly slower,

I tried to used scoped_guard()s every where the extra non-guarded
section could be CPU heavy (the only bits left are some very simple
bit/arithmetic ops, and a couple queue_work() IIRC).

> it also
> becomes less clear what exactly do the guards protect.

I know, and I have pretty much the same feeling, but we've crossed that
bridge when we started accepting non-scoped guard()s, unfortunately.


