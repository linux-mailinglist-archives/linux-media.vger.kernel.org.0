Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC1954FF64
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 23:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbiFQVeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 17:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbiFQVeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 17:34:24 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D7842ED7
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 14:34:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o8so7217639wro.3
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 14:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E6J2GDFXNA9d2Ur0cBOwlB2pD33WtCla1AS4T/F8zFc=;
        b=McfFr2H4uUyZBLWPhYsclLMDsaAEJs/nwet2oYKtO3ZovJP4GOwXQLvfdYsScpq7xD
         4DaC1AaMfV1ERdwVCiOAGgZG0aH/ZU9qm9jUeGsSda7wTpFCCk3xr28DOSCmKDYRJ41C
         wIWiBY+RFTq2HBdlLJ85v/WUSY6Zx2upu5aTBIW7DgDtnMyFLUe8MXqUOW1PwUN2HQCk
         ks9TQzB5qpfrNby4EeTZCbNEhaslwQHRM7o6tsCxaF7f0HeqPUN98AIY0LGKh6s4NWuC
         rXln+QFcs3i0OKMbzkV1J3HjxyEyEtfF0cjNRh7rS13Jzlc5789crPJsulBnsXBWngTl
         IMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E6J2GDFXNA9d2Ur0cBOwlB2pD33WtCla1AS4T/F8zFc=;
        b=aw5LSGO41K35CCHcIFZt3CymYQTiM8L1HCQ8sAyRffJi0owP0+ZUE993WMsOQVpN0f
         4f9VyGfif4+6KhcJgpDzNZiK7K+J+cYLePDmTEG3H5mhe2GjNbQDxafgI/zHKcxapxL7
         B5soMtVFgEoUykEvIlZwTYgzKCYJdmoh7jRBuc/zTFHIEE43zeUb3pYtbgJkIUNLoY1W
         v5hoQnCavMUENPrCdn8siyoQMg5JUCt9yubyLfRZDTkpKasxri5C7in4AI9c7Z8idSbK
         0pNWe0HU4r2WV776AUMPrhP8msDK0R8kCmYuz3X2hKsk4PiwCopiepd9MoevIzQMsq1x
         E9KA==
X-Gm-Message-State: AJIora9rVXtcTZp38lRGdj1OrB5yCQkU1NwRVxFYSslB5edvy133E6ct
        Av8s73SaLLBKFMvQ/IRr6fE=
X-Google-Smtp-Source: AGRyM1sdfmWAB71n854msPnVjKa+QfE2XohTi2r41xyncb8L436Q4uzI/6R0Hi6OZnryZgZ5y0SzYQ==
X-Received: by 2002:a5d:598e:0:b0:218:531a:eb5 with SMTP id n14-20020a5d598e000000b00218531a0eb5mr10917451wri.334.1655501661377;
        Fri, 17 Jun 2022 14:34:21 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l14-20020adfe58e000000b0021a56cda047sm3312866wrm.60.2022.06.17.14.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 14:34:20 -0700 (PDT)
Message-ID: <e9b1b46f-e8a5-4481-e70f-d7355b828808@gmail.com>
Date:   Fri, 17 Jun 2022 22:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 37/55] media: mc-entity: Add a new helper function to get
 a remote pad
Content-Language: en-US
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-38-paul.elder@ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220614191127.3420492-38-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

