Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B185A64DB99
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 13:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLOMta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 07:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiLOMtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 07:49:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020F9221
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 04:49:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02B4CFB;
        Thu, 15 Dec 2022 13:49:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671108542;
        bh=mp61nf2ScvV944VCCIpe9cw4//xtj6rw0Et154PjP/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pRm33B87oKFUmCWKZFrzBrXDjaCK/G8KQH42GxodivctrSdo4VSbGQmOJaOF6055c
         woUBzTHKuxUYKCxpvrzGyl5ZUctprL7Qz3TKH9xQ3vDMEzaJAIp/eCp4s963PkFvTy
         0MHxx6KS0Q3igYWHMueT4eu63PS9N71oEypLZLjY=
Date:   Thu, 15 Dec 2022 14:48:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 1/5] media: mc: entity: Add pad iterator for
 media_pipeline
Message-ID: <Y5sXus6z6h1tf18b@pendragon.ideasonboard.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-2-laurent.pinchart@ideasonboard.com>
 <fea9c172-65b6-8067-3957-13fbf77de6ff@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fea9c172-65b6-8067-3957-13fbf77de6ff@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Dec 15, 2022 at 02:33:43PM +0200, Tomi Valkeinen wrote:
> On 12/12/2022 16:16, Laurent Pinchart wrote:
> > Add a media_pipeline_for_each_pad() macro to iterate over pads in a
> > pipeline. This should be used by driver as a replacement of the
> > media_graph_walk API, as iterating over the media_pipeline uses the
> > cached list of pads and is thus more efficient.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/mc/mc-entity.c | 18 ++++++++++++++++++
> >   include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
> >   2 files changed, 47 insertions(+)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index b8bcbc734eaf..70df2050951c 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -932,6 +932,24 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
> >   }
> >   EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
> >   
> > +struct media_pad *
> > +__media_pipeline_pad_iter_next(struct media_pipeline *pipe,
> > +			       struct media_pipeline_pad_iter *iter,
> > +			       struct media_pad *pad)
> > +{
> > +	if (!pad)
> > +		iter->cursor = pipe->pads.next;
> > +
> > +	if (iter->cursor == &pipe->pads)
> > +		return NULL;
> > +
> > +	pad = list_entry(iter->cursor, struct media_pipeline_pad, list)->pad;
> > +	iter->cursor = iter->cursor->next;
> > +
> > +	return pad;
> > +}
> > +EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
> > +
> >   /* -----------------------------------------------------------------------------
> >    * Links management
> >    */
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 85ed08ddee9d..e881e483b550 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -130,6 +130,15 @@ struct media_pipeline_pad {
> >   	struct media_pad *pad;
> >   };
> >   
> > +/**
> > + * struct media_pipeline_pad_iter - Iterator for media_pipeline_for_each_pad
> > + *
> > + * @cursor: The current element
> > + */
> > +struct media_pipeline_pad_iter {
> > +	struct list_head *cursor;
> > +};
> > +
> 
> Is there any reason to have this iter struct in a public header, vs. 
> having it in mc-entity.c?

It has to be instantiated on the stack by the user of the
media_pipeline_for_each_pad() macro. A typical usage is

	struct media_pipeline_pad_iter iter;
	struct media_pad *pad

	media_pipeline_for_each_pad(pipe, &iter, pad) {
		...
	};

Note how iter is not a pointer.

> >   /**
> >    * struct media_link - A link object part of a media graph.
> >    *
> > @@ -1163,6 +1172,26 @@ void media_pipeline_stop(struct media_pad *pad);
> >    */
> >   void __media_pipeline_stop(struct media_pad *pad);
> >   
> > +struct media_pad *
> > +__media_pipeline_pad_iter_next(struct media_pipeline *pipe,
> > +			       struct media_pipeline_pad_iter *iter,
> > +			       struct media_pad *pad);
> > +
> > +/**
> > + * media_pipeline_for_each_pad - Iterate on all pads in a media pipeline
> > + * @pipe: The pipeline
> > + * @iter: The iterator (struct media_pipeline_pad_iter)
> > + * @pad: The iterator pad
> 
> If I understand this correctly, both iter and pad are just variables the 
> macro will use. In other words, they are not used to pass any values.
> 
> Would it be better to declare those variables in the macro itself? Well, 
> that has its downsides. But perhaps at least clarify in the doc that 
> they are only variables used by the loop, and do not need to be initialized.

Now that the kernel uses C99, I suppose we could make the pad variable
locally declared within the loop:

#define media_pipeline_for_each_pad(pipe, pad)				\
	for (struct media_pipeline_pad *pad = __media_pipeline_pad_iter_next((pipe), iter, NULL);	\
	     pad != NULL;						\
	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))

Hiding the iter variable would be more difficult, as I don't think you
can declare multiple variables of different types.

I'm a bit concerned about backporting though, so I'd rather not do this
in this patch, but on top.

> > + * Iterate on all pads in a media pipeline. This is only valid after the
> > + * pipeline has been built with media_pipeline_start() and before it gets
> > + * destroyed with media_pipeline_stop().
> > + */
> > +#define media_pipeline_for_each_pad(pipe, iter, pad)			\
> > +	for (pad = __media_pipeline_pad_iter_next((pipe), iter, NULL);	\
> > +	     pad != NULL;						\
> > +	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
> > +
> >   /**
> >    * media_pipeline_alloc_start - Mark a pipeline as streaming
> >    * @pad: Starting pad

-- 
Regards,

Laurent Pinchart
