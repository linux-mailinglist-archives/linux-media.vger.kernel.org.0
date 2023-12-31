Return-Path: <linux-media+bounces-3109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84130820AEB
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2508F1F22161
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A93210B;
	Sun, 31 Dec 2023 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKxsTxXD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D88801
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEf7d/YGdeFm03zUvPaO/2U+4jX1XrcVLrOXY0pw9B4=;
	b=fKxsTxXDR2rhd39UBTE002xGvUfEBsmXtgvkhZraOkYRUj7ZXREVN3Yofvpty62XfLaOCT
	oJvavVtaRW1le46LZhKGPyHbW1AFH2QeJswG5TRxguuGMvZcbtI2mG8yDgErKuSd/Cv6YJ
	OUfcdYh6uLRv3OYszSwVfbdsg+jD9PQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-R6WxhcFXMfCVWQDkg071xA-1; Sun, 31 Dec 2023 04:50:26 -0500
X-MC-Unique: R6WxhcFXMfCVWQDkg071xA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5560c5ff5f4so443624a12.1
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016224; x=1704621024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEf7d/YGdeFm03zUvPaO/2U+4jX1XrcVLrOXY0pw9B4=;
        b=l5qiuZlL6P2hJLGZrJ8hgwBQdFqqyNY7w61r3+rx1kpcUru4s6/2f/bXInVAp5rA8y
         SPkv9yuxNyNyKXJ9E6hrR2zcgLe0zVEkW0CTGuSMI+9FuP8dhnsEvsniFx02SsVbumjA
         k1SZ3twSluQi5qbBS77YyeD+Z3qYegeHOXScV8tZEqT2eewXT+ScQgvqGFYaRtjFZS3h
         CmfXLYequXK4drk3PVNnhCuhz86uAcvxHcR+zD2P6pIZ6N+Ubu6vCRkExiX+/NHHB9TI
         RmXZcNfMOSAHKgDHLmr189/xKkCaIA6Yx93ljESfPiCkGwa1IS4gu/xzrkIr8r61k5Ys
         s22g==
X-Gm-Message-State: AOJu0Ywk17oI7ye3EKpu3ixBzTZQXDMKzd4xl8J1MUVLtGX96OTtn3tr
	BjksAGh5Y51bwaet5FOUJ9W+Bxh/tZKMilf9zvWSYKs6eNnrTFbA7x2uz8MSr30ByjN3IRlbgh5
	1xSGj5hkB9uTq3FKZcYpIBAITuKZvBhP5DAl6U5g=
X-Received: by 2002:a05:6402:308b:b0:555:aa7f:d497 with SMTP id de11-20020a056402308b00b00555aa7fd497mr2093643edb.78.1704016224823;
        Sun, 31 Dec 2023 01:50:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3d64gvre5UEtDcBCBGdINd+i9LVRHckeXIouY1yFGpHks7z/uFszsGDHYUupOFufsytkjmw==
X-Received: by 2002:a05:6402:308b:b0:555:aa7f:d497 with SMTP id de11-20020a056402308b00b00555aa7fd497mr2093638edb.78.1704016224521;
        Sun, 31 Dec 2023 01:50:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:24 -0800 (PST)
Message-ID: <7e1cd3de-053a-4664-a728-1d5999f4d354@redhat.com>
Date: Sun, 31 Dec 2023 10:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/isp/kernels/hdr: Fix spelling
 mistakes in ia_css_hdr_types.h
Content-Language: en-US, nl
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223083157.84090-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223083157.84090-1-kdipendra88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 09:31, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in ia_css_hdr_types.h below:
> 
> '''
> ./isp/kernels/hdr/ia_css_hdr_types.h:60: paramterers ==> parameters
> ./isp/kernels/hdr/ia_css_hdr_types.h:62: Currenly ==> Currently
> '''
> This patch fixes these spelling mistakes.
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
>  .../media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
> index 175c301ee96a..ecc98686f5cf 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
> @@ -57,9 +57,9 @@ struct ia_css_hdr_exclusion_params {
>  };
>  
>  /**
> - * \brief HDR public paramterers.
> + * \brief HDR public parameters.
>   * \details Struct with all parameters for HDR that can be seet from
> - * the CSS API. Currenly, only test parameters are defined.
> + * the CSS API. Currently, only test parameters are defined.
>   */
>  struct ia_css_hdr_config {
>  	struct ia_css_hdr_irradiance_params irradiance; /** HDR irradiance parameters */


