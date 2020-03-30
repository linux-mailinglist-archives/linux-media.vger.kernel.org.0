Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B47E19848C
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 21:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgC3Tg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 15:36:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35820 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbgC3Tg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 15:36:57 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 178E1293630;
        Mon, 30 Mar 2020 20:36:50 +0100 (BST)
Subject: Re: [PATCH v2 1/3] media: vimc: Support multiple media bus codes for
 each pixelformat
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-2-nfraprado@protonmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <e41520f6-1d2e-9d36-3693-1e6d950ecf2f@collabora.com>
Date:   Mon, 30 Mar 2020 16:36:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200326214730.2449707-2-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nícolas,

thank you for the patch.

The series looks good in general, just minor comments below.

On 3/26/20 6:47 PM, Nícolas F. R. A. Prado wrote:
> Change vimc_pix_map_list to allow multiple media bus codes to map to the
> same pixelformat, making it possible to add media bus codes for which
> there are no pixelformat.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> 
> Changes in v2:
> - Fix vimc_mbus_code_by_index not checking code array bounds
> - Fix array formatting
> - Rename variables
> - Change code array size
> - Add comment about vimc_mbus_code_by_index return value
> 
>  drivers/media/platform/vimc/vimc-common.c | 70 ++++++++++++++---------
>  drivers/media/platform/vimc/vimc-common.h | 11 +++-
>  drivers/media/platform/vimc/vimc-scaler.c | 10 +++-
>  drivers/media/platform/vimc/vimc-sensor.c |  6 +-
>  4 files changed, 65 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index c95c17c048f2..119846f3eaa5 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -19,19 +19,19 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* RGB formats */
>  	{
> -		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.code = { MEDIA_BUS_FMT_BGR888_1X24 },
>  		.pixelformat = V4L2_PIX_FMT_BGR24,
>  		.bpp = 3,
>  		.bayer = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.code = { MEDIA_BUS_FMT_RGB888_1X24 },
>  		.pixelformat = V4L2_PIX_FMT_RGB24,
>  		.bpp = 3,
>  		.bayer = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
> +		.code = { MEDIA_BUS_FMT_ARGB8888_1X32 },
>  		.pixelformat = V4L2_PIX_FMT_ARGB32,
>  		.bpp = 4,
>  		.bayer = false,
> @@ -39,49 +39,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* Bayer formats */
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.code = { MEDIA_BUS_FMT_SBGGR8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SBGGR8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.code = { MEDIA_BUS_FMT_SGBRG8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SGBRG8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.code = { MEDIA_BUS_FMT_SGRBG8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SGRBG8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.code = { MEDIA_BUS_FMT_SRGGB8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SRGGB8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.code = { MEDIA_BUS_FMT_SBGGR10_1X10 },
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.code = { MEDIA_BUS_FMT_SGBRG10_1X10 },
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.code = { MEDIA_BUS_FMT_SGRBG10_1X10 },
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.code = { MEDIA_BUS_FMT_SRGGB10_1X10 },
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10,
>  		.bpp = 2,
>  		.bayer = true,
> @@ -89,25 +89,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* 10bit raw bayer a-law compressed to 8 bits */
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
> +		.code = { MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
> +		.code = { MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
> +		.code = { MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
> +		.code = { MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
> @@ -115,49 +115,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* 10bit raw bayer DPCM compressed to 8 bits */
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> +		.code = { MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> +		.code = { MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> +		.code = { MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> +		.code = { MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8 },
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.code = { MEDIA_BUS_FMT_SBGGR12_1X12 },
>  		.pixelformat = V4L2_PIX_FMT_SBGGR12,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.code = { MEDIA_BUS_FMT_SGBRG12_1X12 },
>  		.pixelformat = V4L2_PIX_FMT_SGBRG12,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.code = { MEDIA_BUS_FMT_SGRBG12_1X12 },
>  		.pixelformat = V4L2_PIX_FMT_SGRBG12,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.code = { MEDIA_BUS_FMT_SRGGB12_1X12 },
>  		.pixelformat = V4L2_PIX_FMT_SRGGB12,
>  		.bpp = 2,
>  		.bayer = true,
> @@ -182,13 +182,31 @@ const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
>  	return &vimc_pix_map_list[i];
>  }
>  
> +const u32 vimc_mbus_code_by_index(unsigned int index)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
> +		for (j = 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j++) {
> +			if (vimc_pix_map_list[i].code[j]) {

Can this be false?

> +				if (!index)
> +					return vimc_pix_map_list[i].code[j];
> +				index--;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
>  const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
>  {
> -	unsigned int i;
> +	unsigned int i, j;
>  
>  	for (i = 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
> -		if (vimc_pix_map_list[i].code == code)
> -			return &vimc_pix_map_list[i];
> +		for (j = 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j++) {
> +			if (vimc_pix_map_list[i].code[j] == code)
> +				return &vimc_pix_map_list[i];
> +		}
>  	}
>  	return NULL;
>  }
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 616d5a6b0754..585441694c86 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -69,7 +69,7 @@ do {									\
>   * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
>   */
>  struct vimc_pix_map {
> -	unsigned int code;
> +	unsigned int code[1];
>  	unsigned int bpp;
>  	u32 pixelformat;
>  	bool bayer;
> @@ -172,6 +172,15 @@ void vimc_sen_release(struct vimc_ent_device *ved);
>   */
>  const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
>  
> +/**
> + * vimc_mbus_code_by_index - get mbus code by its index
> + *
> + * @index:		index of the mbus code in vimc_pix_map_list
> + *
> + * Returns 0 if no mbus code is found for the given index.
> + */
> +const u32 vimc_mbus_code_by_index(unsigned int index);
> +
>  /**
>   * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
>   *
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index 7521439747c5..6bac1fa65a6f 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -110,13 +110,19 @@ static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_pad_config *cfg,
>  				   struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
> +	const u32 mbus_code = vimc_mbus_code_by_index(code->index);
> +	const struct vimc_pix_map *vpix;
> +
> +	if (!mbus_code)
> +		return -EINVAL;
> +
> +	vpix = vimc_pix_map_by_code(mbus_code);
>  
>  	/* We don't support bayer format */
>  	if (!vpix || vpix->bayer)
>  		return -EINVAL;
>  
> -	code->code = vpix->code;
> +	code->code = mbus_code;

no need to change this.

>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 92daee58209e..b8bd430809c1 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -52,12 +52,12 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_pad_config *cfg,
>  				   struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
> +	const u32 mbus_code = vimc_mbus_code_by_index(code->index);
>  
> -	if (!vpix)
> +	if (!mbus_code)
>  		return -EINVAL;
>  
> -	code->code = vpix->code;
> +	code->code = mbus_code;
>  
>  	return 0;
>  }
> 

With these changes

Acked-by: Helen Koike <helen.koike@collabora.com>

Regards,
Helen
