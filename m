Return-Path: <linux-media+bounces-60586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNi0IdY0+2nfXgMAu9opvQ
	(envelope-from <linux-media+bounces-60586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:32:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E1B4DA3C2
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C9EE3062960
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4574444A71D;
	Wed,  6 May 2026 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="k882CJdw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF829898B;
	Wed,  6 May 2026 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070550; cv=pass; b=WRgDTk74ATps26MZdYCVVnr/nwO+DFKJ9/zp73GD1hbhvVM+scXfpl9/3ocbswoEV8hyv5GUKeibtZNEzj4RhQ2prqYoAdccWXn9o9uJ96Bi7y1PpauKNu+bwrykETILmI6OUR4QgiY7PNu+6KIUhStp4LNVrQD5M6hVXMzeKfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070550; c=relaxed/simple;
	bh=HGExhX3Nx3Hp6N/5gPRanTy0Gj9lfvUuyY7S/dUhkzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTPCzh3q8PbICVG+Y/TlH8YSsE2elXN54f4oLdMfkHhcEfBsxiKor08df65g2arawrmdm6Hkl3gWwUN+qFjSpkmHQgMo+q3VR1BSmy19PFAE6j+Yvf8sTtJs+CF1kOGOBKVJwn8drLJfUf/gDeJew4u6VFXWU7PsKcG5z49/Yac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=k882CJdw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778070520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l+02Y4nt08vYzf5RfTPLfhMaq12SDRw85bPfEuZHxOr5YVrMaQZLuc7Lo8S2aaGJWmg4Wr9OHf+c7qgKyq+aY6exi+0KdewDgnh6LxVv43HOUsg7UHTlg4u2zNT0UtwL57XSActJj/6N1oLNIy2bZMApQ/YfoVcyI04WTGzZPTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778070520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VgWsD25kUgi7nesCpzRJxHdsGO1uPq3DzCM9dWMbCnY=; 
	b=HQNxPwXIA1b5XRlyV4Fj/cH08jploj5YB2ii5SNPVNOyU2ksrOHr/fEYzdHanVvvS1T7xHbjwErKKqJYipOYITLIPwJZAiijJIdVtsAINS0M6oP0wbm/C9DhKXCJ3TJc8BEOxleUXDQMdpyTapbIORalSUBId95YhANS5Ry8v/o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778070520;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=VgWsD25kUgi7nesCpzRJxHdsGO1uPq3DzCM9dWMbCnY=;
	b=k882CJdwPQxQF3guIG+q9PvT1FBxyho4i23SDEJs7wlNvjAq4wyHBJUif/xXtOyR
	K3DmZSVO8cl25g6F+xDm0wuNzzB4V2YQ0v/BuH9fV7nuR/4qV3xhkEwfwsmoMWb9+hV
	2KY3rMN0B23mHSTvh6Qc2nGubnliwugLIdJTw+Bw=
Received: by mx.zohomail.com with SMTPS id 17780705193392.3676128759162793;
	Wed, 6 May 2026 05:28:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject:
 Re: [PATCH 4/8] drm/panthor: Add support for protected memory allocation in
 panthor
Date: Wed, 06 May 2026 14:28:31 +0200
Message-ID: <2eMYrGP5StSgdRAYKcS0Lw@collabora.com>
In-Reply-To: <20260505140516.1372388-5-ketil.johnsen@arm.com>
References:
 <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: E0E1B4DA3C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60586-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]

Thanks for sending this series! A few quick notes in-line.

