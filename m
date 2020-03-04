Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC87179A7D
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 21:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388302AbgCDUzW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 15:55:22 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42565 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbgCDUzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 15:55:21 -0500
Received: by mail-lj1-f195.google.com with SMTP id q19so3582914ljp.9
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 12:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=N8TMoVnGizDGjD4F+oBcA8gM1V3wB7c/2Mybba8wb0M=;
        b=tOkMJEqCwb18LfVUT8bCabUDthEP/rfNZr/z/EUZfIKF6gCJ5031XaOtiydhCJjwhF
         NdJwlOOQr7CQ4/lap7BYu5U4cQmsWI219S8uL0KMsYJ+Gvap3V2CoCwyIk+klfmTMal1
         AQTL8BXPwhUv36T4Z6U+HI1rHHRQAj0n4DUJ3UxuDvIDVKctGeOQKzhCDdyQLz4q9iv/
         dIRI0UHxVwuRaxx8yPdJ8a++afV3hhVUk6GG6bp1rJDPydaQTNfWb6LYhvMngtWHamDW
         rjWWUaG1zDDcwmXlRSw3jAfzkvFDdb4buppmA2OW1NVA0eC89R1DFEL+M2qPZ2AvaQ7z
         pb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=N8TMoVnGizDGjD4F+oBcA8gM1V3wB7c/2Mybba8wb0M=;
        b=WM/91R4vOHH890b7yZh2JHdKqrgk7lNEqTllEBlxul9VqNn8likX3WenaAWawPTtgg
         OjVCUvGZL4xTC4WRfHvTPKwJj4C41/uYZAfs6wem52qsscOtvF6eZD8MLlk5q5sUDw0c
         hrwWEvd7tAZyWgpS61ffSVRdhANMOGH4z/QID8GZ/x2frLGR6DGVLfFJ0RTtssjZKjdR
         XQKjEYbGH3jejmKpZfMfewjHfs2SRcrLsOGaJqMmhyOr7dp5eO2OO/Hi4lB/lbZ8ocW4
         XBKIG/j/Yl1//lsNHWmo4cgxS2Hlgs/QO1kARYbDsTSEn8DcPKKgOvO9KLY2t1dhTq+q
         OYkA==
X-Gm-Message-State: ANhLgQ2qWbLCNZrzSU5oDK22rODBB95Uw8MqWm36iXHZYbwgb3L0hd9i
        4Pvf2NAr3gkXhMnWQKxRn8ho+Q==
X-Google-Smtp-Source: ADFU+vvGT8h9y5D5IP2yuhAd5w4BRZjij5dQKsXZveJYJfXMfBouDMsJyUJyTrGN7XomFrl9MAxJGA==
X-Received: by 2002:a2e:8250:: with SMTP id j16mr3024159ljh.274.1583355317967;
        Wed, 04 Mar 2020 12:55:17 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id f19sm3794523ljc.37.2020.03.04.12.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 12:55:17 -0800 (PST)
Date:   Wed, 4 Mar 2020 21:55:16 +0100
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] media: rcar-vin: Add support for SRGGB8_1X8
Message-ID: <20200304205516.GD1791497@oden.dyn.berto.se>
References: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165011.17898-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200228165011.17898-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-02-28 16:50:11 +0000, Lad Prabhakar wrote:
> Most of the RZ/G2x boards can support capturing frames in SRGGB8_1X8
> format, add support for this with a runtime check that the running
> hardware supports it.

Where is the runtime check for supported hardware? Also out of curiosity 
which boars can't support SRGGB and what setup are you using to test 
SRGGB capture?

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
>  drivers/media/platform/rcar-vin/rcar-csi2.c |  1 +
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 14 ++++++++++++--
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++

This patch shall be split in two. One which touches rcar-csi2.c and one 
for the other files as they are two different drivers.

>  4 files changed, 18 insertions(+), 2 deletions(-)
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
>  			vin->mbus_code = code.code;
>  			vin_dbg(vin, "Found media bus format for %s: %d\n",
>  				subdev->name, vin->mbus_code);
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 5b04e4768eb1..97e4886f63f0 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
>  	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
>  	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
>  	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
>  };
>  
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 1a30cd036371..63709b4bbf7a 100644
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
> @@ -587,13 +588,15 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
>  	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
>  
> -
>  	/* TODO: Add support for the UDS scaler. */
>  	if (vin->info->model != RCAR_GEN3)
>  		rvin_crop_scale_comp_gen2(vin);
>  
>  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
> -	stride = vin->format.bytesperline / fmt->bpp;
> +	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
> +		stride = ALIGN(vin->format.bytesperline / 2, 0x10);
> +	else
> +		stride = vin->format.bytesperline / fmt->bpp;

This does not look right, you should to move this logic into 
rvin_format_bytesperline().

>  	rvin_write(vin, stride, VNIS_REG);
>  }
>  
> @@ -676,6 +679,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  
>  		input_is_yuv = true;
>  		break;
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		vnmc |= VNMC_INF_RAW8;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -737,6 +743,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_ABGR32:
>  		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
>  		break;
> +	case V4L2_PIX_FMT_SRGGB8:
> +		dmr = 0;
> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1110,6 +1119,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		vin->mbus_code = fmt.format.code;
>  		break;
>  	default:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index b12b3f88836a..d56cf85ba065 100644
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
