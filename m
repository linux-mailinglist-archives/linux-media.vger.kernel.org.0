Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B459369817D
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 18:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjBORAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 12:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjBORAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 12:00:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4519323644
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 09:00:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C560C25E;
        Wed, 15 Feb 2023 18:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676480438;
        bh=jcnrgUlEc0jPtGLeEdzGYHUpfM5YqGYRsBb+jPHXARk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S/FG7oGcqPQMeBCVo/dCgZx2zN3sKpXMXUANzN5CiuB+HPBWXtaEOriZSlvRyjItK
         J3xzK4iGnnmYLRe/nMcEgSxxyQC1r9Wg77veQt2w36Izy875ZZfSNGAGR2QiVI0aI4
         M2/dz8CY5Oe8Jvy3VVOo9wrqmKUcLqGRUP20XSLY=
Date:   Wed, 15 Feb 2023 19:00:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH for v6.3] media: v4l2-subdev.c: clear stream field
Message-ID: <Y+0PtUKmZmDxkkOK@pendragon.ideasonboard.com>
References: <e9cb93fd-cdb7-7e67-ca79-1e3ffd1241e6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9cb93fd-cdb7-7e67-ca79-1e3ffd1241e6@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Feb 15, 2023 at 03:48:17PM +0100, Hans Verkuil wrote:
> Both userspace and kernelspace can pass structs with an uninitialized 'stream'
> field. Since the check_state() function checks for a non-zero stream field,
> suddenly these calls will fails with -EINVAL.
> 
> So check in the wrapper functions in v4l2-subdev.c (which are used by both the
> kernel and userspace API) if V4L2_SUBDEV_FL_STREAMS is set, and if not, then zero
> the stream field.
> 
> Currently no drivers set V4L2_SUBDEV_FL_STREAMS.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good to me as a v6.3 fix. I would however like to then revert it
in v6.4 once a better fix gets developed: if an application that does
support the streams API sets the stream field to an invalid value for a
subdev that doesn't support streams, this shouldn't be silently ignored.

Could you capture this in the commit message ?

> ---
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1bebcda2bd20..db22da153002 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -197,6 +198,8 @@ static inline int check_format(struct v4l2_subdev *sd,
>  	if (!format)
>  		return -EINVAL;
> 
> +	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +		format->stream = 0;

Could you add a blank line here ? Same below. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
>  	       check_state(sd, state, format->which, format->pad, format->stream);
>  }
> @@ -224,6 +227,8 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (!code)
>  		return -EINVAL;
> 
> +	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +		code->stream = 0;
>  	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
>  	       check_state(sd, state, code->which, code->pad, code->stream) ? :
>  	       sd->ops->pad->enum_mbus_code(sd, state, code);
> @@ -236,6 +241,8 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
>  	if (!fse)
>  		return -EINVAL;
> 
> +	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +		fse->stream = 0;
>  	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
>  	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
>  	       sd->ops->pad->enum_frame_size(sd, state, fse);
> @@ -271,6 +278,8 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
>  	if (!fie)
>  		return -EINVAL;
> 
> +	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +		fie->stream = 0;
>  	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
>  	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
>  	       sd->ops->pad->enum_frame_interval(sd, state, fie);
> @@ -283,6 +292,8 @@ static inline int check_selection(struct v4l2_subdev *sd,
>  	if (!sel)
>  		return -EINVAL;
> 
> +	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +		sel->stream = 0;
>  	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
>  	       check_state(sd, state, sel->which, sel->pad, sel->stream);
>  }

-- 
Regards,

Laurent Pinchart
