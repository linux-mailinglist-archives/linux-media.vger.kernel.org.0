Return-Path: <linux-media+bounces-40418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31088B2DD46
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 932767B1F3D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFBB31A053;
	Wed, 20 Aug 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YerllQTq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72B2D8785
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695058; cv=none; b=PZS7ml4zGs64gtkeE+uR7FN8WZTKVTc/6TmC73CuacN1EmJMFB4josTBfxPnFWnj5tP8jlsmfco68JJxFPav36KUzdJPXt11p1ghzqC5dF/b4y3t3DeJwrqBFyWf2ZXzJAEGkw6fU3N1FvnnXAgFxwzw56LvFYaaHinOWu0b7Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695058; c=relaxed/simple;
	bh=MTEmr6PLWX1CfiIGNeCXCHdIIUWkodJVfLUhpASrxR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB1LSV2N7B6wGOPyQVxJ+HxGH0MjViSC8F3z3MZeCFFJGYG6jOl2ir1cPRx4MFD1M/cTguBk1v0QL+/MDrhMIZER2c/iETaHx3/JmdcG0erxR1dFYmXxKGSw5agYrIqE1bO7gK+JRjT2BQy4gwMHbLdLKZ2p/p6J2DFEB1Xz8zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YerllQTq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so6082965e9.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755695055; x=1756299855; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gY7XVkJ6w+vjaw3X44Oc8ca14AVZViv5sVYFg+uhWoE=;
        b=YerllQTqNAuC/LZx1jCH5DoPfV+euqe4CVefRo/ko5eetzV8hbIdMkbMn/9LCfXAL/
         gJ8Dc108bHuDSFbmO04KrQGTLWezDVkWfuHkKp7vxfc6sr2ViSCI5BhGSI07AJbA3Rub
         WZ5ZlvlqaMg570F+YbvCw11QIvxMwPwoIRT6nFycBj25UbNhLFF5xTG8lFsUBluQUY46
         yIsjNU04QnXRp3mJg/0ATKScMZCO/HA8QAMFfrqraAZwhPi1Vw2IKCBgPzy7wPpx/AXx
         w2KfOVZyORgqSOskZWIa8qUfRWiNbFmntiJI0WKG4oI2SFCNuWghs94+0meo0aU8J3Hx
         I4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695055; x=1756299855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gY7XVkJ6w+vjaw3X44Oc8ca14AVZViv5sVYFg+uhWoE=;
        b=f1IRlLhL2oEsMtoxLrgxAVZ7qG78WQj5KCbcfME3rIrWDHlcHRKof88rV3sAgQxMBp
         Ex7p5jAaIoLa2qHktt4nX4oDRyHSQeDba+593oGTDP4Shl6VcG+Q5/1qvZMIVqUT7HSR
         B6zAb1KQE3mooCytK/YLCciXw1sWGEVdrLgrmjesYPcTaH9v+gzuRpXOSK7SIPGR7vPq
         XNBQC+cTjMg9DvlRfEmfVVYOVVdZ0EnLUoHkQ9SRV7YHgI6LU6qGNzz38amElZKiBfUV
         VRrJfXIFkm4Sv26gyLGFnXkNP4Hl//7LdxE63B+2zqSZQZyHZMK4zIT/DFSNW1MEBmGj
         Y3+g==
X-Forwarded-Encrypted: i=1; AJvYcCXdpzWHV0XWUZU1ZEeS2PBgaeUXVwLQvJA+pwstlECOaitlo9MWpCPFoO7u1vhSk++Vn4Je1hEofGcj+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIj68Mkh6L7CRBzIGXGNMPXhVTP/xO0H80sacFe2bDFUbA4OK
	yP1bob02SRw+YS+CKSdqCn/B+8yIw472i0bhmMrU3eo2JYQZVeWQEoTDfFaBp32Xz0c=
X-Gm-Gg: ASbGncvVjhq0oAGqSXtf+IuO4jM7M9qUNkIQCUJEJUsfwGly4uIX8iJMJBvCn6Iu2bh
	8wzDxu2/T2MNEoIkWhVTnV5OyIUMzM9nNak8geLnU29TzsdeG8wu4bCqZdG4LqS+CjjkKThjxsV
	Eb+ZYHxRkIIm4X6pepUIXaC7gZA4xvGSkYKaTnM8N6JC4LBvfR8GOJeD10KruZebrBUkG3iPkOo
	oUEbTARCoUrt6zrd0ZEC1fFENB/E3/N7wH8gBNPvfS6pSpjXpXsRnE4nuTC1QckmNMDj0TFjzJ+
	kSOnTR1c9SF1/OsLo9ZyFNBAGOtw5AJs+S398OoWpYO34zmZlgtleuwrK6Yi4QjtuohqAd123eG
	kWJ6EzFVGjZdCUB3MBwg1ik+gQly3EF36qjVdAX/nx9VbrgSg+LVNWg==
X-Google-Smtp-Source: AGHT+IFDXUSqh4DOnr6eHhJBZWOZMSWPHk/5O4ChkMSVZ6URykazM/OIpEHf8YVEdfT818C1CmnNkQ==
X-Received: by 2002:a05:600c:1988:b0:459:dd1d:2ee0 with SMTP id 5b1f17b1804b1-45b43e0339cmr54417895e9.0.1755695055064;
        Wed, 20 Aug 2025 06:04:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47c30dc1sm31620545e9.6.2025.08.20.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:04:14 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:04:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Whitespaces style cleanup in
 gdc.c
Message-ID: <aKXHypUfl00qE0yP@stanley.mountain>
References: <20250820124519.2287171-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820124519.2287171-1-abarnas@google.com>

On Wed, Aug 20, 2025 at 12:45:19PM +0000, Adrian Barnaś wrote:
> NFC: This patch cleans up coding style whitespace issues

What does "NFC" mean in this context?  I only know it as the networking
protocol.

> in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
> 
> Fixes include:
>  - removal of unnecessary line breaks
>  - correcting spacing around operators
>  - correcting spaces between types and names
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---

[ snip ]

> @@ -85,8 +79,7 @@ void gdc_lut_convert_to_isp_format(const int in_lut[4][HRT_GDC_N],
>  	}
>  }
>  
> -int gdc_get_unity(
> -    const gdc_ID_t		ID)
> +int gdc_get_unity(const gdc_ID_t ID)
>  {
>  	assert(ID < N_GDC_ID);
>  	(void)ID;
> @@ -96,10 +89,8 @@ int gdc_get_unity(
>  /*
>   * Local function implementations
>   */
> -static inline void gdc_reg_store(
> -    const gdc_ID_t		ID,
> -    const unsigned int	reg,
> -    const hrt_data		value)
> +static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int	reg,
                                                                         ^^^^^^^
Replace this tab with a space.



> +				 const hrt_data value)
>  {
>  	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
>  	return;

regards,
dan carpenter

