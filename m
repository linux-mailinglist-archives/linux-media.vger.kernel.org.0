Return-Path: <linux-media+bounces-45009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADCBF0331
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 11:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E168A4F102D
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B282EACE9;
	Mon, 20 Oct 2025 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDpT+Neb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8401238171
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952913; cv=none; b=jD0xyqCOydcBqbsbjyNn6Dhd2H329IxdsZZyX+ZcGgr97iggSNM7XBecL4koIxB488SxYXYu6Nzz5pDUsfzyxCq9E+HTqUeDg6VdtLLfjhPtkrVjJKNygX3KXzlWX926RUH9jUYqN0exXDhoWrnOwfti++JrefaJFqjiFl0WDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952913; c=relaxed/simple;
	bh=ZlAhWnMzThFErNs6nj61N00dMsX9TgSzAylKsKkopb0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u/6PQuQWG4xq8w8GltSw+zqTKryNhHBfDNFcwDZEs45PD35Bgj5p/wqI41oGpH9zC232BqQfoXcolpXyVWpwhPWn/P1OZsPvZYUii44Xl0RRT0ejAiqtJJlI9d8FkSYB+tuiQ6No3xJ0HfCxGI/n3sSg+GhXTZQpUwmOF3kgALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDpT+Neb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760952911; x=1792488911;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ZlAhWnMzThFErNs6nj61N00dMsX9TgSzAylKsKkopb0=;
  b=HDpT+NebncV9tYkbD/ACbFf9hJQPgFamp+3IwVWjHj13vZQ7vUAW4AwV
   TwaszsJtFchBbcT3+KLR2DgwSh+Ml6EpMeHuUDOXkrjvfy8pa3/XThncf
   2iPPeMx2IM1SFk2Q2XzwqJkGxC9UqqrrouSj9XZBzJR6kHfx5EuoP7n3s
   BPJqsMLEUvUiAZgRjfi58PLWNy42+5q/6PFttJ5mVTNuEVqhlvflm/dk6
   /zZP+u8Y8rfHKeb9I7VSbV9srWFTpuHBoq7NmKBadMBAq3C1oi6nQjQpc
   zgh5ywmPbNNo9XjP1NeeYGqP//iJU8p7nDb+5bGawl7023RHKAm9hTi5L
   Q==;
X-CSE-ConnectionGUID: LWjfLzoXSqir6IvOpV//QA==
X-CSE-MsgGUID: 6LrsZFoqTTqxzO3ueLRAWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73737598"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="73737598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 02:35:10 -0700
X-CSE-ConnectionGUID: Q4n8AAvzSYWm97MU4u4bdA==
X-CSE-MsgGUID: rPbaYQ+ZQTS74dknrzS4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="182475944"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.245.4]) ([10.245.245.4])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 02:35:07 -0700
Message-ID: <9d32258381ef46807e599e8e85e8ab94244c9a67.camel@linux.intel.com>
Subject: Re: [RFC 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Jason Gunthorpe <jgg@nvidia.com>, Christian Koenig
	 <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, Simona
 Vetter <simona.vetter@ffwll.ch>
Date: Mon, 20 Oct 2025 11:34:52 +0200
In-Reply-To: <20251014071243.811884-2-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
	 <20251014071243.811884-2-vivek.kasireddy@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi, Vivek,

On Tue, 2025-10-14 at 00:08 -0700, Vivek Kasireddy wrote:
> For the map operation, the dma-buf core will create an xarray but
> the exporter is expected to populate it with the interconnect
> specific addresses. And, similarly for unmap, the exporter is
> expected to cleanup the individual entries of the xarray.
>=20
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
> =C2=A0drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 68
> ++++++++++++++++++++++++++++
> =C2=A0include/linux/dma-buf-interconnect.h | 29 ++++++++++++
> =C2=A0include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++
> =C2=A03 files changed, 108 insertions(+)
> =C2=A0create mode 100644 include/linux/dma-buf-interconnect.h
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..162642bd53e8 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1612,6 +1612,74 @@ void dma_buf_vunmap_unlocked(struct dma_buf
> *dmabuf, struct iosys_map *map)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, "DMA_BUF");
> =C2=A0
> +struct dma_buf_ranges *
> +dma_buf_map_interconnect(struct dma_buf_attachment *attach)

Even if this is an RFC, please add kerneldoc so that the way the
interface is intended to be used becomes completely clear. Both for
functions and structs.


