Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E4664E75E
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 07:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiLPGrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 01:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiLPGr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 01:47:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048D76BC9C
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 22:47:18 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB524505;
        Fri, 16 Dec 2022 07:47:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671173237;
        bh=EyuoxdKiSUDPfBqvzdY7WzINr0zsSlFRH/eGBr77Ln8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sK6rseyBzcPhD07epOee8i6NZiSit1C1qUtod3ULGxuPsAJ5cpXEy3zNcqTvM094E
         fQDUX4B5RRUmIczk2GVQHnsMrj1E0ek2088TinY+z1fjKk9In7uqDft8PrbqI6CdGG
         xAoisNQcJbXxJ/qW6tvLMgti3+lP4LSyGfb97710=
Message-ID: <f50012ba-3654-86b8-94b9-1600715b512e@ideasonboard.com>
Date:   Fri, 16 Dec 2022 08:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 5/5] media: xilinx: dma: Use
 media_pipeline_for_each_pad()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-6-laurent.pinchart@ideasonboard.com>
 <e71c1729-a052-bda8-f277-ea0c94e64073@ideasonboard.com>
 <Y5u9m7SUmg0oKV+q@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5u9m7SUmg0oKV+q@pendragon.ideasonboard.com>
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

On 16/12/2022 02:36, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Thu, Dec 15, 2022 at 03:29:13PM +0200, Tomi Valkeinen wrote:
>> On 12/12/2022 16:16, Laurent Pinchart wrote:
>>> Replace usage of the deprecated media graph walk API with the new
>>> media_pipeline_for_each_pad() macro.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    drivers/media/platform/xilinx/xilinx-dma.c | 28 +++++-----------------
>>>    1 file changed, 6 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
>>> index 0a7fd8642a65..fee02c8c85fd 100644
>>> --- a/drivers/media/platform/xilinx/xilinx-dma.c
>>> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
>>> @@ -173,31 +173,19 @@ static int xvip_pipeline_set_stream(struct xvip_pipeline *pipe, bool on)
>>>    static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
>>>    				  struct xvip_dma *start)
>>>    {
>>> -	struct media_graph graph;
>>> -	struct media_entity *entity = &start->video.entity;
>>> -	struct media_device *mdev = entity->graph_obj.mdev;
>>> +	struct media_pipeline_pad_iter iter;
>>>    	unsigned int num_inputs = 0;
>>>    	unsigned int num_outputs = 0;
>>> -	int ret;
>>> +	struct media_pad *pad;
>>>    
>>> -	mutex_lock(&mdev->graph_mutex);
>>> -
>>> -	/* Walk the graph to locate the video nodes. */
>>> -	ret = media_graph_walk_init(&graph, mdev);
>>> -	if (ret) {
>>> -		mutex_unlock(&mdev->graph_mutex);
>>> -		return ret;
>>> -	}
>>> -
>>> -	media_graph_walk_start(&graph, entity);
>>> -
>>> -	while ((entity = media_graph_walk_next(&graph))) {
>>> +	/* Locate the video nodes in the pipeline. */
>>> +	media_pipeline_for_each_pad(&pipe->pipe, &iter, pad) {
>>>    		struct xvip_dma *dma;
>>>    
>>> -		if (entity->function != MEDIA_ENT_F_IO_V4L)
>>> +		if (pad->entity->function != MEDIA_ENT_F_IO_V4L)
>>>    			continue;
>>
>> Why do you iterate the pads here, instead of using
>> media_pipeline_for_each_entity()?
> 
> The entity iterator still iterates over all pads internally, so it's not
> more efficient. It also requires explicit initialization and cleanup, so
> is more complicated to use. In this specific case, the driver ignores
> all pads belonging to entities that are not V4L2 video nodes
> (MEDIA_ENT_F_IO_V4L). As such entities have a single pad, there's a
> guarantee they will not be visited twice.
> 
> If you think this is too fragile due to the assumption that
> MEDIA_ENT_F_IO_V4L entities have a single pad, I can use the entity
> iterator, it's not a big deal.

Well, the reason I commented was that the old code iterates entities, in 
this series you add a new way to iterate entities, and then... you don't 
use it for iterating entities =).

I think it hints that the entity iteration is not as good as one could 
wish, but I don't right away see the means to improve it. I do miss C++ 
in cases like this.

I think I would have gone with the entity iterator even if it's slightly 
more complex to use, just to highlight the point that this is iterating 
entities. But I don't mind either way.

  Tomi

