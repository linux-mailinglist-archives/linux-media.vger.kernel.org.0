Return-Path: <linux-media+bounces-18686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D5198823F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D5A282E20
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B081BC092;
	Fri, 27 Sep 2024 10:10:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638E1BC067;
	Fri, 27 Sep 2024 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431800; cv=none; b=S/y3FWiAkehCZXyCt/HBvU8Rhaav4WyPSVKVk5jUai/F4GIhX7AAJHbJslgUrWaOT3OCK3wB6JeZdEAI7i3bpq4Yjq9dqjZ//HUpVK+W70sauupvvpdAKZJoDKCYRZEjATw7CfQOwvXjvYLdjr2zBCyaJqptNQm0nMivxjslikM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431800; c=relaxed/simple;
	bh=bfTVNyHA8T5YebxsMPfa9M28R6M0BnoxV58WaZn4zdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxuToZbei0qAoKtEzlbT55aIr4Jtekqnws6csFW78RSUvHdxQBMq5zJizOubteQiDiDRwTrCs3FXtiyoGu8A9eehfxo/YMjnlhqquzbNO3VtPxyFNnP529QsPsS0XLicHp25F7E8IfOyF8+uqB9RShwYOB0ZwpOuPoqE7MQnnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE015C4CEC4;
	Fri, 27 Sep 2024 10:09:57 +0000 (UTC)
Message-ID: <aeb90ae8-8572-434a-82bc-3d218d3affb8@xs4all.nl>
Date: Fri, 27 Sep 2024 12:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: atomisp: Use max() macros
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2024 12:02, Ricardo Ribalda wrote:
> The max() macro produce nicer code and also fixes the following cocci
> errors:
> 
> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()

Subject and commit message is now out of sync with the code.

Hans

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_frac.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> index 8ba65161f7a9..3191d2858f59 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> @@ -37,7 +37,8 @@ static inline int sDIGIT_FITTING(int v, int a, int b)
>  	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
>  
>  	v >>= sSHIFT;
> -	v >>= fit_shift > 0 ? fit_shift : 0;
> +	if (fit_shift > 0)
> +		v >>= fit_shift;
>  
>  	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
>  }
> @@ -47,7 +48,8 @@ static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
>  	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
>  
>  	v >>= uSHIFT;
> -	v >>= fit_shift > 0 ? fit_shift : 0;
> +	if (fit_shift > 0)
> +		v >>= fit_shift;
>  
>  	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
>  }
> 


