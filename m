Return-Path: <linux-media+bounces-15579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70D941525
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 17:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C73284FC8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28FF1A2C1E;
	Tue, 30 Jul 2024 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YTwysXdV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4B1A2553;
	Tue, 30 Jul 2024 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352180; cv=none; b=GYd0oVAY6IRyRNlSHyhl4lvFmJ1SH0J+yWn11TSknQVQQB+XRr77HuMnppVOhOeyp4lz3f9t2YknBUc4/fcv2953LpPRW8r8OHQR1g2mppavpvdTayrmgqJu0yiuYgQNkVlRXquLa9mCZmZl0l2cEJDiJmp8a6VeJgodltlFFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352180; c=relaxed/simple;
	bh=pxQDAovu9lTk6RWD/UQIR4USTzWJ46bI1gsHcQsAuRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpvdMWHqfAAWeBGtLrE1evXS2sOzXQq0zi5oNvk6b7so1NCiebjVU1kP1sSzLEKkQ1qpiriKde++ztGFm1SMGFVu3X3KnXxy7Vft7Sh7TE00WbNQW60sXh8xJGeUsRsKpDRS4jRtH6o9YmpBuDeCfF/3N31xzknxe+ku53xASF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YTwysXdV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8809F743;
	Tue, 30 Jul 2024 17:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722352128;
	bh=pxQDAovu9lTk6RWD/UQIR4USTzWJ46bI1gsHcQsAuRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTwysXdVHfRi+F6rkDAQRWqCuLqo7Zs4YGwsgwTjSfdnW93i/3HjDCxfC6t86Jfl7
	 pUgBjXxRZycV5TA/yAGutDCpEBvOWElyaFgMOS/w8uUl3JyJsr6K2SABeUIijf6HGf
	 TtwLy48cOD+bOrDFF1mSAKwYh3gVhiIozQ6vn8ic=
Date: Tue, 30 Jul 2024 18:09:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v6 01/18] media: mc-entity: Record number of video
 devices in a pipeline
Message-ID: <20240730150915.GA8146@pendragon.ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709132906.3198927-2-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:28:49PM +0100, Daniel Scally wrote:
> Record the number of video devices in a pipeline so that we can track
> in a central location how many need to be started before drivers must
> actually begin streaming.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v6:
> 
> 	- New patch. This is intended to support Sakari's requirement for the
> 	  driver not to start streaming before all of the video devices have
> 	  called streamon(). This was the cleanest way I could think to acheive
> 	  the goal, and lets us just check for start_count == required_count
> 	  before streaming.

This violates the abstraction layers a bit, the MC code isn't supposed
to handle video devices like that.

What you can instead do is to use media_pipeline_for_each_entity() in
your driver when starting the pipeline to iterate over all entities, and
count the video devices there.

> 
>  drivers/media/mc/mc-entity.c | 5 +++++
>  include/media/media-entity.h | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 96dd0f6ccd0d..1e8186b13b55 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -596,6 +596,9 @@ static int media_pipeline_add_pad(struct media_pipeline *pipe,
>  
>  	list_add_tail(&ppad->list, &pipe->pads);
>  
> +	if (pad->entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
> +		pipe->required_count++;
> +
>  	dev_dbg(pad->graph_obj.mdev->dev,
>  		"media pipeline: added pad '%s':%u\n",
>  		pad->entity->name, pad->index);
> @@ -713,6 +716,8 @@ static void media_pipeline_cleanup(struct media_pipeline *pipe)
>  		list_del(&ppad->list);
>  		kfree(ppad);
>  	}
> +
> +	pipe->required_count = 0;
>  }
>  
>  static int media_pipeline_populate(struct media_pipeline *pipe,
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 0393b23129eb..ab84458b40dc 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -104,12 +104,14 @@ struct media_graph {
>   * @mdev:		The media device the pipeline is part of
>   * @pads:		List of media_pipeline_pad
>   * @start_count:	Media pipeline start - stop count
> + * @required_count:	Number of starts required to be "running"
>   */
>  struct media_pipeline {
>  	bool allocated;
>  	struct media_device *mdev;
>  	struct list_head pads;
>  	int start_count;
> +	int required_count;
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart

