Return-Path: <linux-media+bounces-8997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22D89F013
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA72A1F23A29
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCDB15956F;
	Wed, 10 Apr 2024 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPEaQLLF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FB1581E5
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712745662; cv=none; b=VcKjoPOyBYq9CO54C/uO1S+mi/6rqpq8jeBQLQXsZB6hvqBd8AG6tEOdBbWDJwzdhqKN2nDuSWDiZLdfqHpYGnrAntKIMMMZsIZfFQPXU/MJKvOc6sivtd5rSCyBzs29IgwNuZh9ExtfvN00oUti2fqwXBRkqK5tdgigS+j78O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712745662; c=relaxed/simple;
	bh=d2rePbaAXYB09qw9YelL3lAO5AZZaCWIiQiczn1FsTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITYrLWBKjb4sJMjjwOu2MtDHuyYhem9LcLjdwEzkK0tN8U6hvHUlErwDkOG5xmqoCB4mXjjMc1tDrDcO/qtCgjJHqPusesxtonwDdBboJc7ppR5nKM6FmI+2Fd/qrpwbPzNj23taI9HFLrn2Cz1NJ9vw6Jd295uyoSrqWwZttY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DPEaQLLF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712745659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+TeWdebrCO/in8a4ZQ+ikj065Xf+M/htxdxpFkTfUTI=;
	b=DPEaQLLFhC2IoTnQ8jmLIpcn3JhIn/kHiZrMc483TneoLeKSsLPR+qXc2/RUscK08Oqnbv
	/ho71IJpCJ5zHjNA5Ejaa4/kDJZbuO/2a6Ws5AizdhpfAJ5M8VuKThGjguLtzqlP7ClT/+
	rFVDy9Z3XA/pkFuO5Ofnl0/JVrR1qo8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-OcT6nIHxMvemj9226Szrgw-1; Wed, 10 Apr 2024 06:40:58 -0400
X-MC-Unique: OcT6nIHxMvemj9226Szrgw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a52052809caso59921666b.2
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712745657; x=1713350457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TeWdebrCO/in8a4ZQ+ikj065Xf+M/htxdxpFkTfUTI=;
        b=I5Hd75L5AFXADEhrrV+7riSLxmBD0mnaAqUYbGMMa4bSCPZ9uJ8x1CooSjGi0YAAqg
         ggNKdaiyYa2NlTnwDfFYEMcNmCOCKpdjIJ/pg9FGA6+JnSUqNp0KTaqBXjtgLwv++IXD
         H7O/XkTtAZNhsV/eK52L1nQJ4MmvFf0ATVd7msy7O9lVdB171tsdABkf0bmNlHa9L7Rl
         17r7asnWlFp8h6wZQx2XKvEegxDk7NYUKHpl0jPvQIngzdCy4WG2wgMgnCqGANqPstZU
         ouC8v3ge//I5TfQvNAp2I3yCjov0vF9l9vAyr0Q83lPzp9AEI0FAF1AYGa4zErR/9P42
         IBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW65OGcjPezGn5s85p1QLxyiQqtQyVi+/9EuolIb4qNJjNU2d0MAyZe0p7PfhGqupm1FRYYg76g0pKRQsKj1o24Z71B52INxykEGUg=
X-Gm-Message-State: AOJu0YwibQhYbFxt3FZ+rOhVmoEyKGzMDuy0lgdF3AkPXhHpz82mzxwg
	+ta36cPH/Y60sGGbvILLeSjBCJQvifkE4m1ibtC3tlGxsg3JrmCFTqTI57H4j3HHWBMkGLfJ4Zh
	sjQr5WMf4+lnHvv59jO5Lepjuz2NuIHtkiNwbGs6JSue9wtRVnvUDAw5CdvxL
X-Received: by 2002:a17:906:f116:b0:a52:10dc:4ca8 with SMTP id gv22-20020a170906f11600b00a5210dc4ca8mr946683ejb.72.1712745657390;
        Wed, 10 Apr 2024 03:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhdJBzUX4DuqZ2uULshWmUbL6QUe6whMHXJ3hUs3QrHGHJpjCoySP9VM42gaV/tN/8rWUJoQ==
X-Received: by 2002:a17:906:f116:b0:a52:10dc:4ca8 with SMTP id gv22-20020a170906f11600b00a5210dc4ca8mr946665ejb.72.1712745657028;
        Wed, 10 Apr 2024 03:40:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lg11-20020a170906f88b00b00a4e2db8ffdcsm6790801ejb.111.2024.04.10.03.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 03:40:55 -0700 (PDT)
