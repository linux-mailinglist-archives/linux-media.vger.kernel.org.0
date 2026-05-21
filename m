Return-Path: <linux-media+bounces-62422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMiTJSDODmqdCQYAu9opvQ
	(envelope-from <linux-media+bounces-62422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:19:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17A5A22BD
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314643239F9E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 08:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3A3367B88;
	Thu, 21 May 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cg9EMLnb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8678435C1BD;
	Thu, 21 May 2026 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353649; cv=none; b=WkTr1JgxFmtbSWfGWVdtfvYNpeepROoZyduGIPtFJzvop3XXp2GlcdCzkcLkgpsnMLagkeSyvrasOzH/64ZzH5ZvTr73GC9Fr2s6LUVtxxqupFlVLig7ycZboi+pmdy/rGZyEhbVyg6fFE3xcSnMcym5uO91XaODMxtywxvE0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353649; c=relaxed/simple;
	bh=Ra5BznzPov9L1SF1BCTSdVIKjQq8Jg4J1ZpWShdlICA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtJsGPfYJIL5eh1W38SbJ8mlxaHl9umGQ/A/TusSKTWbx8VxbCEo64JKK+qTKfethdl80szfXG4Qlsz8Yf4U0K3qeqLFPZ8Z6rrxKgCRd+4S/UGgS5RsCNSFUvq/GGTRPnbVO0H51SOjz5K1qoZtnNyofpox54kxQ3hjJI9/Z5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cg9EMLnb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779353645;
	bh=Ra5BznzPov9L1SF1BCTSdVIKjQq8Jg4J1ZpWShdlICA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cg9EMLnbG/dLQw3ZSs4pBQ4/TJS0E8wNAsAUaxtocDsfFofLSmtRX7DlGsWxn3zIm
	 F+I2vX323SJpJhf7ShqOAakvuGxlB2ppvIWRqvSOYvp5pviJ2bXQTIj9u8cZxbX86s
	 /TS6/LH8lfO3bYLwELhD45YNLcT6Go1yP7JKEDHfu9LVaLTQm1u7fI1+g87UUSuEeL
	 zPIkuStzlk8QHo81rcPH/ibBxPkWj4l5mACNYPZesmOmLvXlJJaFvkYLIGoGScC2aO
	 8uT5KdAQ1BS0hfSp/oTqf8fZ175ES4M2oYTDBbRzyEKcGsqg4g0EXEEYNvzqxqvTXA
	 U6olDb+51Kmnw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28DD317E125C;
	Thu, 21 May 2026 10:54:05 +0200 (CEST)
Date: Thu, 21 May 2026 10:54:02 +0200
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
Message-ID: <20260521105402.4bc4b1e5@fedora>
In-Reply-To: <d793568d-9611-4174-b9e9-c71ffec5ae93@amd.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
	<03a57011-e734-4a74-aef2-e3a6016e15fc@amd.com>
	<20260518111456.30ba9bba@fedora>
	<a9ee80aa-0c9b-4bd7-87bb-d3e228357b18@amd.com>
	<20260518161531.331cab2d@fedora>
	<d793568d-9611-4174-b9e9-c71ffec5ae93@amd.com>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62422-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0F17A5A22BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 10:36:47 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 5/18/26 16:15, Boris Brezillon wrote:
> > On Mon, 18 May 2026 14:18:41 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> >> On 5/18/26 11:14, Boris Brezillon wrote: =20
> >>> Hi Christian,
> >>>
> >>> On Mon, 18 May 2026 09:10:23 +0200
> >>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >>>    =20
> >>>> On 5/13/26 18:58, Boris Brezillon wrote:   =20
> >>>>> When used without a context, dma_resv are no different from regular
> >>>>> locks. Define guards so we can use the guard-syntactic sugars for
> >>>>> explicit/implicit scoped locks.
> >>>>>
> >>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>     =
=20
> >>>>
> >>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>
> >>>> How do you want to upstream it? My preference would be drm-misc-next=
, but I think I can live with a panthor specific branch as well.   =20
> >>>
> >>> Everything Panthor related goes through drm-misc-next, so drm-misc-ne=
xt
> >>> also has my preference ;-). But I'd like to wait for more feedback on
> >>> the other drm patches, and there are a few things I need to address in
> >>> the panthor patches anyway, so it's likely to take a couple more weeks
> >>> for this series to hit the drm-misc tree, unless you have a good reas=
on
> >>> to fast-track this specific patch.   =20
> >>
> >> Well the DMA-buf code itself uses dma_resv_lock/unlock =20
> >=20
> > There's no use in dma-resv.c that can be converted to guards. I gave
> > dma-buf.c a try, but just like for panthor, I don't really like the fact
> > it's halfway through (other locks still use manual locking), so I'd be
> > tempted to convert everything at once for consistency. If you're fine
> > with that, I can give this a try. =20
>=20
> Well depends on what everything means. I would only convert dma-buf.c in =
one patch and nothing else.

By everything I mean all type of locks, not just dma_resv ones.

