Return-Path: <linux-media+bounces-18972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24B98CF50
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3DAF286A36
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C8B197A66;
	Wed,  2 Oct 2024 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xr+Xr1ko"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1F567D;
	Wed,  2 Oct 2024 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859445; cv=none; b=UHD3lVzZVddcF19rZAFheT64H/j9B34BuJX51wrt95CSw/8qJl/2InizcaU0PAipe1hMTz67k1v1g+O+Hp/7r7e1P3QL5iO/Q6lwFrLU276p0U3v+E7VkK6mO5cg8cz3tCX+SXULzMungvrKeZebaJzu3pROUtL6kWdsXOI57CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859445; c=relaxed/simple;
	bh=x3Va4L+CCjiLs3cqAMzBwjCH5cIBQHZcmS7FtUCH1CI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKd2X7JKt+ABsdzElFM3C0Yz4h8VJUO6c3Yhkj7KgtYJa4pQuxAqBgo0RjSfk7dmR+dr2IsFP4auFf2o4KcjBQLK0y2ynoQODYTsTNKspyh1dkSG+or2DG4gldqR4DZEeSG8extNmdkkAYlBskph4K2GEjREIMsq7qCPh7FMpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xr+Xr1ko; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727859442;
	bh=x3Va4L+CCjiLs3cqAMzBwjCH5cIBQHZcmS7FtUCH1CI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xr+Xr1kow8fYPsMeVKUbGEP9uaZcLvoFl0wTZvBbDI9sFeDHYkmv/n15FuB5WOAv/
	 2U0gRfvcaaZWikBNucZ7Cy0BVNd6A9u/TpmohkUG2vA2kRPq+XMWCBmzLo7qPdO5Io
	 EHvCLuO6EuVx9Ll8OZTxwAEyTadV8Nciqgs+4GV+NzoHJd/B5UULygZIAOdZVTs8oH
	 uWIzq+C1YHaQHkD1THu6Pr/gW/vHsR4hJS4C9ULeD5uDkaZEkC6Kvjngp8bVA9Up9C
	 6P3HgpjL+o+UX/xZ3tHBSOTZXjrtlWXRxXkjP2EZUw2ekd5pp16OIqF0Ct84kLTIOj
	 5GWaafSKF+Fdw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66C8E17E10AC;
	Wed,  2 Oct 2024 10:57:21 +0200 (CEST)
Date: Wed, 2 Oct 2024 10:57:15 +0200
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
Subject: Re: [PATCH v8 0/5] Support fdinfo runtime and memory stats on
 Panthor
Message-ID: <20241002105715.18ec024c@collabora.com>
In-Reply-To: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
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

On Tue, 24 Sep 2024 00:06:20 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This patch series enables userspace utilities like gputop and nvtop to qu=
ery a
> render context's fdinfo file and figure out rates of engine and memory ut=
ilisation.
>=20
> Previous discussion can be found at
> https://lore.kernel.org/dri-devel/20240920234436.207563-1-adrian.larumbe@=
collabora.com/
>=20
> Changelog:
> v8:
>  - Fixed uninitialised stack variable bug that was triggering an invalid =
memory reference.
>  - Added a few R-b tags to commits
> v7:
>  - Fixed some kernel test bot-reported documentation and sign mismatch er=
rors.
>  - Defined convenience macros for specifying CS instructions according to=
 their profiled status.
>  - Explicitly initialised instruction count for structure containing a jo=
b's
>  instructions when calculating its amount of credits for the scheduler.
>  - Some minor cosmetic nits.=20
> v6:
>  - Addressed some nits and style issues.
>  - Enforced static assert equality of instruction buffer when calculating=
 job
>  credits or copying them into the ringbuffer.
>  - Added explanation to the way in which job credits and profiled job siz=
e is done.
>  - Broke down fdinfo enablement patch into two, one of them dealing with =
adding
>  support for calculating the current and top operating device frequencies
>  - Fixed race at the time drm file-wide profiling stats are gathered from=
 groups.
> v5:
>  - Moved profiling information slots into a per-queue BO and away from sy=
ncobjs.
>  - Decide on size of profiling slots BO from size of CS for minimal profi=
led job
>  - Turn job and device profiling flag into a bit mask so that individual =
metrics
>  can be enabled separately.
>  - Shrunk ringbuffer slot size to that of a cache line.
>  - Track profiling slot indeces separately from the job's queue ringbuffe=
r's
>  - Emit CS instructions one by one and tag them depending on profiling ma=
sk
>  - New helper for calculating job credits depending on profiling flags
>  - Add Documentation file for sysfs profiling knob
>  - fdinfo will only show engines or cycles tags if these are respectively=
 enabled.
> v4:
>  - Fixed wrong assignment location for frequency values in Panthor's devf=
req
>  - Removed the last two commits about registering size of internal BO's
>  - Rearranged patch series so that sysfs knob is done last and all the pr=
evious
>  time sampling and fdinfo show dependencies are already in place
> v3:
>  - Fixed some nits and removed useless bounds check in panthor_sched.c
>  - Added support for sysfs profiling knob and optional job accounting
>  - Added new patches for calculating size of internal BO's
> v2:
>  - Split original first patch in two, one for FW CS cycle and timestamp
>  calculations and job accounting memory management, and a second one
>  that enables fdinfo.
>  - Moved NUM_INSTRS_PER_SLOT to the file prelude
>  - Removed nelem variable from the group's struct definition.
>  - Precompute size of group's syncobj BO to avoid code duplication.
>  - Some minor nits.
>=20
> Adri=C3=A1n Larumbe (5):
>   drm/panthor: introduce job cycle and timestamp accounting
>   drm/panthor: record current and maximum device clock frequencies
>   drm/panthor: add DRM fdinfo support
>   drm/panthor: enable fdinfo for memory stats
>   drm/panthor: add sysfs knob for enabling job profiling

Queued to drm-misc-next after applying the few modifications I
mentioned. Also added Steve's ack (given on IRC) on the first patch.

>=20
>  .../testing/sysfs-driver-panthor-profiling    |  10 +
>  Documentation/gpu/panthor.rst                 |  46 +++
>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  18 +-
>  drivers/gpu/drm/panthor/panthor_device.h      |  36 ++
>  drivers/gpu/drm/panthor/panthor_drv.c         |  73 ++++
>  drivers/gpu/drm/panthor/panthor_gem.c         |  12 +
>  drivers/gpu/drm/panthor/panthor_sched.c       | 384 +++++++++++++++---
>  drivers/gpu/drm/panthor/panthor_sched.h       |   2 +
>  8 files changed, 531 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profil=
ing
>  create mode 100644 Documentation/gpu/panthor.rst
>=20


