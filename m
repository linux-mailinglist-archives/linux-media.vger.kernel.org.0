Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB03464DC44
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 14:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiLON3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 08:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLON3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 08:29:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2390716487
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 05:29:18 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B39327;
        Thu, 15 Dec 2022 14:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671110956;
        bh=mAJXqxKqqLXELzNUb+EOuezI8ULwyyIWTH2b+LurwRA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=d1LFqFrOiXx081kQ9PcbeNqQ12edCM9cYIrmTjbbRaK5Jcx4j3XCkIFsAfSi4ZkrZ
         wce5seqlypafneV0PD7xSzdfcyeltMWeZal8lrUOBnhx2MdEjc12UgbGuZVz3BLHhj
         KrIajVwOhyQ25EaRr72Nm8VMuxeGzczvZ0+Kz2z8=
Message-ID: <e71c1729-a052-bda8-f277-ea0c94e64073@ideasonboard.com>
Date:   Thu, 15 Dec 2022 15:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 5/5] media: xilinx: dma: Use
 media_pipeline_for_each_pad()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-6-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212141621.724-6-laurent.pinchart@ideasonboard.com>
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
> Replace usage of the deprecated media graph walk API with the new
> media_pipeline_for_each_pad() macro.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/xilinx/xilinx-dma.c | 28 +++++-----------------
>   1 file changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index 0a7fd8642a65..fee02c8c85fd 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -173,31 +173,19 @@ static int xvip_pipeline_set_stream(struct xvip_pipeline *pipe, bool on)
>   static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
>   				  struct xvip_dma *start)
>   {
> -	struct media_graph graph;
> -	struct media_entity *entity = &start->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pipeline_pad_iter iter;
>   	unsigned int num_inputs = 0;
>   	unsigned int num_outputs = 0;
> -	int ret;
> +	struct media_pad *pad;
>   
> -	mutex_lock(&mdev->graph_mutex);
> -
> -	/* Walk the graph to locate the video nodes. */
> -	ret = media_graph_walk_init(&graph, mdev);
> -	if (ret) {
> -		mutex_unlock(&mdev->graph_mutex);
> -		return ret;
> -	}
> -
> -	media_graph_walk_start(&graph, entity);
> -
> -	while ((entity = media_graph_walk_next(&graph))) {
> +	/* Locate the video nodes in the pipeline. */
> +	media_pipeline_for_each_pad(&pipe->pipe, &iter, pad) {
>   		struct xvip_dma *dma;
>   
> -		if (entity->function != MEDIA_ENT_F_IO_V4L)
> +		if (pad->entity->function != MEDIA_ENT_F_IO_V4L)
>   			continue;

Why do you iterate the pads here, instead of using 
media_pipeline_for_each_entity()?

  Tomi

