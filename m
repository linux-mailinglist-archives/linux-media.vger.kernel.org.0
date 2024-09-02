Return-Path: <linux-media+bounces-17335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013649684AB
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F121C224FE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828FD13FD99;
	Mon,  2 Sep 2024 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIVtwlaW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697E13D8B2
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272938; cv=none; b=d/zZfylwQPX8gEH0yYZCTHJG3aPs5GIvibxrXOIzpAkpn8ULWYpfrTHKNipSG/GrFWe7+4KRJMukEnSCmLqtl4EO+FS+N8zvj4hzeRFuikPTClhnI30GJedXLa6qlO1vC/inz6VR2k+ipgfMyNN7TBhoeMV5gDwwaqxwgRIXGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272938; c=relaxed/simple;
	bh=/8liyZOyhiUCHo0/9Un5b6c6v2jpsWwfKep752zm9bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJr0n5j7l6fe5K+wwOq5Nl849ZB+jMfk9QGG6+psMABKlqUm5ZPCVpquLYSqqtvJ17gQ61J4xMAB4Ur5h77z54hnMLflwD2Sr2Ly7yj6zMTzSkQvFmeT4LAL/t8b2fB0qvopCwC3SqQdEADqUvIgZ6W0D7xkUPtO/ArZahhVS6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIVtwlaW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725272935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v+So8N3yAwR3Sc59OWxXeMnjDpGsxHEW6n1U4TTFYE=;
	b=OIVtwlaWaqmYSRKD/5Qz7dBAdA/tPjqE+GGlw+0ZvQelWV5cOsR1pxluIfyQL5R7AkhkXn
	WjvGkOqTLInPU39S65f3ELwrSI4ACa3K6Qfx5rimDRbUdCHdU6HAvLyTv1HzoSK+nwMaj4
	fF68wMwYI61sVyLU1ExQh2S5yM7eqVE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-THNodC-SNs6jaTqBlk1ssg-1; Mon, 02 Sep 2024 06:28:54 -0400
X-MC-Unique: THNodC-SNs6jaTqBlk1ssg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5343808962cso4541474e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272932; x=1725877732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v+So8N3yAwR3Sc59OWxXeMnjDpGsxHEW6n1U4TTFYE=;
        b=m0pdGi3ahnCGbZP3Yyq3VW1js9+mF1i1quKvI7sz0qcaIC3zRTF45kazZz9l3iPsLx
         VJaSl7agYJND/YZMlOBfu45s3Uc6nilnvIAqWxgVHlLJfg7nFSWBzLM8919QRsAW8K2v
         IGKHd7bw+wAqnqSCyHy5oX0zb9ZtansDik+AJtH9kFvOjyfvhpe3wjntK5+YFIkjp2Vg
         kICj+5xlfvLmoIycZvbSD3ogUrbUfHHTv6RDbPmKCmSwOM7g25jDAbhZoeBiC36kWtmE
         HaZ77gb2BBCllC0p5n9KiZyuH/dpO7TbxtqtyvJ/xRVuJllZxB64XE2QfQq0XHIbamlw
         CLVg==
X-Gm-Message-State: AOJu0YwWFYzJt/sQrKhV5CRM1IgNqRf3SLv8+wbHrSzWIWLw+oD+ECks
	ZjSsncRkp2hDjVnLLX9rxH1VNSjHcwzwXKmxqy06SVzsieAtK6sbbn6n+A+K+uStfWRS8b3Gt3m
	HtRngVpYqXLgChbwRJvLn9oZUV347qp/rNdO2ttzD9OV4/8f4KsGtSIZjv/Z+
X-Received: by 2002:a05:6512:398e:b0:52f:154:661b with SMTP id 2adb3069b0e04-53546b19204mr6560955e87.11.1725272932375;
        Mon, 02 Sep 2024 03:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM+TllGK/OcRlnNlcZG086nEzuubW8ZJgkUZoTbwN7tdW2VA3pCptX1PAAr2+HF1Rstw72WQ==
X-Received: by 2002:a05:6512:398e:b0:52f:154:661b with SMTP id 2adb3069b0e04-53546b19204mr6560925e87.11.1725272931780;
        Mon, 02 Sep 2024 03:28:51 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feacbfsm539931866b.27.2024.09.02.03.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:28:51 -0700 (PDT)
Message-ID: <a43eb3d1-bdfc-40f6-b4f5-4de44f18fc0e@redhat.com>
Date: Mon, 2 Sep 2024 12:28:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/2] media: atomisp: use clamp() in
 ia_css_eed1_8_encode()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 topofeverest8848@gmail.com, hverkuil-cisco@xs4all.nl,
 andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240830011752.603433-1-lizetao1@huawei.com>
 <20240830011752.603433-2-lizetao1@huawei.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240830011752.603433-2-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/30/24 3:17 AM, Li Zetao wrote:
> When it needs to get a value within a certain interval, using clamp()
> makes the code easier to understand than min(max()).
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Thank you for your 2 patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  .../media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> index e4fc90f88e24..55d102b479ac 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> @@ -276,7 +276,7 @@ ia_css_eed1_8_encode(
>  	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++) {
>  		min_exp = max(min_exp, from->dew_enhance_seg_exp[i]);
>  	}
> -	to->e_dew_enh_asr = 13 - min(max(min_exp, 0), 13);
> +	to->e_dew_enh_asr = 13 - clamp(min_exp, 0, 13);
>  
>  	to->dedgew_max = from->dedgew_max;
>  }


