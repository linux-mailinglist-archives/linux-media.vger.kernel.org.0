Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD4154D4A9
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348429AbiFOWin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347129AbiFOWim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:38:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0CA5622B
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 15:38:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2647C415;
        Thu, 16 Jun 2022 00:38:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655332720;
        bh=l3+8xMOJlpi7aNGHzxKvolg3yAiTzQK/YUxYygUsGvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bN7fqeSn9/OgOGf50eohjaGEuJFicP4EEYPHa5x7MKgJVbGnxMGxsvNAj1F6AlA0a
         MyQD42Zw7fCZY+jSen4bMnsKw9DE/h4b0YO2aogq8EnloNycOCHDkwHzVY4rFSTDi8
         lqNBoBcuCagcZGKOABLmgTEM/cosAU+IPU7EVIl8=
Date:   Thu, 16 Jun 2022 01:38:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 38/55] media: mc-entity: Add a new helper function to get
 a remote pad for a pad
Message-ID: <YqpfZjcXigaTLwMN@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-39-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-39-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+ Sakari and Hans

On Wed, Jun 15, 2022 at 04:11:10AM +0900, Paul Elder wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The newly added media_entity_remote_source_pad() helper function handles
> use cases where the entity has a link enabled uniqueness constraint
> covering all pads. There are use cases where the constraint covers a
> specific pad only. Add a new media_pad_remote_pad() function to handle
> this. It operates as media_entity_remote_source_pad(), but on a given
> pad instead of on the entity.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/driver-api/media/mc-core.rst |  4 +--
>  drivers/media/mc/mc-entity.c               | 31 ++++++++++++++++++++++
>  include/media/media-entity.h               | 18 +++++++++++++
>  3 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index a2d1e32e3abb..83c3bdbf67be 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -186,8 +186,8 @@ is required and the graph structure can be freed normally.
>  
>  Helper functions can be used to find a link between two given pads, or a pad
>  connected to another pad through an enabled link
> -(:c:func:`media_entity_find_link()`, :c:func:`media_entity_remote_pad()` and
> -:c:func:`media_entity_remote_source_pad()`).
> +(:c:func:`media_entity_find_link()`, :c:func:`media_entity_remote_pad()`,
> +:c:func:`media_entity_remote_source_pad()` and :c:func:`media_pad_remote_pad()`).
>  
>  Use count and power handling
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 1febf5a86be6..6429b0510bfb 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -958,6 +958,37 @@ media_entity_remote_pad_unique(const struct media_entity *entity,
>  }
>  EXPORT_SYMBOL_GPL(media_entity_remote_pad_unique);
>  
> +struct media_pad *media_pad_remote_pad(const struct media_pad *pad)
> +{
> +	struct media_pad *found_pad = NULL;
> +	struct media_link *link;
> +
> +	list_for_each_entry(link, &pad->entity->links, list) {
> +		struct media_pad *remote_pad;
> +
> +		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> +			continue;
> +
> +		if (link->sink == pad)
> +			remote_pad = link->source;
> +		else if (link->source == pad)
> +			remote_pad = link->sink;
> +		else
> +			continue;
> +
> +		if (found_pad)
> +			return ERR_PTR(-ENOTUNIQ);
> +
> +		found_pad = remote_pad;
> +	}
> +
> +	if (!found_pad)
> +		return ERR_PTR(-ENOLINK);
> +
> +	return found_pad;
> +}
> +EXPORT_SYMBOL_GPL(media_pad_remote_pad);
> +
>  static void media_interface_init(struct media_device *mdev,
>  				 struct media_interface *intf,
>  				 u32 gobj_type,
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 33d5f52719a0..bfe6a7b10a68 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -904,6 +904,24 @@ media_entity_remote_source_pad(const struct media_entity *entity)
>  	return media_entity_remote_pad_unique(entity, MEDIA_PAD_FL_SOURCE);
>  }
>  
> +/**
> + * media_pad_remote_pad - Find a remote pad connected to a pad
> + * @pad: The pad
> + *
> + * Search for and return a remote pad connected to @pad through an enabled
> + * link. If multiple (or no) remote pads are found, an error is returned.
> + *
> + * The uniqueness constraint makes this helper function suitable for entities
> + * that support a single active source at a time on a given pad.
> + *
> + * Return: A pointer to the remote pad, or one of the following error pointers
> + * if an error occurs:
> + *
> + * * -ENOTUNIQ - Multiple links are enabled
> + * * -ENOLINK - No connected pad found
> + */
> +struct media_pad *media_pad_remote_pad(const struct media_pad *pad);
> +
>  /**
>   * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
>   * @entity: The entity
> -- 
> 2.30.2
> 

-- 
Regards,

Laurent Pinchart
