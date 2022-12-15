Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A33464DB36
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 13:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiLOMdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 07:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiLOMdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 07:33:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408781C925
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 04:33:48 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 817C4FB;
        Thu, 15 Dec 2022 13:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671107626;
        bh=R5OqsBqqhjyv5aqVGY+lKMzrIg0aQZMTME6Rq4SWWaU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Cs7itYg74y+gVYkAcWWqSJ6zC19LlN2Jjzk9VHaJQlwQ+rUJN90/2r4dO6pM377HV
         qa2V3kprV2LlKA3u6SLSQEIe4XUTAzla9/QUrfsuyFYBKHSXA1XFq/kVl8acpaZmZZ
         gebguh7DmAEjD1pV4h5AyVz3p+XRHovE3cm5SCOE=
Message-ID: <fea9c172-65b6-8067-3957-13fbf77de6ff@ideasonboard.com>
Date:   Thu, 15 Dec 2022 14:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/5] media: mc: entity: Add pad iterator for
 media_pipeline
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212141621.724-2-laurent.pinchart@ideasonboard.com>
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
> Add a media_pipeline_for_each_pad() macro to iterate over pads in a
> pipeline. This should be used by driver as a replacement of the
> media_graph_walk API, as iterating over the media_pipeline uses the
> cached list of pads and is thus more efficient.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/mc/mc-entity.c | 18 ++++++++++++++++++
>   include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index b8bcbc734eaf..70df2050951c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -932,6 +932,24 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
>   }
>   EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
>   
> +struct media_pad *
> +__media_pipeline_pad_iter_next(struct media_pipeline *pipe,
> +			       struct media_pipeline_pad_iter *iter,
> +			       struct media_pad *pad)
> +{
> +	if (!pad)
> +		iter->cursor = pipe->pads.next;
> +
> +	if (iter->cursor == &pipe->pads)
> +		return NULL;
> +
> +	pad = list_entry(iter->cursor, struct media_pipeline_pad, list)->pad;
> +	iter->cursor = iter->cursor->next;
> +
> +	return pad;
> +}
> +EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
> +
>   /* -----------------------------------------------------------------------------
>    * Links management
>    */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 85ed08ddee9d..e881e483b550 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -130,6 +130,15 @@ struct media_pipeline_pad {
>   	struct media_pad *pad;
>   };
>   
> +/**
> + * struct media_pipeline_pad_iter - Iterator for media_pipeline_for_each_pad
> + *
> + * @cursor: The current element
> + */
> +struct media_pipeline_pad_iter {
> +	struct list_head *cursor;
> +};
> +

Is there any reason to have this iter struct in a public header, vs. 
having it in mc-entity.c?

>   /**
>    * struct media_link - A link object part of a media graph.
>    *
> @@ -1163,6 +1172,26 @@ void media_pipeline_stop(struct media_pad *pad);
>    */
>   void __media_pipeline_stop(struct media_pad *pad);
>   
> +struct media_pad *
> +__media_pipeline_pad_iter_next(struct media_pipeline *pipe,
> +			       struct media_pipeline_pad_iter *iter,
> +			       struct media_pad *pad);
> +
> +/**
> + * media_pipeline_for_each_pad - Iterate on all pads in a media pipeline
> + * @pipe: The pipeline
> + * @iter: The iterator (struct media_pipeline_pad_iter)
> + * @pad: The iterator pad

If I understand this correctly, both iter and pad are just variables the 
macro will use. In other words, they are not used to pass any values.

Would it be better to declare those variables in the macro itself? Well, 
that has its downsides. But perhaps at least clarify in the doc that 
they are only variables used by the loop, and do not need to be initialized.

> + * Iterate on all pads in a media pipeline. This is only valid after the
> + * pipeline has been built with media_pipeline_start() and before it gets
> + * destroyed with media_pipeline_stop().
> + */
> +#define media_pipeline_for_each_pad(pipe, iter, pad)			\
> +	for (pad = __media_pipeline_pad_iter_next((pipe), iter, NULL);	\
> +	     pad != NULL;						\
> +	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
> +
>   /**
>    * media_pipeline_alloc_start - Mark a pipeline as streaming
>    * @pad: Starting pad

  Tomi

