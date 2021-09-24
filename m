Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2D0416FCD
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 12:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245453AbhIXKCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 06:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245436AbhIXKBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 06:01:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF87BC061574
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 03:00:22 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p29so37695576lfa.11
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9spe2BT8WYhxoMB5PWx9SyNtZ6j20UIUeNEeZtSy4lI=;
        b=agnRw4hPbQTzGV9rKZRfn9MBqDfI7I2IPjL9dwDGzo7i0qYi2HQD/SXCFBtHzg3EJw
         jDJiurFSHVWTZ9hsJ57HjtfSKRksZYbXx7vtRuGCLsSAGGaGwcHvy17XC54cKSc7XO4M
         TR9r3a+guTq8SfiTwFX7vbIXRg8gn7LSYOo1xwNVme4ZJjZBlDJ1idrl0xCNrLCZCEvP
         cHwf/wTcdEz+mAWjcFEPvWefU2FwYO1HFyC1y+GwFsisopnn34E336cNqSCAATaths9b
         8nBhLTYaDEQOHXa528iGxP7BpP8eg/kpcJdo9YVbX5n+x2nw1pNINCBl08m3xBzd1u3/
         hPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9spe2BT8WYhxoMB5PWx9SyNtZ6j20UIUeNEeZtSy4lI=;
        b=DoMJPjE6yCK5zaD0rbHw+7IGRESfpZsULrWFTmYlk8KfoX7nLPF3ioBStypIIaHVJW
         2rPiZCkYypqppa9eSk5EFa2PichNmVRyVirTgMm6ZgIgQ9Xux3iwNUYPh8DIBZj17qLx
         iGfpeTeY4uFyfwItEq2NJl0LlaGjsJ6A2L8X1jHl0Z+8lSwyX1Xh3a83UQG8AGCuU4lQ
         Kw9KN4cI6XKPQY3hcvBQQ4PupWPta6+5ZkBmghGdAdh1xP7z2DcjkObLZ9R/dDmMSkIP
         KWjLDNTNA/tsRiOD67tjQIBkSrAfMeSVT76ReSdEkg665pcSTbGpKXUdcWByVq/ehe35
         HXWg==
X-Gm-Message-State: AOAM531MW6FX8JsyRguUbxiRDf5kkf93Sj/dh3v/wMLIoP/cIoXbZUDL
        VMFKF0OfoEs6vqa2puuOBBlmjWqpk2hEcQ==
X-Google-Smtp-Source: ABdhPJydHkaU9EFSFsIwIQelHVAe3kif1c9lzLcXuKl1YmahZZmr6lOaVUHMmY73S3Ip6hxeGSHtzA==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr10314516ljm.254.1632477621131;
        Fri, 24 Sep 2021 03:00:21 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id l11sm700284lfg.39.2021.09.24.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 03:00:20 -0700 (PDT)
Date:   Fri, 24 Sep 2021 12:00:20 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] media: rcar-vin: add support for GREY format
Message-ID: <YU2htCDCbedXi4ai@oden.dyn.berto.se>
References: <20210924081938.30230-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924081938.30230-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikita and Vladimir,

Thanks for your work.

On 2021-09-24 11:19:39 +0300, Nikita Yushchenko wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> This adds support for MEDIA_BUS_FMT_Y8_1X8 input and V4L2_PIX_FMT_GREY
> output format.

Thanks for this, I'm happy to see this code!

I been wrestling a while with this as I have no sensor where I could 
test it with I always put it off. May I ask what sensor and platform was 
used to test this?

The code looks good and I truest that it's tested and produce a good 
image, one small nit below.

> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 14 ++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f5f722ab1d4e..d2bfd3e575fa 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -114,6 +114,7 @@
>  /* Video n Data Mode Register bits */
>  #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
>  #define VNDMR_A8BIT_MASK	(0xff << 24)
> +#define VNDMR_YMODE_Y8		(1 << 12)
>  #define VNDMR_EXRGB		(1 << 8)
>  #define VNDMR_BPSM		(1 << 4)
>  #define VNDMR_ABIT		(1 << 2)
> @@ -603,6 +604,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_SGBRG8:
>  	case V4L2_PIX_FMT_SGRBG8:
>  	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_GREY:
>  		stride /= 2;
>  		break;
>  	default:
> @@ -695,6 +697,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_Y8_1X8:
>  		vnmc |= VNMC_INF_RAW8;
>  		break;
>  	default:
> @@ -774,6 +777,13 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_SRGGB8:
>  		dmr = 0;
>  		break;
> +	case V4L2_PIX_FMT_GREY:
> +		if (input_is_yuv) {
> +			dmr = VNDMR_DTMD_YCSEP | VNDMR_YMODE_Y8;
> +			output_is_yuv = true;
> +		} else
> +			dmr = 0;

Please encapsulate the else clause in { } if the corresponding if clause 
body uses { }.

> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1145,6 +1155,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
>  			return -EPIPE;
>  		break;
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
> +			return -EPIPE;
> +		break;
>  	default:
>  		return -EPIPE;
>  	}
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0d141155f0e3..bdeff51bf768 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -82,6 +82,10 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_SRGGB8,
>  		.bpp			= 1,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_GREY,
> +		.bpp			= 1,
> +	},
>  };
>  
>  const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
