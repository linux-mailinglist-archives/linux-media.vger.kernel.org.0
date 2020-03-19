Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DFF18B77B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 14:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgCSNdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 09:33:45 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36831 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728644AbgCSNNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 09:13:16 -0400
Received: by mail-lj1-f194.google.com with SMTP id g12so2430085ljj.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lihn5FzD/6idQ4+0vgu8K5La8l3gtXOBL1sBTYbHOu8=;
        b=UmhrWCo0xu/Iq1kPHHScxdzVFt26NhhlfDA3ZyotUREhHVnpR1ZlE+119e7SXfs/i4
         S2Px3omtSK1ZeOlrOfuiNEHy9LgQciycw3xEN0+k7OhECVhpAP2SpiUh+j7yY7O8Sct4
         8fiSr71XyQk3aT2MPv/nmE3kWZhUQk8LBp5y/HgQ9QZdsb9MGrsQHhfrfvouYnRX/lKE
         RbQRZm41lBjPwKegDkYHW1D34ZO0HEGX8Sdy5QZYUgE+WSnZA7RJU/ws/M0hF3VI9zyx
         PkNsTAQcL0U8dxztd9Xurhy9wZ0/2h5j+FClMG980PoPp85GgwVkGDLQWODB1rHY0dSC
         CtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lihn5FzD/6idQ4+0vgu8K5La8l3gtXOBL1sBTYbHOu8=;
        b=Yvjd4LAVHFFUYNM4ip3sz4SQwJD5W0zrmKeUSjoohpAyyXpCMK9wA/wWnbwYo72EV+
         nymq8wKCRlto8bLOuutksqfyMrpB8hfdOP0raV3xp4+em2J758k9394u02eXeUPotd7l
         WbBXYUENq7UzbJ4TuW8e40FeybbBvSWVKHgI5nsmGoWKIH2DtqIOaQv7mw3lCpBlYwnF
         GTQMVCVQQnfZYkn7A0Q9vTjNAEw89tobKEZFULEkSiFQon5PDiyuAl1Z/52AmKrzogCS
         DqVk7UMB0E5HUG3mlKxYKeFZa4Ssxie17xC88LpfkjayVnEE8Q1EeqaOwT0d+o6bDZvF
         xpNg==
X-Gm-Message-State: ANhLgQ144AYNLuFhzsUvqIsBzmTmkVUTni4aKE8FFWIdOfvktMY7AWuy
        sP5LrXS0TzABlr8yWkz+xHfxKA==
X-Google-Smtp-Source: ADFU+vvKmsJWPuEArtXUSGljtHsqGmwv3cSwtVkRt6RHNyyFzpUewTuRsRvpi/ruvaKboBgg/rFQRA==
X-Received: by 2002:a2e:804b:: with SMTP id p11mr2185641ljg.50.1584623594050;
        Thu, 19 Mar 2020 06:13:14 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id g20sm1523376lfj.88.2020.03.19.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 06:13:13 -0700 (PDT)
Date:   Thu, 19 Mar 2020 14:13:12 +0100
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/2] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Message-ID: <20200319131312.GA3192108@oden.dyn.berto.se>
References: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200318170638.18562-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318170638.18562-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thanks for your work.

On 2020-03-18 17:06:37 +0000, Lad Prabhakar wrote:
> Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by setting
> format type to RAW8 in VNMC register and appropriately setting the
> bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.

> For RAW8 format data is transferred by 4-Byte unit so VnIS register is
> configured accordingly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 11 ++++++++++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 7440c8965d27..76daf2fe5bcd 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -469,6 +469,7 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
>  		case MEDIA_BUS_FMT_UYVY8_2X8:
>  		case MEDIA_BUS_FMT_UYVY10_2X10:
>  		case MEDIA_BUS_FMT_RGB888_1X24:
> +		case MEDIA_BUS_FMT_SRGGB8_1X8:

This is wrong RAW formats are only supported on the CSI-2 interface and 
not the parallel one. This line shall be dropped.

>  			vin->mbus_code = code.code;
>  			vin_dbg(vin, "Found media bus format for %s: %d\n",
>  				subdev->name, vin->mbus_code);
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 1a30cd036371..ec7b49c0b281 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -85,6 +85,7 @@
>  #define VNMC_INF_YUV8_BT601	(1 << 16)
>  #define VNMC_INF_YUV10_BT656	(2 << 16)
>  #define VNMC_INF_YUV10_BT601	(3 << 16)
> +#define VNMC_INF_RAW8		(4 << 16)
>  #define VNMC_INF_YUV16		(5 << 16)
>  #define VNMC_INF_RGB888		(6 << 16)
>  #define VNMC_VUP		(1 << 10)
> @@ -587,13 +588,14 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
>  	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
>  
> -
>  	/* TODO: Add support for the UDS scaler. */
>  	if (vin->info->model != RCAR_GEN3)
>  		rvin_crop_scale_comp_gen2(vin);
>  
>  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
>  	stride = vin->format.bytesperline / fmt->bpp;
> +	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
> +		stride /= 2;

I'm sorry this makes no sens to me.

- The width of the image is number of pixels in the raw format.
- In memory each row is either is either RGRGRG... or GBGBGB...
- The pixel size is 1 byte per pixel.
- We calculate bytesperline as ALIGN(width, align) * bpp, where align is 
  how much we need to "adjust" the width to match the VNIS_REG reg 
  value.  We do this in rvin_format_bytesperline().
- We then remove bpp from bytesperline and we have a unit in pixels 
  which is our stride.

I can't see why you need to cut the stride in half. In my view you 
should add a check for V4L2_PIX_FMT_SRGGB8 in rvin_format_bytesperline() 
and pick an alignment value that matches the restrictions.

I might miss something, but then I wish to learn.

>  	rvin_write(vin, stride, VNIS_REG);
>  }
>  
> @@ -676,6 +678,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  
>  		input_is_yuv = true;
>  		break;
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		vnmc |= VNMC_INF_RAW8;
> +		break;

Here and ...

>  	default:
>  		break;
>  	}
> @@ -737,6 +742,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_ABGR32:
>  		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
>  		break;
> +	case V4L2_PIX_FMT_SRGGB8:
> +		dmr = 0;
> +		break;

... here we have a new problem, sorry for not thinking of it before.

Up until now the VIN was capable to convert any of its supported input 
mbus formats to any of it's supported output pixel formats. With the 
addition of RAW formats this is no longer true. This new restriction 
needs to be added to the driver.

Luck has it we can fix ...

>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1110,6 +1118,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		vin->mbus_code = fmt.format.code;

... this here by changes this to

        switch (fmt.format.code) {
        case MEDIA_BUS_FMT_YUYV8_1X16:
        case MEDIA_BUS_FMT_UYVY8_1X16:
        case MEDIA_BUS_FMT_UYVY8_2X8:
        case MEDIA_BUS_FMT_UYVY10_2X10:
                break;
        case MEDIA_BUS_FMT_RGB888_1X24:
                if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
                    return -EPIPE:
                break;
        default:
                return -EPIPE;
	}

        vin->mbus_code = fmt.format.code;

>  		break;
>  	default:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 5151a3cd8a6e..ca542219e8ae 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_ABGR32,
>  		.bpp			= 4,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_SRGGB8,
> +		.bpp			= 1,
> +	},
>  };
>  
>  const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
