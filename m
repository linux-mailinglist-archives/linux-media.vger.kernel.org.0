Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1D83419F0
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 11:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhCSK1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 06:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhCSK1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 06:27:46 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B6AC06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 03:27:46 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id k8so8544166wrc.3
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ket/PTbCNu1Bbmd3Bko4HHYUlwQg6eTDjIHtdAtuZhY=;
        b=MBhLx3TRwCmw24zSxNi5cmKrbUghb1YAFkgRNQkAGcHKfkH/T7FbT3zCsESSmVoZO1
         j8P1iYnQg0i+NRf3+0x5BOpwVkvHeQRgh75ZYFBWGu40j3Y72jKicSblZ0RgUYcqU9dv
         6bYQYtk8QvijaQzSGDX/Gj7U982lnZx7FhV3lUbUeLQKVIn2olixBwoyk80sVWnIA8CX
         aOX9WTGnEvH6PcF3yjbE+R5SgF1g/5Y/4oLOYlZsreXZ7xBk3SzJ1bg1TSt7TOJ3b1kS
         UyI541WhERF/FPXZOpccyIgro3qekwuCboRUFU6/84nU/dSDQCoaNH1qm0e8dExOtYoJ
         xxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ket/PTbCNu1Bbmd3Bko4HHYUlwQg6eTDjIHtdAtuZhY=;
        b=JNlCW0RKc+Y/tFTamHBPozAeAaf78is+yJQUKOxVQPSLQ89oFUUIPhLOTrFu4PvKQ2
         ZG4gb8ZUk3K1qLjrhpyb5WVnLpX4DR0QkxDn/fBjWTR/n3SAwduqC0figUqy0VZmfDnl
         qbm1g+yOHmLaGKkUza6vGyUGvp8pr2ESBSW/FQGgk1AhMRt5JvanKCm0oAjD4BH44QNv
         HTowIbCHVo7zE8pilMZ+I9SfABbubcbaCiGi3jTr/8ptaZjeaohGuZ+8dEKb8JGosV5k
         nSekSpYKczaCk0R4ZaYcghUFpnADsrYgvQxkg2NEFxkMqam+pGzkpDVtf8ikwiDCsvTe
         Fz1Q==
X-Gm-Message-State: AOAM533C2ytgrzrMyDp02XNcJA9mVbqPQ2C5h5kUNzGW9tYvf2gMoT9R
        svFxGRluTozoZyQgWj3u0N0=
X-Google-Smtp-Source: ABdhPJx62BgaddUedaHtZULOZlBjH9bykrE/CPeeYGVPqt/V1igUpIbTO0ztMfoZsG++be4nlvcfDQ==
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr3917160wra.250.1616149665022;
        Fri, 19 Mar 2021 03:27:45 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z25sm6394959wmi.23.2021.03.19.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 03:27:44 -0700 (PDT)
Date:   Fri, 19 Mar 2021 10:27:42 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 2/3] media: imx: imx7_mipi_csis: Don't take state->lock
 in .link_setup()
Message-ID: <20210319102742.wlo2fvmxqxmzn5kc@arch-thunder.localdomain>
References: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
 <20210319011735.26846-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319011735.26846-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Fri, Mar 19, 2021 at 03:17:34AM +0200, Laurent Pinchart wrote:
> The .link_setup() handler uses state->lock to protect the src_sd field.
> This is only used in mipi_csis_s_stream(), which can't race
> .link_setup() as the MC core prevents link setup when the pipeline is
> streaming. Drop the lock.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index c6cd60896969..21774f3e66e0 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -749,7 +749,6 @@ static int mipi_csis_link_setup(struct media_entity *entity,
>  	struct v4l2_subdev *mipi_sd = media_entity_to_v4l2_subdev(entity);
>  	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
>  	struct v4l2_subdev *remote_sd;
> -	int ret = 0;
>  
>  	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
>  		local_pad->entity->name);
> @@ -760,22 +759,16 @@ static int mipi_csis_link_setup(struct media_entity *entity,
>  
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
> -	mutex_lock(&state->lock);
> -
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (state->src_sd) {
> -			ret = -EBUSY;
> -			goto out;
> -		}
> +		if (state->src_sd)
> +			return -EBUSY;
>  
>  		state->src_sd = remote_sd;
>  	} else {
>  		state->src_sd = NULL;
>  	}
>  
> -out:
> -	mutex_unlock(&state->lock);
> -	return ret;
> +	return 0;
>  }
>  
>  static struct v4l2_mbus_framefmt *
> -- 
> Regards,
> 
> Laurent Pinchart
> 
