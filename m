Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1299435984F
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 10:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhDIIxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 04:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDIIxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 04:53:35 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48ED9C061760;
        Fri,  9 Apr 2021 01:53:21 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j5so3849685wrn.4;
        Fri, 09 Apr 2021 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5A7hip5HNnqqYLaE8cwZV0V2a06xYyPPsPaw4/onnlI=;
        b=E/8GgFwelU6ZMU3BlvWFt00DzbWUEBm+p5if5yuq3rd8uBeRrXl3L+F9A1CmFfxl61
         g/kXk3pws6NLEC8xhd+wm+VPLMNPsaFs047yGXm0k9mHdetig8vqDF5O/TfDsc5zm+oL
         1MWxS5g2Q7LUNt25SvQS/TtB81xp7x7WU2WQ7Di40zAZTElW3dvk4lvh7g4mVdewQ7Au
         PToOU1uAhPy0wrFSWmiOZkaFG4EaaJk9HJhkjtmJ4CRGR0q+rAorI3bizPQc7bKDdABb
         wcVfQpT3jQMhzx/4WBlVrU/zKXplS2tp+lk0ctKfNB3l6WBqY75jpjokU95VlI+qe+SM
         ipuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5A7hip5HNnqqYLaE8cwZV0V2a06xYyPPsPaw4/onnlI=;
        b=V4BG3hqSyp7CLvjaPyP5+vox+jL7RnCgADJKjhKvsnkFGnxwAYZWayENMDvCC5Omvj
         yO3fvyP13rpbbZZX5MvIjGV/9Q+tCOB+iNR6zFbyE/J8/t58kRtZhPzi/EV+VsyPyRG2
         TfDxpB9FrmyJH9LLlgm4xxON9N9YP2yTr/3rdqjhLE6T7tWD8Bwt3LcR3lIWMNCz0paW
         s+2UTldilt62kETDmd3fDDlhhXReVxWKcRUkAjFz6PmILT/JUloB3DyrOBAc03MqlsU5
         MGRbM0xvbKKD2NstgltDfgUzYlO/AuE86AeySIcDxLNJRum57JmSKnGZ1mqWjXpzdqBS
         /t2A==
X-Gm-Message-State: AOAM533XTuUhY1a9UEQWAeGEXvG8WFrbWySEkBXumxn55LAXX79deEzZ
        eRfgFJxVJ0/vLMMQPtmgPiM=
X-Google-Smtp-Source: ABdhPJy/hMUhoUXl46PoPPOyK3KQawtQgk1CfJKQDeLLRw4/8Cfdeh7A5T2E2ovfJVBF3SouidyLFg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr16303013wrd.47.1617958399990;
        Fri, 09 Apr 2021 01:53:19 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id m67sm1659146wme.27.2021.04.09.01.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 01:53:19 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:53:17 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] media: imx: imx7-mipi-csis: Fix runtime PM
 imbalance in mipi_csis_s_stream
Message-ID: <20210409085317.ycj273fqwbmowfqb@arch-thunder.localdomain>
References: <20210409082225.22461-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409082225.22461-1-dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Liu,
Many thanks for the patch.

On Fri, Apr 09, 2021 at 04:22:25PM +0800, Dinghao Liu wrote:
> When v4l2_subdev_call() fails, a pairing PM usage counter
> decrement is needed to keep the counter balanced. It's the
> same for the following error paths in case 'enable' is on.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

LGTM
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
> 
> Changelog:
> 
> v2: - Use pm_runtime_put() to balance the refcount.
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index a01a7364b4b9..6f3e8a15e7c4 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -628,7 +628,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  		}
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
>  		if (ret < 0)
> -			return ret;
> +			goto pm_put;
>  	}
>  
>  	mutex_lock(&state->lock);
> @@ -657,7 +657,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  
>  unlock:
>  	mutex_unlock(&state->lock);
> -	if (!enable)
> +pm_put:
> +	if (!enable || (ret < 0))
>  		pm_runtime_put(&state->pdev->dev);
>  
>  	return ret;
> -- 
> 2.17.1
> 
> 
