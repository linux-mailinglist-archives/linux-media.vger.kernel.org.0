Return-Path: <linux-media+bounces-11421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B38C43EF
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9391C23089
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9016B5674C;
	Mon, 13 May 2024 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdFmxfc3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02B01EB5C
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715613359; cv=none; b=iSfWQKn9yQ1NwIk4RqAVUnx6k37HY9pYoCPf2IUccbwJLhCvYOmCWR6vyYD/fb4P6504obntvptalDCYYb2Be7fbgqHsKjb3CKUGs/wW+LMtkwWiavXS/MP12aNDK+S/NethJDbSxk8R+tvxZgKwQSYtTcXCqTaNTyzsBg9622g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715613359; c=relaxed/simple;
	bh=/2orZh053R+sZ2V8wrkpbFAjEdmdzEk1mYHCNXXo9Xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEiK1kYccLzyGYFyu+2mlBGcYvBPR+WBgkr5TnXnNZ5pSxJSCI7VK6zPB6/vXX0K2VSjkqIOzzHX2KVnCJLqgfQxvxfN6ObRYX8kZ6Qha+wiAeIIEuoNumbaxsZ9aN7gQhIK7Z9HO7JfcYTO7QwhLt0t2nUGjVOQSuRj0OPge3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdFmxfc3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59afb8a55aso107374166b.1
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715613354; x=1716218154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNfhgO5auj+G1pAmgHG64xPFj0nwejQhzgJPxZfvKts=;
        b=cdFmxfc3c5/qUJ9NY/KQeK9MucliPPSBiQCXWq68nhHnOiH/fBs1YlEWRlglJ1R9f2
         fTl7FUEKDe3Ve+aYCz85or3l1PbyDRpKXmON3Y3LvAVG+hE4bViyrmrpVEtbnBIJcAMj
         RG/Xbf8J7j87IrxxpzHLvQwVjXkTXwBW1VaUYM6Tj8sqSuXBrxrVvUCeRctYazPxptsr
         137O3RNxlOp+kiEu6feV3LHrQ/rgED/q5wxWv7GwRMgGryTLDna9FFrtKxFqGvMJIjrT
         ZubPhMvICqMfaBX8SjtKstR8HfEKRFlhnWv3wKXCgRv+ZpvnLDXB0KXywZual7diyPwz
         JbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715613354; x=1716218154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNfhgO5auj+G1pAmgHG64xPFj0nwejQhzgJPxZfvKts=;
        b=jh3a5gP70eqiMcNDjxF4DmqlD/38U0l6/6UGlwI0fZLXCgnnDBXwIhcJN0psG7jZ35
         lJIjmYNKMw97xeqTJCUfUEDUf72G0oNIGQ6bFV2l3Ffw1h0OCirPRBUoyOUbN9JFc30f
         EZzabw/8zPmSG4Yk9/bMeH37mH5ZRMtw48scU/jRiDmXkj9ZJKmDy17gN88ifcBXZYje
         p4iMs6yX5HfmGPOR6zwKyV7+vNRvgBhEQ3RBQRDBkoL5nVi5lacZOMvqNYdL5kfafLLa
         JCLbnVV75+G85h5Tw1+CzDKWA+MlEpyed801OcdXHfB0IH+KPLJ1KsOCLSbf0L6yLRRT
         SnwA==
X-Gm-Message-State: AOJu0YypeO1QVFAJkXcNEj23ye78MmweGsbsruD6xC1oAmPtPFfJcvL8
	clgXOtyoLGPV3t2DqkLHHZwS/SU9e8UTvtI9pco7t5OQ1+ydPlBRL1s+BZXx+uk=
X-Google-Smtp-Source: AGHT+IGXWBftDykKIbm0RO2aPy71Y3HrcVQiHkTasLFMeNd051PHYab8Hqj/d/03gr03TJ2LtWaIrw==
X-Received: by 2002:a17:906:b85a:b0:a59:b02a:90e0 with SMTP id a640c23a62f3a-a5a2d673188mr627766566b.7.1715613353824;
        Mon, 13 May 2024 08:15:53 -0700 (PDT)
