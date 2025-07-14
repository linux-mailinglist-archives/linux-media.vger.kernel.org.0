Return-Path: <linux-media+bounces-37716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C6B04923
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC353B77CE
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91BD2673A9;
	Mon, 14 Jul 2025 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIenBUXz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BE2586EF
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527379; cv=none; b=R2GXgrOH8CWDIS110ov6waqszOJEYLm3T+v0t3N7L1i8E2GA1xTA2J6TBT0G/S45JCRAqwK7dSgY3+geabwP3gzT9cHNpnAanJb4tNTKSk4Rl9zecGxj6QYj9WP2rmgART//zv/ChQuP/XqWmmgwyRSJLnBPh7N//GvmWM85sGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527379; c=relaxed/simple;
	bh=Eo0o2hEb39hiPyghzkvSTKfu8tBjairbI2YusZgQgHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfdWmYjTOrUGzw8oxWwQAmns+45CoBS2PVvWkQqYJPFJm/F5O4lDuIRZ5DV0/mn9UFLV3VXi/2BuUd0HJ6DrZLc6XI95dZGk8wpgUcrGhTomC2JLs+k+j4nVDIC7kUGn3m+80dmWMghzR+bChjWNh4T/6S9myWcECTFOH3w/fc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIenBUXz; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-41b309ce799so435079b6e.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752527375; x=1753132175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvTi+cy+QDC0rQAzEsO6ZT46EiAuz4DM9iAPl2nhYbk=;
        b=DIenBUXzhBH5yf1uThKAVGvtwAvrWsDBjgETugfoQrqzbLEnUgF8CSPbCnXQjsueNq
         1LOLIMLksV6rYrNGO5sufVh4AaFoBeuYv5XxwTYz3OE1JK9M2bXXCOZhwIFx1gmnUAXb
         CDVhVNdxKMu0lz+DTJ70tb7t5b2IvJhUlJxfWCWCClNY5IMorQY+p+MrdWZ8RHhmyIIn
         Dr1uE9LCBZJoBC/cW/UZ4YT7XouVipaVw/L7h/2/i5eumyiiKhIjpl6/Mvll0GQNQVJN
         yqrHlYlIZAwhJ6KiRwZQe0uo/Cbsl1iHksC7tLtUfMgJx5N8OALR5V1Se4+OBLoU3uTS
         /0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752527375; x=1753132175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvTi+cy+QDC0rQAzEsO6ZT46EiAuz4DM9iAPl2nhYbk=;
        b=hDYMpWlJ9Nn+i68sef80kefb+Fh29PIsbDwiuI5UdgVa2amzIjLeqrnekxja+Iog38
         hvlbbtAT3ZG5tRZHwZfeil2IPQQM3oxZBJ7PpbSBLgiVHfWMlW9/T9GBLVWL4k5ZGxXU
         sSMbTP27FYLksi4TN9jlhRzn0KKqVGZW3a48Rpe4Ry4n0a6qEMh86ZSdCcvBvBhCNaF1
         mUq8jXgBVhMVm+yGE80SPs1TYLzapDjtJ2jFCsTQmRS+wGGR1l0owXN2z2bSebS8SnAm
         D0ATm16grmSjiPgDCX+TgWBEG6DReIZQI+QN2DrdEsjKTGnHJspUcPI6wD9KeJbnPHFl
         53hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbr8Oty9Gf58edYu2EStMj+g7lF0msKJ3XhDnw2SP7sH1t53u1IlHmd+8jqNgJnZSL5vc3nyzlocT8sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe/ZJBykofHN3jsxnWfoGiQlMCrdvVv6yfPTVcYy5QJWfFz40
	SO9Q5rHC9LjcShSEjxWUmLqlYg1OsNi+KYNNc7oSBRT5UjX+5jEZNCDdwsZk1T7RGic=
X-Gm-Gg: ASbGncsNQzvm6lZ4Bp+pqtzYnjp1PdIalZdxr3YUWjmMYhJ2IyIjReaiie73qWPbd6a
	hU/lU+ASEXnsoZr68CWk6Q7JcO+5fY/n5/keAXxSZ+AMc7ccr9VODpQ5ab2wdOAy2n8hCtQlteP
	yREna8QB5gA3uRoViqajESWOOfC6Vlir+2lIPaEEVeuWS8gjd+vWcIZRi2lSMP2IUB0grL6bfoG
	+EntoU8WweBAaWH4LCvIX8EdJ8LV3q12vuwEGceBUpUZrPtygSjj7xhNe2o+E2ajOj3kzbvVdRF
	+CADcKYk/9wblHH7wXF212wYSOFQY3/ofE/kSt3slDGB9t9kJjnIJnnb+TJfmPMu9EIu3ccmRea
	gLUyARTewJoR4wRZkfBWLc+RpGbuxbzSh4tOW+Gyz
X-Google-Smtp-Source: AGHT+IERTMOpjsDRrZFdMuMNdim8TfF6hlXEjvbR3D4xp58pSuklvW4nDe2xvA8xk6yFe6KPdBlrbw==
X-Received: by 2002:a05:6808:11ca:b0:406:71fd:b610 with SMTP id 5614622812f47-41539d98e0bmr10236884b6e.33.1752527375538;
        Mon, 14 Jul 2025 14:09:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41418c0c259sm1635798b6e.5.2025.07.14.14.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:09:35 -0700 (PDT)
Date: Tue, 15 Jul 2025 00:09:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sina hosseinizad <sina.hz@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: atomisp: stylefix
Message-ID: <6519f649-82bd-4f58-b99a-731fb86aa1a6@suswa.mountain>
References: <20250714142645.88038-1-sina.hz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714142645.88038-1-sina.hz@gmail.com>

On Mon, Jul 14, 2025 at 04:26:45PM +0200, sina hosseinizad wrote:
> change the spaces at the beginning of the line to tabs
> 
> Signed-off-by: sina hosseinizad <sina.hz@gmail.com>

You probably want to capitalize your name.  It's supposed to be written
like you would write it on a legal document.  (These Signed off by lines
are supposed to be like a legal thing which says that you haven't stolen
any code or violated any copy rights in this patch).

> ---
> My first contribution to the linux kernel, so starting out with a stylefix
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index bc97fa2c374c..bd3a017490ef 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2347,7 +2347,7 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
>  }
>  
>  int atomisp_css_video_configure_viewfinder(
> -    struct atomisp_sub_device *asd,
> +	struct atomisp_sub_device *asd,
>      unsigned int width, unsigned int height,

The other lines don't match now.

regards,
dan carpenter

>      unsigned int min_width,
>      enum ia_css_frame_format format)
> -- 
> 2.39.5
> 

