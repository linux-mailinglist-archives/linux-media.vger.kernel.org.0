Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EE61EEAD3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 21:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgFDTFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 15:05:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46647 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729588AbgFDTFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 15:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591297532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ul0Gd1q39xy/+znscqHyGd+HqqENFH8nbxN3dnuntWk=;
        b=IyWQH+PLmNiZRyxCZzvHrXKX/KnfrUH0vZ2iO9lcRtRnAWIcayriPKX9IpEasojphRsIFu
        1HFN9oJ8STJTradf7GDOqQChaBeOsiWIHaG5eib2/tdCY8COI8+HLVljIuqMRAuGX+mnL8
        6hlxb6Qtmpm8e6SzstVgYdvwRDOcgVk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-EXHH3L3-MImIhyC7iPXuVA-1; Thu, 04 Jun 2020 15:05:29 -0400
X-MC-Unique: EXHH3L3-MImIhyC7iPXuVA-1
Received: by mail-wr1-f71.google.com with SMTP id w16so2779958wru.18
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 12:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ul0Gd1q39xy/+znscqHyGd+HqqENFH8nbxN3dnuntWk=;
        b=AzeAqWYxZBEeReQPYqqm+xtHMPeOz5wnobYar52757Z6mamSGU45DMfdPuFczg+h0f
         dVUnMvwnI3TVTOWHHP+2wRfGu5bDoUySGB7mnlvWbwwbcyPZ5ij2ZCY6oxpoqc+L+D3/
         eNNvIZpJsmrpYukKlePooZ4Gu1nunSBlBfgeM5ltpzAS7qWd63XqqLxlK8BQkY0/eJG1
         aHEf4fcAXvuwpqFax1y0noKGPZ28A/Yvh6HZvYhoce6FQXx2UZlndr/zUs6xm8PvIVCd
         KNJj1uhqIUtaEkQ9/fE8fpJLbpOAh7MQluR01liV3sOiTcsZvPMSKiFBFUST5o9S9CwV
         m3dg==
X-Gm-Message-State: AOAM530JhU9OpoWHG6TmmgjDviJD61V0jgAJFSfo+8i8JASnpFfqYEgI
        nBBARS5xfwXH69dyRPmK9D9nuilJbQlW2FmWEGwW0E/fzu1nD7lEtHXjB/Ptl1aZVYmPd3OhJIr
        sCxPa/1pep3JH+QTNLk6HsGU=
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr4956130wmj.146.1591297528051;
        Thu, 04 Jun 2020 12:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyilb2EQmaD9XeUNkwrvnyHI7PCfvokVhncmnDFTklSZwJ5vM0u4I0Afx8vNqV5lpNVQn4Mag==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr4956100wmj.146.1591297527751;
        Thu, 04 Jun 2020 12:05:27 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id j190sm8467500wmb.33.2020.06.04.12.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 12:05:27 -0700 (PDT)
Date:   Thu, 4 Jun 2020 15:05:23 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200604145620-mutt-send-email-mst@kernel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526105811.30784-2-stevensd@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> This change adds a new flavor of dma-bufs that can be used by virtio
> drivers to share exported objects. A virtio dma-buf can be queried by
> virtio drivers to obtain the UUID which identifies the underlying
> exported object.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>

Is this just for graphics? If yes I'd rather we put it in the graphics
driver. We can always move it later ...

