Return-Path: <linux-media+bounces-13658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE690E43E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500541C21C28
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 07:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0DD7603F;
	Wed, 19 Jun 2024 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xh6plvt2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5A757F3
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781713; cv=none; b=pIunZcS5SQAroNRVDzWhk3NOmLY74ughrVmMJ6VrKRj2jpAu1nMBkwq3O4vqfqaebmFNNnbfekJaJQavnuylz1MvrvZj6D4D9Lu9KmjoHoU+6GfhXKB07fuPGQmC9MHjTUnnc0ITSvRqqce5msuWeBeI5bwbQVjlxRnE23LSWlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781713; c=relaxed/simple;
	bh=R/kmyQPRM325I/bwHAyp+h9CTCTqygm4C67yMCBClTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW6l0Ql/Hc4bnaBIS0XWgbQYJZ3cJ3+H7VjvIe0qmbZ2zdQgn2K4dGkBhRMA97uU6VcYmyw/s48oynJYeg6I3PGqH33EGrCsBhx9oTnm9SC06CK+STiqDQuIfqRbVOSng8gcqGdZ5++F5q1MCaR0DxAeLpBX/y5nNEBncXNE1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xh6plvt2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so2602723f8f.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 00:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718781710; x=1719386510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5FlCuYx89OMN7s2VzglpB6pm+N8b7rvZjLOnkOOQ78c=;
        b=xh6plvt2/QFhu2BdF2ZPrBwzs8XRXl2W7vWnlUli/piO5Rro4JxIVMU5u0mmnJy/fN
         upJFMNoIA0fHoKgCrdbIr2mjOS0oUIry5IvMngSNgoejMgg90P277n8dvcD91R8dvi2u
         a9YC7+o0iQ38XVJIcAwehs9sGZOgoZ7iOb+BxyrlUiPssl5q0Xj+M2ayCBXjTaTbnI/E
         AbFxI0rhUfygbtK4oH2sNQiWE/SLdJjIVEsed3ar2NqCqyLvwFl7RSSezDUnVeIElviY
         G0UsaJK30FvFIbTPekytUV2gcOU+s4/+JFcxTiVpzRciPF4RwrYVZWP9a/ALDvAF6kmU
         C4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718781710; x=1719386510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FlCuYx89OMN7s2VzglpB6pm+N8b7rvZjLOnkOOQ78c=;
        b=JQVIWPlRv+Mv5d5PnESTCgJTyIzPkFB1tFQWePHm0QoBngV1hbIYWoxoi+3n/oacfT
         9FioEoIePS7MSJGhfUbApDof8UYwRp2otmsfWq+/BjlS3fqXeRkdPwe3DYAssAWeSmNW
         tOqapBd1E+4Nde3F5pdbhHmHMCycpPKC/lxf1Yf2owPJpofkIQs7HXuV2oyanCEaJX9w
         qHG7tAzMENn3AuPs1xxbVZhl1UP5LkcuW7xbeE3ud6MX2tZicFj4a+XxqnHOK1+VqIoY
         RK/hig1Onk0cyoOSqCbF9g4OUmEZV4g2mcrtv7ouONujx9ujL4PdsafL/ncoQ1W1aehT
         HRlg==
X-Forwarded-Encrypted: i=1; AJvYcCX8ORUrMNoWJiNkBFG+IuoSwXLW4/rAcAQnqPdhr1kASTFqqH4M0TNgbtXziA2cMQ5al0YcjwQEHMYb+4cxdxfeYkTCAqXhbO3c1GU=
X-Gm-Message-State: AOJu0YykvUJW8C5WsvhrbACB6MYwGDS9D9o/Ie3s/IA0BtdhDwEoQwFg
	wJfzBy0ohWf7/uhuOIiNq9DCHbIbC5+NuuHiO5jAIF3B4FJ+XyxE4Cz5JbzwEDc=
X-Google-Smtp-Source: AGHT+IF2UOLV+qz3Kk3N1LJ8/j7ro1aIbV92WwNj2KhCxSSnTu3IwZUZX9P1RLZZrBmMGynzY0ETcg==
X-Received: by 2002:a5d:5402:0:b0:35f:1f91:c23 with SMTP id ffacd0b85a97d-36319990751mr1278337f8f.65.1718781710339;
        Wed, 19 Jun 2024 00:21:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-363bd4668aasm534412f8f.48.2024.06.19.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 00:21:49 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:21:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/10] media: rkvdec: Add image format concept
Message-ID: <f7e4b0be-fe09-4db8-b081-21c46c0d836f@moroto.mountain>
References: <20240618194647.742037-1-jonas@kwiboo.se>
 <20240618194647.742037-9-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618194647.742037-9-jonas@kwiboo.se>

On Tue, Jun 18, 2024 at 07:46:32PM +0000, Jonas Karlman wrote:
> +static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index,
> +				   enum rkvdec_image_fmt image_fmt)
>  {
>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	unsigned int i, j;
>  
>  	if (WARN_ON(!desc))
>  		return 0;
>  
> -	if (index >= desc->num_decoded_fmts)
> -		return 0;
> +	for (i = 0, j = 0; i < desc->num_decoded_fmts; i++) {
> +		if (rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
> +					   image_fmt) &&
> +		    index == j++)

I really don't care for this j++ which is tucked inside a condition.

> +			return desc->decoded_fmts[i].fourcc;
> +	}

	int fmt_idx = -1;
	unsigned int i;

	for (i = 0, i < desc->num_decoded_fmts; i++) {
		if (!rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
					    image_fmt))
			continue;
		fmt_idx++;
		if (index == fmt_idx)
			return desc->decoded_fmts[i].fourcc;
	}

	return 0;

>  
> -	return desc->decoded_fmts[index];
> +	return 0;
>  }

Don't resend if this is the only issue, but if you do resend could you
get rid of the j++?

regards,
dan carpenter

