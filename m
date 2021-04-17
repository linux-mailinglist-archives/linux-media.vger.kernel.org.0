Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDB3363299
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 01:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237101AbhDQXBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 19:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbhDQXBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 19:01:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7424C06174A
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 16:01:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78352B9C;
        Sun, 18 Apr 2021 01:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618700464;
        bh=p4TxTvsF49EuO2cUXaly1m7YLeJDo+Zk+ZRU6OEd+KI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cu9xjd1LLDNbixq1qRKMMY37FrRooS2JgJjzbSiU/1L67tvU4oXbk7eaGuC2hYQ2W
         UPavbs78ZALFrwVEDBDn2HfVx1wck6PgpkcPJxwzrmpjNXCgIMW2GRBGM04NW2x/a5
         1z+J+G4HaL4MuAlS5OCa7VZXFDqJA6ZdLHTWCNlE=
Date:   Sun, 18 Apr 2021 02:01:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/28] media: ti-vpe: cal: add g/s_parm for legacy API
Message-ID: <YHtorlx+tVApLPtL@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:30PM +0300, Tomi Valkeinen wrote:
> v4l2-compliance complains about g/s_parm when using the non-MC API. Fix
> it by adding the functions and just call v4l2_s/g_parm_cap for the
> phy subdev.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 7b7436a355ee..86d7cdd27224 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -388,6 +388,20 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int cal_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> +{
> +	struct cal_ctx *ctx = video_drvdata(file);
> +
> +	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->sensor, a);
> +}
> +
> +static int cal_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> +{
> +	struct cal_ctx *ctx = video_drvdata(file);
> +
> +	return v4l2_s_parm_cap(video_devdata(file), ctx->phy->sensor, a);
> +}
> +
>  static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
>  	.vidioc_querycap      = cal_querycap,
>  	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
> @@ -411,6 +425,8 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
>  	.vidioc_log_status    = v4l2_ctrl_log_status,
>  	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +	.vidioc_g_parm		= cal_g_parm,
> +	.vidioc_s_parm		= cal_s_parm,
>  };
>  
>  /* ------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
