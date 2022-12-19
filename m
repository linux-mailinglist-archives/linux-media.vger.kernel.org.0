Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713AE65157E
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 23:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbiLSWWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 17:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiLSWWo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 17:22:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB47C2DF8
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 14:22:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4636825;
        Mon, 19 Dec 2022 23:22:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671488561;
        bh=gdDLb8rnde0H/0WWwlhbGTP8oBegQP/uQnsLEAUHQKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d2NY0Cpcio23ioPV6quaMvbPRh7HbKgYbRwPuszarkgnM5TuDFcrwHQiMkJUzBtpx
         7FXP5OS7r4T2DQLdSOMnbqgK3ZLkVeDuZ8n0aGEcUiCanRaAJZtFcqI3njlszysoRR
         XlIado7TDW4xBYEoE65ixXiIiy/AUm3v0oZck8Dc=
Date:   Tue, 20 Dec 2022 00:22:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 5/5] media: xilinx: dma: Use
 media_pipeline_for_each_pad()
Message-ID: <Y6DkLZn91EEK7C69@pendragon.ideasonboard.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-6-laurent.pinchart@ideasonboard.com>
 <e71c1729-a052-bda8-f277-ea0c94e64073@ideasonboard.com>
 <Y5u9m7SUmg0oKV+q@pendragon.ideasonboard.com>
 <f50012ba-3654-86b8-94b9-1600715b512e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f50012ba-3654-86b8-94b9-1600715b512e@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Dec 16, 2022 at 08:47:13AM +0200, Tomi Valkeinen wrote:
> On 16/12/2022 02:36, Laurent Pinchart wrote:
> > On Thu, Dec 15, 2022 at 03:29:13PM +0200, Tomi Valkeinen wrote:
> >> On 12/12/2022 16:16, Laurent Pinchart wrote:
> >>> Replace usage of the deprecated media graph walk API with the new
> >>> media_pipeline_for_each_pad() macro.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>    drivers/media/platform/xilinx/xilinx-dma.c | 28 +++++-----------------
> >>>    1 file changed, 6 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> >>> index 0a7fd8642a65..fee02c8c85fd 100644
> >>> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> >>> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> >>> @@ -173,31 +173,19 @@ static int xvip_pipeline_set_stream(struct xvip_pipeline *pipe, bool on)
> >>>    static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
> >>>    				  struct xvip_dma *start)
> >>>    {
> >>> -	struct media_graph graph;
> >>> -	struct media_entity *entity = &start->video.entity;
> >>> -	struct media_device *mdev = entity->graph_obj.mdev;
> >>> +	struct media_pipeline_pad_iter iter;
> >>>    	unsigned int num_inputs = 0;
> >>>    	unsigned int num_outputs = 0;
> >>> -	int ret;
> >>> +	struct media_pad *pad;
> >>>    
> >>> -	mutex_lock(&mdev->graph_mutex);
> >>> -
> >>> -	/* Walk the graph to locate the video nodes. */
> >>> -	ret = media_graph_walk_init(&graph, mdev);
> >>> -	if (ret) {
> >>> -		mutex_unlock(&mdev->graph_mutex);
> >>> -		return ret;
> >>> -	}
> >>> -
> >>> -	media_graph_walk_start(&graph, entity);
> >>> -
> >>> -	while ((entity = media_graph_walk_next(&graph))) {
> >>> +	/* Locate the video nodes in the pipeline. */
> >>> +	media_pipeline_for_each_pad(&pipe->pipe, &iter, pad) {
> >>>    		struct xvip_dma *dma;
> >>>    
> >>> -		if (entity->function != MEDIA_ENT_F_IO_V4L)
> >>> +		if (pad->entity->function != MEDIA_ENT_F_IO_V4L)
> >>>    			continue;
> >>
> >> Why do you iterate the pads here, instead of using
> >> media_pipeline_for_each_entity()?
> > 
> > The entity iterator still iterates over all pads internally, so it's not
> > more efficient. It also requires explicit initialization and cleanup, so
> > is more complicated to use. In this specific case, the driver ignores
> > all pads belonging to entities that are not V4L2 video nodes
> > (MEDIA_ENT_F_IO_V4L). As such entities have a single pad, there's a
> > guarantee they will not be visited twice.
> > 
> > If you think this is too fragile due to the assumption that
> > MEDIA_ENT_F_IO_V4L entities have a single pad, I can use the entity
> > iterator, it's not a big deal.
> 
> Well, the reason I commented was that the old code iterates entities, in 
> this series you add a new way to iterate entities, and then... you don't 
> use it for iterating entities =).
> 
> I think it hints that the entity iteration is not as good as one could 
> wish, but I don't right away see the means to improve it. I do miss C++ 
> in cases like this.

Indeed. In this specific case, it would be possible to initialize the
iterator on first use, but not to destroy it automatically if the code
breaks from the loop.

There's something else I've been thinking about: we could cache the list
of entities in the media_pipeline structure when starting the pipeline,
to facilitate iteration. The entity iterator API would become simpler
(and more efficient), but pipeline start would be more costly. Any
opinion ?

> I think I would have gone with the entity iterator even if it's slightly 
> more complex to use, just to highlight the point that this is iterating 
> entities. But I don't mind either way.

-- 
Regards,

Laurent Pinchart
