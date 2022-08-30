Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50DB35A6251
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 13:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiH3LoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 07:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiH3Lnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 07:43:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B095560FB
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 04:43:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2E5A481;
        Tue, 30 Aug 2022 13:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661859779;
        bh=41U9saKQFn/BiqEFN9dkcqfJVyF89Br4xWwW0rFx+MI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jt5A0Xtc62Ow84LBiA0F5ZyFMA+v695FGXCrALOfbdzenL8wltTcY5I2rlfzRBu3x
         /gQ2VefgkcLzaGfqlumIHsLJ1p+cm54+OQ6pac+rXwji5FoN/u5a1NrHII/O5juspt
         rK8+BAHKZ5DIFfIMrr4grSBj+L5ey4YgGamEvS0g=
Date:   Tue, 30 Aug 2022 14:42:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v13 12/34] media: mc: entity: add alloc variant of
 pipeline_start
Message-ID: <Yw33uHNg94EI8CIj@pendragon.ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-13-tomi.valkeinen@ideasonboard.com>
 <Ywzv7oCiubQwqSdK@pendragon.ideasonboard.com>
 <e3576d29-a2fa-32e7-78d4-583b8abb414e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3576d29-a2fa-32e7-78d4-583b8abb414e@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Aug 30, 2022 at 02:08:53PM +0300, Tomi Valkeinen wrote:
> On 29/08/2022 19:57, Laurent Pinchart wrote:
> > On Wed, Aug 10, 2022 at 03:11:00PM +0300, Tomi Valkeinen wrote:
> >> Add new variant of media_pipeline_start(), media_pipeline_alloc_start().
> >>
> >> media_pipeline_alloc_start() can be used by drivers that do not need to
> >> extend the media_pipeline. The function will either use the pipeline
> >> already associated with the entity, if such exists, or allocate a new
> >> pipeline.
> >>
> >> When media_pipeline_stop() is called and the pipeline's use count drops
> >> to zero, the pipeline is automatically freed.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/mc/mc-entity.c       | 41 ++++++++++++++++++++++++++++++
> >>   drivers/media/v4l2-core/v4l2-dev.c | 11 ++++++++
> >>   include/media/media-entity.h       | 14 ++++++++++
> >>   include/media/v4l2-dev.h           | 14 ++++++++++
> >>   4 files changed, 80 insertions(+)
> >>
> >> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> >> index b1abaa333d13..d277eed11caf 100644
> >> --- a/drivers/media/mc/mc-entity.c
> >> +++ b/drivers/media/mc/mc-entity.c
> >> @@ -529,6 +529,8 @@ void __media_pipeline_stop(struct media_entity *entity)
> >>   
> >>   	media_graph_walk_cleanup(graph);
> >>   
> >> +	if (pipe->allocated)
> >> +		kfree(pipe);
> >>   }
> >>   EXPORT_SYMBOL_GPL(__media_pipeline_stop);
> >>   
> >> @@ -542,6 +544,45 @@ void media_pipeline_stop(struct media_entity *entity)
> >>   }
> >>   EXPORT_SYMBOL_GPL(media_pipeline_stop);
> >>   
> >> +__must_check int media_pipeline_alloc_start(struct media_entity *entity)
> >> +{
> >> +	struct media_device *mdev = entity->graph_obj.mdev;
> >> +	struct media_pipeline *pipe;
> >> +	int ret;
> >> +	bool new_pipe = false;
> >> +
> >> +	mutex_lock(&mdev->graph_mutex);
> >> +
> >> +	/*
> >> +	 * Is the entity already part of a pipeline? If not, we need to allocate
> >> +	 * a pipe.
> >> +	 */
> >> +	pipe = media_entity_pipeline(entity);
> >> +	if (!pipe) {
> >> +		pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
> >> +
> > 
> > You can drop the blank line.
> 
> Ok.
> 
> >> +		if (!pipe) {
> >> +			ret = -ENOMEM;
> >> +			goto out;
> >> +		}
> >> +
> >> +		new_pipe = true;
> >> +		pipe->allocated = true;
> >> +	}
> >> +
> >> +	ret = __media_pipeline_start(entity, pipe);
> >> +	if (ret) {
> >> +		if (new_pipe)
> >> +			kfree(pipe);
> > 
> > If new_pipe was a media_pipeline pointer, initialized to NULL and set to
> > pipe when you allocate the pipe, you could write this
> > 
> > 	if (ret)
> > 		kfree(new_pipe);
> 
> Yes, that's slightly neater.
> 
> > I don't mind much either way.
> > 
> > I have no objection against this patch, but I don't think it aligns well
> > with what I was imagining as further evolutions of the API. I would like
> > the pipe to be turned into an object similar to a DRM atomic commit.
> > There will thus never be a need for drivers to allocate the pipeline, it
> > will be done by the framework. We can rework (and likely drop) this
> > function when that happens.
> 
> True, but isn't this a bit in the right direction? This goes a bit 
> towards automating the pipeline management. Having the drivers use this 
> instead of doing the management themselves should make it easier to 
> eventually move to a framework managed model.

It's hard for me at this point to tell how much this would help, I don't
have enough visibility. I think it doesn't go in the wrong direction, so
it's OK :-)

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