> ---
>  drivers/virtio/Makefile         |  2 +-
>  drivers/virtio/virtio.c         |  6 +++
>  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
>  include/linux/virtio.h          |  1 +
>  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
>  5 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/virtio/virtio_dma_buf.c
>  create mode 100644 include/linux/virtio_dma_buf.h
> 
> diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> index 29a1386ecc03..ecdae5b596de 100644
> --- a/drivers/virtio/Makefile
> +++ b/drivers/virtio/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
>  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
>  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
>  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index a977e32a88f2..5d46f0ded92d 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
>  }
>  EXPORT_SYMBOL_GPL(register_virtio_device);
>  
> +bool is_virtio_device(struct device *dev)
> +{
> +	return dev->bus == &virtio_bus;
> +}
> +EXPORT_SYMBOL_GPL(is_virtio_device);
> +
>  void unregister_virtio_device(struct virtio_device *dev)
>  {
>  	int index = dev->index; /* save for after device release */
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> new file mode 100644
> index 000000000000..23e3399b11ed
> --- /dev/null
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * dma-bufs for virtio exported objects
> + *
> + * Copyright (C) 2020 Google, Inc.
> + */
> +
> +#include <linux/virtio_dma_buf.h>
> +
> +/**
> + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> + *
> + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> + * for an virtio exported object that can be queried by other virtio drivers
> + * for the object's UUID.
> + */
> +struct dma_buf *virtio_dma_buf_export(
> +		const struct virtio_dma_buf_export_info *virtio_exp_info)
> +{
> +	struct dma_buf_export_info exp_info;
> +
> +	if (!virtio_exp_info->ops
> +		|| virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> +		|| !virtio_exp_info->ops->get_uuid) {
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	exp_info.exp_name = virtio_exp_info->exp_name;
> +	exp_info.owner = virtio_exp_info->owner;
> +	exp_info.ops = &virtio_exp_info->ops->ops;
> +	exp_info.size = virtio_exp_info->size;
> +	exp_info.flags = virtio_exp_info->flags;
> +	exp_info.resv = virtio_exp_info->resv;
> +	exp_info.priv = virtio_exp_info->priv;
> +	BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> +		     != sizeof(struct dma_buf_export_info));

This is the only part that gives me pause. Why do we need this hack?
What's wrong with just using dma_buf_export_info directly,
and if you want the virtio ops, just using container_off?



> +
> +	return dma_buf_export(&exp_info);
> +}
> +EXPORT_SYMBOL(virtio_dma_buf_export);
> +
> +/**
> + * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + */
> +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> +			  struct dma_buf_attachment *attach)
> +{
> +	int ret;
> +	const struct virtio_dma_buf_ops *ops = container_of(
> +			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> +
> +	if (ops->device_attach) {
> +		ret = ops->device_attach(dma_buf, attach);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(virtio_dma_buf_attach);
> +
> +/**
> + * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
> + * @dma_buf: buffer to query
> + */
> +bool is_virtio_dma_buf(struct dma_buf *dma_buf)
> +{
> +	return dma_buf->ops->attach == &virtio_dma_buf_attach;
> +}
> +EXPORT_SYMBOL(is_virtio_dma_buf);
> +
> +/**
> + * virtio_dma_buf_get_uuid - gets the uuid of the virtio dma-buf's exported object
> + * @dma_buf: [in] buffer to query
> + * @uuid: [out] the uuid
> + *
> + * Returns: 0 on success, negative on failure.
> + */
> +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
> +			    uuid_t *uuid)
> +{
> +	const struct virtio_dma_buf_ops *ops = container_of(
> +			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> +
> +	if (!is_virtio_dma_buf(dma_buf))
> +		return -EINVAL;
> +
> +	return ops->get_uuid(dma_buf, uuid);
> +}
> +EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 15f906e4a748..9397e25616c4 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -128,6 +128,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
>  void virtio_add_status(struct virtio_device *dev, unsigned int status);
>  int register_virtio_device(struct virtio_device *dev);
>  void unregister_virtio_device(struct virtio_device *dev);
> +bool is_virtio_device(struct device *dev);
>  
>  void virtio_break_device(struct virtio_device *dev);
>  
> diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
> new file mode 100644
> index 000000000000..29fee167afbd
> --- /dev/null
> +++ b/include/linux/virtio_dma_buf.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * dma-bufs for virtio exported objects
> + *
> + * Copyright (C) 2020 Google, Inc.
> + */
> +
> +#ifndef _LINUX_VIRTIO_DMA_BUF_H
> +#define _LINUX_VIRTIO_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/uuid.h>
> +#include <linux/virtio.h>
> +
> +/**
> + * struct virtio_dma_buf_ops - operations possible on exported object dma-buf
> + * @ops: the base dma_buf_ops. ops.attach MUST be virtio_dma_buf_attach.
> + * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
> + *		   all attach operations.
> + * @get_uid: [required] callback to get the uuid of the exported object.
> + */
> +struct virtio_dma_buf_ops {
> +	struct dma_buf_ops ops;
> +	int (*device_attach)(struct dma_buf *dma_buf,
> +			     struct dma_buf_attachment *attach);
> +	int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
> +};
> +
> +/**
> + * struct virtio_dma_buf_export_info - see struct dma_buf_export_info
> + */
> +struct virtio_dma_buf_export_info {
> +	const char *exp_name;
> +	struct module *owner;
> +	const struct virtio_dma_buf_ops *ops;
> +	size_t size;
> +	int flags;
> +	struct dma_resv *resv;
> +	void *priv;
> +};
> +
> +/**
> + * DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO - helper macro for exporters
> + */
> +#define DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO(name)	\
> +	struct virtio_dma_buf_export_info name = { \
> +		.exp_name = KBUILD_MODNAME, \
> +		.owner = THIS_MODULE }
> +
> +int virtio_dma_buf_attach(struct dma_buf *dma_buf,
> +			  struct dma_buf_attachment *attach);
> +
> +struct dma_buf *virtio_dma_buf_export(
> +		const struct virtio_dma_buf_export_info *virtio_exp_info);
> +bool is_virtio_dma_buf(struct dma_buf *dma_buf);
> +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
> +
> +#endif /* _LINUX_VIRTIO_DMA_BUF_H */
> -- 
> 2.27.0.rc0.183.gde8f92d652-goog

