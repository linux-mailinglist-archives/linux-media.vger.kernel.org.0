Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D2B34A06F
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 05:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCZEQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 00:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCZEPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 00:15:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD6BC06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 21:15:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43978443;
        Fri, 26 Mar 2021 05:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616732142;
        bh=GRg7BP5yQH90yKmbFdcBg6qZxJaxsXRjjTIgXK8bkL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i5JwcTp5cz2wiOC2KbawrZ2whn/0gDYRyughU114VZ34UsiL9qQODK1UHN9OZQpWh
         mgkUSCj6Xqbfpc8bCMkIKabkwWTceN/N+q4c/tG6Cn5R0zajL901MvKEmoB/Pu78zi
         eGIyQG7tbaC5z06BwvyGQ982qpoaq9DvOOcn0Hfo=
Date:   Fri, 26 Mar 2021 06:14:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, heiko@sntech.de
Subject: Re: [PATCH 1/2] media: rkisp1: Increase ISP input resolution limit
Message-ID: <YF1fw75lCud3Akxg@pendragon.ideasonboard.com>
References: <20210325192700.21393-1-sebastian.fricke@posteo.net>
 <20210325192700.21393-2-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210325192700.21393-2-sebastian.fricke@posteo.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Thu, Mar 25, 2021 at 08:27:01PM +0100, Sebastian Fricke wrote:
> The incentive for this patch was to overcome the inability of the
> ISP device to work with resolutions greater than 4032x3024.
> Increase the limit to 4416x3312 to allow higher input resolutions.
> Use the old resolution to crop the input resolution down to the maximum
> size for the ISP to process frames.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 038c303a8aed..553effda4d5e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -30,10 +30,12 @@
>  #define RKISP1_ISP_SD_SINK BIT(1)
>  
>  /* min and max values for the widths and heights of the entities */
> -#define RKISP1_ISP_MAX_WIDTH		4032
> -#define RKISP1_ISP_MAX_HEIGHT		3024
> -#define RKISP1_ISP_MIN_WIDTH		32
> -#define RKISP1_ISP_MIN_HEIGHT		32
> +#define RKISP1_ISP_MAX_WIDTH			4416
> +#define RKISP1_ISP_MAX_HEIGHT			3312
> +#define RKISP1_ISP_MAX_WIDTH_PROCESSING		4032
> +#define RKISP1_ISP_MAX_HEIGHT_PROCESSING	3024

Maybe s/_PROCESSING/_CROP/, or a name more descriptive ?

I would also squash this patch with 2/2, as otherwise you'll introduce a
bisection breakage (applying 1/2 only will leave the driver in an
incorrect state).

> +#define RKISP1_ISP_MIN_WIDTH			32
> +#define RKISP1_ISP_MIN_HEIGHT			32
>  
>  #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
>  #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312

-- 
Regards,

Laurent Pinchart