On 14/06/2022 20:11, Paul Elder wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The media_entity_remote_pad() helper function returns the first remote
> pad it find connected to a given pad. Beside being possibly ill-named
> (as it operates on a pad, not an entity) and non-deterministic (as it
> stops at the first enabled link), the fact that it returns the first
> match makes it unsuitable for drivers that need to guarantee that a
> single link is enabled, for instance when an entity can process data
> from one of multiple sources at a time.
>
> For those use cases, add a new helper function,
> media_entity_remote_pad_unique(), that operates on an entity and returns
> a remote pad, with a guarantee that only one link is enabled. To ease
> its use in drivers, also add an inline wrapper that locates source pads
> specifically. A wrapper that locates sink pads can easily be added when
> needed.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/driver-api/media/mc-core.rst |  4 +-
>  drivers/media/mc/mc-entity.c               | 38 ++++++++++++++++++
>  include/media/media-entity.h               | 45 ++++++++++++++++++++++
>  3 files changed, 85 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 02481a2513b9..a2d1e32e3abb 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -186,8 +186,8 @@ is required and the graph structure can be freed normally.
>  
>  Helper functions can be used to find a link between two given pads, or a pad
>  connected to another pad through an enabled link
> -:c:func:`media_entity_find_link()` and
> -:c:func:`media_entity_remote_pad()`.
> +(:c:func:`media_entity_find_link()`, :c:func:`media_entity_remote_pad()` and
> +:c:func:`media_entity_remote_source_pad()`).
>  
>  Use count and power handling
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 11f5207f73aa..1febf5a86be6 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/bitmap.h>
> +#include <linux/list.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <media/media-entity.h>
> @@ -920,6 +921,43 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
>  }
>  EXPORT_SYMBOL_GPL(media_entity_remote_pad);
>  
> +struct media_pad *
> +media_entity_remote_pad_unique(const struct media_entity *entity,
> +			       unsigned int type)
> +{
> +	struct media_pad *pad = NULL;
> +	struct media_link *link;
> +
> +	list_for_each_entry(link, &entity->links, list) {
> +		struct media_pad *local_pad;
> +		struct media_pad *remote_pad;
> +
> +		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> +			continue;
Does this need another guard here to make sure the link isn't an
ancillary link? Only likely to happen at least in the immediate future
where the entity represents a camera sensor, so possibly not applicable
here - I couldn't find where the new function is used in the series to
check. I _think_ it would actually work ok regardless...media_gobj
type-punning makes my brain ache, but I think the local_pad->entity ==
entity comparison would actually compare the entity->name member of the
entity at the end of an ancillary link to the entity parameter, not find
a match and so continue the loop without failing, but that feels a bit
sub-optimal.



> +
> +		if (type == MEDIA_PAD_FL_SOURCE) {
> +			local_pad = link->sink;
> +			remote_pad = link->source;
> +		} else {
> +			local_pad = link->source;
> +			remote_pad = link->sink;
> +		}
> +
> +		if (local_pad->entity == entity) {
> +			if (pad)
> +				return ERR_PTR(-ENOTUNIQ);
> +
> +			pad = remote_pad;
> +		}
> +	}
> +
> +	if (!pad)
> +		return ERR_PTR(-ENOLINK);
> +
> +	return pad;
> +}
> +EXPORT_SYMBOL_GPL(media_entity_remote_pad_unique);
> +
>  static void media_interface_init(struct media_device *mdev,
>  				 struct media_interface *intf,
>  				 u32 gobj_type,
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index a9a1c0ec5d1c..33d5f52719a0 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -859,6 +859,51 @@ struct media_link *media_entity_find_link(struct media_pad *source,
>   */
>  struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
>  
> +/**
> + * media_entity_remote_pad_unique - Find a remote pad connected to an entity
> + * @entity: The entity
> + * @type: The type of pad to find (MEDIA_PAD_FL_SINK or MEDIA_PAD_FL_SOURCE)
> + *
> + * Search for and return a remote pad of @type connected to @entity through an
> + * enabled link. If multiple (or no) remote pads match these criteria, an error
> + * is returned.
> + *
> + * The uniqueness constraint makes this helper function suitable for entities
> + * that support a single active source or sink at a time.
> + *
> + * Return: A pointer to the remote pad, or one of the following error pointers
> + * if an error occurs:
> + *
> + * * -ENOTUNIQ - Multiple links are enabled
> + * * -ENOLINK - No connected pad found
> + */
> +struct media_pad *
> +media_entity_remote_pad_unique(const struct media_entity *entity,
> +			       unsigned int type);
> +
> +/**
> + * media_entity_remote_source_pad - Find a remote source pad connected to an entity
> + * @entity: The entity
> + *
> + * Search for and return a remote source pad connected to @entity through an
> + * enabled link. If multiple (or no) remote pads match these criteria, an error
> + * is returned.
> + *
> + * The uniqueness constraint makes this helper function suitable for entities
> + * that support a single active source at a time.
> + *
> + * Return: A pointer to the remote pad, or one of the following error pointers
> + * if an error occurs:
> + *
> + * * -ENOTUNIQ - Multiple links are enabled
> + * * -ENOLINK - No connected pad found
> + */
> +static inline struct media_pad *
> +media_entity_remote_source_pad(const struct media_entity *entity)
> +{
> +	return media_entity_remote_pad_unique(entity, MEDIA_PAD_FL_SOURCE);
> +}
> +
>  /**
>   * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
>   * @entity: The entity
