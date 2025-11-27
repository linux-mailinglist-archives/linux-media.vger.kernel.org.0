Return-Path: <linux-media+bounces-47834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B1EC8F518
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 16:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3AA25349A35
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 15:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA5326FD9B;
	Thu, 27 Nov 2025 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rJBnWCwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF49335BA5;
	Thu, 27 Nov 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258226; cv=none; b=GDsEBvpyZVwiNtuBrmC+6NSjiPmDTZwJ9JB/Solgq1uLWzWQZi0zib+2Ah33CUKqMuUGGK0z7tyTfUazEp6wqxgELI/hXt7oLnO6/Ulbwr8kjMpl104R6tqDAUnVrSUKb3jySMWgbwVHR/VHgbyWTaix74smoYECr1Bnd/ng6yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258226; c=relaxed/simple;
	bh=jXFPSJgBYsVS5gOmaPK7dUS8w7V4vohE+/bJbW58hlg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L3sDg1FRoVd7uvUQcTjzby1v9iJDQYucVnUdKQfZlr/my/lstDszluZZoil+b7y+jgSjbjcABVsaskKjwoolEVWzNTvq3TF3+hyht0FB+viJKN+5FCWns41CVy/P0EshQISSPjL5tmTrB8evpVNryGKVobe/7l/v67OOwBusi84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rJBnWCwd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dHLLg5Mnxz9v0b;
	Thu, 27 Nov 2025 16:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764258219; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8BebGp6817BarcOhYkOTFKpNtGZhH0Hzg/x4d8jTPI=;
	b=rJBnWCwdjqhyXax+vj9jEdfvvNHmHBKxf4Vx01UM2VZR/M8uhzUla8075dSW3u3MUThOFq
	UWPLNvuVWnYgUi3hZGxb/HuABbU5m8EYXT11ECG736HnrLFHM9gj58Y2/oMWek3lAugwCc
	UlPh9rJ1VYSTVlC5FfoNsxxDV43GeHaJGexjJpfdR6vz0zxTn096zYv3GisOcvElyWLmZ/
	5xd4OUXnH6yJXZ9MpWXgXBMU6Sy9EMyG7fCbspCKodX1QSuQ/Isi+unePiiija3oVnnr/e
	bpgsIo8xtw8Q2BsyLHjNH7xFDCju7gwS1rE468ebDHd3/vbbZo4wBsxwOz8XRg==
Message-ID: <5c69f4849cb3d9dc087c303a33ba385925e126eb.camel@mailbox.org>
Subject: Re: [PATCH 2/6] amd/amdkfd: Ignore return code of dma_fence_signal()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: "Kuehling, Felix" <felix.kuehling@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, phasta@kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Date: Thu, 27 Nov 2025 16:43:28 +0100
In-Reply-To: <39263b3b-3574-43ae-aec1-73fe39e29f10@amd.com>
References: <20251126131914.149445-2-phasta@kernel.org>
	 <20251126131914.149445-4-phasta@kernel.org>
	 <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
	 <d46f753e660694ab46c65409a5e43f050b7eb2d9.camel@mailbox.org>
	 <b1c3dd51-1ba9-4036-b964-8e9f4350bbee@amd.com>
	 <39263b3b-3574-43ae-aec1-73fe39e29f10@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: guh68fw61fno75gu3xahdopeu8c9fbtb
X-MBO-RS-ID: ca2c12074ac69eba2f0

On Thu, 2025-11-27 at 10:08 -0500, Kuehling, Felix wrote:
> On 2025-11-27 04:55, Christian K=C3=B6nig wrote:
> > On 11/27/25 10:48, Philipp Stanner wrote:
> > >=20

[=E2=80=A6]

> > > The issue now is that dma_fence_signal()'s return code is actually no=
n-
> > > racy, because check + bit-set are protected by lock.
> > >=20
> > > Christian's new spinlock series would add a lock function for fences:
> > > https://lore.kernel.org/dri-devel/20251113145332.16805-5-christian.ko=
enig@amd.com/
> > >=20
> > >=20
> > > So I suppose this should work:
> > >=20
> > > dma_fence_lock_irqsave(ef, flags);
> > > if (dma_fence_test_signaled_flag(ef)) {
> > > 	dma_fence_unlock_irqrestore(ef, flags);
> > > 	return true;
> > > }
> > > dma_fence_signal_locked(ef);
> > > dma_fence_unlock_irqrestore(ef, flags);
> > >=20
> > > return false;
> > >=20
> > >=20
> > > + some cosmetic adjustments for the boolean of course.
> > >=20
> > >=20
> > > Would that fly and be reasonable? @Felix, Christian.
> > I was just about to reply with the same idea when your mail arrived.
>=20
> I agree as well. The important feature is that we need to test and=20
> signal the fence atomically. It may even make sense to add a function
> for that "dma_fence_test_and_signal" that preserves the original=20
> behaviour of dma_fence_signal. ;)

Fine by me if the maintainer agrees

P.

