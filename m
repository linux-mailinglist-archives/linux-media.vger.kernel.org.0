Return-Path: <linux-media+bounces-3099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5E820ACA
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AEBC2828A2
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C40D20F2;
	Sun, 31 Dec 2023 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HoIuxlA0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE68186E
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSsXgXAWfLN2ei8onO/BaPZdF6p5wfeK/YpnlP6sL2w=;
	b=HoIuxlA06quQ81gb+YT0n/hpDpCsNvME9poosOUYopgLs0ALpkTjGgr5wIZ+XorejIJ99t
	j7IEBL6VbL7i4zSy8R/aOrFTjW+gH5LAcFQXRNGqXNtKB0FNTB5yr5eAPNotZ6ddkItPSl
	2LujGyckHcBuC5FbXIxK5ClmYxBmJt4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-WX7TTp9OOl6leKKVeeFz4g-1; Sun, 31 Dec 2023 04:39:16 -0500
X-MC-Unique: WX7TTp9OOl6leKKVeeFz4g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5560c5ff2f2so316041a12.0
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015555; x=1704620355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSsXgXAWfLN2ei8onO/BaPZdF6p5wfeK/YpnlP6sL2w=;
        b=b9wiTbcciy4XBJT8eh/3WUBBHuBAKFQGNZMt4qzPPbFPRsFnfYU+eTLKzsQi758n+X
         61faGaT4IyjlRIEzMNEyzt5/bEZHhjezeEUbI4rAs9hb/CBJ66BZVg6E/kisRWEx5vcz
         ovDvQlLPwPH3++rHXEOxq0nbxIyK0u48K9cBAMx8VxIzjKyOkXHtk6JZ2z2wiuGr4cez
         msNgbcRLt9rje64wbpedR8A+NepN76ZAZjd56ZPOuNw8KTV5Y5fW2nOgb9UYOFAQU97t
         A1n4X/PH25J7HOVINL5wBlkdP6WBLdZQoxz2AGv3UtuoTnicwvOWiqjzAQwk/TzN1YTm
         k2AQ==
X-Gm-Message-State: AOJu0YyVCzhPDCd0P/i2VeQ+O5t0bwQB3GFX5nm4oF2H+Sm8EyvsQKqC
	ld4bnY5Eq//aYMeeeqqBBAuFkMm8qLy6WdT+4waMrE0j1xK6Pc78r0LIq+MBzbIqHFn7ToIw7/n
	rBhCkUd7m4ak+OnUaejmQqIyEEp9HSKcbBqthVV0=
X-Received: by 2002:a05:6402:148f:b0:555:b7b8:6d58 with SMTP id e15-20020a056402148f00b00555b7b86d58mr2236135edv.68.1704015554867;
        Sun, 31 Dec 2023 01:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7gkqwiv08UWlPI2wSdTw3bR46a7OJotvXDUCIQsB1EFFE5OYNb2PjBotp4aybJT+sJK7bXQ==
X-Received: by 2002:a05:6402:148f:b0:555:b7b8:6d58 with SMTP id e15-20020a056402148f00b00555b7b86d58mr2236127edv.68.1704015554550;
        Sun, 31 Dec 2023 01:39:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:13 -0800 (PST)
Message-ID: <b78d7f1d-ced8-42d2-8523-7b26f917d3e9@redhat.com>
Date: Sun, 31 Dec 2023 10:39:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: staging: media: atomisp: pci: Fixes a spelling
 mistake in sh_css_defs.h
Content-Language: en-US, nl
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231218153200.450148-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231218153200.450148-1-kdipendra88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/18/23 16:32, Dipendra Khadka wrote:
> The script checkpatch.pl reported a spelling error
> in sh_css_defs.h as below:
> 
> '''
> WARNING: 'upto' may be misspelled - perhaps 'up to'?
> /* The FPGA system (vec_nelems == 16) only supports upto 5MP */
>                                                     ^^^^
> '''
> 
> This patch corrects a spelling error,
> changing "upto" to "up to".
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/sh_css_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
> index 7eb10b226f0a..2afde974e75d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
> @@ -131,7 +131,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
>   * invalid rows/columns that result from filter initialization are skipped. */
>  #define SH_CSS_MIN_DVS_ENVELOPE           12U
>  
> -/* The FPGA system (vec_nelems == 16) only supports upto 5MP */
> +/* The FPGA system (vec_nelems == 16) only supports up to 5MP */
>  #define SH_CSS_MAX_SENSOR_WIDTH           4608
>  #define SH_CSS_MAX_SENSOR_HEIGHT          3450
>  


