Return-Path: <linux-media+bounces-12143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F088D2E4A
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 09:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9B9AB24C6D
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 07:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFC61667CA;
	Wed, 29 May 2024 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BrZRV001"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8115CD6C;
	Wed, 29 May 2024 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716967942; cv=none; b=nNNbMOO22u/dUBVXdcn8+HlNbTw1aYbmIL60DGB6I3i1zYx5mZJSIsXIpZVm6yfVmsWmIey+LF3JjU2QOowBSEcibevqcvdVMkFZtb7c9TQjcQP9jY9zVJowmYXyZ6HAneK4S+OqqcYgY5El19+aEIB2YySoujuCznMg1BOgUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716967942; c=relaxed/simple;
	bh=cADutWs2Dsx1o9inKNPez5xFnY+sOuOUeUDqJ44drFk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDONJu1wkrfmtMV1xYr9zuk7MlnNxHFIEyrNZfG0QQGn6uQSk4jlVSYzDMUIZTCEeUxIOJbeTDTay1xxcymskNePcvyiiA4FrvLP4yWnti5Uc5tm/Usbqb1B+LBrJElqaVM96xHhlQDQbqz0ReiXT77GkC0hMYRTQbkKqqbaCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BrZRV001; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716967939;
	bh=cADutWs2Dsx1o9inKNPez5xFnY+sOuOUeUDqJ44drFk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BrZRV001CJRtCqhATXy9C/FXVikr+5BdllJGZ2rStBbfQk7E4RecsGhHyLUYYTaIX
	 DdX1+wJBWQFYV5tjrx9nrd9tQQJymjFfZSy6VjmJioLWGMpiRHvVXQcCdNqEjHg2nc
	 5Ofxh4snXgHT9f0visanV+QcHJiyJBN05ySKzTc3bXeWPSMtlxnPKH6PZ80J06d8dh
	 S9WP60/wwTTEDRUGmWqBV3OvWMlJ/QKPqS3N9XUPm0tVd+j32q0IXhPWDAzVjl0jg6
	 RjMI6caeXqeU15q9tG1E37Yw3kWZXMAASFBGSEMNh/yZchKQ5k8TQK7AdofrfG5BSK
	 Nino7JsVpA7dA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0DFB63780627;
	Wed, 29 May 2024 07:32:18 +0000 (UTC)
Date: Wed, 29 May 2024 09:32:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 0/3] drm: Fix dma_resv deadlock at drm object pin
 time
Message-ID: <20240529093216.6640d05d@collabora.com>
In-Reply-To: <20240523113236.432585-1-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 May 2024 12:32:16 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This is v4 of https://lore.kernel.org/lkml/20240521181817.097af5e1@collab=
ora.com/T/
>=20
> The goal of this patch series is fixing a deadlock upon locking the dma r=
eservation
> of a DRM gem object when pinning it, at a prime import operation.
>=20
> Changelog:
> v3:
>  - Split driver fixes into separate commits for Panfrost and Lima
>  - Make drivers call drm_gem_shmem_pin_locked instead of drm_gem_shmem_ob=
ject_pin
>  - Improved commit message for first patch to explain why dma resv lockin=
g in the=20
>  pin callback is no longer necessary.
> v2:
>  - Removed comment explaining reason why an already-locked
> pin function replaced the locked variant inside Panfrost's
> object pin callback.
>  - Moved already-assigned attachment warning into generic
> already-locked gem object pin function
>=20
>=20
> Adri=C3=A1n Larumbe (3):
>   drm/panfrost: Fix dma_resv deadlock at drm object pin time
>   drm/lima: Fix dma_resv deadlock at drm object pin time
>   drm/gem-shmem: Add import attachment warning to locked pin function

Queued to drm-misc-fixes.

Thanks!

Boris

