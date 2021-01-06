Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7812EC2D3
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 18:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbhAFR4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 12:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbhAFR4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 12:56:23 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CA1C061575
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:55:43 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id n16so3559838wmc.0
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=N7UgmQ/ll5UXd8f2OXqc6eTsQppsoyL3GcHFnRI5XyA=;
        b=iduQVIIw7JboWenS1imaq9Zzl+3ybSl+d74SJIxQeiUzvzdU+8SRFZmCjXF5lciINQ
         lYmJ6bbHiMENhqg2j6SWS2FUCkUzusdNski2a8IZmn2ZhVI/wy7TUAaDhp53tibcgACA
         NrSkNX0gUC4UPF1y8k389hmEHU23wY8Yxuvr9SuK5PYLlbFMaRcKQQzJ/kEmFLABErGj
         1hKfG+tBwgkt6JjGSZN/ckB2EoGaGlTiAeYY63i8rFGTFPlT0W0/HRsbHoiEfHSoeSS3
         YlD5C/R/ZKZ2xSYOKkRVKofMzdTfQhjw8K400T93cIBU1i/6KB3Zvw4u2x5ezt60UhXM
         /bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=N7UgmQ/ll5UXd8f2OXqc6eTsQppsoyL3GcHFnRI5XyA=;
        b=fuSzAr9aGKf3iCjDIZkPlCPhdVJOVKPErzl056b9niUurW2dJOPOdHD5yILcHkJD2Y
         L1fvIQ7kdFJie0mPu2DioQozzUMBsf4xNGLrAqOyhneMLzWyIXr/EeuNJqQixqnkMKw/
         2on6Nsf6RN0CnDTBeYVMsTaowJXkYezKn71p49DAxSt76h+xxFJA5CVlpVya25d0TLSU
         TzB0Ab3LevcBl6Yh01Z4HRLaaRjoWs04AbynQRCGZVtMIP8Y1QQTAEa+fyHyWNR2NTWW
         6yeoirxQeR7YcSIDP90vMhOO2EE9B1SRmV49Rt774uKuSqzaBOg+J+2dYbQMO5Utk+Ji
         ExEg==
X-Gm-Message-State: AOAM532WIMy/BliDHr2XjgiQyNWddOh2UiPq5yBQl98KNuH2yBv8OPFM
        8Sz2KzpSoIkjMi/5RgDuxbA=
X-Google-Smtp-Source: ABdhPJx+0lHqV8DrishWgmKKAZ1fleWHwwrykVCl0Ye+5Uf1j5FviAzpvsbOpuR7+x5y25e29xb5zA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr4763795wmf.134.1609955741922;
        Wed, 06 Jan 2021 09:55:41 -0800 (PST)
Received: from [172.30.88.143] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id x66sm3739918wmg.26.2021.01.06.09.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 09:55:41 -0800 (PST)
Subject: Re: [PATCH 22/75] media: imx: capture: Remove unneeded variable in
 __capture_legacy_try_fmt
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-23-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <323b2b63-be46-5e93-5814-04855bd19f52@gmail.com>
Date:   Wed, 6 Jan 2021 09:55:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105152852.5733-23-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/5/21 7:27 AM, Laurent Pinchart wrote:
> The __capture_legacy_try_fmt() function doesn't need two
> imx_media_pixfmt pointer variables. Remove one of them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx-media-capture.c | 20 +++++++++----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 70b3d187bbc3..7932b7f0f4f2 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -236,16 +236,16 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   				    const struct imx_media_pixfmt **retcc,
>   				    struct v4l2_rect *compose)
>   {
> -	const struct imx_media_pixfmt *cc, *cc_src;
> +	const struct imx_media_pixfmt *cc;
>   
> -	cc_src = imx_media_find_ipu_format(fmt_src->format.code,
> -					   PIXFMT_SEL_YUV_RGB);
> -	if (cc_src) {
> +	cc = imx_media_find_ipu_format(fmt_src->format.code,
> +				       PIXFMT_SEL_YUV_RGB);
> +	if (cc) {
>   		enum imx_pixfmt_sel fmt_sel;
>   		u32 fourcc;
>   
> -		fmt_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
> -			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
> +		fmt_sel = (cc->cs == IPUV3_COLORSPACE_YUV)
> +			? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
>   		fourcc = f->fmt.pix.pixelformat;
>   
>   		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
> @@ -254,12 +254,10 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
>   		}
>   	} else {
> -		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
> -						    PIXFMT_SEL_ANY);
> -		if (WARN_ON(!cc_src))
> +		cc = imx_media_find_mbus_format(fmt_src->format.code,
> +						PIXFMT_SEL_ANY);
> +		if (WARN_ON(!cc))
>   			return -EINVAL;
> -
> -		cc = cc_src;
>   	}
>   
>   	/* allow IDMAC interweave but enforce field order from source */

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
