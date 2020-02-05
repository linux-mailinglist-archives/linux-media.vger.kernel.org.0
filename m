Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145DC1532A2
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 15:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgBEORn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 09:17:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgBEORm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 09:17:42 -0500
Received: from [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae] (unknown [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A2AD028E9C0;
        Wed,  5 Feb 2020 14:17:36 +0000 (GMT)
Subject: Re: [PATCH 1/3] media: vimc: Support multiple buscodes for each
 pixelformat
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
 <20200202155019.1029993-2-nfraprado@protonmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <1d32848b-3009-1748-2823-5b91404c6426@collabora.com>
Date:   Wed, 5 Feb 2020 11:17:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200202155019.1029993-2-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nícolas,

Thanks for the patch, just some minor nits:

On 2/2/20 1:50 PM, Nícolas F. R. A. Prado wrote:
> Change vimc_pix_map_list to allow multiple media bus codes to map to the
> same pixelformat, making it possible to add media bus codes for which
> there are no pixelformat.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
>  drivers/media/platform/vimc/vimc-common.c | 68 ++++++++++++++---------
>  drivers/media/platform/vimc/vimc-common.h |  9 ++-
>  drivers/media/platform/vimc/vimc-scaler.c | 10 +++-
>  drivers/media/platform/vimc/vimc-sensor.c |  6 +-
>  4 files changed, 61 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 16ce9f3b7c75..55797e5ab2b1 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -19,19 +19,19 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* RGB formats */
>  	{
> -		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.code = {MEDIA_BUS_FMT_BGR888_1X24},

Could you add spaces around the curly brackets?
Example: https://git.linuxtv.org/media_tree.git/tree/drivers/media/common/v4l2-tpg/v4l2-tpg-colors.c#n35

>  		.pixelformat = V4L2_PIX_FMT_BGR24,
>  		.bpp = 3,
>  		.bayer = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.code = {MEDIA_BUS_FMT_RGB888_1X24},
>  		.pixelformat = V4L2_PIX_FMT_RGB24,
>  		.bpp = 3,
>  		.bayer = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
> +		.code = {MEDIA_BUS_FMT_ARGB8888_1X32},
>  		.pixelformat = V4L2_PIX_FMT_ARGB32,
>  		.bpp = 4,
>  		.bayer = false,
> @@ -39,49 +39,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* Bayer formats */
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.code = {MEDIA_BUS_FMT_SBGGR8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SBGGR8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.code = {MEDIA_BUS_FMT_SGBRG8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SGBRG8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.code = {MEDIA_BUS_FMT_SGRBG8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SGRBG8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.code = {MEDIA_BUS_FMT_SRGGB8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SRGGB8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.code = {MEDIA_BUS_FMT_SBGGR10_1X10},
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.code = {MEDIA_BUS_FMT_SGBRG10_1X10},
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.code = {MEDIA_BUS_FMT_SGRBG10_1X10},
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.code = {MEDIA_BUS_FMT_SRGGB10_1X10},
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10,
>  		.bpp = 2,
>  		.bayer = true,
> @@ -89,25 +89,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* 10bit raw bayer a-law compressed to 8 bits */
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
> +		.code = {MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
> +		.code = {MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
> +		.code = {MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
> +		.code = {MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
>  		.bpp = 1,
>  		.bayer = true,
> @@ -115,49 +115,49 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  
>  	/* 10bit raw bayer DPCM compressed to 8 bits */
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> +		.code = {MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> +		.code = {MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> +		.code = {MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> +		.code = {MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8},
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
>  		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.code = {MEDIA_BUS_FMT_SBGGR12_1X12},
>  		.pixelformat = V4L2_PIX_FMT_SBGGR12,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.code = {MEDIA_BUS_FMT_SGBRG12_1X12},
>  		.pixelformat = V4L2_PIX_FMT_SGBRG12,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.code = {MEDIA_BUS_FMT_SGRBG12_1X12},
>  		.pixelformat = V4L2_PIX_FMT_SGRBG12,
>  		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.code = {MEDIA_BUS_FMT_SRGGB12_1X12},
>  		.pixelformat = V4L2_PIX_FMT_SRGGB12,
>  		.bpp = 2,
>  		.bayer = true,
> @@ -182,13 +182,29 @@ const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
>  	return &vimc_pix_map_list[i];
>  }
>  
> +const u32 vimc_mbus_code_by_index(unsigned int i)> +{
> +	unsigned int j, k;

I would rename

s/i/index
s/j/i
s/k/j

> +
> +	for (j = 0; j < ARRAY_SIZE(vimc_pix_map_list); j++) {
> +		for (k = 0; vimc_pix_map_list[j].code[k]; k++) {
> +			if (!i)
> +				return vimc_pix_map_list[j].code[k];
> +			i--;
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
> index 87eb8259c2a8..132a5889f1ea 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -69,7 +69,7 @@ do {									\
>   * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
>   */
>  struct vimc_pix_map {
> -	unsigned int code;
> +	unsigned int code[3];

why 3?

>  	unsigned int bpp;
>  	u32 pixelformat;
>  	bool bayer;
> @@ -171,6 +171,13 @@ void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
>   */
>  const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
>  
> +/**
> + * vimc_mbus_code_by_index - get mbus code by its index
> + *
> + * @i:			index of the mbus code in vimc_pix_map_list
> + */

Could you add a comment saying it returns 0 if no mbus code is found?

Regards,
Helen

> +const u32 vimc_mbus_code_by_index(unsigned int i);
> +
>  /**
>   * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
>   *
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index e2e551bc3ded..d2ba0a2cfcc4 100644
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
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 32380f504591..9f4dd7fee9ab 100644
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
