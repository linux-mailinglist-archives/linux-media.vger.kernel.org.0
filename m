Return-Path: <linux-media+bounces-5527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7C85D113
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 08:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F4C1C22DEE
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 07:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050D3A8C9;
	Wed, 21 Feb 2024 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPNDvptR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11139FE9
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499831; cv=none; b=FbYtcts5mPPxOIrNRjsOJTK6OxTet59R7b9PFDUxe4B4jQBzdi7bQJGUDKSnAL+qmtzOZDYlsqrovrAAJLjecmj9agOVgzJ8bM7cFreu+Hn9daa2Re6aFyI+X9fVs1OphIc50o8ytAThtnbtAO16JqZufj7r/TUL6ACINfx/HUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499831; c=relaxed/simple;
	bh=t5K5Xk3uY5Lndm7K86bMqAkl124epkeYqKObYYslsfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDiFTAodM4qnTF7U8CSw+7FjAxBSA7ZdYYLX6bT2oq74H6DxQ5MFYUNpUnBuxmhiZc+1SlTp9mKPyzmSMoaZdgGjdq8mX1q/UkssXW1MLhM3SNhLQLun9AlQ23mLMvKmwtjLvRtCtbMMhItLtex1W0Js5merSnPfi/taUunNuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPNDvptR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e2f0d6c82eso2112898a34.2
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 23:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499828; x=1709104628; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7KG8vtySQzBjl3EBr1otU8V28hlGhrmjDOu9JaXSExk=;
        b=RPNDvptRAxV7tQ1wiFDMu1eqcvZVzTyVeK2QOEI+dNiDGxlBb13mJaSGkmsP6ZgSX7
         U1U98WWz6ZpVKBaVQw2Uw8AEAemxNGHZ1qoQphba1nZBv8r1zpr/9/Dyh/TQOO0OGXcS
         VLDZJjyIV0ReGcQrkmcQX01XetLEa1Cuxo6RLmX84hXNThks1fZdEL6K89OyBD5zNleO
         yrNrlszhJs488087KrTldmKwrizTqzGLStsQEalJJUKgNVYA3AQ5i16sah+mvEqpZvUk
         SSplvbgChGV3Oeq1mmbLUILaB6rnWRfREfhFisMs54i4OBfpythC+sEVvi7cvUbKGz9q
         tCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499828; x=1709104628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KG8vtySQzBjl3EBr1otU8V28hlGhrmjDOu9JaXSExk=;
        b=bIXvyHy4XtBzykTtiV1YVIyHqkR3utJrboAIcLRDkCmfe3vxJLP7e+73JYeKFxzU4e
         seMIDt0ka6SGVlPo8h5jx4X+Sdum6yO9g1fUPpQQ+b6u/htzkVzBZ4lStt7gT46ezXyW
         Xx12eayFlniHc94iEDzP7wpmvf1CVkCN7DpSOT4S/RiwMGZO3jaIVj4QV+XiLoTBShLv
         dAAURGM+yvLsAHEp7LadAwi0YDyGIuau/JoPmG3TC0gaV4sN8B5vpYJt5qeTjneOAMcB
         PKSAyp5JxE4/0n/AV4Wjd7whF7IpaC8bFMs5B0/BMvmOe/8Ch0AZWhb/fAeAi8gljuQj
         G0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVB46lYyo33E+DUXHp43FIgtJL5WD/Sq5z2wVybPLiCi7R6T7MYfwyHyPQrAbFPNOHeaZi5pAGR3yVEdhvGc3N8610NhVHwjzcbBXY=
X-Gm-Message-State: AOJu0Yw4ruUUHOZEZyqdsUYXl6XZlLxGG/9HOC/IFXWukxAwBshZxw4u
	dXnTXIG43voRA02fUsp+WKJRXnKnuwyVkF40hs8y9OTM291LhqvAXEIqfKDZXA==
X-Google-Smtp-Source: AGHT+IEjTwoqqfZnJMJoisjIkdrZphp51VBceVZFRlYb34SIPpfWhHQ0UXvW8LTmQpgDpPmMRqUiTA==
X-Received: by 2002:a9d:6246:0:b0:6e1:4dfb:6a67 with SMTP id i6-20020a9d6246000000b006e14dfb6a67mr17510568otk.9.1708499828676;
        Tue, 20 Feb 2024 23:17:08 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id l184-20020a6391c1000000b005dca5caed40sm7797700pge.81.2024.02.20.23.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:17:08 -0800 (PST)
Date: Wed, 21 Feb 2024 12:47:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: imx290: Fix IMX920 typo
Message-ID: <20240221071702.GI11693@thinkpad>
References: <20240221071550.2769570-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221071550.2769570-1-alexander.stein@ew.tq-group.com>

On Wed, Feb 21, 2024 at 08:15:50AM +0100, Alexander Stein wrote:
> Replace IMX920 by IMX290.
> 
> Fixes: b4ab57b07c5b9 ("media: i2c: imx290: Add crop selection targets support")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/media/i2c/imx290.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 89fcebe178395..d75e36018cdc0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -150,10 +150,10 @@
>  
>  #define IMX290_PIXEL_ARRAY_WIDTH			1945
>  #define IMX290_PIXEL_ARRAY_HEIGHT			1097
> -#define IMX920_PIXEL_ARRAY_MARGIN_LEFT			12
> -#define IMX920_PIXEL_ARRAY_MARGIN_RIGHT			13
> -#define IMX920_PIXEL_ARRAY_MARGIN_TOP			8
> -#define IMX920_PIXEL_ARRAY_MARGIN_BOTTOM		9
> +#define IMX290_PIXEL_ARRAY_MARGIN_LEFT			12
> +#define IMX290_PIXEL_ARRAY_MARGIN_RIGHT			13
> +#define IMX290_PIXEL_ARRAY_MARGIN_TOP			8
> +#define IMX290_PIXEL_ARRAY_MARGIN_BOTTOM		9
>  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH		1920
>  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT		1080
>  
> @@ -1161,10 +1161,10 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  		 * The sensor moves the readout by 1 pixel based on flips to
>  		 * keep the Bayer order the same.
>  		 */
> -		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> +		sel->r.top = IMX290_PIXEL_ARRAY_MARGIN_TOP
>  			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
>  			   + imx290->vflip->val;
> -		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> +		sel->r.left = IMX290_PIXEL_ARRAY_MARGIN_LEFT
>  			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
>  			    + imx290->hflip->val;
>  		sel->r.width = format->width;
> @@ -1183,8 +1183,8 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  		return 0;
>  
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
> -		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP;
> -		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT;
> +		sel->r.top = IMX290_PIXEL_ARRAY_MARGIN_TOP;
> +		sel->r.left = IMX290_PIXEL_ARRAY_MARGIN_LEFT;
>  		sel->r.width = IMX290_PIXEL_ARRAY_RECORDING_WIDTH;
>  		sel->r.height = IMX290_PIXEL_ARRAY_RECORDING_HEIGHT;
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

