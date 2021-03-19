Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896F43419F7
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 11:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhCSK30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 06:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhCSK25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 06:28:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D501BC06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 03:28:56 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id bx7so10099986edb.12
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=11zirrrW3iDjvSkKCKDfD5KXRa1QVmzXARcO4/mQo9w=;
        b=g+/4rYhzpsktOUqpGgLP9IcY9NyknAP8aLn4diQRmrRZ+cbwtcwlXw9lc30Pz7n6DU
         Y9tAcnbrveQa3H8SuuH98sQRun5lIKVN7AP6hFboYzR3NL39JaxZFw7bHM9iHEW9J/Kf
         4woX2VaBXAi1xZSTXTMhKQb6j6m0SvH8/Oe3rpAxN5jN7jxM4TcWcwJp1iL4a6b62ab2
         47KZMogXvyPau1kUK9rWWxlWyRBkJJt677YjzdyRmoJOFPu4w6sh0BfZTuuKHuVFK+rK
         4880IFgqJzT4/SCmoXE/kU2jEvj9q1PBZnuvYjGzcss0IZTWY1/a3GODRmEZ2BYY52KM
         WVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=11zirrrW3iDjvSkKCKDfD5KXRa1QVmzXARcO4/mQo9w=;
        b=aV/LQlISch7jc4kbz+AG6z0afrnGIL/Q8CkbYUnPliBhBJJBSuSnMKx/UgZXSiUTnp
         aABMmOGtaYJ9QfKQs/U722gfup2b4F5fSwD2m1ZeZ8Vz1r256bhBucNGEXnUXdqXCr/3
         ays9GHnM86Fun/bOUJL2dQRf1KYumPCMpk5B9CGC1EOU4L3ukKg1l74GHjWPMsqKzTAH
         087csM9XvjV1yBOLMYL+rMYYOFDF8t7wgS2IhAVImTwx2npjFJeLrdb96jLpGqHt6Zx0
         e5yO04bD047WagsrbPJMSbrJsidP3McIVmvK25zXlpAOuzYOY34YY4OkY4/x2bCZmh1/
         2AfA==
X-Gm-Message-State: AOAM532jkG1gKGwLIUTRSMUvl395wNo5UuEy77mp3NnVnBE4uWxwa3aV
        0miQdQOKnJ/OQpzKhF9juaE=
X-Google-Smtp-Source: ABdhPJwmRKxQ2SI+GvPMbFJTtNKrOWSLSd91AZdcB1ykT36EnoTRim2tTlVsUL1oEkHU/IBTK/1Z1A==
X-Received: by 2002:a05:6402:3486:: with SMTP id v6mr8536942edc.109.1616149735656;
        Fri, 19 Mar 2021 03:28:55 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d15sm3749195edx.62.2021.03.19.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 03:28:55 -0700 (PDT)
Date:   Fri, 19 Mar 2021 10:28:53 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 3/3] media: imx: imx7_mipi_csis: Ensure pads are connected
Message-ID: <20210319102853.yfidhbrqtko26ura@arch-thunder.localdomain>
References: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
 <20210319011735.26846-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319011735.26846-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for the all series.
On Fri, Mar 19, 2021 at 03:17:35AM +0200, Laurent Pinchart wrote:
> The CSI-2 receiver requires both its sink pad and its source pad to be
> connected through enabled links in order to be started. Ensure this by
> setting the MEDIA_PAD_FL_MUST_CONNECT flag on both pads.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 21774f3e66e0..025fdc488bd6 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1065,8 +1065,10 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
>  
>  	v4l2_set_subdevdata(mipi_sd, &pdev->dev);
>  
> -	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> -	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
> +					 | MEDIA_PAD_FL_MUST_CONNECT;
> +	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
> +					   | MEDIA_PAD_FL_MUST_CONNECT;
>  	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
>  				      state->pads);
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
