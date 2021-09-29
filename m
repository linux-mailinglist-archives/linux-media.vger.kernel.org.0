Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31BE41C766
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 16:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344744AbhI2Ozi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 10:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344683AbhI2Oze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 10:55:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5218C061762
        for <linux-media@vger.kernel.org>; Wed, 29 Sep 2021 07:53:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id j5so7055884lfg.8
        for <linux-media@vger.kernel.org>; Wed, 29 Sep 2021 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JQ9T4n0FIcOq17O9WIuPMXgKjJWLtigT8GSjbeG4O3A=;
        b=S1mQR2y7E7KzALcNIPbbtmqByFx0GYmKJ0JRrrnjBpA9bytzUZofjYImlWsbak/T5j
         f4DLZVDQzW8FxGZwOzQ+C+PolabNSzj4mMP046DGXle+akLBK8R1CNcI0cSiCPbI1gdo
         M4zPJP6P+WVCUy6cWfe0ibQa8IBmJbX1SGK/szjrP62B2F9snxnP1xxupUQX6x9d+Hzv
         PC/IyQp8n3OPP1vZHHtktbOhWzEyh2kHNAu8URpvnCWWt2BkbqiF6fYCuiYCGO2nwwdK
         ndr0TloFRMKPGmCwjmEaqBnxQslZK837QXi2Zp4ejnnJ/vfnD8j0EiGVedH++ZVIOeSI
         j9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JQ9T4n0FIcOq17O9WIuPMXgKjJWLtigT8GSjbeG4O3A=;
        b=j4zsIoxs0ChvJ8HgC1vhoh7wMaVjvIRap6ScqxohTYo5iHREQ+bmqSs92C/qH9tm0P
         N/FOguiDD4ZwLWvvxfb7aAHDakHS/MY1lXTvAI1H9Unwlcb7y/h64P4nlwIXyFBHQQxc
         RBfEJDLVJtQufo0OVBBJFJrn08fYkG6LM2UTgqr+N20sUlxjjshbfv5CSCYcD+sqO987
         Zt5TIErb+aENso4ZIL+dzpEiBaFWUc/16di8HVda7vl12KdZJmwBsE4cEuqsgnNO23Xn
         2mcB+jRDd17jLTcZb45bIvtxf+F84Y46K+N3UwYE2llwpzWPOvBD+hQ0rpw3c0vVnvrm
         9MiQ==
X-Gm-Message-State: AOAM5301aJe1QbGA/2DLlFj/70kXucLSlxSG2GOmvBuvw7WM8gz6T2lE
        lFEvEamFF5AFiYCgTwJq8Qa1K0Ty2VLwsg==
X-Google-Smtp-Source: ABdhPJztiED96RbyrcWQK8vcOXRAc9+CiqHZ1+aI910OqoBmXHaxGspoWkoWAgcdw9SB/Ar+5GhTjw==
X-Received: by 2002:a2e:5443:: with SMTP id y3mr346759ljd.482.1632927231242;
        Wed, 29 Sep 2021 07:53:51 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id a6sm14048lfr.142.2021.09.29.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:53:50 -0700 (PDT)
Date:   Wed, 29 Sep 2021 16:53:50 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2] media: rcar-vin: add GREY format
Message-ID: <YVR9/iQIGp/T2ymx@oden.dyn.berto.se>
References: <YU2htCDCbedXi4ai@oden.dyn.berto.se>
 <20210924124315.26164-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924124315.26164-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vladimir,

Thanks for your work.

On 2021-09-24 15:43:17 +0300, Nikita Yushchenko wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> This adds support for MEDIA_BUS_FMT_Y8_1X8 input and V4L2_PIX_FMT_GREY
> output format.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes from v1:
> - fix coding style issue
> 
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 15 +++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f5f722ab1d4e..4d0d95cf4c5f 100644
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
> @@ -774,6 +777,14 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_SRGGB8:
>  		dmr = 0;
>  		break;
> +	case V4L2_PIX_FMT_GREY:
> +		if (input_is_yuv) {
> +			dmr = VNDMR_DTMD_YCSEP | VNDMR_YMODE_Y8;
> +			output_is_yuv = true;
> +		} else {
> +			dmr = 0;
> +		}
> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1145,6 +1156,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
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
