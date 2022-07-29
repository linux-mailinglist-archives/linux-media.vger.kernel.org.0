Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAF5584D65
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbiG2Iax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 04:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbiG2Iav (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 04:30:51 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6973AE48
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 01:30:50 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id j63so7009056ybb.13
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aHQFG+YOVjWFm3vwEZzGlZA/Sh/k+uVZOjKE7m9hf+Q=;
        b=LqJp1IuAZ3x8eeoRVFZBCqsOFzKXjVFVDdY9euxBG1GUyuWRKtDBW6eCtHjAiE4KRe
         UA/TnaxQ10X6NXQcQo20ujN8aIEdgVMz6wWIs4rN7NkW/o/fHu4da0iXUbHKvFsVoqSG
         6/SCT2F1X59H3w+8CJ01HKlc9/tGyJCG0krlprmz1xHgckZvsparmjeKgJCBNa4MhoNP
         DR3qj6I2N0bEFo1xaCv0zoKYTbsFjpusW639/R1Fyr6frno0KhueyxruaBIkycuI/mXG
         INz0y4VjTitvA3KGG4jJp+7QghZLsh3ntWRS6V3as2XHCI8VPWpRY1YYAq40Vf9IVlei
         bGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aHQFG+YOVjWFm3vwEZzGlZA/Sh/k+uVZOjKE7m9hf+Q=;
        b=QoqVILC0wX0WC91Wu98hNv3cOd99UU2kiup/XHy/rQ60/Rj/BxHfFKLrmP0/ECqLz0
         TmxcmMl6co7BBjbePAl0DGwX/Wes4qlWQn2bQ/k0JeXCwfW3ptX/O4BvXw5jOODXkjnS
         SQjECbr51yIKWJiGrAZglOLXMRZb51hwLNuygqgSPtwhxXEtTtRMOT3adxmrKre0eiHO
         5xY1VKIuxVrbOBKyn1vGZQM0fyqZCrrAIwkl1YGs0E4qFeGSg+rfkaXkTiqkZ7iR6nrT
         5a9nZ5itxobQRCfvJ0k3DMoGDfkTNk4HDYOKJWFtm4wKAWEjCyjk5zSNe5M0sZEGoqGW
         2nmA==
X-Gm-Message-State: ACgBeo2gC1GZwW4MsC1NYR4Z/hjU5QiLSoMb1Hx5CkZ7yMBYRcQsKK0t
        4gtQHJWjB3oa0CrCutJhMawKbzdFYcWnqxl+8dQZVw==
X-Google-Smtp-Source: AA6agR68gxtyTHBG48SGsic/B2Iyk+yjAOXqSZutO/nH/r4x6NNl4uBeW56bs0ksgfiWyO+reOlT+5a/tW5BqZF/eDc=
X-Received: by 2002:a25:d682:0:b0:672:6b8e:cd97 with SMTP id
 n124-20020a25d682000000b006726b8ecd97mr1672432ybg.53.1659083449826; Fri, 29
 Jul 2022 01:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com> <20220727103639.581567-9-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220727103639.581567-9-tomi.valkeinen@ideasonboard.com>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Fri, 29 Jul 2022 01:30:39 -0700
Message-ID: <CAG0LG97p4X9oVa7GJxiGvZKzKY45ivPMi2QHeH=k4M7GSo5FrA@mail.gmail.com>
Subject: Re: [EXT] [PATCH v12 08/30] media: mc: entity: add
 media_pipeline_alloc_start & media_pipeline_stop_free
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thanks for the patch.

On Wed, Jul 27, 2022 at 3:37 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Add new versions of media_pipeline_start() and media_pipeline_stop().
> The new functions can be used by drivers that do not need to extend the
> media_pipeline with their own structs, and the new functions will handle
> allocating and freeing the media_pipeline as needed.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 49 ++++++++++++++++++++++++++++++++++++
>  include/media/media-entity.h | 22 ++++++++++++++++
>  2 files changed, 71 insertions(+)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 0d0d6c0dda16..b7b6c6411aa7 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -579,6 +579,55 @@ void media_pipeline_stop(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL_GPL(media_pipeline_stop);
>
> +__must_check int media_pipeline_alloc_start(struct media_entity *entity)
> +{
> +       struct media_device *mdev = entity->graph_obj.mdev;
> +       struct media_pipeline *pipe;
> +       int ret;
> +       bool new_pipe = false;
> +
> +       mutex_lock(&mdev->graph_mutex);
> +
> +       /*
> +        * Is the entity already part of a pipeline? If not, we need to allocate
> +        * a pipe.
> +        */
> +       pipe = media_entity_pipeline(entity);
> +       if (!pipe) {
> +               pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);

Please add NULL check here to handle the allocation failure.

> +               new_pipe = true;
> +       }
> +
> +       ret = __media_pipeline_start(entity, pipe);
> +       if (ret) {
> +               if (new_pipe)
> +                       kfree(pipe);
> +       }
> +
> +       mutex_unlock(&mdev->graph_mutex);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);

Just a suggestion. It would be nice to extend the
media_pipeline_start() instead of adding a new function. The caller
can pass pipe as NULL as below.
      media_pipeline_start(entity, NULL)
And allocation can happen inside media_pipeline_start() when pipe is NULL.

Regards,
Satish

> +
> +void media_pipeline_stop_free(struct media_entity *entity)
> +{
> +       struct media_device *mdev = entity->graph_obj.mdev;
> +       struct media_pipeline *pipe;
> +
> +       mutex_lock(&mdev->graph_mutex);
> +
> +       pipe = media_entity_pipeline(entity);
> +
> +       __media_pipeline_stop(entity);
> +
> +       if (pipe && pipe->start_count == 0)
> +               kfree(pipe);
> +
> +       mutex_unlock(&mdev->graph_mutex);
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_stop_free);
> +
>  /* -----------------------------------------------------------------------------
>   * Links management
>   */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 6c0d0a00d58e..13a882a7839c 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1035,6 +1035,28 @@ void media_pipeline_stop(struct media_entity *entity);
>   */
>  void __media_pipeline_stop(struct media_entity *entity);
>
> +/**
> + * media_pipeline_alloc_start - Mark a pipeline as streaming
> + * @entity: Starting entity
> + *
> + * media_pipeline_alloc_start() is similar to media_pipeline_start() but
> + * instead of working on a given pipeline the function will allocate a new
> + * pipeline if needed.
> + *
> + * Calls to media_pipeline_alloc_start() must be matched with
> + * media_pipeline_stop_free().
> + */
> +__must_check int media_pipeline_alloc_start(struct media_entity *entity);
> +
> +/**
> + * media_pipeline_stop_free - Mark a pipeline as not streaming
> + * @entity: Starting entity
> + *
> + * media_pipeline_stop_free() is similar to media_pipeline_stop() but will
> + * also free the pipeline when the start_count drops to 0.
> + */
> +void media_pipeline_stop_free(struct media_entity *entity);
> +
>  /**
>   * media_devnode_create() - creates and initializes a device node interface
>   *
> --
> 2.34.1
>
