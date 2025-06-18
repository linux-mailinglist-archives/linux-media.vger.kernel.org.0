Return-Path: <linux-media+bounces-35207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FACADF7B9
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 22:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666D3177B5C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 20:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC6A21B9E2;
	Wed, 18 Jun 2025 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+fRZzkp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA721885A
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278729; cv=none; b=KftJTnxxgxYxsOPsrKFw4zjiUNKsa7OFaVXVSazHwNYcmPhqGFZZrC4VqsICpY0f4puvE+1PrXT7EluzhtbFrlyGvxdQ/3LgnmrColOVTdaVpQ7k88lG2sF1ZWWpeJvGkszoihEZQyFhIIL2+YLChgXYojQI3Uhf/6+eplOIHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278729; c=relaxed/simple;
	bh=KKil6mB1inJvRsPNxuS73RDHrSQiovHayZ3B4QHqHJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMDfTdecBwsLGynfNP1Y3I8Q0KKkjmNgpNVJs/S7OammJfZFJvYdPUTxq7eDT2gFY/SqWCYCL7CX9loEM00PTXeJY0M0osx3nbX/7jO0t1DWV0RvinQbfYbW8RLsLZtr765IYMDcydX0shi3V0FvehJquNi13XukssijoTF3xsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+fRZzkp; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40669fd81b5so29579b6e.1
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278727; x=1750883527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7F5LbEOE2TliZOiivov6fQ8KwW3D9N8KkGHlHMLzOc=;
        b=W+fRZzkpTBkjRtUxD94aPakQHgas84kHtOajLU8Ie6HKgp3HxcBhPN3C/dg4VBCafS
         Er1MmG5AR5DmTLbvk9wBAK+6a49OMeIHykqrUfRKtXtGZ8ll+qR8irl9/Xf0stC+S/AX
         Ez1zf8mxoV6J+klMBPkviB/Sv6pyYDF+2Oz8/Gy3m0XFtjmyPqyioJUteYIh7fSIZE9R
         kt78MzOi/b/8Ps8MCwMMSgm3s+MrCBpZF94T80slFp1HDtWkha+db7Jy5MqyZcLbEXa8
         bP/jJpLFjRH0KDvw2cppv90n+z/E/Ag5MJe7koRC1vGk/Cg8MXNxXw4rAJYMYYr1xtt1
         Bg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278727; x=1750883527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7F5LbEOE2TliZOiivov6fQ8KwW3D9N8KkGHlHMLzOc=;
        b=JokH1wNoveVAmvPJ3xFZI7GfQ4ei6scTWEC+AtYaZllY+TZwhiJ+DXwPeQrd4KNv9r
         PcCmlkXVm6Q0MfrcaFpqKK6qxttuTGZaqzrMNCk0ryH925a3DYOTPjAv/tzefiu9Ylv3
         uUvzx37CRyi4aw7t4Cy5UXOAUhggcMmDtUKzXhU0vt+QGQ3TzzZtVoIPtXMgMmHK7Jhx
         y4YOtXYUfIfN+DSiTYOF3C/f0Dp3tn65aISFkKziZqjODvn20zktRuazTYYPaJ5UQXYs
         PbsI1+12v7FrzrgTT/JQBqyF2mYmQPESzcQaCgRBCJyTl8alwq9hvRcCXAEwu7vN9MkW
         4HTg==
X-Forwarded-Encrypted: i=1; AJvYcCWIluQ7D34rEhLj3jSKo0qNhNw0+6URUIsLhJ24u761ADQef/HBxmi3CAhF5bO7+6+hmFjXd3+i4oeAvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8F93HezGeHrKwqxJ6eAvuC88KrQlPbW3KKlp6sGF/JPDkCYB
	d8EmWqGNAOBLV0VcDEnTmnmu3IoJ1x3TEdbhmUslciiQoXalY3Hh10PiYaa7bXOEXRI=
X-Gm-Gg: ASbGncvpw1YxE8VAO58aM3ZvspkqMbNXv1nvzMuVzeTXGA3hKO2hSj3x4n1+VFWgUpL
	AGRYmZkLeA+Z3ImlgYE2b3c4tcpzjqmmoLvP4/yRFQaCy0UHPswMawHARuK3Jq6CyY1w8bmaPVT
	2SZ8SHn4Ds9NlCOmFulBtFlQEpuzX8dRg6mGeaoxEGeHcqduhTOtyQ1rB/6sEOubFwxGdax4yf3
	afgbgZD+g1xXWkmEqKbAM3/I+o7oZ7FjBe97vLfHO2YPXOpb34YHyYH0Q4CAE6IiQDttRwFjxRS
	4U1ydLuqdAbSAQNQD++gsx1gfZSp5PYpPImHw1TTqCWFrF2FK6EQHSqvSX9piIJXecd4sw==
X-Google-Smtp-Source: AGHT+IFo8Z7V83YupZPSM3vubxz2Lq3pVlw4KiSrALtxHNSGiA1WTsEH9DXaaQA234FKxa9g/hTS0g==
X-Received: by 2002:a05:6808:f07:b0:404:d6a3:225b with SMTP id 5614622812f47-40a7c275c7amr13438618b6e.34.1750278727008;
        Wed, 18 Jun 2025 13:32:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740b2e75sm2512409b6e.2.2025.06.18.13.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:32:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:32:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/5] Staging: media: atomisp: i2c: hardcoded function name
Message-ID: <23e0a3f5-cc4a-4791-ba9a-f578ce0ba11e@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:39AM +0200, Thomas Andreatta wrote:
> Checkpatch fix: use func instead of hardcoded function name
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index d35394f1ddbb..f57f2b70909a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -584,7 +584,7 @@ static void gc0310_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc0310_device *dev = to_gc0310_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc0310_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);

This printk just prints when a function is called.  You can get
the same information from ftrace already so the printk is useless.
Just delete it.

regards,
dan carpenter


