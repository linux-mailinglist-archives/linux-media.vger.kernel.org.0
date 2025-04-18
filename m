Return-Path: <linux-media+bounces-30530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D378BA934A2
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C933189C9D6
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA2E26B2D6;
	Fri, 18 Apr 2025 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NR23A4/3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33FF25744D;
	Fri, 18 Apr 2025 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964817; cv=none; b=R9GLlp9I83q923AJ1oAxK/T5xEFqPYE4zmn36RnzYS6bUlQN7Nr8Lri0X2w8T7VOkiWL1G/ZECvMVUMMxndcuHYmRzUDiogr/9IvByEqKJiQYd3d5mXjGf6jT6RCb2n1lyEM5x7IZP0hsXTS8pyu7sZ8oECL9Cj8LtdrOmPw6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964817; c=relaxed/simple;
	bh=e3658IgZ8nOTRetGLbWCrC9hScdhNn7J2xOl2EFdMAk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfGvVCON7m6STrREHWX5jOdfD/uhihJkPP6UJBInYLm2AiNxrCds5/35XI0//0cEiMetsfncwFES1yoiNGKXlRH2FDrt9H69NKSuZs3MCqkhL0gTSIMIOFyJ/CKv65m8EiIrLX8FwPRguxwuoJoSrO5HddUu6PlxXs9ile2kjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NR23A4/3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744964813;
	bh=e3658IgZ8nOTRetGLbWCrC9hScdhNn7J2xOl2EFdMAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NR23A4/34J+WhMJ/VlGpByqJi03M1NBdFpU9qVyY+AhAynvsUF7jXUxmzIIc5e2pv
	 gxYojrrZc29HcVQydeAEPdKO6nc0n6L2Sz66A/OimLAtcc3YlG9nK0Ob+JjovsJFQ8
	 NFkxkMtRZgD3xMM4SUHfbZMFx3FQBXUK9ffj+fI3fcqD5QGNKKMEl/wds9Qj6ERF5a
	 f2stTSn/cyZ8uR7VpMoX8ZIbX6hi58QiK/JODzmj7gz615J4tp+N+dzjt2/yfzVe7Y
	 gjVs7fwfPgpYRffAgc32cxviYC3W2UyVxP3YV7bfi39Z+pTz24DTP1QTORG0c9OJaE
	 NhKoGD8kAABKQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 074DB17E10F7;
	Fri, 18 Apr 2025 10:26:52 +0200 (CEST)
Date: Fri, 18 Apr 2025 10:26:49 +0200
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
Message-ID: <20250418102649.41a609d6@collabora.com>
In-Reply-To: <20250418101156.0241a000@collabora.com>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
	<20250418022710.74749-5-adrian.larumbe@collabora.com>
	<20250418101156.0241a000@collabora.com>
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

On Fri, 18 Apr 2025 10:11:56 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 18 Apr 2025 03:27:07 +0100
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>=20
> > +	static const char * const gem_state_flags_names[] =3D {
> > +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] =3D "imported",

FYI, the compiler seems to be happy with:

		[ffs(PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED) - 1] =3D "imported",

but I'm not sure we want to fix it this way. The other
option would be to define bit pos in the enum and then
define flags according to these bit pos:

enum panthor_debugfs_gem_state_flags {
	PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT =3D 0,
	PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT =3D 1,

	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED: GEM BO is PRIME imported. */
	PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED =3D BIT(PANTHOR_DEBUGFS_GEM_STATE_=
IMPORTED_BIT),

	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED: GEM BO is PRIME exported. */
	PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED =3D BIT(PANTHOR_DEBUGFS_GEM_STATE_=
EXPORTED_BIT),
};

> > +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED] =3D "exported", =20
>=20
> Okay, I think I know where the flag indexing issue comes from:
> PANTHOR_DEBUGFS_GEM_STATE_FLAG_xx are flags, not bit positions, so we
> can't use them as indices here.
>=20
> > +	};
> > +
> > +	static const char * const gem_usage_flags_names[] =3D {
> > +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL] =3D "kernel",
> > +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED] =3D "fw-mapped", =20
>=20
> Same problem here.
>=20
> > +	};
> > + =20


