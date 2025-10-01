Return-Path: <linux-media+bounces-43512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B06BB1A46
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 21:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1302719C23D0
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 19:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6551726FA70;
	Wed,  1 Oct 2025 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M28XBKuT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DDA2AD0C;
	Wed,  1 Oct 2025 19:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347922; cv=none; b=SqP/t50TwsLARUB2FRZsGDtzUfUtfK8swQqtW1jmKwmemuMNiv2XITP7xeQfwWAmozea8c6GCrts8V45nbQ2jsqgptL3sKTmX3ab8sbBRzsCMX59yvTKs3OT40Pm8fSVd3nc5z7gcW7qNvNOTf4UNUzCs+TH1gM5xhkmZsdoxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347922; c=relaxed/simple;
	bh=d+32j7mykuQLclysPTsyNlCE3t+aPfRKTi1XybG5tOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uokZXcenIO5nu29m+vDe9/DBOSkn4RFI2p5y5NEV0e82eVFSpiVRPdnn5CQHC7JomucRmcgOKdWjn4ZTIHCyUX9CxlcCoIxivkO0YyWdt1XQr0wsu2L7q1SaAIrfNftRzficaL1AD0GpMlQbeNtmwcbcwtX7m6NwZ6teqkxnZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M28XBKuT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759347918;
	bh=d+32j7mykuQLclysPTsyNlCE3t+aPfRKTi1XybG5tOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M28XBKuTwKb9b7bD7Wl9dNYQ16Kzdr7LhCjlGuqtZxLOTRTBN5+VVibHU8EvPgl3v
	 7nJA1Bp8V9OrNKCgBwLVfV+lyaiTBl8b3UYp7ZNOsCjcs0al/cmsbq6xeiVgS3bxUT
	 thvOMM8KQDEBoGsCaBxBzjccRW3tVhDo6enSwMFcBakNzBlqz5KLALJ/dC6RjNYTj8
	 h6yfNoYIWWIbYRjvJ0u746dVnMFektmEPwW/qnZKdQs4usFz6uEDG6dzdcCd4K7mXm
	 b7K9Fs2hTyqvju7BkuIsFqUXYDcstXBw0akqUibWlwitKJlD908B+G+Ir8N1QlM6yp
	 QskoDPmq2jznA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 732AC17E12C0;
	Wed,  1 Oct 2025 21:45:17 +0200 (CEST)
Message-ID: <9f1dbc4d-d4c7-4c1c-b48a-355a83e18e5c@collabora.com>
Date: Wed, 1 Oct 2025 21:45:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/27] media: media-entity: Introduce
 media_entity_context
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-3-c9b316773486@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-3-c9b316773486@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

Thanks for your patch. Looks good to me, but found a few typos.

