Return-Path: <linux-media+bounces-41552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE7B3FBF5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3984A17FFDD
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E252B2F066A;
	Tue,  2 Sep 2025 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXLBwiIi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CD2EE272
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807966; cv=none; b=r7d37cx+Jogb8uaX8plti0loeUGFARPemwKmpeYR9QVdqRpqk0QfAy5fcjOgo2NIRW5iT0Rn7MaSWZxETfe5SPv93ASXiTFp7yl+Tc8kqVUzEghSTupGZ5NdxS9pC86yDkGS04bfviJrdKr6vFqYMZCD2cSTi1ipfkE/daJCzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807966; c=relaxed/simple;
	bh=SjEO5Mf8trw66bSMBZcBAX0fSI45BCBQMiqBnD5W/yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOEtbmvqqT3R95NGwxyJMLJe6d/m3Ay6hvscd0qURwZU/wpB00zJtQG7i9ErdRhZTBoafuwaEERwEohrk7xs7ehINJKlThSNN0SqVIL9WfKteS2aonfVOVQB//o8EFaR8wROceTZA5kL9WatZKPUbX7aaYCqpzEVNYROJepvBj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXLBwiIi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso34887005e9.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807962; x=1757412762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnYStx1tmY335G9wa9Z21vYW/Hu/c3l+9Jg6zw7X6p4=;
        b=UXLBwiIirDlfoKddPJDl47evb11RbgF/+l0hyMaIef3mcWwz+pDKj/nRjEemcm6JUx
         oAjsdoPqVmzZ3OyZEPJPz7dMh3pkMe4T5FbA5Qr1dtgZB+U4mwkODFzuoJKD/6Dks+2M
         mAqgbZeBqCGyRIsFHoRBJ597P8toNBXy1rsDf6SMPyJ7QCckVN5vaQ6MQvAGej/pwcLh
         thlqoZ24dxjjol45jJNAgpv8W4mrdntScZPQiuS4+vOadbnCkSGUeMN5b/c3W3yUrXkF
         9V6z9epvxMiRY9IkwYVw9Tr+gEa0wZIHjp+1POsvWNUHPIKrC4nXC3DyjTi5+OCvQtIc
         EsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807962; x=1757412762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnYStx1tmY335G9wa9Z21vYW/Hu/c3l+9Jg6zw7X6p4=;
        b=mlsqu419DKyeGDbD+uwgZll1tifcWQweElMXvY5A2bVEasFmaP3Ku3KuZhCdPNS5Qk
         Dl1gE296UNqCQVPsZzKaW3tJjZGokNV0bYNjnQ1wuavbw0csBGhPASxGmPJb4kHOudr6
         UIPvcRJTDLHWStWAMube7JEQAyjWOFZyjYmNQ5m78Zvq7z0nO1vQW6tcAaKPtF3/CEnL
         Vcdx329wo4c81mNTw20ax62pc0vui94oX6O+n1t9vOHOdEKXywJGlAnazwVDiLGglaSj
         +0AMXND6HzQ5XMEIXF2iezaxuUkhsnTz/YR1EDXhGCjole43ZD0jjWXBa7wc/hNJayj7
         6/uw==
X-Forwarded-Encrypted: i=1; AJvYcCX/veZQ2DmJxSVR0POitecTdUocbYejNq4gqKTpvYrrFqymvVRCPm2JRqcrduKRUwL5MTe5K5vsr+mmFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvvk0z54xxB/6R7QI7vFwwdL3MP7TlIwjmvZzCzLTcaiO3I43o
	ufK0wCwr+MPbu2tTEOuCzcZTJCGCZAvONYUIvchpJntATDDKjJwo6evjAbLpmWcyquE=
X-Gm-Gg: ASbGncscxSSJ2WZ5P3wNGZdEX7m8QUSLKDRlx0UT8TW64UFxrYgDrOPxeJAq9I7qY3x
	YoBzjjSonu16dcqLtC0HuXew+mGWm8Ko916slePMseO82Be4vuV0JyTeRdovgPMtbknFVRvRVp0
	9dR1WjqRl4vmnMhwZlsV0d2gqUkfSzBOuHBbqZBvLQnEM7bK/Z7k8TehOuF3ov3Z2gK8h6Hwzt2
	pDOyKId5161FafUd9q9/4ikGoYbr31pZTIGnJsuETtxpw6BB//tArV9pZnWYzgDC8AZVP4Bfl1U
	xWNfyJwPfytGv6FPM1U+FJT0a5Bm3MVIfQf7zUC/nc/go1zzz+FoltezWMt2DPthh3Ml+o8B+i0
	frkWSg32SIm99tYO3o62uGsH4fvNaojnsbjzf3Q==
X-Google-Smtp-Source: AGHT+IHG6eBfdtTOEZxcXAbASopPkY4+xwB16XZCz9dFBdFmkVcioRx8F/ATKlllEq5D5xx6npvGpg==
X-Received: by 2002:a05:600c:1f96:b0:45b:7510:4042 with SMTP id 5b1f17b1804b1-45b84c65642mr105053935e9.17.1756807961803;
        Tue, 02 Sep 2025 03:12:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b73c52735sm254121465e9.22.2025.09.02.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:12:41 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:12:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
Message-ID: <aLbDFcaqzJtZUdCB@stanley.mountain>
References: <20250902073841.2338568-1-abarnas@google.com>
 <aLaypTjukJJloGuL@stanley.mountain>
 <aLa-1GPJDxpX-soG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLa-1GPJDxpX-soG@smile.fi.intel.com>

On Tue, Sep 02, 2025 at 12:54:28PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 02, 2025 at 12:02:29PM +0300, Dan Carpenter wrote:
> > On Tue, Sep 02, 2025 at 07:38:40AM +0000, Adrian Barnaś wrote:
> 
> ...
> 
> > >  static inline hive_uedge
> > >  inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> > >  {
> > > -	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> > > +	return w & (~__GENMASK_ULL(end-1, start));
> > >  }
> > 
> > nit: white space.  Add spaces.  Remove parentheses.
> > 
> > These are supposed to be opposites, right?  Subword and inverse Subword.
> > You could dress them up to make them look more opposite.
> > 
> > 	return (w & __GENMASK_ULL(end - 1, start)) >> start;
> > 	return w & ~__GENMASK_ULL(end - 1, start);
> 
> The problem is (and actually with the (end-1, start) above that it might
> generate a really bad code on some CPUs, so I really, really prefer the way
> when _at least_ one of the parameters is constant.

Ah.  Okay.  That makes sense.  Thanks.

regards,
dan carpenter

