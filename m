Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB65464DB96
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 13:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiLOMtM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 07:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiLOMsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 07:48:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBCC221
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 04:48:47 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AD98FB;
        Thu, 15 Dec 2022 13:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671108526;
        bh=Q7D8Z7AhTp9sL5GB7LjRxEam/rdkK+0VUBq87F0qFrc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gDCy/mXzfN7t0Hf87r4gfX46cmzIAnf31nk75LXnI7NoHO0nkE+/HHOuUxaVHOz+e
         gk5eSdHZg2Ap4+Pr6t27Zxf2rxqI0Bh2aUhi9Xu2hOLAMp1IJ2Sh9xvadpT4bOMhw4
         aYKM6Ijn5KVqK7/E2M200HeaDMxoZMXzAc/i8u3M=
Message-ID: <953f3132-e031-75fa-5be3-63bab2accdba@ideasonboard.com>
Date:   Thu, 15 Dec 2022 14:48:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/5] media: mc: entity: Add entity iterator for
 media_pipeline
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-3-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212141621.724-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/12/2022 16:16, Laurent Pinchart wrote:
> Add a media_pipeline_for_each_entity() macro to iterate over entities in
> a pipeline. This should be used by driver as a replacement of the
> media_graph_walk API, as iterating over the media_pipeline uses the
> cached list of pads and is thus more efficient.
> 
> Deprecate the media_graph_walk API to indicate it shouldn't be used in
> new drivers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/mc/mc-entity.c | 37 +++++++++++++++++++
>   include/media/media-entity.h | 69 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 70df2050951c..f19bb98071b2 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -950,6 +950,43 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
>   }
>   EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
>   
> +int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
> +				    struct media_pipeline_entity_iter *iter)
> +{
> +	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
> +
> +void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
> +{
> +	media_entity_enum_cleanup(&iter->ent_enum);
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
> +
> +struct media_entity *
> +__media_pipeline_entity_iter_next(struct media_pipeline *pipe,
> +				  struct media_pipeline_entity_iter *iter,
> +				  struct media_entity *entity)
> +{
> +	if (!entity)
> +		iter->cursor = pipe->pads.next;
> +
> +	while (iter->cursor != &pipe->pads) {
> +		struct media_pipeline_pad *ppad;
> +		struct media_entity *entity;
> +
> +		ppad = list_entry(iter->cursor, struct media_pipeline_pad, list);
> +		entity = ppad->pad->entity;
> +		iter->cursor = iter->cursor->next;
> +
> +		if (media_entity_enum_test_and_set(&iter->ent_enum, entity))
> +			return entity;

Shouldn't this be if (!media_entity...)? Doesn't 
media_entity_enum_test_and_set return true if the entity has already 
been seen, and thus we shouldn't return it?

> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
> +
>   /* -----------------------------------------------------------------------------
>    * Links management
>    */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index e881e483b550..1b820cb6fed1 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -139,6 +139,17 @@ struct media_pipeline_pad_iter {
>   	struct list_head *cursor;
>   };
>   
> +/**
> + * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
> + *
> + * @ent_enum: The entity enumeration tracker
> + * @cursor: The current element
> + */
> +struct media_pipeline_entity_iter {
> +	struct media_entity_enum ent_enum;
> +	struct list_head *cursor;
> +};
> +

Same question here as for the previous one: can this be in the mc-entity.c?

  Tomi

