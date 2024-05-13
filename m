Return-Path: <linux-media+bounces-11423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B38C4469
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AB5F1C20B7F
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A4415443B;
	Mon, 13 May 2024 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQ6g3R4N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BAF154423
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614790; cv=none; b=S1qQQJLw6qqpltSN4C3n6aAKdw8rxiWQaBB794UOwFh7G7Z/eU0LVHgKL7UhKf3y18e3ghfmSLUeVi05qHaFGwb5T6+fTIUQ9asxbu/dQ0IWy76MglGTG3AL+qseTwBuSAPsXN7CtV8c1T+O3cWaDGZvw/U0Tk2MCqF09g2dWeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614790; c=relaxed/simple;
	bh=e73Qxhnwot2lfI+R/UQMZ+swnRsXgYDtysktYG/a52c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYBABBLjMrqgwDhdFQd8YYs6tCeDXW3nAPtuX0SabIPMQdHCR3kWQsthEW9WNt4/0w3a76ZSY3OoZn2zYvYq5Jyk0LU4Bpweqw+jweVidG9pOZMMYiwZ/JN+hUuWK/Q0NqEOiBzwZvXyGrp5dckJyPMysLUUuw5W0HT0FUwA2rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQ6g3R4N; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-351c2c48effso102175f8f.3
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715614787; x=1716219587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rP2aaVf8dFLFhsm6qBn807LGYJgCX08X8bR7IKOZshs=;
        b=BQ6g3R4Ngf0OiUpdl9D/k/F6hKPQO0W2t+v6PLdCV6Qu2eio3dsHOM2ndG+kohqFyn
         Ni0jaYIZobU7ufewJ4v6GpPrn/WkumyA/Jitm1EWhGmnc/ZZAeRteQLhdGjie9SpPPv7
         RXx60k+uvIi/k6SUn/2sbtlvPf1cKFrHKc+QRbLKcIIsrZmdLFcsdxmaUXywutLkIIq/
         W9YH5AyjEu6LMdZu+zyGUgGp3BmuMUq7hssXTjAgb7QmgF0OHd6ZPBQHf3IW5YDuqkJw
         v0yRlmmnPjqA9Ac0o1QB87BDBP7usjWOn/TMMKyUGKf7lvkJjGCuFO93SBwYP7gqVYPM
         7cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715614787; x=1716219587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rP2aaVf8dFLFhsm6qBn807LGYJgCX08X8bR7IKOZshs=;
        b=f9MydKU/96rystMW6S6CkeyUFiphLYygxzGew+NqDlomUDB5qlN8q6MusnkYbXnM/l
         7W8QkPhiYyURG9ew6I4zkNQ2/dT59gWEKXjt2hyCMlB02JCfDAohE1qfzqruMDOcVaf6
         SY4tw7MC7TsiXXz2FfD3UwC95X8QwCtXjt6+JjeH7cHihsHw3kyjsqnLEJFOigkKzm1o
         mb7Fnl/UA3xkUIOzic6/608NNC5Sit1/ZIB0ws2C7+kLZgih50K7alI25PBVfEaMbS61
         BH4MuD6rEs/9AbOkil1+mrsYthUW6xy8CXrVik2ODhzdNSuurqDrrLhuxAX0M0eiHobl
         4CZw==
X-Gm-Message-State: AOJu0YyqMCTnh2629wkPbDfhFG4oLk/jyMK182gUhkMkItBLLBK3gM5o
	jPhLEhDvZbCzPi0Mb5qwUCKjODb/kV0OomOLf2K64kkLVyMqRadeOyh2jMi1e8oTskOTibUevuW
	L
X-Google-Smtp-Source: AGHT+IF5Mb4MetZLo2NIlSAgSaKFZbnchaSvxf1xX8BV6ry1OwySDhl9xiquDUFJJ5cHFoce/Hq+6Q==
X-Received: by 2002:adf:f705:0:b0:34d:7201:4616 with SMTP id ffacd0b85a97d-3504a20b1admr7155807f8f.0.1715614786869;
        Mon, 13 May 2024 08:39:46 -0700 (PDT)
