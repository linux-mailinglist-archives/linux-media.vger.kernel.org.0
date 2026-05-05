Return-Path: <linux-media+bounces-60456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GtPDmUZ+mlYJQMAu9opvQ
	(envelope-from <linux-media+bounces-60456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:23:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B34D1318
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 041C8304003B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28F348BD27;
	Tue,  5 May 2026 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KfWjPNf2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D8248B386;
	Tue,  5 May 2026 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997736; cv=none; b=kRC/qFE2E7QrxE92gHDIGA6bxXzS73cUAwDRRTxO0mdwTmC1WyYnrJ+e5detZ+lQ4NDTdM/KKfsD6NJfhLP7GC4XAbuY27n3mUpFN9p+zKlt2tr/FgcQterMf7iso6AOMLc+LiDqBSDbHEDSPyqG7Tz9+vnjPz6T2MqwudMcsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997736; c=relaxed/simple;
	bh=SUR+3O1lNhQZ/N1PLeY059UENNuWQ5FFufY5GqMTbqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JwxyJ54CQ3N3nt/tTTPAmWcSoQzRw5DCbxV8058yBkuu6eLy1MYiCTbyhdbfUtLpZNgeURT2Jh9XCr4oQqyo1QLZkdr8ORxajlyXS41TBsq0mR8JRA9XCQ7T38gIea31pXYH8zDBpQ7izYNR6JAIyhJiD9dnpJXqGoRhco9uLc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KfWjPNf2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777997729;
	bh=SUR+3O1lNhQZ/N1PLeY059UENNuWQ5FFufY5GqMTbqM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KfWjPNf2Vd8prYBhzXFn8etK++Pm9GCWPubI34/slhjFtcgd9+/Xl9lDjpCAHS+qE
	 5oNfCL/mkG60BZ4hRXkzf4LnyZkHmVPXDfTGNx/+RV9/jB0SWBWA3tnEp9OFvInWtN
	 tHD6ju7vHygovVvqwwUa/w8QqLhAtyV66g7yFqRAm2WlU60RAJ/Y+/zDQfUGjKzhbi
	 BH9pSLk+SHqdllIzS2A6lTh2IAIzxNeMv341KiI9w/nTk/P9sMBZz/Tt9x3olpFrbC
	 JbpXgrSdt6FyuV6GpxXDcpGNMsjGc01/OHANbv4jC42fu7IaawJoZaAvGNTSHALHw9
	 e3ud267VmV1rw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87E9C17E131B;
	Tue,  5 May 2026 18:15:28 +0200 (CEST)
Date: Tue, 5 May 2026 18:15:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260505181523.49a3d85c@fedora>
In-Reply-To: <20260505140516.1372388-5-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D50B34D1318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60456-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Tue,  5 May 2026 16:05:10 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

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

Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
name is "" already?

> +		ptdev->protm.heap =3D dma_heap_find(protected_heap_name);
> +		if (!ptdev->protm.heap) {
> +			drm_warn(&ptdev->base,
> +				 "Protected heap \'%s\' not (yet) available - deferring probe",
> +				 protected_heap_name);
> +			ret =3D -EPROBE_DEFER;
> +			goto err_rpm_put;

If you move the heap retrieval before the rpm enablement, you can get
rid of this goto err_rpm_put.

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

Let's use drmm_add_action_or_reset() so we don't need this manual
dma_heap_put() here or in the panthor_device_unplug() path.

> +
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
.heap) {
> +		drm_info(&ptdev->base, "Firmware protected mode entry supported");
> +		kbo_flags =3D DRM_PANTHOR_KBO_PROTECTED_HEAP;
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
>  	kfree(bo);
>  	drm_gem_object_put(vm_root_gem);
>  }
> @@ -1026,6 +1030,7 @@ panthor_gem_create(struct drm_device *dev, size_t s=
ize, uint32_t flags,
>  	}
> =20
>  	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
> +
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

s/dma_bo/dmabuf/

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

You can call

	dma_buf_put(dma_bo);

here. If the prime_import worked, it should have acquired a ref on the
dmabuf, and if it failed, we want to drop the ref anyway.

> +	if (IS_ERR(gem_obj)) {
> +		ret =3D PTR_ERR(gem_obj);

		return PTR_ERR(gem_obj);

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

This error path can go away.

> +}
> +
>  struct drm_gem_object *
>  panthor_gem_prime_import_sg_table(struct drm_device *dev,
>  				  struct dma_buf_attachment *attach,
> @@ -1242,12 +1295,17 @@ void panthor_kernel_bo_destroy(struct panthor_ker=
nel_bo *bo)
>  {
>  	struct panthor_device *ptdev;
>  	struct panthor_vm *vm;
> +	struct dma_buf *dma_bo =3D NULL;
> =20
>  	if (IS_ERR_OR_NULL(bo))
>  		return;
> =20
>  	ptdev =3D container_of(bo->obj->dev, struct panthor_device, base);
>  	vm =3D bo->vm;
> +
> +	if (bo->flags & DRM_PANTHOR_KBO_PROTECTED_HEAP)
> +		dma_bo =3D bo->obj->import_attach->dmabuf;
> +
>  	panthor_kernel_bo_vunmap(bo);
> =20
>  	drm_WARN_ON(bo->obj->dev,
> @@ -1257,6 +1315,10 @@ void panthor_kernel_bo_destroy(struct panthor_kern=
el_bo *bo)
>  	if (vm =3D=3D panthor_fw_vm(ptdev))
>  		panthor_gem_unpin(to_panthor_bo(bo->obj));
>  	drm_gem_object_put(bo->obj);
> +
> +	if (dma_bo)
> +		dma_buf_put(dma_bo);

With panthor_gem_create_protected() tweaked as suggested, you don't
need this extra dma_buf_put(), and the dma_bo can go away.
> +
>  	panthor_vm_put(vm);
>  	kfree(bo);
>  }
> @@ -1267,6 +1329,7 @@ void panthor_kernel_bo_destroy(struct panthor_kerne=
l_bo *bo)
>   * @vm: VM to map the GEM to.
>   * @size: Size of the buffer object.
>   * @bo_flags: Combination of drm_panthor_bo_flags flags.
> + * @kbo_flags: Combination of drm_panthor_kbo_flags flags.
>   * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
>   * that are related to map operations).
>   * @gpu_va: GPU address assigned when mapping to the VM.
> @@ -1278,8 +1341,8 @@ void panthor_kernel_bo_destroy(struct panthor_kerne=
l_bo *bo)
>   */
>  struct panthor_kernel_bo *
>  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm=
 *vm,
> -			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va, const char *name)
> +			 size_t size, u32 bo_flags, u32 kbo_flags,

Rather than adding new flags and having to patch all current
panthor_kernel_bo_create() users as a result, I'd just add a
panthor_kernel_bo_create_protected() helper. If you want to share the
rest of the logic in panthor_kernel_bo_create(), just add a static
panthor_kernel_bo_create_from_gem() helper taking a panthor_gem_object,
and have panthor_kernel_bo_create[_protected]() call this internal
helper.

> +			 u32 vm_map_flags, u64 gpu_va, const char *name)
>  {
>  	struct panthor_kernel_bo *kbo;
>  	struct panthor_gem_object *bo;

