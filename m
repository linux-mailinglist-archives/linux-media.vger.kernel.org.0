Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E852D281192
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 13:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387652AbgJBLwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 07:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgJBLwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 07:52:00 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9D9C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 04:51:59 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b22so1467450lfs.13
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IRqVDg0g1ttgGILMwprq0pBwFnNYHi2rxDEhxqfQtkU=;
        b=r0ClZ1s+56wy9i3i2rpNhwR7RvB4fzIsENc1wIHeXIectW7G2J3+57EbEnz6nTYxPH
         jXNinRS7NLA+z809gDitjKaXOylIdHuHVEhYYSxRiBPOCcCIF0yEb5cuJs6qFRO2g/Ga
         jYhY2wj6iaZAp0U9/4yw/q8i3K7QlXDfCeAWdYNu6Zh4VdIHLZi4LAXNUXOoejzd4RvI
         5D1B2wtWjBBjqeg2F98vTJLBFUVH6w9YB+hqsxg9sVKxyJEWe+bt8PsOTW79iCleyZnY
         DOIhYmlJ4kDemPixRn+WJjvjciQ6JpNLp5f7SOwQQwTHWXrIbEugcP61rdoIhg20+iCg
         sozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IRqVDg0g1ttgGILMwprq0pBwFnNYHi2rxDEhxqfQtkU=;
        b=RarNo0MRKmdC43YVOonFq85SvXTzswB/JelELn4brb/MmTGM2aXyjmkFyRiAAou5az
         YAEWuZMttl73S49BCg6w+FJa0pnnGlT8W9pgZ/3PuFAeGSwQhOeWcu9XR8H9M8Pa63E3
         jJknLnTSLffdB5yk5bIn3GIXuf/wdnB01jYSgSxCXoE4Hl+tNpxLaHY5iHdWBiXb8LLz
         Ua3PpYbg4khA3c0IFT2cKuBfeEoA9GOcI5PPaNcm+DIMBNlsfU8JVewhLDKWWFjyxBtU
         iZ7StrVkTtoNuQvAB0QOWlF5NVFcaUuYVuRu+hRhUJnBTZEqTIOTwy4Y3BkcFxpEzg0N
         hsyg==
X-Gm-Message-State: AOAM532YuzlnnqOhcvPuh5fHT7DQXyYn1FM2kfUJt4PZ2wA9jPpYvPFH
        7LwS3hQ7uCFtpwQeFqaiQ+4beA==
X-Google-Smtp-Source: ABdhPJyBXLAMuaZNHmOsIKWa5JBV7O5tutEyQgoVPz5F3D7+faxZIbGusCCauj8Hp0YQCykfqxm7Ag==
X-Received: by 2002:a05:6512:31c4:: with SMTP id j4mr673957lfe.323.1601639518027;
        Fri, 02 Oct 2020 04:51:58 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c20sm253110lff.291.2020.10.02.04.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 04:51:57 -0700 (PDT)
Date:   Fri, 2 Oct 2020 13:51:57 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        UlrichHechtuli+renesas@fpond.eu, linux-renesas-soc@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] media: rcar-vin: rcar-dma: Fix setting VNIS_REG for RAW8
 formats
Message-ID: <20201002115157.6qgtn3vku226oysb@oden.dyn.berto.se>
References: <20201002102652.9154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201002102652.9154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for catching and fixing this.

On 2020-10-02 11:26:52 +0100, Lad Prabhakar wrote:
> pixelformat in vin priv structure holds V4L2_PIX_FMT_* and not
> MEDIA_BUS_FMT_* so make sure we check against V4L2_PIX_FMT_* formats
> while setting the VNIS_REG.
> 
> Fixes: 8c3e0f67df6c9 ("media: rcar-vin: Extend RAW8 support to all RGB layouts")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Hi Hans,
> 
> If it isn't too late for v5.10 could you please queue up this patch.
> 
> Cheers,
> Prabhakar
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index e9a47b705acc..692dea300b0d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -600,10 +600,10 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
>  	 */
>  	switch (vin->format.pixelformat) {
> -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
>  		stride /= 2;
>  		break;
>  	default:
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
