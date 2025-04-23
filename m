Return-Path: <linux-media+bounces-30784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9CA983D1
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 10:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D9A3A7535
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 08:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5244A274674;
	Wed, 23 Apr 2025 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CGPEKNRX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E0265CBC;
	Wed, 23 Apr 2025 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397268; cv=none; b=rjrIu8Tj+Z43mwjkk3zeV6zj65hxMYGAftyYiaNaLDV+ZnteF8XIVpDRKaluKv/NkeRfS5KThaQdwor1isIVjd0638vdIutULPAQqv01BD80YDg3ExlhNvzBA0+RMky8jmMTSev+qP6y9rinuGpXPiBE+tKZfYQLw7O4tUYqXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397268; c=relaxed/simple;
	bh=yNcym9AB15nC9Tu7sEWtC7GM04KbMiS2dWyXXltgH3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9QoOqqBX5UU/3JaKGOolYsasnwblDFHEVabBoccWOhnD062WFDo9pI47bvvI6uB8TyTxL9sFWyWQqZWB/Hp7JeCrGdPVO1bF4PqRkqQvIiRKK4rBuOiCv+F5hudeNFSDDh85Xmja/t7OKSXvGiswWCUwzIyDnuYIhBBGHwPGo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CGPEKNRX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745397264;
	bh=yNcym9AB15nC9Tu7sEWtC7GM04KbMiS2dWyXXltgH3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CGPEKNRXsbehCZXs4NA5cZw4zmzXv5MuCy41cXQLI4yxUFDSRlSKQWwswuc2GDOQV
	 1n0Sxo6wDzxQo0iczXrCIF8xxvv2KgBiFG3vswfMl5M0PmKwRWEZtd+hCCX6C9Rxgc
	 L0Gzt546S+u3LZ9h2EY8+cLmFz6h6ZSTgR34BgbkyC+vYuWByLixZ47GvM+m9M6MSc
	 xNfNlmkQ76VU7Ho8SE9S6+z4H0Ata/0FJzixfCHlPU4eWcgSlkOmkTGUeCQAIs6N41
	 kGQOPv3ca8St1RgcVjr3QJDZ8dCl+tkQHMjqIc/xZXu3mzdZOjK3a4mVJS/L1YuVYp
	 OchThd/qjHByw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF55617E03B6;
	Wed, 23 Apr 2025 10:34:23 +0200 (CEST)
Date: Wed, 23 Apr 2025 10:34:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v10 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250423103419.587a88f9@collabora.com>
In-Reply-To: <20250423090149.2748ef62@collabora.com>
References: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
	<20250423021238.1639175-5-adrian.larumbe@collabora.com>
	<20250423090149.2748ef62@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 09:01:49 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > +
> > +enum panthor_debugfs_gem_usage_flags {
> > +	PANTHOR_DEBUGFS_GEM_USAGE_KERNEL_BIT = 0,
> > +	PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT = 1,  
> 
> Now that you print the flags as raw hex values, you don't need those
> _BIT definitions.

My bad, I didn't notice you were still printing flag names as a legend.

