Return-Path: <linux-media+bounces-234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047247E9CB3
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A22C280CF0
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BB31DDDC;
	Mon, 13 Nov 2023 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GRNLiaLO"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538301DA39
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:03:45 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA09410EA
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:03:43 -0800 (PST)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 460FD10A;
	Mon, 13 Nov 2023 14:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699880597;
	bh=KK7iSpHyq0WI+Js6jh9eHvruWZAA677+sN3hI4To2G4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRNLiaLO+nfczSmHyZoGd58NPY4SIONVIjh2vJTd8MePgOUu2AqOMZj10xqooBzL+
	 rV+MiTULPpEekjQYsSZRoNceSm316ZwkxxSH2oqxYeatuqXPZxaHqnTyd36xA1vTZX
	 k/juf2bl3zT2LpSujgpCCj5SiaJStmilgon77mo8=
Message-ID: <f542bb33-57fb-4ce1-bb08-85b69a8cd40a@ideasonboard.com>
Date: Mon, 13 Nov 2023 15:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link
 validation
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2023 12:17, Laurent Pinchart wrote:
> Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
> whose source was a video device and sink a subdev. The helper was (and

Didn't it also ignore links where the sink is a video device?

> still is) used by drivers in such cases, in particular for subdevs with
> multiple sink pads, some connected to video devices and some to other
> subdevs.
> 
> Then, commit a6b995ed03ff ("media: subdev: use streams in
> v4l2_subdev_link_validate()") assumed the entities on the two sides of a
> link are both subdevs, and caused crashes in drivers that use the helper
> with subdev sink pads connected to video devices. Commit 55f1ecb11990
> ("media: v4l: subdev: Make link validation safer"), merged in v6.4,
> fixed the crash by adding an explicit check with a pr_warn_once(),
> mentioning a driver bug.
> 
> Links between a subdev and a video device need to be validated, and
> v4l2_subdev_link_validate() can't handle that. Drivers typically handle
> this validation manually at stream start time (either in the .streamon()
> ioctl handler, or in the .start_streaming() vb2 queue operation),
> instead of implementing a custom .link_validate() handler. Forbidding
> usage of v4l2_subdev_link_validate() as the .link_validate() handler
> would thus force all subdev drivers that mix source links to subdev and
> video devices to implement a custom .link_validate() handler that
> returns immediately for the video device links and call
> v4l2_subdev_link_validate() for subdev links. This would create lots of
> duplicated code for no real gain. Instead, relax the check in
> v4l2_ctrl_modify_range() to ignore links from a video device to a subdev

v4l2_ctrl_modify_range? copy-paste error?

Should the check also be relaxed wrt. video device as a sink?

> without printing any warning.

As Sakari said, it would make sense to use .link_validate() to validate 
all links.

But if this warning is getting printed at the moment, then I think this 
is a valid fix (maybe with the sink side handled too, if needed).

  Tomi

> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 67d43206ce32..b00be1d57e05 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
>   	struct v4l2_subdev *source_sd, *sink_sd;
>   	struct v4l2_subdev_state *source_state, *sink_state;
>   	bool states_locked;
> +	bool is_sink_subdev;
> +	bool is_source_subdev;
>   	int ret;
>   
> -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> -			     "sink" : "source",
> -			     link->source->entity->name, link->source->index,
> -			     link->sink->entity->name, link->sink->index);
> +	is_sink_subdev = is_media_entity_v4l2_subdev(link->sink->entity);
> +	is_source_subdev = is_media_entity_v4l2_subdev(link->source->entity);
> +
> +	if (!is_sink_subdev || !is_source_subdev) {
> +		/*
> +		 * Do not print the warning if the source is a video device and
> +		 * the sink a subdev. This is a valid use case, to allow usage
> +		 * of this helper by subdev drivers that have multiple sink
> +		 * pads, some connected to video devices and some connected to
> +		 * other subdevs. The video device to subdev link is typically
> +		 * validated manually by the driver at stream start time in such
> +		 * cases.
> +		 */
> +		if (!is_sink_subdev ||
> +		    !is_media_entity_v4l2_video_device(link->source->entity))
> +			pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> +				     !is_sink_subdev ? "sink" : "source",
> +				     link->source->entity->name,
> +				     link->source->index,
> +				     link->sink->entity->name,
> +				     link->sink->index);
>   		return 0;
>   	}
>   