On Tuesday, 5 May 2026 16:05:10 Central European Summer Time Ketil Johnsen =
wrote:
> From: Florent Tomasin <florent.tomasin@arm.com>
>=20
> This patch allows Panthor to allocate buffer objects from a
> protected heap. The Panthor driver should be seen as a consumer
> of the heap and not an exporter.
>=20
> Protected memory buffers needed by the Panthor driver:
> - On CSF FW load, the Panthor driver must allocate a protected
>   buffer object to hold data to use by the FW when in protected
>   mode. This protected buffer object is owned by the device
>   and does not belong to a process.
> - On CSG creation, the Panthor driver must allocate a protected
>   suspend buffer object for the FW to store data when suspending
>   the CSG while in protected mode. The kernel owns this allocation
>   and does not allow user space mapping. The format of the data
>   in this buffer is only known by the FW and does not need to be
>   shared with other entities.
>=20
> The driver will retrieve the protected heap using the name of the
> heap provided to the driver as module parameter.
>=20
> If the heap is not yet available, the panthor driver will defer
> the probe until created. It is an integration error to provide
> a heap name that does not exist or is never created.
>=20
> Panthor is calling the DMA heap allocation function
> and obtains a DMA buffer from it. This buffer is then
> registered to GEM and imported.
>=20
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  Documentation/gpu/panthor.rst            | 47 +++++++++++++++
>  drivers/gpu/drm/panthor/Kconfig          |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c | 28 ++++++++-
>  drivers/gpu/drm/panthor/panthor_device.h |  6 ++
>  drivers/gpu/drm/panthor/panthor_fw.c     | 29 ++++++++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |  2 +
>  drivers/gpu/drm/panthor/panthor_gem.c    | 77 ++++++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_gem.h    | 16 ++++-
>  drivers/gpu/drm/panthor/panthor_heap.c   |  2 +
>  drivers/gpu/drm/panthor/panthor_sched.c  | 11 +++-
>  10 files changed, 208 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index 7a841741278fb..be20eadea6dd5 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -54,3 +54,50 @@ sync object arrays and heap chunks. Because they are a=
ll allocated and pinned
>  at creation time, only `panthor-resident-memory` is necessary to tell us=
 their
>  size. `panthor-active-memory` shows the size of kernel BO's associated w=
ith
>  VM's and groups currently being scheduled for execution by the GPU.
> +
> +Panthor Protected Memory Integration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Panthor requires the platform to provide a protected DMA HEAP.
> +This DMA heap must be identifiable via a string name.
> +The name is defined by the system integrator, it could be hard coded
> +in the heap driver, defined by a module parameter of the heap driver
> +or else.
> +
> +.. code-block:: none
> +
> +    User
> +        =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> +        |           Application       |
> +        =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=B2=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> +            |         |          |
> +            | DMA-BUF |          | Protected
> +            |         |          | Job Submission
> +    --------|---------|----------|---------
> +    Kernel  |         |          |
> +            |         |          |
> +            |         |  DMA-BUF |
> +    =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=
=94=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90
> +    | DMA PROTECTED HEAP  |=E2=97=84=E2=94=80=E2=94=80=E2=94=80| Panthor=
 |
> +    | (Vendor specific)   |    |         |
> +    =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=
=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98
> +            |                    |
> +    --------|--------------------|---------
> +    HW      |                    |
> +            |                    |
> +    =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90  =E2=94=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> +    | Trusted FW            |  |     |
> +    | Protected Memory      =E2=97=84=E2=94=80=E2=94=80=E2=96=BA GPU |
> +    =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> +
> +To configure Panthor to use the protected memory heap, pass the protecte=
d memory
> +heap string name as module parameter of the Panthor module.
> +
> +Example:
> +
> +    .. code-block:: shell
> +
> +        insmod panthor.ko protected_heap_name=3D=E2=80=9Cvendor_protecte=
d_heap"
> +
> +If `protected_heap_name` module parameter is not provided, Panthor will =
not support
> +protected job execution.
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kc=
onfig
> index 911e7f4810c39..fb0bad9a0fd2b 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -7,6 +7,7 @@ config DRM_PANTHOR
>  	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
>  	depends on MMU
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	select DMABUF_HEAPS
>  	select DRM_EXEC
>  	select DRM_GPUVM
>  	select DRM_SCHED
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index bc62a498a8a84..3a5cdfa99e5fe 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -5,7 +5,9 @@
>  /* Copyright 2025 ARM Limited. All rights reserved. */
> =20
>  #include <linux/clk.h>
> +#include <linux/dma-heap.h>
>  #include <linux/mm.h>
> +#include <linux/of.h>

Can be dropped, none of the added code in this file requires it.

>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -27,6 +29,10 @@
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> =20
> +MODULE_PARM_DESC(protected_heap_name, "DMA heap name, from which to allo=
cate protected buffers");
> +static char *protected_heap_name;
> +module_param(protected_heap_name, charp, 0444);
> +
>  static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  {
>  	BUILD_BUG_ON(GPU_COHERENCY_NONE !=3D DRM_PANTHOR_GPU_COHERENCY_NONE);
> @@ -127,6 +133,9 @@ void panthor_device_unplug(struct panthor_device *ptd=
ev)
>  	panthor_gpu_unplug(ptdev);
>  	panthor_pwr_unplug(ptdev);
> =20
> +	if (ptdev->protm.heap)
> +		dma_heap_put(ptdev->protm.heap);
> +
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
> =20
> @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
>  			return ret;
>  	}
> =20
> +	/* If a protected heap name is specified but not found, defer the probe=
 until created */
> +	if (protected_heap_name && strlen(protected_heap_name)) {
> +		ptdev->protm.heap =3D dma_heap_find(protected_heap_name);
> +		if (!ptdev->protm.heap) {
> +			drm_warn(&ptdev->base,
> +				 "Protected heap \'%s\' not (yet) available - deferring probe",
> +				 protected_heap_name);

The escaping of the single quotes here is redundant, and I think this
is better as a debug message rather than a drm_warn: probe deferral
is normal.

Though I'm wondering whether we're open-coding dependency handling here,
I guess there's no way for any core to order things for us because the
dependency is on a name and the name is from a driver-specific module
parameter, so there's no generic solution to this. This second paragraph
is just me ruminating though and not an actionable request for changes.

> +			ret =3D -EPROBE_DEFER;
> +			goto err_rpm_put;
> +		}
> +	}
> +
>  	ret =3D panthor_hw_init(ptdev);
>  	if (ret)
> -		goto err_rpm_put;
> +		goto err_dma_heap_put;
> =20
>  	ret =3D panthor_pwr_init(ptdev);
>  	if (ret)
> @@ -343,6 +364,11 @@ int panthor_device_init(struct panthor_device *ptdev)
> =20
>  err_rpm_put:
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
> +
> +err_dma_heap_put:
> +	if (ptdev->protm.heap)
> +		dma_heap_put(ptdev->protm.heap);
> +

This is ordered wrong. Getting the dma heap happens after getting rpm,
so the unwind should put the dma heap before putting rpm. Right now,
a failure of panthor_hw_init would leave rpm enabled.

As Boris already mentioned in his review though, using devres helpers
would get rid of this manual put on error or driver remove entirely,
which is preferable.

>  	return ret;
>  }
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 5cba272f9b4de..d51fec97fc5fa 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -7,6 +7,7 @@
>  #define __PANTHOR_DEVICE_H__
> =20
>  #include <linux/atomic.h>
> +#include <linux/dma-heap.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/pm_runtime.h>
> @@ -329,6 +330,11 @@ struct panthor_device {
>  		struct list_head node;
>  	} gems;
>  #endif
> +	/** @protm: Protected mode related data. */
> +	struct {
> +		/** @heap: Pointer to the protected heap */
> +		struct dma_heap *heap;
> +	} protm;
>  };
> =20
>  struct panthor_gpu_usage {
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panth=
or/panthor_fw.c
> index 0d07a133dc3af..1aba29b9779b6 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -500,6 +500,7 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_devic=
e *ptdev,
> =20
>  	mem =3D panthor_kernel_bo_create(ptdev, ptdev->fw->vm, SZ_8K,
>  				       DRM_PANTHOR_BO_NO_MMAP,
> +				       0,
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>  				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>  				       PANTHOR_VM_KERNEL_AUTO_VA,
> @@ -534,6 +535,26 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_devi=
ce *ptdev, size_t size)
>  {
>  	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
>  					DRM_PANTHOR_BO_NO_MMAP,
> +					0,
> +					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> +					PANTHOR_VM_KERNEL_AUTO_VA,
> +					"suspend_buf");

Looks like we're effectively renaming this from "FW suspend buffer"
to "suspend_buf", and calling the protm suspend buf "FW suspend buffer".

This seems a little confusing, to the point where the diff algorithm
also had a hard time. Naming comes down to a matter of taste, but I
want to make sure the rename was intentional here.

> +}
> +
> +/**
> + * panthor_fw_alloc_protm_suspend_buf_mem() - Allocate a protm suspend b=
uffer
> + * for a command stream group.
> + * @ptdev: Device.
> + * @size: Size of the protm suspend buffer.
> + *
> + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
> + */
> +struct panthor_kernel_bo *
> +panthor_fw_alloc_protm_suspend_buf_mem(struct panthor_device *ptdev, siz=
e_t size)
> +{
> +	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
> +					DRM_PANTHOR_BO_NO_MMAP,
> +					DRM_PANTHOR_KBO_PROTECTED_HEAP,
>  					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
>  					PANTHOR_VM_KERNEL_AUTO_VA,
>  					"FW suspend buffer");
> @@ -547,6 +568,7 @@ static int panthor_fw_load_section_entry(struct panth=
or_device *ptdev,
>  	ssize_t vm_pgsz =3D panthor_vm_page_size(ptdev->fw->vm);
>  	struct panthor_fw_binary_section_entry_hdr hdr;
>  	struct panthor_fw_section *section;
> +	u32 kbo_flags =3D 0;
>  	u32 section_size;
>  	u32 name_len;
>  	int ret;
> @@ -585,10 +607,13 @@ static int panthor_fw_load_section_entry(struct pan=
thor_device *ptdev,
>  		return -EINVAL;
>  	}
> =20
> -	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) {
> +	if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) && !ptdev->protm.heap)=
 {
>  		drm_warn(&ptdev->base,
>  			 "Firmware protected mode entry is not supported, ignoring");
>  		return 0;
> +	} else if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) && ptdev->protm=
=2Eheap) {
> +		drm_info(&ptdev->base, "Firmware protected mode entry supported");
> +		kbo_flags =3D DRM_PANTHOR_KBO_PROTECTED_HEAP;

Instead of the duplicated check in both branches of the condition,
nesting it may be less clunky:

if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) {
	if (!ptdev->protm.heap) {
		drm_warn(&ptdev->base,
		         "Firmware protected mode entry is not supported, ignoring");
		return 0;
	}

	drm_info(&ptdev->base, "Firmware protected mode entry supported");
	kbo_flags =3D DRM_PANTHOR_KBO_PROTECTED_HEAP;
}

That being said, we might want to rethink the warning/info entirely. If
it's normal behaviour for a platform to load this fw section, even if
the platform doesn't support protm, as I suspect is the case due to the
`return 0`, then the warning has always been a bit too noisy.

I think info level that also gives some identifier for what section was
ignored (e.g. fw offset start/end) would be fine. The other branch, i.e.
"Firmware protected mode entry supported", may be best something that
gets printed along with other details about what the GPU supports, so
that each protected section does not print this over and over. It feels
wrong to do it in panthor_hw_info_init since that's printing features of
the hardware rather than of panthor's configuration, so maybe just do it
in panthor_device_init after ptdev->protm.heap is non-NULL.

>  	}
> =20
>  	if (hdr.va.start =3D=3D CSF_MCU_SHARED_REGION_START &&
> @@ -653,7 +678,7 @@ static int panthor_fw_load_section_entry(struct panth=
or_device *ptdev,
> =20
>  		section->mem =3D panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
>  							section_size,
> -							DRM_PANTHOR_BO_NO_MMAP,
> +							DRM_PANTHOR_BO_NO_MMAP, kbo_flags,
>  							vm_map_flags, va, "FW section");
>  		if (IS_ERR(section->mem))
>  			return PTR_ERR(section->mem);
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panth=
or/panthor_fw.h
> index fbdc21469ba32..0cf3761abf789 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -509,6 +509,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_devic=
e *ptdev,
>  				 u32 *input_fw_va, u32 *output_fw_va);
>  struct panthor_kernel_bo *
>  panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t si=
ze);
> +struct panthor_kernel_bo *
> +panthor_fw_alloc_protm_suspend_buf_mem(struct panthor_device *ptdev, siz=
e_t size);
> =20
>  struct panthor_vm *panthor_fw_vm(struct panthor_device *ptdev);
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 13295d7a593df..08fe4a5e43817 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -20,12 +20,17 @@
>  #include <drm/drm_print.h>
>  #include <drm/panthor_drm.h>
> =20
> +#include <uapi/linux/dma-heap.h>
> +
>  #include "panthor_device.h"
>  #include "panthor_drv.h"
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_mmu.h"
> =20
> +MODULE_IMPORT_NS("DMA_BUF");
> +MODULE_IMPORT_NS("DMA_BUF_HEAP");
> +
>  void panthor_gem_init(struct panthor_device *ptdev)
>  {
>  	int err;
> @@ -466,7 +471,6 @@ static void panthor_gem_free_object(struct drm_gem_ob=
ject *obj)
>  	}
> =20
>  	drm_gem_object_release(obj);
> -