Received: from [10.91.0.142] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d57sm610659266b.73.2024.05.13.08.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 08:15:53 -0700 (PDT)
Message-ID: <c76957b9-d57d-469d-87c8-c9f59b4462b0@linaro.org>
Date: Mon, 13 May 2024 18:15:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: Attach formats to VFE
 resources
Content-Language: en-US
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-3-quic_grosikop@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240411124543.199-3-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/24 15:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Video node formats have direct dependency by the sub-device pad formats.
> Remove dependency for SoC version and move format definitions in device
> which creates video node.
> 
> This commit attaches a struct to the VFE resources that holds format
> description, so it is much easier to assign them to the video node.
> No need to use a switch-case.
> 
> NOTE: The mbus_bpp is used to calculate the clock rates and is different
> from bpp which is the bits per pixel written to memory. We need to keep
> both values to not break the calcualtions.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-format.h  |  62 +++
>   drivers/media/platform/qcom/camss/camss-vfe.c | 359 ++++++++++++------
>   drivers/media/platform/qcom/camss/camss-vfe.h |  11 +-
>   .../media/platform/qcom/camss/camss-video.c   | 269 +------------
>   .../media/platform/qcom/camss/camss-video.h   |   5 +-
>   drivers/media/platform/qcom/camss/camss.c     |  80 +++-
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   7 files changed, 383 insertions(+), 404 deletions(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-format.h
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
> new file mode 100644
> index 000000000000..bfbc761bd46c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-format.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
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
> +

The given SPDX-License-Identifier tag is sufficient to describe the licence,
so all the lines above but the first one are redundant and should be removed.

> +#define PER_PLANE_DATA(plane, h_fract_num, h_fract_den, v_fract_num, v_fract_den, _bpp)		\
> +	.hsub[(plane)].numerator	= (h_fract_num),					\
> +	.hsub[(plane)].denominator	= (h_fract_den),					\
> +	.vsub[(plane)].numerator	= (v_fract_num),					\
> +	.vsub[(plane)].denominator	= (v_fract_den),					\
> +	.bpp[(plane)]			= (_bpp)
> +
> +#ifndef __CAMSS_FORMAT_H__
> +#define __CAMSS_FORMAT_H__
> +

PER_PLANE_DATA macro declaration shall be put under __CAMSS_FORMAT_H__ macro guard,
otherwise the macro guard does not work as expected, you'll get compile time issues,
if you enter some kind of a header include collision.

> +#include <linux/types.h>
> +
> +/*
> + * struct fract - Represents a fraction
> + * @numerator: Store the numerator part of the fraction
> + * @denominator: Store the denominator part of the fraction
> + */
> +struct fract {
> +	u8 numerator;
> +	u8 denominator;
> +};
> +

Please note a "struct v4l2_fract" and find the next comment.

I see that the structure is moved from "camss-video.c", to some extent it
might be acceptable to keep it .c file, but probably it's better to replace
it in a header file.

> +/*
> + * struct camss_format_info - ISP media bus format information
> + * @code: V4L2 media bus format code
> + * @mbus_bpp: Media bus bits per pixel
> + * @pixelformat: V4L2 pixel format FCC identifier

Apparently and according to the comments above the header file references
to V4L2 specific structures and types. So, I'd say it makes a sense to
reuse V4L2 code rather than redefining it.

> + * @planes: Number of planes
> + * @hsub: Horizontal subsampling (for each plane)
> + * @vsub: Vertical subsampling (for each plane)
> + * @bpp: Bits per pixel when stored in memory (for each plane)
> + */
> +struct camss_format_info {
> +	u32 code;
> +	u32 mbus_bpp;
> +	u32 pixelformat;
> +	u8 planes;
> +	struct fract hsub[3];
> +	struct fract vsub[3];
> +	unsigned int bpp[3];

struct plane {
	struct fract hsub;
	struct fract vsub;
	unsigned int bpp;
}

and then define an array of planes, plance argument will go away from the macro in
the beginning of the file.

> +};
> +
> +struct camss_formats {
> +	unsigned int nformats;
> +	const struct camss_format_info *formats;
> +};
> +
> +#endif /* __CAMSS_FORMAT_H__ */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 459c70a4b319..2d5a64c055f1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -32,96 +32,250 @@
>   
>   #define SCALER_RATIO_MAX 16
>   
> -struct vfe_format {
> -	u32 code;
> -	u8 bpp;
> +static const struct camss_format_info formats_rdi_8x16[] = {
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +};
> +
> +static const struct camss_format_info formats_rdi_8x96[] = {
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +};
> +
> +static const struct camss_format_info formats_rdi_845[] = {
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_Y8_1X8, 8, V4L2_PIX_FMT_GREY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +};
> +
> +static const struct camss_format_info formats_pix_8x16[] = {
> +	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +};
> +
> +static const struct camss_format_info formats_pix_8x96[] = {
> +	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +};
> +
> +const struct camss_formats vfe_formats_rdi_8x16 = {
> +	.nformats = ARRAY_SIZE(formats_rdi_8x16),
> +	.formats = formats_rdi_8x16
>   };
>   
> -static const struct vfe_format formats_rdi_8x16[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
> +const struct camss_formats vfe_formats_pix_8x16 = {
> +	.nformats = ARRAY_SIZE(formats_pix_8x16),
> +	.formats = formats_pix_8x16
>   };
>   
> -static const struct vfe_format formats_pix_8x16[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
> +const struct camss_formats vfe_formats_rdi_8x96 = {
> +	.nformats = ARRAY_SIZE(formats_rdi_8x96),
> +	.formats = formats_rdi_8x96
>   };
>   
> -static const struct vfe_format formats_rdi_8x96[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16 },
> -	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
> +const struct camss_formats vfe_formats_pix_8x96 = {
> +	.nformats = ARRAY_SIZE(formats_pix_8x96),
> +	.formats = formats_pix_8x96
>   };
>   
> -static const struct vfe_format formats_pix_8x96[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
> +const struct camss_formats vfe_formats_rdi_845 = {
> +	.nformats = ARRAY_SIZE(formats_rdi_845),
> +	.formats = formats_rdi_845
>   };
>   
> -static const struct vfe_format formats_rdi_845[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16 },
> -	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> -	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
> -	{ MEDIA_BUS_FMT_Y8_1X8, 8 },
> -	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
> +/* TODO: Replace with pix formats */
> +const struct camss_formats vfe_formats_pix_845 = {
> +	.nformats = ARRAY_SIZE(formats_rdi_845),
> +	.formats = formats_rdi_845
>   };
>   
>   /*
> @@ -132,18 +286,18 @@ static const struct vfe_format formats_rdi_845[] = {
>    *
>    * Return number of bits per pixel
>    */
> -static u8 vfe_get_bpp(const struct vfe_format *formats,
> +static u8 vfe_get_bpp(const struct camss_format_info *formats,
>   		      unsigned int nformats, u32 code)
>   {
>   	unsigned int i;
>   
>   	for (i = 0; i < nformats; i++)
>   		if (code == formats[i].code)
> -			return formats[i].bpp;
> +			return formats[i].mbus_bpp;
>   
>   	WARN(1, "Unknown format\n");
>   
> -	return formats[0].bpp;
> +	return formats[0].mbus_bpp;
>   }
>   
>   static u32 vfe_find_code(u32 *code, unsigned int n_code,
> @@ -1495,32 +1649,12 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		init_completion(&l->output.sof);
>   		init_completion(&l->output.reg_update);
>   
> -		switch (camss->res->version) {
> -		case CAMSS_8x16:
> -			if (i == VFE_LINE_PIX) {
> -				l->formats = formats_pix_8x16;
> -				l->nformats = ARRAY_SIZE(formats_pix_8x16);
> -			} else {
> -				l->formats = formats_rdi_8x16;
> -				l->nformats = ARRAY_SIZE(formats_rdi_8x16);
> -			}
> -			break;
> -		case CAMSS_8x96:
> -		case CAMSS_660:
> -			if (i == VFE_LINE_PIX) {
> -				l->formats = formats_pix_8x96;
> -				l->nformats = ARRAY_SIZE(formats_pix_8x96);
> -			} else {
> -				l->formats = formats_rdi_8x96;
> -				l->nformats = ARRAY_SIZE(formats_rdi_8x96);
> -			}
> -			break;
> -		case CAMSS_845:
> -		case CAMSS_8250:
> -		case CAMSS_8280XP:
> -			l->formats = formats_rdi_845;
> -			l->nformats = ARRAY_SIZE(formats_rdi_845);
> -			break;
> +		if (i == VFE_LINE_PIX) {
> +			l->nformats = res->vfe.formats_pix->nformats;
> +			l->formats = res->vfe.formats_pix->formats;
> +		} else {
> +			l->nformats = res->vfe.formats_rdi->nformats;
> +			l->formats = res->vfe.formats_rdi->formats;
>   		}
>   	}
>   
> @@ -1684,10 +1818,13 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   			video_out->bpl_alignment = 16;
>   			video_out->line_based = 1;
>   		}
> +
> +		video_out->nformats = vfe->line[i].nformats;
> +		video_out->formats = vfe->line[i].formats;
> +
>   		snprintf(name, ARRAY_SIZE(name), "%s%d_%s%d",
>   			 MSM_VFE_NAME, vfe->id, "video", i);
> -		ret = msm_video_register(video_out, v4l2_dev, name,
> -					 i == VFE_LINE_PIX ? 1 : 0);
> +		ret = msm_video_register(video_out, v4l2_dev, name);
>   		if (ret < 0) {
>   			dev_err(dev, "Failed to register video node: %d\n",
>   				ret);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 87fc159c48cc..10e2cc3c0b83 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -92,7 +92,7 @@ struct vfe_line {
>   	struct v4l2_rect crop;
>   	struct camss_video video_out;
>   	struct vfe_output output;
> -	const struct vfe_format *formats;
> +	const struct camss_format_info *formats;
>   	unsigned int nformats;
>   };
>   
> @@ -132,6 +132,8 @@ struct vfe_subdev_resources {
>   	bool has_pd;
>   	char *pd_name;
>   	const struct vfe_hw_ops *hw_ops;
> +	const struct camss_formats *formats_rdi;
> +	const struct camss_formats *formats_pix;
>   };
>   
>   struct vfe_device {
> @@ -224,6 +226,13 @@ void vfe_pm_domain_off(struct vfe_device *vfe);
>    */
>   int vfe_pm_domain_on(struct vfe_device *vfe);
>   
> +extern const struct camss_formats vfe_formats_rdi_8x16;
> +extern const struct camss_formats vfe_formats_pix_8x16;
> +extern const struct camss_formats vfe_formats_rdi_8x96;
> +extern const struct camss_formats vfe_formats_pix_8x96;
> +extern const struct camss_formats vfe_formats_rdi_845;
> +extern const struct camss_formats vfe_formats_pix_845;
> +
>   extern const struct vfe_hw_ops vfe_ops_4_1;
>   extern const struct vfe_hw_ops vfe_ops_4_7;
>   extern const struct vfe_hw_ops vfe_ops_4_8;
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 54cd82f74115..cd13a432e291 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -24,244 +24,6 @@
>   #define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
>   #define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
>   
> -struct fract {
> -	u8 numerator;
> -	u8 denominator;
> -};
> -
> -/*
> - * struct camss_format_info - ISP media bus format information
> - * @code: V4L2 media bus format code
> - * @pixelformat: V4L2 pixel format FCC identifier
> - * @planes: Number of planes
> - * @hsub: Horizontal subsampling (for each plane)
> - * @vsub: Vertical subsampling (for each plane)
> - * @bpp: Bits per pixel when stored in memory (for each plane)
> - */
> -struct camss_format_info {
> -	u32 code;
> -	u32 pixelformat;
> -	u8 planes;
> -	struct fract hsub[3];
> -	struct fract vsub[3];
> -	unsigned int bpp[3];
> -};
> -
> -static const struct camss_format_info formats_rdi_8x16[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -};
> -
> -static const struct camss_format_info formats_rdi_8x96[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, V4L2_PIX_FMT_SBGGR10, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SBGGR14_1X14, V4L2_PIX_FMT_SBGGR14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_SGBRG14_1X14, V4L2_PIX_FMT_SGBRG14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_SGRBG14_1X14, V4L2_PIX_FMT_SGRBG14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -};
> -
> -static const struct camss_format_info formats_rdi_845[] = {
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, V4L2_PIX_FMT_SBGGR10, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
> -	{ MEDIA_BUS_FMT_SBGGR14_1X14, V4L2_PIX_FMT_SBGGR14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_SGBRG14_1X14, V4L2_PIX_FMT_SGBRG14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_SGRBG14_1X14, V4L2_PIX_FMT_SGRBG14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
> -	{ MEDIA_BUS_FMT_Y8_1X8, V4L2_PIX_FMT_GREY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
> -	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -};
> -
> -static const struct camss_format_info formats_pix_8x16[] = {
> -	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -};
> -
> -static const struct camss_format_info formats_pix_8x96[] = {
> -	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
> -	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV16, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV61, 1,
> -	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
> -	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
> -};
> -
>   /* -----------------------------------------------------------------------------
>    * Helper functions
>    */
> @@ -968,8 +730,7 @@ static int msm_video_init_format(struct camss_video *video)
>    * Return 0 on success or a negative error code otherwise
>    */
>   
> -int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
> -		       const char *name, int is_pix)
> +int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev, const char *name)

Please wrap the line above.

>   {
>   	struct media_pad *pad = &video->pad;
>   	struct video_device *vdev;
> @@ -1006,34 +767,6 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   
>   	mutex_init(&video->lock);
>   
> -	switch (video->camss->res->version) {
> -	case CAMSS_8x16:
> -		if (is_pix) {
> -			video->formats = formats_pix_8x16;
> -			video->nformats = ARRAY_SIZE(formats_pix_8x16);
> -		} else {
> -			video->formats = formats_rdi_8x16;
> -			video->nformats = ARRAY_SIZE(formats_rdi_8x16);
> -		}
> -		break;
> -	case CAMSS_8x96:
> -	case CAMSS_660:
> -		if (is_pix) {
> -			video->formats = formats_pix_8x96;
> -			video->nformats = ARRAY_SIZE(formats_pix_8x96);
> -		} else {
> -			video->formats = formats_rdi_8x96;
> -			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
> -		}
> -		break;
> -	case CAMSS_845:
> -	case CAMSS_8250:
> -	case CAMSS_8280XP:
> -		video->formats = formats_rdi_845;
> -		video->nformats = ARRAY_SIZE(formats_rdi_845);
> -		break;
> -	}
> -
>   	ret = msm_video_init_format(video);
>   	if (ret < 0) {
>   		dev_err(v4l2_dev->dev, "Failed to init format: %d\n", ret);
> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
> index bdbae8424140..4f6c0821ead2 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.h
> +++ b/drivers/media/platform/qcom/camss/camss-video.h
> @@ -33,8 +33,6 @@ struct camss_video_ops {
>   			     enum vb2_buffer_state state);
>   };
>   
> -struct camss_format_info;
> -
>   struct camss_video {
>   	struct camss *camss;
>   	struct vb2_queue vb2_q;
> @@ -52,8 +50,7 @@ struct camss_video {
>   	unsigned int nformats;
>   };
>   
> -int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
> -		       const char *name, int is_pix);
> +int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev, const char *name);

Please wrap the line above.

>   
>   void msm_video_unregister(struct camss_video *video);
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e4ae81dc9a15..f3242d2d9807 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -143,7 +143,9 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
>   		.type = CAMSS_SUBDEV_TYPE_VFE,
>   		.vfe = {
>   			.line_num = 3,
> -			.hw_ops = &vfe_ops_4_1
> +			.hw_ops = &vfe_ops_4_1,
> +			.formats_rdi = &vfe_formats_rdi_8x16,
> +			.formats_pix = &vfe_formats_pix_8x16
>   		}
>   	}
>   };
> @@ -318,7 +320,9 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
>   		.vfe = {
>   			.line_num = 3,
>   			.has_pd = true,
> -			.hw_ops = &vfe_ops_4_7
> +			.hw_ops = &vfe_ops_4_7,
> +			.formats_rdi = &vfe_formats_rdi_8x96,
> +			.formats_pix = &vfe_formats_pix_8x96
>   		}
>   	},
>   
> @@ -342,7 +346,9 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
>   		.vfe = {
>   			.line_num = 3,
>   			.has_pd = true,
> -			.hw_ops = &vfe_ops_4_7
> +			.hw_ops = &vfe_ops_4_7,
> +			.formats_rdi = &vfe_formats_rdi_8x96,
> +			.formats_pix = &vfe_formats_pix_8x96
>   		}
>   	}
>   };
> @@ -538,7 +544,9 @@ static const struct camss_subdev_resources vfe_res_660[] = {
>   		.vfe = {
>   			.line_num = 3,
>   			.has_pd = true,
> -			.hw_ops = &vfe_ops_4_8
> +			.hw_ops = &vfe_ops_4_8,
> +			.formats_rdi = &vfe_formats_rdi_8x96,
> +			.formats_pix = &vfe_formats_pix_8x96
>   		}
>   	},
>   
> @@ -565,7 +573,9 @@ static const struct camss_subdev_resources vfe_res_660[] = {
>   		.vfe = {
>   			.line_num = 3,
>   			.has_pd = true,
> -			.hw_ops = &vfe_ops_4_8
> +			.hw_ops = &vfe_ops_4_8,
> +			.formats_rdi = &vfe_formats_rdi_8x96,
> +			.formats_pix = &vfe_formats_pix_8x96
>   		}
>   	}
>   };
> @@ -758,7 +768,9 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.has_pd = true,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   
> @@ -784,7 +796,9 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.has_pd = true,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   
> @@ -809,7 +823,9 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	}
>   };
> @@ -985,7 +1001,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
>   			.line_num = 3,
>   			.has_pd = true,
>   			.pd_name = "ife0",
> -			.hw_ops = &vfe_ops_480
> +			.hw_ops = &vfe_ops_480,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE1 */
> @@ -1010,7 +1028,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
>   			.line_num = 3,
>   			.has_pd = true,
>   			.pd_name = "ife1",
> -			.hw_ops = &vfe_ops_480
> +			.hw_ops = &vfe_ops_480,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE2 (lite) */
> @@ -1033,7 +1053,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_480
> +			.hw_ops = &vfe_ops_480,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE3 (lite) */
> @@ -1056,7 +1078,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_480
> +			.hw_ops = &vfe_ops_480,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   };
> @@ -1267,7 +1291,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.pd_name = "ife0",
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE1 */
> @@ -1285,7 +1311,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.pd_name = "ife1",
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE2 */
> @@ -1303,7 +1331,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.pd_name = "ife2",
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE3 */
> @@ -1321,7 +1351,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.pd_name = "ife3",
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE_LITE_0 */
> @@ -1338,7 +1370,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE_LITE_1 */
> @@ -1355,7 +1389,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE_LITE_2 */
> @@ -1372,7 +1408,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   	/* VFE_LITE_3 */
> @@ -1389,7 +1427,9 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
>   		.vfe = {
>   			.is_lite = true,
>   			.line_num = 4,
> -			.hw_ops = &vfe_ops_170
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
>   		}
>   	},
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 2477821dfd85..4b13012940bf 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -22,6 +22,7 @@
>   #include "camss-csiphy.h"
>   #include "camss-ispif.h"
>   #include "camss-vfe.h"
> +#include "camss-format.h"
>   
>   #define to_camss(ptr_module)	\
>   	container_of(ptr_module, struct camss, ptr_module)

--
Best wishes,
Vladimir

