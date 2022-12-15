Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E086F64DC12
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 14:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiLONQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 08:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiLONQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 08:16:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2452BB2F
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 05:16:32 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 289B7327;
        Thu, 15 Dec 2022 14:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671110190;
        bh=veZ2Rj6IyY/Pwk2ziYRC+sG0XLoae7438dwuNLO7KKw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RLsc7/6NT2S1JNTFwL51t9y0ehuB+O17GGr39cELQWpB05S5NuHks6QIClsdOHS0E
         EAPR1EG3/oUXgNfOGfgIcYL/iYjhiDFEQGm/R3nLHR0WSvhOgYE5r4IW1A/9TFBlCY
         zJ2esWATkGBR/afRhuOSAnx6P35UyPzCp25lmMOU=
Message-ID: <ca33baab-3827-dcb6-2b5c-c49992c4597a@ideasonboard.com>
Date:   Thu, 15 Dec 2022 15:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 3/5] media: ti: omap3isp: Use
 media_pipeline_for_each_entity()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20221212141621.724-1-laurent.pinchart@ideasonboard.com>
 <20221212141621.724-4-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212141621.724-4-laurent.pinchart@ideasonboard.com>
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
> media_pipeline_for_each_entity() macro.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/ti/omap3isp/ispvideo.c | 21 +++----------------
>   1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 3e5348c63773..aa81b5564b4f 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -221,22 +221,11 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
>   static int isp_video_get_graph_data(struct isp_video *video,
>   				    struct isp_pipeline *pipe)
>   {
> -	struct media_graph graph;
> -	struct media_entity *entity = &video->video.entity;
> -	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_pipeline_entity_iter iter;
> +	struct media_entity *entity;
>   	struct isp_video *far_end = NULL;
> -	int ret;
>   
> -	mutex_lock(&mdev->graph_mutex);
> -	ret = media_graph_walk_init(&graph, mdev);
> -	if (ret) {
> -		mutex_unlock(&mdev->graph_mutex);
> -		return ret;
> -	}
> -
> -	media_graph_walk_start(&graph, entity);
> -
> -	while ((entity = media_graph_walk_next(&graph))) {
> +	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
>   		struct isp_video *__video;
>   
>   		media_entity_enum_set(&pipe->ent_enum, entity);
> @@ -255,10 +244,6 @@ static int isp_video_get_graph_data(struct isp_video *video,
>   			far_end = __video;
>   	}
>   
> -	mutex_unlock(&mdev->graph_mutex);
> -
> -	media_graph_walk_cleanup(&graph);
> -
>   	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>   		pipe->input = far_end;
>   		pipe->output = video;

media_pipeline_entity_iter_init() and media_pipeline_entity_iter_cleanup()?

  Tomi

