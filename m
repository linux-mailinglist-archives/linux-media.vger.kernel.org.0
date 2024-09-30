Return-Path: <linux-media+bounces-18760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACE989B48
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D2A2814B8
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C51F1547F0;
	Mon, 30 Sep 2024 07:20:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB094F218;
	Mon, 30 Sep 2024 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680836; cv=none; b=pNCdeWDUcOEtnK2NK6sh14ZNeJipg3jqFADvLBV7kLiTuf6N9/DCayQE0OJhCedz3h/fqGHsSgsePoTWx5IbFFiUzgF7ByJyhHAhBAoaxjakHE6yc5evWua8GYW1KWwrsRezxO8IWRT0e3n5iJljWxjUoHrmb266fs3ZMfTPuZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680836; c=relaxed/simple;
	bh=NMKGffa42z4vD4nUThyQ6Lp/FCMZi+p9bYBzM7dXtT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFBaKnGLIylB9IM6eTQkOkS4oE6sZRRa6TCxxG1ART+l/L7RZxGWBQ5pJhpik84gDC8xY+mbriTir+ixwWCVE3ZTqq8YoTqF2dL9taWj5/eqkRWp0z3F/POD1hnPpmbQ/3XDrlBEToQHo+Vqdp8z8d+vEAJ2Z0F4S6hk8l/BU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7895BC4CEC7;
	Mon, 30 Sep 2024 07:20:33 +0000 (UTC)
Message-ID: <7d8065fb-a040-4f79-9c46-07924f46b876@xs4all.nl>
Date: Mon, 30 Sep 2024 09:20:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: atomisp: Replace ternary operator with if
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
 <20240928-cocci-6-12-v3-3-53fc5ed20be0@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240928-cocci-6-12-v3-3-53fc5ed20be0@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2024 19:24, Ricardo Ribalda wrote:
> Replace the ternary operator with an if. In this case the code is more
> clear and also fixes the following cocci warnings:
> 
> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

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


