Return-Path: <linux-media+bounces-41534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D380B3F98B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2D78162BA7
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6932EA73D;
	Tue,  2 Sep 2025 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0AVoKJI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB222EA480
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803756; cv=none; b=TOv8jwiXl+GMcWfxy3vsOixjX72loLdaRiQSPU5eZJdU7fb3DQAPTVd23NgFwRTHjz+mL2B78/RgsEB8DpE27r3KG0sHB/RACSjqdPOb5r0yn6WBikV7cW+rDWLdIuhO8jxIF19w+kbSXddM9SOC1CJkubRWGv85hWV4baGzbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803756; c=relaxed/simple;
	bh=oOsC2gd09SWVStH3OCZPd0RWU1k+5APOO3/9u+LKdaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxNss+Ty7hInYbPLZHr8g8zoguQ8JHhhU7Os4HpNkeRI0JO6HrdvaCxgVqbFrjK1ys9SjKwsFSbN1iWF/bncVb19rB495B9vMbgzTP0DgFWhKu/A+qFA7FZZ8OSGXK3Ty4i8FBZ1gOggi76S5jZNyrzMhDyw5XPBfbYGBA7nBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0AVoKJI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b82a21eeeso32394635e9.2
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756803753; x=1757408553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1qJLMRO86kBaK32XQGtbUGvCudTpu+XINTSG1qXn1M=;
        b=Q0AVoKJIRU6sLXsFLAs6bAGG7pVAokR6TfTczxJuCKeK+niBYjWuPPORUHSurAuDYU
         0VE+8X8yCfNxxeSoh44lQ5XMJih6AvbBHB4FjMBeE9YfS3bCgoZGWcN1vY+mpYUfKJ4g
         GNI/1+oEeW8wNlvhuxQIhZAPPQ1P93G+J8JZmdIu8u7mLghzezfGxY5JgH9x6KFxjB3I
         napbU7q615e+ZG5TfPm3PsE2xUvCIdwNJqeQ2qBqU5qARmYAD0NNfBcYVfGQieBvzYht
         P5hegCh68Eq+8DBLLvWEYtENh+HTjPYApEX3ipbWf/b+kTPt0S/Le6ppjKH2rtCZ96uU
         eV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803753; x=1757408553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1qJLMRO86kBaK32XQGtbUGvCudTpu+XINTSG1qXn1M=;
        b=Bwvrj42DLrpKyOxVePkvwtvUxkjudca0Ck8fyIMDkR73NO7SuZgEMBs4KgrhzH5/EO
         YFlWsatGgFNG2kfCB6qm7nZQQmH4ArL75cswMW9NhbOSBJyt+IPwStmtVCxqAIGzmCDi
         sUvb9z51NQI9cneaPEKlFeRxLRC/R6EidWOaFrxRCb1NLOa8IQgowPXkf8j028iqM3J+
         lKbrKk5lv4AkqYeMvxTvGr7ZjnIleXl11vMr8B9g52ufMbM16my7nlrQiyoyfa2wce1G
         6PkWyMubiiNeCXyhWvwbR6pyVmMuRhQqjzIRwX2VY5w1UKdgc0qshZmm7sRX/O5NEYDa
         ntdw==
X-Forwarded-Encrypted: i=1; AJvYcCWv3urKf5IudAga9s4hDH7sIbmX45IeAp5L4QzpZfikZ4kRh1FGcDN1VRk38CYysCeuKoXhbcB+JiRNoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznZ/w6sIF3Ty6+3ZAAZ8rbY0zuA53MT9qlV9VGgA2NkQ+uxh4d
	o139d3xDBBziBBjKQrTIBF0EwiLAwes/OMLE1ntGZGAqo21RjWNotZSSfxkSUVcI8tA=
X-Gm-Gg: ASbGncvyTobuJqtFnEgm1iBz+WTOq7BjdxTtYWToSQDS5fgNqwguAeoInmHA3H6ZB1J
	lKkO6/JXvdr1ayr46q5A/aCCOp1Nena5ihUQpsO+Yf9e9xQ9Vf1gGU5CiCNAEnNG0M6uaJbEQuB
	OuP3ltjJnwtUNuar2dzz8dvlTs8biTYCLbJ/kKH3DND597P+cQelB3h6iuxzo0WeX2nkQvAp+Mq
	bmOVxoRYehJjh0EmSA8uoJBKp7H4JhuRYwgD0wfrD2N5cpsTcuKd9tBXvBCw0eM2zhFg1iL3L1P
	7JhSbBsKJyaXP1Xo8UYTMahup/jWulria4CBCaqPt/sdjozY6eR3w3gGAX1kb9P2T3KiYxZgKXH
	lslAjW5JYJiEglBQHJtlOHvRuzr8=
X-Google-Smtp-Source: AGHT+IFuemm//sDn/qj0h4zJPJMFIak6SnCztGlZa9zOLzUoeyHjd+ENyXK8/Xhkk0G9vUcU6KL79A==
X-Received: by 2002:a05:600c:1390:b0:45b:8366:2a1a with SMTP id 5b1f17b1804b1-45b8555ccb3mr90650645e9.11.1756803753361;
        Tue, 02 Sep 2025 02:02:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6db6sm287723295e9.2.2025.09.02.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:02:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:02:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
Message-ID: <aLaypTjukJJloGuL@stanley.mountain>
References: <20250902073841.2338568-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902073841.2338568-1-abarnas@google.com>

On Tue, Sep 02, 2025 at 07:38:40AM +0000, Adrian Barnaś wrote:
> Simplified masking logic in pci/hive_isp_css_common/host/vmem.c.
> 
> ---
> 
> I have tested this change on whole range of *valid* inputs, and it gives
> the same results as before, but this function seems to be little
> counter-intuitive as far as start is a (bit index) but end is
> (bit index + 1).

Yeah.  The "end - 1" is unfortunate.  I guess we accidentally started
counting from 1...  I looked at how to remove it but got lost.

> 
> It is follow up to: https://lore.kernel.org/linux-staging/20250901091050.1935505-1-abarnas@google.com/
> ---
>  .../staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
> index 722b684fbc37..9703e39b7497 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
> @@ -22,14 +22,14 @@ typedef hive_uedge *hive_wide;
>  static inline hive_uedge
>  subword(hive_uedge w, unsigned int start, unsigned int end)
>  {
> -	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> +	return (w & __GENMASK_ULL(end-1, 0)) >> start;
>  }
>  
>  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
>  static inline hive_uedge
>  inv_subword(hive_uedge w, unsigned int start, unsigned int end)
>  {
> -	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> +	return w & (~__GENMASK_ULL(end-1, start));
>  }

nit: white space.  Add spaces.  Remove parentheses.

These are supposed to be opposites, right?  Subword and inverse Subword.
You could dress them up to make them look more opposite.

	return (w & __GENMASK_ULL(end - 1, start)) >> start;
	return w & ~__GENMASK_ULL(end - 1, start);

regards,
dan carpenter

