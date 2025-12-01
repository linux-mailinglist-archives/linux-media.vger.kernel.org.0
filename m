Return-Path: <linux-media+bounces-47984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B7C98209
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B22994E1FB1
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8B7333424;
	Mon,  1 Dec 2025 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sBbSHmzs"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088853321D9;
	Mon,  1 Dec 2025 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604417; cv=none; b=eg3pnslD3s/CrEO6oGCdSE6Hnok36s5Fjsd/boQb/AhLcMWEh5l80HYJJfOJXtoHzEeUMkPQ1yCjf8A2qaSe5nGgOB4UtTb7zyaS0sjhT6kGo4nUL5KoQcf33DTAhtpvVNqdbwHoGL8CulT8m5rgX5rw7jHCc3jtmtf6IuIeAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604417; c=relaxed/simple;
	bh=ZtbPB0Z9jBZIWmO3OTf4OrZtUZ7WN04pUFUQ93COB14=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gq8rt0krJmAHnjXuXngjwDKTdbK7V3Sk85SRHiBQq8in1h7tv8JKbjpuvNZMaXVip5rOy839PX27VPF1e+FcfQlVO+K12v1aA8k6HjWAmMO+iAVN6hlz2i5eCKQ2bleWxocYBYPvxo+VajJY5kF2HOviMLBEjunzlHS/7fo2Bj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sBbSHmzs; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKpND1qYnz9sSq;
	Mon,  1 Dec 2025 16:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764604412; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGqYb67ev6KtdX+YTXDxiPnVVJgPnz1zCF5EHXt4hqo=;
	b=sBbSHmzsi3wPuWYFAAsh7dTsB5/2BthPcSteomaBpjOOXqjRl4JVBPb/opZ+0TvekWfWh6
	kkrhVaI5rHlsptkCOOV1cEZ+1Vk+ont6Rbwmv+8a8aCIMhACUF9VPbT2CaCITeqRij/2/r
	oH2zKPUBjgeXVl0q3fmw/SMlM1xCI1nLQuAbHnv2USqCf+waiCIjoR+lAAn7YbTh6E0CON
	/sEKdCwDOW3RiLQr5wGRrqkI2ZosLT1xcI3/LP/R7DrfLIjoeJQ1PveMpvTCwtzC6ZEWew
	MSsck3FBtmzJ65blZyfmgt2caSH/5QIFj8wSQdMiEOTCnuVWVIHlwC/zRTJiWQ==
Message-ID: <247185f833edd075cd4aac8c39ac8ae5b5aabe07.camel@mailbox.org>
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add
 dma_fence_check_and_signal()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 16:53:25 +0100
In-Reply-To: <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
	 <20251201105011.19386-4-phasta@kernel.org>
	 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
	 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
	 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 1308e1c837b3c1f5430
X-MBO-RS-META: ijujsb3wwab53aghs3jk89kkrxiqj4um

On Mon, 2025-12-01 at 16:20 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 14:55, Philipp Stanner wrote:
> > On Mon, 2025-12-01 at 14:23 +0100, Christian K=C3=B6nig wrote:
> > > On 12/1/25 11:50, Philipp Stanner wrote:
> > > > The overwhelming majority of users of dma_fence signaling functions
> > > > don't care about whether the fence had already been signaled by som=
eone
> > > >=20
> >=20

[=E2=80=A6]

> > >=20
> > > > +{
> > > > +	unsigned long flags;
> > > > +	bool ret;
> > > > +
> > > > +	spin_lock_irqsave(fence->lock, flags);
> > > > +	ret =3D dma_fence_check_and_signal_locked(fence);
> > > > +	spin_unlock_irqrestore(fence->lock, flags);
> > >=20
> > > Could this use guard(fence->lock, flags) ?
> >=20
> > guard? You mean a lockdep guard? Do you have a pointer to someplace in
> > dma_fence who does what you mean / want?
>=20
> E.g. like guard(spinlock_irqsave)(&fence->lock);


Hmm, but why?
It's obvious to all readers that I do spin_unlock_irqrestore() here.
It's very simple code, lock, 1 line, unlock. What would the guard
improve?


P.

