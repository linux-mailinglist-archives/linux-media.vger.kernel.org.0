Return-Path: <linux-media+bounces-19168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CDD9935DF
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5952C1F258FB
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228F01DDC19;
	Mon,  7 Oct 2024 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dDxn0MfP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08A013B58B;
	Mon,  7 Oct 2024 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325023; cv=none; b=brUDwAzKh4hJUP/87tTbQKIQ7KkFylRw1XQtO6FcunxMMFkG2gA3LZ32ptkA1/lRE1fYQWVxK5zs8EYLgpTi1b2F9AXy7lRFd8n2ItKs5Y+G6/sJ5ObwMP66R1bNu3dhwfTfI6/xhIacmcsxWrapsICl5G+HQID6BrrBAmVgJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325023; c=relaxed/simple;
	bh=i1MFloGHnOOJJAwI7DfqyXIHG/y71ogAotKuw1/xDCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWuIMnRbHN7vrO8G0+04jbv1jX5XVAHgXcizyALxsD56hLYOg/+x0jf0NG8ro796qsx6oFNGinLV+Ro/w03c2cxIbdkrJStY6ss0NjbFIJ2nNoqxLrIWZz1SI3EecpxLudhcCLwDKrUWbMjyVVKHBi6hXXrFFEXmRMDdKexCKT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dDxn0MfP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC76B792;
	Mon,  7 Oct 2024 20:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728324924;
	bh=i1MFloGHnOOJJAwI7DfqyXIHG/y71ogAotKuw1/xDCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDxn0MfPZkmBcu0JMN0xu6z2J1EBPcB8whVRDhdd4mNY4rGsShenqt5Jnw4aOIS2B
	 kA6IjfuLvqUL0IwTNYdBsxSa2x9X8EgZ7BrRkB1cHOlebikZnMvCVK4mf3HHVtgCca
	 rwSTiSummPWGrJ9phYSHCV1aZuBgzH4t9bIXhov0=
Date: Mon, 7 Oct 2024 21:16:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad
 type in call_get_frame_desc()
Message-ID: <20241007181654.GD14766@pendragon.ideasonboard.com>
References: <20241007123809.89281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007123809.89281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, Oct 07, 2024 at 01:38:09PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The `get_frame_desc()` operation should always be called on a source pad,
> which is indicated by the `MEDIA_PAD_FL_SOURCE` flag. This patch adds a
> check in `call_get_frame_desc()` to ensure that the `MEDIA_PAD_FL_SOURCE`
> flag is set for the pad before invoking `get_frame_desc()`. If the pad is
> not a source pad, the function will return an `-EOPNOTSUPP` error,
> signaling that the operation is not supported on non-source pads.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Added a check for CONFIG_MEDIA_CONTROLLER, as the `entity` member in 
>   `struct v4l2_subdev` is only available when CONFIG_MEDIA_CONTROLLER
>   is enabled.
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index de9ac67574bb..446fbc3805c7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -325,6 +325,11 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	unsigned int i;
>  	int ret;
>  
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))

As this should really not happen, I wonder if we shouldn't be more
vocal:

	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))

Sakari, what do you think ? Either way,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		return -EOPNOTSUPP;
> +#endif
> +
>  	memset(fd, 0, sizeof(*fd));
>  
>  	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);

-- 
Regards,

Laurent Pinchart

