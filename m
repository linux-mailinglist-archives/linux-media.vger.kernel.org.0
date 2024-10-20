Return-Path: <linux-media+bounces-19928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C908B9A5546
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 18:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C90B2814AF
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 16:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E7D194AD6;
	Sun, 20 Oct 2024 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ml+uN4pW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB91922EE;
	Sun, 20 Oct 2024 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729442643; cv=none; b=hXTqyUjkiqpB/4+WAZ/nHZ6n9KU+/0Jf77BABuoEQkntmNa/ZaCAtFd8KRXSRIWFVCtZFTlHYrCytXHuEhxQ0H4dJly01E9xbpOrkT/uvfcE+1j2BSP95da7l3Bb21yldCDCyjgtqcA/JP6zf17DzEb0vT0Vc7TqMefpNVsIung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729442643; c=relaxed/simple;
	bh=GvjUc9EISQVY17P7P0HsrkgLTXZjnepFFKZDU77GjnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzYjaNRN9pkSSkrSGOvlz+iI+5kpLs6ttmXvZ4IMGKxSDpGmNBtW8+QxtzM++AttI6B2xz5GXKGXpBCyBv7tokxthgjFU1c+TgobGXUggKFF7vRaHePCnuhpnztFoyHUvHu0cg3d4lGwlIdUJiKRJW39toLGFFzZnBe8UPfzuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ml+uN4pW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A77A78E;
	Sun, 20 Oct 2024 18:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729442534;
	bh=GvjUc9EISQVY17P7P0HsrkgLTXZjnepFFKZDU77GjnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml+uN4pWalDw4CheCRA+UlqUiR6ctf6Iuz+HdtOzygefnkNraxujE3Dxu/XnlljpW
	 WT95RhLaCTGpsazkzyvA0vbgkl0DctAGYKjAqjw0P/couXPn0d//SPVC5ujiPlbvfk
	 1oJ+M9G0wW+2kJmm88+hOQavk2NWBsiJqeItYdb4=
Date: Sun, 20 Oct 2024 19:43:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <20241020164354.GG7770@pendragon.ideasonboard.com>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241020163534.1720297-1-tomm.merciai@gmail.com>

Hi Tommaso,

Thank you for the patch.

On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> Controls can be exposed to userspace via a v4l-subdevX device, and
> userspace has to be able to subscribe to control events so that it is
> notified when the control changes value.
> If a control handler is set for the subdev then set the HAS_EVENTS
> flag automatically into v4l2_subdev_init_finalize() and use
> v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> as default if subdev don't have .(un)subscribe control operations.

I would add here

This simplifies subdev drivers by avoiding the need to set the
V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
consistency of the API exposed to userspace.

And you can also add

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Now, can we simplify sensor drivers to drop the event handlers and the
flag ? :-)

> ---
> Changes since v1:
>  - Aligned event subscription with unsubscription as suggested by LPinchart,
>    SAilus
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 3a4ba08810d2..fad8fa1f63e8 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
>  
>  	case VIDIOC_SUBSCRIBE_EVENT:
> -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> +			return v4l2_subdev_call(sd, core, subscribe_event,
> +						vfh, arg);
> +
> +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> +		    vfh->ctrl_handler)
> +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> +
> +		return -ENOIOCTLCMD;
>  
>  	case VIDIOC_UNSUBSCRIBE_EVENT:
> -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> +						vfh, arg);
> +
> +		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
> +			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> +
> +		return -ENOIOCTLCMD;
>  
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	case VIDIOC_DBG_G_REGISTER:
> @@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
>  		}
>  	}
>  
> +	if (sd->ctrl_handler)
> +		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> +
>  	state = __v4l2_subdev_state_alloc(sd, name, key);
>  	if (IS_ERR(state))
>  		return PTR_ERR(state);

-- 
Regards,

Laurent Pinchart

