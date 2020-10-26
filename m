Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAEA298601
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 05:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgJZEA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 00:00:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41428 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgJZEA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 00:00:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id g12so4552469pgm.8
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2020 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kVgDhO+taFxq8t0BEttCnWGSdkvbHL8UkilhT38HKvE=;
        b=m2uVth1fXM21zwTKn1Ec0oTOM0cCzhuuFEvzo4StIgPSNeOtntNMqm27OcWUVdiA1m
         0/yZ8VtMgSlDk5vwnkKTRUrrKXgsQgdT2Uu4FNo883nlWqN4Fvy9s0EAXhSF1fYBVX+8
         Aq7Gfq+riF+VyZoGFG+8Nu6n44R0XSLAr0YP8uMxX7opVXB95PC9EPcxbD++8PC1U8R1
         i/IaDtftPdyKPIR7yW87IreAiTnVOaN0zPlce8rKrmKAQuBHFP9S4BrS1KKNikwM1sSC
         MFXlnILiPFCO1DmkiULfEBWbSspMsVXEVjtKVlF2Nvh/rTRxpDwTiQofJN+Dl62IHAZl
         aemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kVgDhO+taFxq8t0BEttCnWGSdkvbHL8UkilhT38HKvE=;
        b=iOChu7VLODM7usGkzuos+rYoCZoGiRipjx0rxwq36cU4up1Bof7VM8SaG7dFcDw9Ir
         fUbHenqwNvMlchKuFvsGQXsBlpv5w+OHbtFQmH8Hh/PLcWrj/vllb4A6dW7SfzdD7w4s
         c2RSfARnm3ITvjLffRTjpA5/JoqRHFlMg/pthn5832vajIUZM9uagYwZ3nXHh2GiDK4a
         cCMMPUwgRoulu1UsaV43wfGlzusrA9o2jH4EcKqodHsXfCo6qWcviOno9amkIkfVCTYo
         XvT0950pRSGcfDESJqOhOL99DVRqyMJ7cOuS1HE2ZvweBqI+90v2I2YsgpgvhmlRUI7l
         /MvQ==
X-Gm-Message-State: AOAM530E+oy2wbYziAe+TRhTvsUzJNGA+oIu3REcVoprjlJGZk0LRQqW
        ENJwfjzNIuDqMyal8GOGTFw=
X-Google-Smtp-Source: ABdhPJxEUUtq7VLC/99X3AjD8UA86M7ryyZwpaSQQR14Tv0JesqNgryngmE9ET+W5q1h1ZCaAViTiQ==
X-Received: by 2002:aa7:99dc:0:b029:15f:d774:718e with SMTP id v28-20020aa799dc0000b029015fd774718emr11914740pfi.62.1603684825148;
        Sun, 25 Oct 2020 21:00:25 -0700 (PDT)
Received: from my--box ([103.108.75.206])
        by smtp.gmail.com with ESMTPSA id s19sm6103421pfe.26.2020.10.25.21.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 21:00:24 -0700 (PDT)
Date:   Mon, 26 Oct 2020 09:30:17 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     outreachy-kernel@googlegroups.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/2] staging: media: imx: remove commented code
Message-ID: <20201026040017.GA5074@my--box>
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 16, 2020 at 11:10:33PM +0530, Deepak R Varma wrote:

Hello All,
Request for review / ack of this patch.

Thank you.
Deepak.

> The virtual channel is always treated as 0 once the stream enters
> CSI's. Commented code in the "#if 0" can be safely removed as it will
> not serve any purpose in future.  Issue reported by checkpatch script.
> 
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
> Changes since v4:
>    - Rephrase patch description to make it exact and accurate as
>      suggested by Julia.
>    - Add linux-media to the recipient list. Suggested by Hans.
> Changes since v3:
>    - Rephrase Patch description
>    - Implement feedback from Vaishali & Helen to mention checkpatch in
>      the patch description.
> Changes since v2:
>    - None
> Changes since v1:
>    - Implement feedback from Julia to be exact with the patch description
> 
>  drivers/staging/media/imx/imx-media-csi.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 21ebf7769696..9320e3974d86 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1131,13 +1131,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
>  		 * enters the CSI's however, they are treated internally
>  		 * in the IPU as virtual channel 0.
>  		 */
> -#if 0
> -		mutex_unlock(&priv->lock);
> -		vc_num = imx_media_find_mipi_csi2_channel(&priv->sd.entity);
> -		if (vc_num < 0)
> -			return vc_num;
> -		mutex_lock(&priv->lock);
> -#endif
>  		ipu_csi_set_mipi_datatype(priv->csi, vc_num,
>  					  &priv->format_mbus[CSI_SINK_PAD]);
>  	}
> -- 
> 2.25.1
> 
