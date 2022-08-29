Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D505A5117
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 18:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiH2QIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 12:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiH2QIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 12:08:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C0B97D48
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 09:08:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC147505;
        Mon, 29 Aug 2022 18:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661789315;
        bh=TCyriV6oSMWokSNpEtJDYW1tfOZVnjiG/INExtEQ7Fs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+krY+r2YRzAatFD4rXD7HEhQlz7vcgyMCoVIaecPtWPQ5nkoBPj32k5iXO+/VzaB
         56/qjpq/QpIWa/vQLvJlm8m/rMFKs4/7VDPfaxvxT8EE1gdDDgRL44vXegX0pJ/eiZ
         ULcNymWDR4zJWF9NR0l/QzthHZO2Vuvf0cIafm4k=
Date:   Mon, 29 Aug 2022 19:08:25 +0300
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
Subject: Re: [PATCH v13 04/34] media: mc: entity: Rename streaming_count ->
 start_count
Message-ID: <YwzkeXtqQ9F6L2wZ@pendragon.ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810121122.3149086-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Aug 10, 2022 at 03:10:52PM +0300, Tomi Valkeinen wrote:
> 'streaming_count' is a bit misleading name, as the count is increased
> with media_pipeline_start(). Let's rename it to 'start_count' instead.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-entity.c                            | 8 ++++----
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 ++--
>  include/media/media-entity.h                            | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 11f5207f73aa..d284f616a456 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -414,8 +414,8 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  	struct media_link *link;
>  	int ret;
>  
> -	if (pipe->streaming_count) {
> -		pipe->streaming_count++;
> +	if (pipe->start_count) {
> +		pipe->start_count++;
>  		return 0;
>  	}
>  
> @@ -498,7 +498,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  		}
>  	}
>  
> -	pipe->streaming_count++;
> +	pipe->start_count++;
>  
>  	return 0;
>  
> @@ -551,7 +551,7 @@ void __media_pipeline_stop(struct media_entity *entity)
>  	if (WARN_ON(!pipe))
>  		return;
>  
> -	if (--pipe->streaming_count)
> +	if (--pipe->start_count)
>  		return;
>  
>  	media_graph_walk_start(graph, entity);
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index fee2aaacb26b..0ebd70275e23 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -931,7 +931,7 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
>  	 * If the other capture is streaming, isp and sensor nodes shouldn't
>  	 * be disabled, skip them.
>  	 */
> -	if (rkisp1->pipe.streaming_count < 2) {
> +	if (rkisp1->pipe.start_count < 2) {
>  		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
>  				 false);
>  		v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
> @@ -964,7 +964,7 @@ static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
>  	 * If the other capture is streaming, isp and sensor nodes are already
>  	 * enabled, skip them.
>  	 */
> -	if (rkisp1->pipe.streaming_count > 1)
> +	if (rkisp1->pipe.start_count > 1)
>  		return 0;
>  
>  	ret = v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, true);
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 3e3d06c1ec36..68a8ecb2b397 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -100,11 +100,11 @@ struct media_graph {
>  /**
>   * struct media_pipeline - Media pipeline related information
>   *
> - * @streaming_count:	Streaming start count - streaming stop count
> + * @start_count:	Media pipeline start - stop count
>   * @graph:		Media graph walk during pipeline start / stop
>   */
>  struct media_pipeline {
> -	int streaming_count;
> +	int start_count;
>  	struct media_graph graph;
>  };
>  

-- 
Regards,

Laurent Pinchart
