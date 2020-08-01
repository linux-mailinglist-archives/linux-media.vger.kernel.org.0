Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B165E235154
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 11:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHAJFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 05:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgHAJFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 05:05:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18E4C06174A
        for <linux-media@vger.kernel.org>; Sat,  1 Aug 2020 02:04:59 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so11252759ljc.3
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2020 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ysGkfROsxh9fScF28a6Ab2vg7iqMPSIMDcq/54hw/Bs=;
        b=NLvj3hoTucDf6+zODHoC036A5mqQFsEMXF7b9PN5sgndABfVg1Ow7CM9z9Ig0i/iAv
         QjBs2ZE6feVJKQ1a+tEYAAXBL9kHxq1JWH4c6J4i3aGKMkU5naF/d8S9QRR9Spg25wtN
         3KAlWP+ovjBMIMbRoEmAcCTTOelojk7X9esECTxq3bgiiEEurWT+vGuVs8BV3q3JBywM
         wKbj+AjK4Ccn16LdqzXunJEsuGsVVQkxEHVUcPT6KA4ybrobiKAo263uG3OhHY0z/uHV
         IvgAjzu8Uh0jKNNRJkMrNbJJrixlcMX9Cxbl9QT+B14Ky0lyXl1YvFdmHX7LHVxlZVUY
         aatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ysGkfROsxh9fScF28a6Ab2vg7iqMPSIMDcq/54hw/Bs=;
        b=lxqmUT17PaVsKNbV0mjauRK9WGJaKCFeAv0NiVVle5ryvMRNO3GUd4ZzZVvUzhiaoV
         iKcGdWO/6u24OGD1om24uXw3fVGFXXGrVyo5JNPYbAcT7QM3X6lP/sLo1ThhE/P1RHd5
         fiIsxjibiINT3u237wZP9iiKYV1OAk2qHq+mh7wEgPvIK3BmBKd20rF1sautxIX2o4wk
         eRkx8lBJudvtj6exyXYkWCaGdJ3shsOJJrqErO/VvsJayafq2CnB0HFxMsLXUuPWzcqF
         N4Jfo2FLpXoYLiEJ+RvammLretLTyH+sTZ0Fd44EmT45AwdZ8SnQ3CHvTbDYkoWyFIOC
         Tp7A==
X-Gm-Message-State: AOAM5311iDsdWUVWCjRqPlFvCF5zK3eB8pzbo+/B2AW593Y1nXr7n7oG
        4ou1igFg7Gh1ne7Sk717nMiL8Q==
X-Google-Smtp-Source: ABdhPJy3b6mLEDRdxzHctsXC+DubwBmRjCbyeloTjS4iFDZlA4tJZMThjxXAl1XSuFAX1eIzRN7tDg==
X-Received: by 2002:a2e:160d:: with SMTP id w13mr3732137ljd.470.1596272698238;
        Sat, 01 Aug 2020 02:04:58 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r19sm2556901lfi.58.2020.08.01.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 02:04:57 -0700 (PDT)
Date:   Sat, 1 Aug 2020 11:04:56 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200801090456.GB1379367@oden.dyn.berto.se>
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> The crop and compose settings for VIN in non mc mode werent updated
> in s_fmt call this resulted in captured images being clipped.
> 
> With the below sequence on the third capture where size is set to
> 640x480 resulted in clipped image of size 320x240.
> 
> high(640x480) -> low (320x240) -> high (640x480)
> 
> This patch makes sure the VIN crop and compose settings are updated.

This is clearly an inconsistency in the VIN driver that should be fixed.  
But I think the none-mc mode implements the correct behavior. That is 
that S_FMT should not modify the crop/compose rectangles other then make 
sure they don't go out of bounds. This is an area we tried to clarify in 
the past but I'm still not sure what the correct answer to.

> 
> Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f421e25..a9b13d9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  	fmt_rect.width = vin->format.width;
>  	fmt_rect.height = vin->format.height;
>  
> +	vin->crop.top = 0;
> +	vin->crop.left = 0;
> +	vin->crop.width = vin->format.width;
> +	vin->crop.height = vin->format.height;
> +	vin->compose = vin->crop;
> +
>  	v4l2_rect_map_inside(&vin->crop, &src_rect);
>  	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
>  	vin->src_rect = src_rect;
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
