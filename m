Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3AF1B7759
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 15:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgDXNqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 09:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727095AbgDXNqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 09:46:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D42C09B046
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 06:46:12 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w20so10027770ljj.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oK6CmIJHBHfv0HWo7YgYzceYBh86WgxIMM3aYNj+VtQ=;
        b=FGM0coSe2uA5sqGO3457F/ihOg+whBn2NcHGxD/ud+9LhUkq4c0kHyOuO9/V2jLkyO
         oeiN8mN6X7Dm83p3qnYNJQww602eaSpvY5sUV8PUjhSdgUQZ40Uw/OW6/XSQU3dyme4y
         qMpFqMCNV24mV4smwQOwCRu2JCoj84iJLVBreJT3BEHLYygZUv6jGfWMYrxbEEcANiXq
         0jdtPrHpi8VrXL1lnclMDVw5VSJhpDosNuILro1fBQqdkTsExY4Ub5IMwtRq/VAPFqA3
         DLIGaVWvHusyzYA97iOHZuYBx03kuKWaMhHM6O6meDFTi/BDJc871E5FdDNT+reHI7h7
         cUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oK6CmIJHBHfv0HWo7YgYzceYBh86WgxIMM3aYNj+VtQ=;
        b=S5H2nk7H8FfxWTVqnp5sVDfJtprp3trPEL7rxJRw0UM8cNayTQIu1UltlaB6Z1Ezea
         o/Vf9uITQA1exCso1ACnfxm7dCWWdVItf4smA4hw0NeqhNvJbPz22J8kHBWpHXDLz8gt
         UmRZFoLBlxqQ2CsyYJGXX4KvQ45gac4qYvqrWBUQVHnJohTHmY1LUwZPHW00xhvb1V5Y
         7f0VfXnqr663wBxYZyP3eae7scFxQo0LdOhNTHO5zru4brC4wFFJM764/v8mYjczalCg
         pqsGwr5cU95SyRy4nBLrZlkTN86GM7iSMt6XFnekUvZvvgeaPFqA5TtkJE9WnjAIMjAi
         /uaw==
X-Gm-Message-State: AGi0Pubhdr1VJnDi8CdhimJq7ywFnnIz/vGg9YWOZWHoE9FgMkiPM++l
        F/djoGktrrmQFMM/zd29qkgwnw==
X-Google-Smtp-Source: APiQypJ2JlXPRC2HDUqFteHa9WDe5UBL/Ds/AInQim0iWDH7dzhdZesOkFgfADD4cjMazeUcn52u+w==
X-Received: by 2002:a2e:8798:: with SMTP id n24mr5829194lji.200.1587735970781;
        Fri, 24 Apr 2020 06:46:10 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m20sm4335105ljj.94.2020.04.24.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 06:46:10 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:46:09 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 1/4] media: mc-entity.c: add
 media_graph_walk_next_stream()
Message-ID: <20200424134609.GD4040416@oden.dyn.berto.se>
References: <20200415013044.1778572-1-helen.koike@collabora.com>
 <20200415013044.1778572-2-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415013044.1778572-2-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your work.