> +{
> +	const struct dma_buf_interconnect_ops *ic_ops;
> +	struct dma_buf *dmabuf =3D attach->dmabuf;
> +	struct dma_buf_ranges *ranges;
> +	int ret;
> +
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!dma_buf_attachment_is_dynamic(attach))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!attach->allow_ic)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ic_ops =3D dmabuf->ops->interconnect_ops;
> +	if (!ic_ops || !ic_ops->map_interconnect)
> +		return ERR_PTR(-EINVAL);
> +
> +	ranges =3D kzalloc(sizeof(*ranges), GFP_KERNEL);
> +	if (!ranges)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xa_init(&ranges->ranges);
> +	ret =3D ic_ops->map_interconnect(attach, ranges);
> +	if (ret)
> +		goto err_free_ranges;
> +
> +	return ranges;
> +
> +err_free_ranges:
> +	xa_destroy(&ranges->ranges);
> +	kfree(ranges);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_interconnect, "DMA_BUF");
> +
> +void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
> +				struct dma_buf_ranges *ranges)
> +{
> +	const struct dma_buf_interconnect_ops *ic_ops;
> +	struct dma_buf *dmabuf =3D attach->dmabuf;
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !ranges))
> +		return;
> +
> +	if (!attach->allow_ic)
> +		return;
> +
> +	ic_ops =3D dmabuf->ops->interconnect_ops;
> +	if (!ic_ops || !ic_ops->unmap_interconnect)
> +		return;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ic_ops->unmap_interconnect(attach, ranges);
> +
> +	xa_destroy(&ranges->ranges);
> +	kfree(ranges);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
> +
> =C2=A0#ifdef CONFIG_DEBUG_FS
> =C2=A0static int dma_buf_debug_show(struct seq_file *s, void *unused)
> =C2=A0{
> diff --git a/include/linux/dma-buf-interconnect.h
> b/include/linux/dma-buf-interconnect.h
> new file mode 100644
> index 000000000000..17504dea9691
> --- /dev/null
> +++ b/include/linux/dma-buf-interconnect.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DMA_BUF_INTERCONNECT_H__
> +#define __DMA_BUF_INTERCONNECT_H__
> +
> +#include <linux/xarray.h>
> +
> +struct dma_buf_attachment;
> +
> +struct dma_buf_ranges {
> +	struct xarray ranges;
> +	unsigned int nranges;

IIUC this would replace the sg-table right? I guess Jason or Christian
would need to comment on whether this is generic enough or whether it
needs to be interconnect-dependent.

> +};
> +
> +enum dma_buf_interconnect_type {
> +	DMA_BUF_INTERCONNECT_NONE =3D 0,
> +};

This calls for registering all known interconnects with the dma-buf
layer even if the interconnects are completely driver-private. I'd
suggest using a pointer to identify interconnect and whatever entity
defines the interconnect provides a unique pointer. For globally
visible interconnects this could be done in dma-buf.c or a dma-buf-
interconnect.c

> +
> +struct dma_buf_interconnect {
> +	enum dma_buf_interconnect_type type;
> +};
> +
> +struct dma_buf_interconnect_ops {
> +	int (*map_interconnect)(struct dma_buf_attachment *attach,
> +				struct dma_buf_ranges *ranges);
> +	void (*unmap_interconnect)(struct dma_buf_attachment
> *attach,
> +				=C2=A0=C2=A0 struct dma_buf_ranges *ranges);
> +};
> +#endif
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..db91c67c00d6 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -23,6 +23,8 @@
> =C2=A0#include <linux/dma-fence.h>
> =C2=A0#include <linux/wait.h>
> =C2=A0
> +#include <linux/dma-buf-interconnect.h>
> +
> =C2=A0struct device;
> =C2=A0struct dma_buf;
> =C2=A0struct dma_buf_attachment;
> @@ -276,6 +278,8 @@ struct dma_buf_ops {
> =C2=A0
> =C2=A0	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> =C2=A0	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
> *map);
> +
> +	const struct dma_buf_interconnect_ops *interconnect_ops;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -502,7 +506,9 @@ struct dma_buf_attachment {
> =C2=A0	struct device *dev;
> =C2=A0	struct list_head node;
> =C2=A0	bool peer2peer;
> +	bool allow_ic;
> =C2=A0	const struct dma_buf_attach_ops *importer_ops;
> +	struct dma_buf_interconnect interconnect;

Hmm. Could we have a pointer to the interconnect here? Let's say the
interconnect implementation would want to subclass with additional
information?


> =C2=A0	void *importer_priv;
> =C2=A0	void *priv;
> =C2=A0};
> @@ -589,6 +595,11 @@ struct sg_table *dma_buf_map_attachment(struct
> dma_buf_attachment *,
> =C2=A0					enum dma_data_direction);
> =C2=A0void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct
> sg_table *,
> =C2=A0				enum dma_data_direction);
> +
> +struct dma_buf_ranges *dma_buf_map_interconnect(struct
> dma_buf_attachment *);
> +void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
> +				struct dma_buf_ranges *);
> +
> =C2=A0void dma_buf_move_notify(struct dma_buf *dma_buf);
> =C2=A0int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_data_direction dir);

Thanks,
Thomas



