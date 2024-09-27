Return-Path: <linux-media+bounces-18680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E498821C
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AE862889E6
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE901BC074;
	Fri, 27 Sep 2024 10:00:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1621BBBD1;
	Fri, 27 Sep 2024 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431232; cv=none; b=NyEBJn7Q4KlultBSoeEB8vuhD30lIU3Oy/Q3WQcG15Axx+Vr8G9M9TN0mqwApnsrIcRouBLkpZ5Nycc8pJbc2INcd5BohsLMpRPMV0o2jusT2kMk0s4Z7rnToxXVqeXGL/oWGw+VyJBFpCFG15p0R6Kcluo2wjqyqqSl1gXFItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431232; c=relaxed/simple;
	bh=Wz4gJSZYZWHvZUo0vjR343i8kACgblFpbi/inpMMNZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTDoAPv74YkVD3Uh4Kljj9yRqQD/TSIwubCfVvGoxBAKSEWzLKo2sh+0lJekbTfyjixUsFedgNpDt3WbI4RkGo0RH99lwA0Oc57fEuHz6wtnVw6th5rF/ays7Yt3sSrNp5rqXLKqjfGk2w7UW1+riMtZnFbN3jD8EK9RewwKaKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE275C4CEC4;
	Fri, 27 Sep 2024 10:00:28 +0000 (UTC)
Message-ID: <c88f736f-6845-414b-aeff-fcf76fa83cda@xs4all.nl>
Date: Fri, 27 Sep 2024 12:00:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Use max() macros
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2024 11:42, Ricardo Ribalda wrote:
> The max() macro produce nicer code and also fixes the following cocci
> errors:
> 
> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_frac.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> index 8ba65161f7a9..9642506d2388 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> @@ -37,7 +37,7 @@ static inline int sDIGIT_FITTING(int v, int a, int b)
>  	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
>  
>  	v >>= sSHIFT;
> -	v >>= fit_shift > 0 ? fit_shift : 0;
> +	v >>= max(fit_shift, 0);

Does the warning go away if you change this to:

	if (fit_shift > 0)
		v >>= fit_shift;

Using 'max' for a shift is a bit weird in my opinion.
Also this change was done to reduce the min/max calls, so introducing
a new max call feels odd (although it should be fine).

Note that I think those cocci warnings should perhaps be ignored or
dropped. In part because of the huge macro expansion of min and max, but
also I often find the code that is not using min or max at least as readable,
if not more.

Regards,

	Hans

>  
>  	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
>  }
> @@ -47,7 +47,7 @@ static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
>  	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
>  
>  	v >>= uSHIFT;
> -	v >>= fit_shift > 0 ? fit_shift : 0;
> +	v >>= max(fit_shift, 0);
>  
>  	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
>  }
> 