On 2020-04-14 22:30:41 -0300, Helen Koike wrote:
> Add media_graph_walk_next_stream() function to follow links only from
> sink to source (not the opposite) to allow iteration only through the
> entities participating in a given stream.
> 
> This is useful to allow calling .s_stream() callback only in the
> subdevices that requires to be enabled/disabled, and avoid calling this
> callback when not required.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v3:
> - Patch re-added in the series from version 1
> 
> Changes in v2: None
> 
>  drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++++++++++++++---
>  include/media/media-entity.h | 15 +++++++++++++++
>  2 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 211279c5fd77d..0d44c2de23e6f 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -228,6 +228,11 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
>   * Graph traversal
>   */
>  
> +enum media_graph_walk_type {
> +	MEDIA_GRAPH_WALK_CONNECTED_NODES,
> +	MEDIA_GRAPH_WALK_STREAM_NODES,
> +};
> +
>  static struct media_entity *
>  media_entity_other(struct media_entity *entity, struct media_link *link)
>  {
> @@ -305,7 +310,8 @@ void media_graph_walk_start(struct media_graph *graph,
>  }
>  EXPORT_SYMBOL_GPL(media_graph_walk_start);
>  
> -static void media_graph_walk_iter(struct media_graph *graph)
> +static void media_graph_walk_iter(struct media_graph *graph,
> +				  enum media_graph_walk_type type)
>  {
>  	struct media_entity *entity = stack_top(graph);
>  	struct media_link *link;
> @@ -326,6 +332,15 @@ static void media_graph_walk_iter(struct media_graph *graph)
>  	/* Get the entity in the other end of the link . */
>  	next = media_entity_other(entity, link);
>  
> +	if (type == MEDIA_GRAPH_WALK_STREAM_NODES
> +	    && next == link->sink->entity) {
> +		link_top(graph) = link_top(graph)->next;
> +		dev_dbg(entity->graph_obj.mdev->dev,
> +			"walk: skipping '%s' (outside of the stream path)\n",
> +			link->sink->entity->name);
> +		return;
> +	}
> +
>  	/* Has the entity already been visited? */
>  	if (media_entity_enum_test_and_set(&graph->ent_enum, next)) {
>  		link_top(graph) = link_top(graph)->next;
> @@ -342,7 +357,9 @@ static void media_graph_walk_iter(struct media_graph *graph)
>  		next->name);
>  }
>  
> -struct media_entity *media_graph_walk_next(struct media_graph *graph)
> +static struct media_entity *
> +__media_graph_walk_next(struct media_graph *graph,
> +			enum media_graph_walk_type type)
>  {
>  	struct media_entity *entity;
>  
> @@ -355,7 +372,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
>  	 * found.
>  	 */
>  	while (link_top(graph) != &stack_top(graph)->links)
> -		media_graph_walk_iter(graph);
> +		media_graph_walk_iter(graph, type);
>  
>  	entity = stack_pop(graph);
>  	dev_dbg(entity->graph_obj.mdev->dev,
> @@ -363,8 +380,19 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
>  
>  	return entity;
>  }
> +
> +struct media_entity *media_graph_walk_next(struct media_graph *graph)
> +{
> +	return __media_graph_walk_next(graph, MEDIA_GRAPH_WALK_CONNECTED_NODES);
> +}
>  EXPORT_SYMBOL_GPL(media_graph_walk_next);
>  
> +struct media_entity *media_graph_walk_next_stream(struct media_graph *graph)
> +{
> +	return __media_graph_walk_next(graph,  MEDIA_GRAPH_WALK_STREAM_NODES);

One space to much after the ','. With this fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +}
> +EXPORT_SYMBOL_GPL(media_graph_walk_next_stream);
> +
>  int media_entity_get_fwnode_pad(struct media_entity *entity,
>  				struct fwnode_handle *fwnode,
>  				unsigned long direction_flags)
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 8cb2c504a05c7..f17a5180ce524 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -927,6 +927,21 @@ void media_graph_walk_start(struct media_graph *graph,
>   */
>  struct media_entity *media_graph_walk_next(struct media_graph *graph);
>  
> +/**
> + * media_graph_walk_next_stream - Get the next entity in the graph
> + * @graph: Media graph structure
> + *
> + * Perform a depth-first traversal of the given media entities graph only
> + * following links from sink to source (and not the opposite).
> + *
> + * The graph structure must have been previously initialized with a call to
> + * media_graph_walk_start().
> + *
> + * Return: returns the next entity in the graph in the stream path
> + * or %NULL if the whole stream path have been traversed.
> + */
> +struct media_entity *media_graph_walk_next_stream(struct media_graph *graph);
> +
>  /**
>   * media_pipeline_start - Mark a pipeline as streaming
>   * @entity: Starting entity
> -- 
> 2.26.0
> 

-- 
Regards,
Niklas Söderlund