On 7/24/25 16:10, Jacopo Mondi wrote:
> Introduce the 'struct media_entity_context' type, which serves for
> reference counting and introduce two new media entity operations to
> allow drivers to allocate and free a media entity context.
> 
> The newly introduced type will be used as a base type for the
> device context types (video_device_context and v4l2_subdevice_context)
> that will be introduced in the next patches.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c |  46 ++++++++++++++++++++
>  include/media/media-entity.h | 101 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 045590905582054c46656e20463271b1f93fa6b4..b4a9f0a0aa7353d7a3333f20903980956b3df4a7 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1673,3 +1673,49 @@ struct media_link *__media_entity_next_link(struct media_entity *entity,
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(__media_entity_next_link);
> +
> +static void media_entity_release_context(struct kref *refcount)
> +{
> +	struct media_entity_context *ctx =
> +		container_of(refcount, struct media_entity_context, refcount);
> +
> +	ctx->entity->ops->destroy_context(ctx);
> +}
> +
> +struct media_entity_context *
> +media_entity_context_get(struct media_entity_context *ctx)
> +{
> +	if (!ctx)
> +		return ERR_PTR(-EINVAL);
> +
> +	kref_get(&ctx->refcount);
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(media_entity_context_get);
> +
> +void media_entity_context_put(struct media_entity_context *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	kref_put(&ctx->refcount, media_entity_release_context);
> +}
> +EXPORT_SYMBOL_GPL(media_entity_context_put);
> +
> +void media_entity_init_context(struct media_entity *entity,
> +			       struct media_entity_context *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	ctx->entity = entity;
> +	kref_init(&ctx->refcount);
> +	INIT_LIST_HEAD(&ctx->list);
> +}
> +EXPORT_SYMBOL_GPL(media_entity_init_context);
> +
> +void media_entity_cleanup_context(struct media_entity_context *ctx)
> +{
> +}
> +EXPORT_SYMBOL_GPL(media_entity_cleanup_context);
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 64cf590b11343f68a456c5870ca2f32917c122f9..32298fe8a18c6ee3c1dbcff9ef869548904417a7 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -15,6 +15,7 @@
>  #include <linux/bug.h>
>  #include <linux/container_of.h>
>  #include <linux/fwnode.h>
> +#include <linux/kref.h>
>  #include <linux/list.h>
>  #include <linux/media.h>
>  #include <linux/minmax.h>
> @@ -248,6 +249,37 @@ struct media_pad {
>  	struct media_pipeline *pipe;
>  };
>  
> +/**
> + * struct media_entity_context - A media entity execution context
> + * @mdev_context: The media device context this media entity is bound to.
> + *		  The field is initialized when the entity is bound to a media
> + *		  device context.
> + * @entity: The media entity this context belongs to
> + * @refcount: The kref reference counter
> + * list: The list entry to link the entity context in the media device context
> + *
> + * This type represent the 'base class' used to implement execution context for
> + * video device contexts and subdevice contexts. Those types embedds an instance

Typo 'embedds' -> 'embed'?

> + * of 'struct media_entity_context' as their first member, allowing the MC core
> + * to implement type polymorphism and handle video device and subdevice contexts
> + * transparently.
> + *
> + * The main function of this type is to provide reference counting for the
> + * 'dervived' device context types. The video device and subdevice core

Typo 'dervived' -> 'derived'?

> + * populates the 'context_release' function pointer that implement specific
> + * clean-up operations, similar to what a 'virtual destructor' would do in C++.
> + *
> + * Drivers are not expected to use this type directly, but only the MC core
> + * will.
> + */
> +struct media_device_context;
> +struct media_entity_context {
> +	struct media_device_context *mdev_context;
> +	struct media_entity *entity;
> +	struct kref refcount;
> +	struct list_head list;
> +};
> +
>  /**
>   * struct media_entity_operations - Media entity operations
>   * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
> @@ -269,6 +301,15 @@ struct media_pad {
>   *			media_entity_has_pad_interdep().
>   *			Optional: If the operation isn't implemented all pads
>   *			will be considered as interdependent.
> + * @alloc_context:	Allocate a media entity context. Drivers are allowed to
> + *			sub-class the entity context type by defining a driver
> + *			specific type that embeds an instance of either a
> + *			video_device_context or subdevice_context as first
> + *			member, and allocate the size of a driver-specific type
> + *			in the implementation of this operation. Returns 0 for
> + *			success, or an error code < 0 otherwise.
> + * @destroy_context:	Release a media entity context previously allocated by
> + *			the driver.
>   *
>   * .. note::
>   *
> @@ -284,6 +325,9 @@ struct media_entity_operations {
>  	int (*link_validate)(struct media_link *link);
>  	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
>  				 unsigned int pad1);
> +	int (*alloc_context)(struct media_entity *entity,
> +			     struct media_entity_context **context);
> +	void (*destroy_context)(struct media_entity_context *context);
>  };
>  
>  /**
> @@ -1448,3 +1492,60 @@ struct media_link *__media_entity_next_link(struct media_entity *entity,
>  					     MEDIA_LNK_FL_DATA_LINK))
>  
>  #endif
> +
> +/**
> + * media_entity_context_get - Increase the media entity context reference count
> + *			      and return a reference to it
> + *
> + * @ctx: the media entity context
> + *
> + * Increase the media entity context reference count. The reference count
> + * is increased by the V4L2 core when:
> + *
> + * * a new context is allocated when bounding a media entity to a media device
> + *   context (by kref_init())
> + * * the media pipeline the context is part of starts streaming
> + *
> + * The entity context gets automatically decreased by the V4L2 core when:
> + *
> + * * a context is unbound
> + * * the pipeline stops streaming
> + */
> +struct media_entity_context *
> +media_entity_context_get(struct media_entity_context *ctx);
> +
> +/**
> + * media_entity_context_put - Decrease the media entity context reference count
> + *
> + * @ctx: the media entity context
> + *
> + * Decrease the media entity context reference count. The reference count
> + * is decreased by the V4L2 core when:
> + *
> + * * the file handle the context is associated with is closed
> + * * the media pipeline the context is part of is stopped
> + */
> +void media_entity_context_put(struct media_entity_context *ctx);
> +
> +/**
> + * media_entity_init_context - Initialize the media entity context
> + *
> + * @entity: the media entity this context belongs to
> + * @ctx: the media entity context
> + *
> + * Initialize the media entity context by initializing the kref reference
> + * counter. The intended caller of this function are the video device context
> + * and subdevic context initialize functions.

Typo "subdevic" -> "subdevice"

> + */
> +void media_entity_init_context(struct media_entity *entity,
> +			       struct media_entity_context *ctx);
> +
> +/**
> + * media_entity_cleanup_context - Cleanup the media entity context
> + *
> + * @ctx: the media entity context
> + *
> + * Cleanup the media entity context. The intended caller of this function are
> + * the video device and subdevice context cleanup functions.
> + */
> +void media_entity_cleanup_context(struct media_entity_context *ctx);
> 

Best regards,
Michael