Message-ID: <39268d69-7a40-4891-847a-af167faa8581@redhat.com>
Date: Wed, 10 Apr 2024 12:40:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove unsused macros
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240326190903.1422069-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240326190903.1422069-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/26/24 8:09 PM, Andy Shevchenko wrote:
> Entire defs.h can be killed, so do that.
> Also kill same macro definitions in hive_types.h
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/bits.h      |  4 +-
>  drivers/staging/media/atomisp/pci/defs.h      | 37 -------------------
>  .../pci/hive_isp_css_common/host/dma_local.h  |  1 -
>  .../staging/media/atomisp/pci/hive_types.h    | 19 ----------
>  .../pci/runtime/debug/src/ia_css_debug.c      |  3 +-
>  5 files changed, 4 insertions(+), 60 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/defs.h
> 
> diff --git a/drivers/staging/media/atomisp/pci/bits.h b/drivers/staging/media/atomisp/pci/bits.h
> index 9fab02ebddc5..f7a66287d763 100644
> --- a/drivers/staging/media/atomisp/pci/bits.h
> +++ b/drivers/staging/media/atomisp/pci/bits.h
> @@ -16,9 +16,9 @@
>  #ifndef _HRT_BITS_H
>  #define _HRT_BITS_H
>  
> -#include "defs.h"
> +#include <linux/args.h>
>  
> -#define _hrt_ones(n) HRTCAT(_hrt_ones_, n)
> +#define _hrt_ones(n)	CONCATENATE(_hrt_ones_, n)
>  #define _hrt_ones_0x0  0x00000000U
>  #define _hrt_ones_0x1  0x00000001U
>  #define _hrt_ones_0x2  0x00000003U
> diff --git a/drivers/staging/media/atomisp/pci/defs.h b/drivers/staging/media/atomisp/pci/defs.h
> deleted file mode 100644
> index 785e7a670a00..000000000000
> --- a/drivers/staging/media/atomisp/pci/defs.h
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Support for Intel Camera Imaging ISP subsystem.
> - * Copyright (c) 2015, Intel Corporation.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - */
> -
> -#ifndef _HRT_DEFS_H_
> -#define _HRT_DEFS_H_
> -
> -#ifndef HRTCAT
> -#define _HRTCAT(m, n)     m##n
> -#define HRTCAT(m, n)      _HRTCAT(m, n)
> -#endif
> -
> -#ifndef HRTSTR
> -#define _HRTSTR(x)   #x
> -#define HRTSTR(x)    _HRTSTR(x)
> -#endif
> -
> -#ifndef HRTMIN
> -#define HRTMIN(a, b) (((a) < (b)) ? (a) : (b))
> -#endif
> -
> -#ifndef HRTMAX
> -#define HRTMAX(a, b) (((a) > (b)) ? (a) : (b))
> -#endif
> -
> -#endif /* _HRT_DEFS_H_ */
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
> index 48a1ace79897..1a71dbebbbe2 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
> @@ -19,7 +19,6 @@
>  #include <type_support.h>
>  #include "dma_global.h"
>  
> -#include <defs.h>				/* HRTCAT() */
>  #include <bits.h>				/* _hrt_get_bits() */
>  #include <hive_isp_css_defs.h>		/* HIVE_DMA_NUM_CHANNELS */
>  #include <dma_v2_defs.h>
> diff --git a/drivers/staging/media/atomisp/pci/hive_types.h b/drivers/staging/media/atomisp/pci/hive_types.h
> index 55d36931f079..34f462c0c9f9 100644
> --- a/drivers/staging/media/atomisp/pci/hive_types.h
> +++ b/drivers/staging/media/atomisp/pci/hive_types.h
> @@ -17,25 +17,6 @@
>  #define _HRT_HIVE_TYPES_H
>  
>  #include "version.h"
> -#include "defs.h"
> -
> -#ifndef HRTCAT3
> -#define _HRTCAT3(m, n, o)     m##n##o
> -#define HRTCAT3(m, n, o)      _HRTCAT3(m, n, o)
> -#endif
> -
> -#ifndef HRTCAT4
> -#define _HRTCAT4(m, n, o, p)     m##n##o##p
> -#define HRTCAT4(m, n, o, p)      _HRTCAT4(m, n, o, p)
> -#endif
> -
> -#ifndef HRTMIN
> -#define HRTMIN(a, b) (((a) < (b)) ? (a) : (b))
> -#endif
> -
> -#ifndef HRTMAX
> -#define HRTMAX(a, b) (((a) > (b)) ? (a) : (b))
> -#endif
>  
>  /* boolean data type */
>  typedef unsigned int hive_bool;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index 3e92794555ec..3807b31bb98f 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -31,6 +31,7 @@
>  #define __INLINE_STREAM2MMIO__
>  #endif
>  
> +#include <linux/args.h>
>  #include <linux/string.h> /* for strscpy() */
>  
>  #include "ia_css_debug.h"
> @@ -861,7 +862,7 @@ void ia_css_debug_wake_up_sp(void)
>  }
>  
>  #define FIND_DMEM_PARAMS_TYPE(stream, kernel, type) \
> -	(struct HRTCAT(HRTCAT(sh_css_isp_, type), _params) *) \
> +	(struct CONCATENATE(CONCATENATE(sh_css_isp_, type), _params) *) \
>  	findf_dmem_params(stream, offsetof(struct ia_css_memory_offsets, dmem.kernel))
>  
>  #define FIND_DMEM_PARAMS(stream, kernel) FIND_DMEM_PARAMS_TYPE(stream, kernel, kernel)


