Return-Path: <linux-media+bounces-28108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C2A5E7A8
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 23:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD331899A05
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 22:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9194E1F0E38;
	Wed, 12 Mar 2025 22:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="X1P1GM19"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17611EFF99;
	Wed, 12 Mar 2025 22:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741819761; cv=none; b=FIZ14baUjk9K8L5SZX6KUkVVrEw6cek0eL2Ec/gtkeIGEq09vG9TbgxvodPz1s6J++E1JZUmcP9BKgDe3N0g2SxCiuxXOVlpKYPXc+QmIhkglw4+94+k38yDYtRnMs/O1Fk9AMpxiTnSECqP6WPZtmCp9r0HOQiwoP31u/Vlg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741819761; c=relaxed/simple;
	bh=pPq/VXHv++IEXzwXB4f3vjzeXmYfdC1A0rtrqx806t0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uqndgDHl01ZfnqWC6ptzwICZRqcZ5Gbf3xrtuSFx592gu7ZgqXMACYYk911T1bE54AS9TA61lJN5Mjes1tgbA1ZUhyYj4Yfs/CsFuLdLfPDt3Plxc5bEgdkdtw2Db4fgGrGMbQs2UMHHhO2E2fJhnZUIaMbQKcPEyQfg5vU/iLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=X1P1GM19; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B793541063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1741819758; bh=ofpb6WFWZpSwe4hGDS3zTfl8z/+FILydqU6HiuMXkXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X1P1GM19z5pRqGfYxNPtxoYTDCSnhdwb0HdmiOV6j8zBmhjk/imyzxwjBnc+nw/LK
	 mqZXdYNGgLaW4s2hfh1wPKcn/wOeIX7W9JXJ/BjQjUBvQZVaLHWGhdxguzlL3gTIRU
	 6yHeQLWWvF4mZXCMd3wdT7QwEH/jEFcx8shkkpj0q4cjdyUwQYknU8Vh33FxtwDbhj
	 zTmREBeEakhvWoZz/ji1bxps8Kb+Y1nIqU4xmiQve5f9R5WJ6QF2G2IvEDimDnNx4k
	 t+wu4MucBdNIVLPyvYa2gGDpw6CZ3naTxq77qBX7TjqfhGGbrh2OIFLsV9RsaWn144
	 dixlLUNZs08vw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B793541063;
	Wed, 12 Mar 2025 22:49:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4] Documentation: dma-buf: heaps: Add heap name
 definitions
In-Reply-To: <20250306135114.1943738-1-mripard@kernel.org>
References: <20250306135114.1943738-1-mripard@kernel.org>
Date: Wed, 12 Mar 2025 16:49:17 -0600
Message-ID: <877c4tlv9u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changes from v3:
>   - Add TJ RB
>   - Fix a few typos.
>
> Changes from v2:
>   - Remove exhaustive list of names for platforms, and just mention the
>     alternatives.
>   - Add MAINTAINERS entry
>
> Changes from v1:
>   - Add the mention that the cma / reserved heap is optional.
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 25 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  MAINTAINERS                                   |  1 +
>  3 files changed, 27 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst

I've applied this, thanks.

jon