Unrelated whitespace change (though I do like it), don't know how we
handle "too small for its own commit but also function isn't touched
by anything else in this commit" type whitespace cleanups.

>  	kfree(bo);
>  	drm_gem_object_put(vm_root_gem);
>  }
> @@ -1026,6 +1030,7 @@ panthor_gem_create(struct drm_device *dev, size_t s=
ize, uint32_t flags,
>  	}
> =20
>  	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
> +

Unrelated whitespace change (though again, I do like it)

>  	return bo;
> =20
>  err_put:
> @@ -1033,6 +1038,54 @@ panthor_gem_create(struct drm_device *dev, size_t =
size, uint32_t flags,
>  	return ERR_PTR(ret);
>  }
> =20
> +static struct panthor_gem_object *
> +panthor_gem_create_protected(struct panthor_device *ptdev, size_t size,
> +			     uint32_t flags, struct panthor_vm *exclusive_vm,
> +			     u32 usage_flags)
> +{
> +	struct dma_buf *dma_bo =3D NULL;
> +	struct drm_gem_object *gem_obj;
> +	struct panthor_gem_object *bo;
> +	int ret;
> +
> +	if (!ptdev->protm.heap)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (flags !=3D DRM_PANTHOR_BO_NO_MMAP)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!exclusive_vm)
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_bo =3D dma_heap_buffer_alloc(ptdev->protm.heap, size, DMA_HEAP_VALI=
D_FD_FLAGS,
> +				       DMA_HEAP_VALID_HEAP_FLAGS);
> +	if (IS_ERR(dma_bo))
> +		return ERR_PTR(PTR_ERR(dma_bo));
> +
> +	gem_obj =3D drm_gem_prime_import(&ptdev->base, dma_bo);

I agree with Boris that putting the dma_buf here is the cleanest
solution.

Adding a cleanup.h DEFINE_FREE helper for dmabufs would be a longer-
term refactor with its own pros and cons, but would allow us to get
rid of the explicit put entirely by adorning the local with a __free
attribute.

> +	if (IS_ERR(gem_obj)) {
> +		ret =3D PTR_ERR(gem_obj);
> +		goto err_free_dma_bo;
> +	}
> +
> +	bo =3D to_panthor_bo(gem_obj);
> +	bo->flags =3D flags;
> +
> +	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
> +
> +	bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(exclusive_vm);
> +	drm_gem_object_get(bo->exclusive_vm_root_gem);
> +	bo->base.resv =3D bo->exclusive_vm_root_gem->resv;
> +
> +	return bo;
> +
> +err_free_dma_bo:
> +	if (dma_bo)
> +		dma_buf_put(dma_bo);
> +
> +	return ERR_PTR(ret);
> +}
> +
>  struct drm_gem_object *
>  panthor_gem_prime_import_sg_table(struct drm_device *dev,
>  				  struct dma_buf_attachment *attach,

Kind regards,
Nicolas Frattaroli