Received: from [10.91.0.142] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf52sm11522861f8f.87.2024.05.13.08.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 08:39:46 -0700 (PDT)
Message-ID: <c6797921-2c2b-4dc1-866e-011d10c9d3c2@linaro.org>
Date: Mon, 13 May 2024 18:39:45 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: Move format related functions
Content-Language: en-US
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-6-quic_grosikop@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240411124543.199-6-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/24 15:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Move out the format related helper functions from vfe and video in a
> separate file. The goal here is to create a format API.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |  1 +
>   .../media/platform/qcom/camss/camss-format.c  | 98 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-format.h  |  5 +
>   drivers/media/platform/qcom/camss/camss-vfe.c | 86 +++++-----------
>   .../media/platform/qcom/camss/camss-video.c   | 26 +----
>   5 files changed, 128 insertions(+), 88 deletions(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-format.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 0d4389ab312d..e636968a1126 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -19,5 +19,6 @@ qcom-camss-objs += \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
>   		camss-video.o \
> +		camss-format.o \
>   
>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
> diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
> new file mode 100644
> index 000000000000..6279cb099625
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-format.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Technologies, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */

SPDX-License-Identifier is fully sufficient, the licence description shall be removed.

> +
> +#include <linux/bug.h>
> +#include <linux/errno.h>
> +
> +#include "camss-format.h"
> +
> +/*
> + * camss_format_get_bpp - Map media bus format to bits per pixel
> + * @formats: supported media bus formats array
> + * @nformats: size of @formats array
> + * @code: media bus format code
> + *
> + * Return number of bits per pixel
> + */
> +u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nformats; i++)
> +		if (code == formats[i].code)
> +			return formats[i].mbus_bpp;
> +
> +	WARN(1, "Unknown format\n");
> +
> +	return formats[0].mbus_bpp;
> +}
> +
> +/*
> + * camss_format_find_code - Find a format code in an array
> + * @code: a pointer to media bus format codes array
> + * @n_code: size of @code array
> + * @index: index of code in the array
> + * @req_code: required code
> + *
> + * Return media bus format code
> + */
> +u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code)
> +{
> +	int i;
> +
> +	if (!req_code && index >= n_code)
> +		return 0;
> +

0 as an error condition indicator is not very common, at least it shall be
documented in the comment.

> +	for (i = 0; i < n_code; i++) {
> +		if (req_code) {
> +			if (req_code == code[i])
> +				return req_code;
> +		} else {
> +			if (i == index)
> +				return code[i];
> +		}
> +	}
> +
> +	return code[0];
> +}
> +
> +/*
> + * camss_format_find_format - Find a format in an array
> + * @code: media bus format code
> + * @pixelformat: V4L2 pixel format FCC identifier
> + * @formats: a pointer to formats array
> + * @nformats: size of @formats array
> + *
> + * Return index of a format or a negative error code otherwise
> + */
> +int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
> +			     unsigned int nformats)
> +{
> +	int i;

unsigned int i

> +
> +	for (i = 0; i < nformats; i++) {
> +		if (formats[i].code == code &&
> +		    formats[i].pixelformat == pixelformat)
> +			return i;
> +	}
> +
> +	for (i = 0; i < nformats; i++) {
> +		if (formats[i].code == code)
> +			return i;
> +	}
> +
> +	WARN_ON(1);
> +

WARN_ON() is not needed here, it has to be removed.

> +	return -EINVAL;
> +}
> diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
> index bfbc761bd46c..86b5790e343d 100644
> --- a/drivers/media/platform/qcom/camss/camss-format.h
> +++ b/drivers/media/platform/qcom/camss/camss-format.h
> @@ -59,4 +59,9 @@ struct camss_formats {
>   	const struct camss_format_info *formats;
>   };
>   
> +u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code);
> +u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
> +int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
> +			     unsigned int nformats);
> +
>   #endif /* __CAMSS_FORMAT_H__ */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2d5a64c055f1..83c5a36d071f 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -278,48 +278,6 @@ const struct camss_formats vfe_formats_pix_845 = {
>   	.formats = formats_rdi_845
>   };
>   
> -/*
> - * vfe_get_bpp - map media bus format to bits per pixel
> - * @formats: supported media bus formats array
> - * @nformats: size of @formats array
> - * @code: media bus format code
> - *
> - * Return number of bits per pixel
> - */
> -static u8 vfe_get_bpp(const struct camss_format_info *formats,
> -		      unsigned int nformats, u32 code)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < nformats; i++)
> -		if (code == formats[i].code)
> -			return formats[i].mbus_bpp;
> -
> -	WARN(1, "Unknown format\n");
> -
> -	return formats[0].mbus_bpp;
> -}
> -
> -static u32 vfe_find_code(u32 *code, unsigned int n_code,
> -			 unsigned int index, u32 req_code)
> -{
> -	int i;
> -
> -	if (!req_code && (index >= n_code))
> -		return 0;
> -
> -	for (i = 0; i < n_code; i++)
> -		if (req_code) {
> -			if (req_code == code[i])
> -				return req_code;
> -		} else {
> -			if (i == index)
> -				return code[i];
> -		}
> -
> -	return code[0];
> -}
> -
>   static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   			    unsigned int index, u32 src_req_code)
>   {
> @@ -335,8 +293,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_YUYV8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		case MEDIA_BUS_FMT_YVYU8_1X16:
>   		{
> @@ -345,8 +303,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_YVYU8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		case MEDIA_BUS_FMT_UYVY8_1X16:
>   		{
> @@ -355,8 +313,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_UYVY8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		case MEDIA_BUS_FMT_VYUY8_1X16:
>   		{
> @@ -365,8 +323,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_VYUY8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		default:
>   			if (index > 0)
> @@ -391,8 +349,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_YUYV8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		case MEDIA_BUS_FMT_YVYU8_1X16:
>   		{
> @@ -404,8 +362,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_YVYU8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		case MEDIA_BUS_FMT_UYVY8_1X16:
>   		{
> @@ -417,8 +375,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_UYVY8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		case MEDIA_BUS_FMT_VYUY8_1X16:
>   		{
> @@ -430,8 +388,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   				MEDIA_BUS_FMT_VYUY8_1_5X8,
>   			};
>   
> -			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
> -					     index, src_req_code);
> +			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
> +						      index, src_req_code);
>   		}
>   		default:
>   			if (index > 0)
> @@ -714,9 +672,9 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>   				} else {
>   					struct vfe_line *l = &vfe->line[j];
>   
> -					bpp = vfe_get_bpp(l->formats,
> -						l->nformats,
> -						l->fmt[MSM_VFE_PAD_SINK].code);
> +					bpp = camss_format_get_bpp(l->formats,
> +								   l->nformats,
> +								   l->fmt[MSM_VFE_PAD_SINK].code);
>   					tmp = pixel_clock[j] * bpp / 64;
>   				}
>   
> @@ -795,9 +753,9 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>   				} else {
>   					struct vfe_line *l = &vfe->line[j];
>   
> -					bpp = vfe_get_bpp(l->formats,
> -						l->nformats,
> -						l->fmt[MSM_VFE_PAD_SINK].code);
> +					bpp = camss_format_get_bpp(l->formats,
> +								   l->nformats,
> +								   l->fmt[MSM_VFE_PAD_SINK].code);
>   					tmp = pixel_clock[j] * bpp / 64;
>   				}
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index cd13a432e291..00b10dda3615 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -28,27 +28,6 @@
>    * Helper functions
>    */
>   
> -static int video_find_format(u32 code, u32 pixelformat,
> -			     const struct camss_format_info *formats,
> -			     unsigned int nformats)
> -{
> -	int i;
> -
> -	for (i = 0; i < nformats; i++) {
> -		if (formats[i].code == code &&
> -		    formats[i].pixelformat == pixelformat)
> -			return i;
> -	}
> -
> -	for (i = 0; i < nformats; i++)
> -		if (formats[i].code == code)
> -			return i;
> -
> -	WARN_ON(1);
> -
> -	return -EINVAL;
> -}
> -
>   /*
>    * video_mbus_to_pix_mp - Convert v4l2_mbus_framefmt to v4l2_pix_format_mplane
>    * @mbus: v4l2_mbus_framefmt format (input)
> @@ -121,9 +100,8 @@ static int video_get_subdev_format(struct camss_video *video,
>   	if (ret)
>   		return ret;
>   
> -	ret = video_find_format(fmt.format.code,
> -				format->fmt.pix_mp.pixelformat,
> -				video->formats, video->nformats);
> +	ret = camss_format_find_format(fmt.format.code, format->fmt.pix_mp.pixelformat,
> +				       video->formats, video->nformats);
>   	if (ret < 0)
>   		return ret;
>   

--
Best wishes,
Vladimir

