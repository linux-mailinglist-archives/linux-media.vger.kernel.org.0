Return-Path: <linux-media+bounces-30529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D444A93435
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C93F93B6E6C
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479FB26B090;
	Fri, 18 Apr 2025 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G2ZztimW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72B26A1DA;
	Fri, 18 Apr 2025 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963923; cv=none; b=h7aCSRdWeihRwvzWiJ3CFPQN4jUUrNTcAjGa55SY8U/O8r0TRCg7bQl8zXp5ARmuNJ2C3FyQkucXA0saHtSwlK8TIw/vrK5R3AQ/1I+nWmWINMP6+c7NIfYuW4wS0m62FP1TNl3zaacjhisqyA1qEHje9aZjSLw9GlRJbjrALBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963923; c=relaxed/simple;
	bh=KJOdSCbBYjdAocBY8yGze1LvEiWZHViM/MTYycy4oWA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBIzGa13UjfEarb/cPhdj8NArab9Uq+o0yM4L/WefQN88Hc6VUENwOLmNHEjqv4gzG8KamnUQMHxYoqHpeRrCO8ogZaideu86UevQ7Uf0Y/ttdS9oTIgrXrBYR6jo8GWKmvOuoq3WYjPgKzzKIx3ij94M3QcVpLHRtyN77zzyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G2ZztimW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744963919;
	bh=KJOdSCbBYjdAocBY8yGze1LvEiWZHViM/MTYycy4oWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G2ZztimWD7bYj//E75dWBXxjaXFMiaTTPrVFg9+sWNmWRwGxpjDrjCryN3L0hXhW0
	 Qv/A0WqMCE7tEC0rdj3xe+NvxnPSO7531w29Uwt6kZueGBmeCYfJBb6BHAkvQfMMcU
	 Mvjl+DH4wtzR05W41l/FKEICw69rh4r3J77Q8kTFVv3zypShFwG6AQ51NLYfMUz0DV
	 Bt5wvO8UK/NwCL6hZm0gT5fbA4sfolH68zaFUN7kjvof8RzDTY7k0MWcMzDHVWjBOq
	 xtnGi5PjKb/wgTfwAT5rz5fS9VVJY7cz56nHHOJ0e1GwK6xO/NJ7cUx898XSc5ib6W
	 mHD3uGh2XpI5w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5870C17E03C8;
	Fri, 18 Apr 2025 10:11:59 +0200 (CEST)
Date: Fri, 18 Apr 2025 10:11:56 +0200
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
Subject: Re: [PATCH v9 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250418101156.0241a000@collabora.com>
In-Reply-To: <20250418022710.74749-5-adrian.larumbe@collabora.com>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
	<20250418022710.74749-5-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Apr 2025 03:27:07 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +	static const char * const gem_state_flags_names[] =3D {
> +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] =3D "imported",
> +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED] =3D "exported",

Okay, I think I know where the flag indexing issue comes from:
PANTHOR_DEBUGFS_GEM_STATE_FLAG_xx are flags, not bit positions, so we
can't use them as indices here.

> +	};
> +
> +	static const char * const gem_usage_flags_names[] =3D {
> +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL] =3D "kernel",
> +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED] =3D "fw-mapped",

Same problem here.

> +	};
> +

