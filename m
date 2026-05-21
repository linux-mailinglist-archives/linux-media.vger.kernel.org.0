Return-Path: <linux-media+bounces-62425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEe7NdXQDmrOCQYAu9opvQ
	(envelope-from <linux-media+bounces-62425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:31:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC925A25FF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8029B315046A
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A1C3603EC;
	Thu, 21 May 2026 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AGmBTyA7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477EE13D51E;
	Thu, 21 May 2026 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354069; cv=none; b=Eq2GXSxj7gXw/zT2d1f1RUaoJ40j0JOHtWYFLiGbwWiJEsGuwfBvaxVcuKsx9Mva5vDBw/kRPTXo5awsITQJw0qjdiWpoXsBAlBHmpYQjPRhfv74xgTO7Qmd1a49MLHlLLCclBjwLxol9JCxpLnct6ww+1tO7tt4eYzwa81+gQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354069; c=relaxed/simple;
	bh=HkYvTVcPzSTc+LKOwW4MxrM8I91nfQVQdqotlUSn+lA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ms5934d1EGMQTUGObukiV2jUBkUhcsNB0yDYUfbrJjNPnEALGR7AOY//Oxyp/VrqpShhl/6lXI/aO1fDsJC4zUd2IN9Cizu+MPgTakTz+rm3YZv/Je+U4ggyRT8zChCKo8ZWNTouy8sR3sEr1kVGbGR5BX450bv3eRdg7CQF7N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AGmBTyA7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779354066;
	bh=HkYvTVcPzSTc+LKOwW4MxrM8I91nfQVQdqotlUSn+lA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AGmBTyA7gH4ux1s88NG7277H5LLbOvuOMz20+ai56lyumT0m4etdK9ZrKA/OhZPvZ
	 DQcKB6ioFVSXqHWyMuWrqzvM4aqjcta50N4XSC3fz7YNRL5Y6oYNp1XngR0zcoVE4p
	 tCkyZbBpYTPocrQq02wdiEJAB4/S8dSQNyN5hZvb4MgEuceLmC6+Q2B4O0tISVk8aa
	 g1BNL/pxVbF9oceU4ybUnO91sFPXaDdOY9LzhebV0Rjp+p6cIEQEQylCweK9d4wrkB
	 lu/YPi74aPQiQW4RLc71oiyVWCC5DRfaD65eLqh66aka+6qqlWEQy8SNzs5+YLozUQ
	 JsNOs2SZzZ5+w==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1126D17E107C;
	Thu, 21 May 2026 11:01:06 +0200 (CEST)
Date: Thu, 21 May 2026 11:01:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dma-resv: Define guards for context-less dma_resv
 locks
Message-ID: <20260521110100.598baadb@fedora>
In-Reply-To: <20260521105402.4bc4b1e5@fedora>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
	<03a57011-e734-4a74-aef2-e3a6016e15fc@amd.com>
	<20260518111456.30ba9bba@fedora>
	<a9ee80aa-0c9b-4bd7-87bb-d3e228357b18@amd.com>
	<20260518161531.331cab2d@fedora>
	<d793568d-9611-4174-b9e9-c71ffec5ae93@amd.com>
	<20260521105402.4bc4b1e5@fedora>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62425-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 3CC925A25FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 10:54:02 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 21 May 2026 10:36:47 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > On 5/18/26 16:15, Boris Brezillon wrote: =20
> > > On Mon, 18 May 2026 14:18:41 +0200
> > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > >    =20
> > >> On 5/18/26 11:14, Boris Brezillon wrote:   =20
> > >>> Hi Christian,
> > >>>
> > >>> On Mon, 18 May 2026 09:10:23 +0200
> > >>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > >>>      =20
> > >>>> On 5/13/26 18:58, Boris Brezillon wrote:     =20
> > >>>>> When used without a context, dma_resv are no different from regul=
ar
> > >>>>> locks. Define guards so we can use the guard-syntactic sugars for
> > >>>>> explicit/implicit scoped locks.
> > >>>>>
> > >>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>   =
    =20
> > >>>>
> > >>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >>>>
> > >>>> How do you want to upstream it? My preference would be drm-misc-ne=
xt, but I think I can live with a panthor specific branch as well.     =20
> > >>>
> > >>> Everything Panthor related goes through drm-misc-next, so drm-misc-=
next
> > >>> also has my preference ;-). But I'd like to wait for more feedback =
on
> > >>> the other drm patches, and there are a few things I need to address=
 in
> > >>> the panthor patches anyway, so it's likely to take a couple more we=
eks
> > >>> for this series to hit the drm-misc tree, unless you have a good re=
ason
> > >>> to fast-track this specific patch.     =20
> > >>
> > >> Well the DMA-buf code itself uses dma_resv_lock/unlock   =20
> > >=20
> > > There's no use in dma-resv.c that can be converted to guards. I gave
> > > dma-buf.c a try, but just like for panthor, I don't really like the f=
act
> > > it's halfway through (other locks still use manual locking), so I'd be
> > > tempted to convert everything at once for consistency. If you're fine
> > > with that, I can give this a try.   =20
> >=20
> > Well depends on what everything means. I would only convert dma-buf.c i=
n one patch and nothing else. =20
>=20
> By everything I mean all type of locks, not just dma_resv ones.

BTW, I actually did more than just dma-buf.c [1], let me know what you
want from there and I'll ditch the rest.

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commits/b4/panthor-gua=
rd-refactor

