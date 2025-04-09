Return-Path: <linux-media+bounces-29720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD2A81F63
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30CED887AC7
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1B825B66A;
	Wed,  9 Apr 2025 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XiXNnRIX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388932405FD;
	Wed,  9 Apr 2025 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185915; cv=none; b=jeOErdikrAxlieY2Lxn3fSztaF4gToHEA7m2yAvBCBAbsrmiBjlk+jK24dfRaYoVlH/+edPpefG8rFEcwjrFY5rjPi+a/R0LgY2PJDRNHvCamxlKLGFyj9ols1rMSJF3vfevuYqp4Rp13uovkUDIuphj/AaUvhLuAxTXb7Uev9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185915; c=relaxed/simple;
	bh=GX89WpulnCn9iyOCjfe2i+8YedETrjUlUWYiE6fb4mE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/9gSU6n82PCoch0nlEf6iYVa3W6f6A7KyDrasZQFnIngxKvCopVyGIYCY3/vUBdjbUyTVf0YLHbMMBSUdZKbFdiHpMLoMxBW0pRYgSYz3Q4f6gNVsqX0C1cL2ThvGeNW6qPsX1uxt4XMVL1G3Sxr/GjleMURpVneVVMi7xrtKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XiXNnRIX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744185911;
	bh=GX89WpulnCn9iyOCjfe2i+8YedETrjUlUWYiE6fb4mE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XiXNnRIXqaOCR6ZRVD5I/OR9XqMMxnFa1L7JmwC2309kj/FAowTnV+Qmg0GD71VFc
	 nLg+sAket30nwFyHr782FE5laBy3NGrzfXP5ck0HS5MQQd/5KMBRpbpilXWqU8OqMY
	 5TnkKyPNEJmRUcW8FLsIVuLBYT/6hCBpV4EuV2wUkDuxJAL0dLfEmuOGqYXjWv0wk7
	 py4FGzm/b/mZM8gtzn6/5u3+dzNUl7GSy1t4D2wrtA0X79cYrjXoT7E4UzQb9e/PAc
	 +35+cFymTzt28UoeAJTbTsVy3mQLmrDnPe2INNXlry5JDVzQUTIfH9As/Sy9WdX9Jd
	 uGtL2agUqQPOA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B443A17E07F3;
	Wed,  9 Apr 2025 10:05:10 +0200 (CEST)
Date: Wed, 9 Apr 2025 10:05:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 3/4] drm/panthor: Label all kernel BO's
Message-ID: <20250409100507.45446b75@collabora.com>
In-Reply-To: <20250408222427.1214330-4-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
	<20250408222427.1214330-4-adrian.larumbe@collabora.com>
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

On Tue,  8 Apr 2025 23:24:23 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Kernel BO's aren't exposed to UM, so labelling them is the responsibility
> of the driver itself. This kind of tagging will prove useful in further
> commits when want to expose these objects through DebugFS.
>=20
> Expand panthor_kernel_bo_create() interface to take a NULL-terminated
> string. No bounds checking is done because all label strings are given
> as statically-allocated literals, but if a more complex kernel BO naming
> scheme with explicit memory allocation and formatting was desired in the
> future, this would have to change.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Just one modification suggested on a label, but this looks good
otherwise

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 8 +++++---
>  drivers/gpu/drm/panthor/panthor_gem.c   | 4 +++-
>  drivers/gpu/drm/panthor/panthor_gem.h   | 2 +-
>  drivers/gpu/drm/panthor/panthor_heap.c  | 6 ++++--
>  drivers/gpu/drm/panthor/panthor_sched.c | 9 ++++++---
>  5 files changed, 19 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 1a276db095ff..432a8993a0cb 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3334,7 +3334,8 @@ group_create_queue(struct panthor_group *group,
>  						  DRM_PANTHOR_BO_NO_MMAP,
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> -						  PANTHOR_VM_KERNEL_AUTO_VA);
> +						  PANTHOR_VM_KERNEL_AUTO_VA,
> +						  "Ring buffer");

						  "CS ring buffer"

>  	if (IS_ERR(queue->ringbuf)) {
>  		ret =3D PTR_ERR(queue->ringbuf);
>  		goto err_free_queue;

