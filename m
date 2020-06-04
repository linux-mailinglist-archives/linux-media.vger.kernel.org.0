Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F271EE15B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgFDJdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgFDJdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:33:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21114C03E96D;
        Thu,  4 Jun 2020 02:33:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEC2029B;
        Thu,  4 Jun 2020 11:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591263218;
        bh=gTw3pEhCifyYlfjL0QN+XuPaqqLDo4p/XZgfoRqObtM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jR+M8HekG0TDjOM2zZDPy2PzFQZrm/lA17ts/R/QHD2ZgAla5VoGnexSodZaFBcSI
         SxqS9cn+Eg5xu7/LIlvb7eMKIbkmDgZh7GgieJPF0p5jAb1toB+lvstYIcGI6nQOrG
         S82o5Bo5/VlFuKsnhF4SPddOOn+4mWies0r+2kY8=
Date:   Thu, 4 Jun 2020 12:33:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilkka Myllyperkio <ilkka.myllyperkio@sofica.fi>,
        "Ivan T . Ivanov" <iivanov@mm-sol.com>,
        Vimarsh Zutshi <vimarsh.zutshi@gmail.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2] media: omap3isp: Add missed v4l2_ctrl_handler_free()
 for preview_init_entities()
Message-ID: <20200604093321.GE5829@pendragon.ideasonboard.com>
References: <20200603164122.2101162-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200603164122.2101162-1-hslester96@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chuhong,

(CC'ing Sakari Ailus)

Thank you for the patch.

On Thu, Jun 04, 2020 at 12:41:22AM +0800, Chuhong Yuan wrote:
> preview_init_entities() does not call v4l2_ctrl_handler_free() when
> it fails.
> Add the missed function to fix it.
> 
> Fixes: de1135d44f4f ("[media] omap3isp: CCDC, preview engine and resizer]")

There's an extra ']' at the end. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sakari, could you take this patch ?

> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>   - Fix the typo.
> 
>  drivers/media/platform/omap3isp/isppreview.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/media/platform/omap3isp/isppreview.c
> index 4dbdf3180d10..607b7685c982 100644
> --- a/drivers/media/platform/omap3isp/isppreview.c
> +++ b/drivers/media/platform/omap3isp/isppreview.c
> @@ -2287,7 +2287,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
>  	me->ops = &preview_media_ops;
>  	ret = media_entity_pads_init(me, PREV_PADS_NUM, pads);
>  	if (ret < 0)
> -		return ret;
> +		goto error_handler_free;
>  
>  	preview_init_formats(sd, NULL);
>  
> @@ -2320,6 +2320,8 @@ static int preview_init_entities(struct isp_prev_device *prev)
>  	omap3isp_video_cleanup(&prev->video_in);
>  error_video_in:
>  	media_entity_cleanup(&prev->subdev.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(&prev->ctrls);
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart
