Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756DD17F83C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 13:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgCJMqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 08:46:09 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36310 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgCJMqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 08:46:09 -0400
Received: by mail-lf1-f66.google.com with SMTP id s1so10767387lfd.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gSh1O1Tg9hbTntXDCgjlVsmaZkd6pHTV1/gOIcuwgPA=;
        b=gBX0hj2bXSbp6ZWoSSKmNdJnfp75xbmMV8MJPUiA15XORwlHFEVauBYND86NTZjePe
         uMWEWtNNrphpDgivuZbFv64ouBIlSFLbilwZbzkEP4+lDXLRNVdOZh9CE+xD6jNOsJs7
         toYBQQeNbDyh4fT09xiiQnN2fGYbuj9I7YeeZ536wtMuCh3jByrjO/NZ2X6yvXnsl4I5
         jP3Jkw15A01benfiwwOLuORcAQmA0ZahHiP+CzcIdgMutm6kPKvVXtUk5uWkHhlkysD3
         HaWjZQxlfG15VjJEWCWUawaTHG3hlxHiVaAekhkAs5lBFFdLYGW8HUSTtVx+qQ9cpyrV
         G31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gSh1O1Tg9hbTntXDCgjlVsmaZkd6pHTV1/gOIcuwgPA=;
        b=YKeVOzzxamNRAj3u3br1t1PEfGeJobZI6s8GYpeUykLcux6n76hKsvazGoCgeAItjr
         zpOuH3EgculYFDaf/RIHrybaIx3BFgNaJzb4+pzyKtWbZ4I7K8XcFSmKs/2xiC4BDXbd
         W59yhdq7qsOZw7NuM9efv+1UMusY69V0+cCyKCB/x6wzj/YacEHPfeUY/deAtYMEG1D8
         rAJQYGwBLEngY5p7VJA/4ceHrs51rs/K4rCtRImxDmJR3k+wnhMnTsTdAu4fwLkwQCo6
         5w2BJKHJyjwZjgDFJ0vrwxTHO68MXED8KGh87z2GUkptPcTXvqauQScdnFjb87C/2wea
         Ijow==
X-Gm-Message-State: ANhLgQ0g3RWpL2u8EbKL7U2IrtDNI63ksZ9PvpgDfz2Y5j8/wdlT0YgY
        WGnn1AmeqPe712fHyb2UZyfoew==
X-Google-Smtp-Source: ADFU+vujsGPeuu/uOOnds8ODD/USMbLgA+oa2eE0LaLi60lfZcm8MGkkOgN13EGJlp/DwCPZ7b32NQ==
X-Received: by 2002:a19:ac42:: with SMTP id r2mr8254913lfc.38.1583844366775;
        Tue, 10 Mar 2020 05:46:06 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id c22sm3508834lfm.25.2020.03.10.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 05:46:05 -0700 (PDT)
Date:   Tue, 10 Mar 2020 13:46:05 +0100
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Message-ID: <20200310124605.GO2975348@oden.dyn.berto.se>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-03-10 11:06:03 +0000, Lad Prabhakar wrote:
> Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by setting
> format type to RAW8 in VNMC register and appropriately setting the
> bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  9 ++++++++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 13 ++++++++++++-
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 7440c89..76daf2f 100644
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
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 1a30cd0..1c1fafa 100644
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
> @@ -587,7 +588,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
>  	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
>  
> -
>  	/* TODO: Add support for the UDS scaler. */
>  	if (vin->info->model != RCAR_GEN3)
>  		rvin_crop_scale_comp_gen2(vin);
> @@ -676,6 +676,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  
>  		input_is_yuv = true;
>  		break;
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		vnmc |= VNMC_INF_RAW8;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -737,6 +740,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_ABGR32:
>  		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
>  		break;
> +	case V4L2_PIX_FMT_SRGGB8:
> +		dmr = 0;
> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1110,6 +1116,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		vin->mbus_code = fmt.format.code;
>  		break;
>  	default:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 5151a3c..4698099 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_ABGR32,
>  		.bpp			= 4,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_SRGGB8,
> +		.bpp			= 2,

This does not look right, is not bytes-per-pixel 1 for a SRGGB8?

> +	},
>  };
>  
>  const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> @@ -102,6 +106,7 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
>  {
>  	const struct rvin_video_format *fmt;
>  	u32 align;
> +	u8 div;
>  
>  	fmt = rvin_format_from_pixel(vin, pix->pixelformat);
>  
> @@ -112,16 +117,22 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV16:
>  		align = 0x20;
> +		div = 1;
> +		break;
> +	case V4L2_PIX_FMT_SRGGB8:
> +		align = 0x10;
> +		div = 2;

Yes this does not look right at all, I think you should set bpp to 1 and 
drop the div handling here.

>  		break;
>  	default:
>  		align = 0x10;
> +		div = 1;
>  		break;
>  	}
>  
>  	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
>  		align = 0x80;
>  
> -	return ALIGN(pix->width, align) * fmt->bpp;
> +	return ALIGN(pix->width / div, align) * fmt->bpp;
>  }
>  
>  static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
