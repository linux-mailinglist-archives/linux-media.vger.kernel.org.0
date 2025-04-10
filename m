Return-Path: <linux-media+bounces-29844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD4A83904
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A6CF3B7E8E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37B81FCFF3;
	Thu, 10 Apr 2025 06:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYrE7tlm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0982A1D9A54
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265868; cv=none; b=SXUFFrsNSRjpVVkWMqiFNAZI7QnundaLjDQdqgDThY8aRzQkarHTqeXKZ41Bwb9Q73grtsjy60AzA7MOvo36jarrn4vmfvzDgecM6uHsy1AsP+MvZ0mGisFkfF6nEzXhjIZZKJ7ybGP5zfvx2yiMqbgfJ9S1F0U1B77+PBm9GUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265868; c=relaxed/simple;
	bh=RuJkx0SME0u7KQoXNcdSFo1kg/bczJSkO6Gfd1eD3s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUzUuMaFl3WoDNl2GAgfmfRVWTQJi4CrED8qEtKH8iCPZZm07vJb1WZMy+V8v1w+dUD0Rbw3CDOuyy8Rf/aQ72e2qs3M4SnbU5tuBqGmtEs3GaWbignG8lWsMpl8XGF9glgKv4CU4ORkg1UAJ2H/1PpMF8Ge5N5/TDJ9g4iTHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYrE7tlm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39129fc51f8so267771f8f.0
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265864; x=1744870664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=XYrE7tlm6lG/Qzu/17ww0gE1PiK3v9bUCi3qviV4EXV/+J7oehIVgOVUu+0I9iJd3u
         g2RHdU4HwaL39OM3HjqeZLmydpz/Kkxw6maFRwNVRHetlDmd7gLFM1ok6qBnrKvH/viR
         Amiky4lARgT1imbK+v4lJw3Rr2VIdM08fYsA/9esNG/Yjz15mVUir+gw0zbbRbQ5Rjmd
         9wo7tIOeO2nnueSSyX04CDkpc72hv9L7RsMt/xlZEY717lG4OgLdxFNl6TXxPP8ENih6
         rIq2JhowNMaZBM64vdo++5MgjxTkLrMSfxs2s/0wbTqM+srsld6/x6s74IV4SZ65I70Z
         d34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265864; x=1744870664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=at6WogpUBIuGS2eDBtKaLabV701CRplhysbc+Rc/TeS0Y022/+FOWvbWFhShVoUSk/
         JhO8AxshJBN+T3RjAuTXyaT1x/BZNFC+KhnRIGoOkowdQQx4L1EdDy0EivvcQ7RWJR3N
         A0M3F6wtG/e6XHYhs0rZutK28LEBlHeDJOh39mRki5yjIxUj/QpX3l/FC3FUNpGgZnGW
         Z7Uk5P38As1Yra5+5uzUtj82oN8zykQvu1aOhOqPRHWHQzqq+7wUnUKqP1blv7PHb47e
         2fgsam/Gu/TOK01Y8PuFTYBp6eTqeoIy3UNXKS7uWM/SQOKyb77A3mJF0bx+sHNz7PPG
         bkKg==
X-Forwarded-Encrypted: i=1; AJvYcCVERyKvemRaaS1ipu9ZQHNs4wd6nBBFb3okNs1qBV/UHvmJUXuOwXWU83MS2ijF3W8hcYzt13+ae6+6Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DbZMvJxQu5w+1JEIgYDg98KgrT+2JTrYHCalQxrpP1un+0O5
	xImhp4HDsJkysVjYDN6KlC9dyUswR/JhkBoBXJorA/bxT4mCcaXkF0nGyzzE6gA=
X-Gm-Gg: ASbGnctSSV+tkCFujJmg1RosWpaFhPT7YqHR1bbenxxOg6b1HpQiKevbelFV0ZTvAf3
	KEsUPhSS9XLQ+62HH1OMKVafHFFsC9WEp37Y9Szxf5YHbnLG7k0TkbWY6Sb7k7R7nmConrJdg8m
	gR/entQrBvwQw6JVq19hfiA9TjGYzJTuyOH1AP2e75SajxLTrycMiesq3RW98ILhyRGfmTAcKFJ
	rAHqtINyU19Ub6f3vU4+Kn+YGdgTsMclH41/YWJLETPeWUJpahvYbP1JvKsUo9yrGG8EBSImZkq
	hB58uEsWnZvlQOk+8RitmwuGxXJHKIcyC1zRgGV1nNmqMlgoYMt6ZgmG
X-Google-Smtp-Source: AGHT+IGPf0mN33Z8VXMC6vHoEgIYPUGu+ettg097AataOUXjxz6bSk1dsUcrvcjBIRQZplQw7qTkLw==
X-Received: by 2002:a05:6000:18ae:b0:39c:2692:425a with SMTP id ffacd0b85a97d-39d8fd63d92mr746462f8f.6.1744265864279;
        Wed, 09 Apr 2025 23:17:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893611d0sm3664353f8f.6.2025.04.09.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:17:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:17:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging/media/imx: fix null pointer dereference
Message-ID: <0d496695-ce20-4774-8e86-4d5c98dc220b@stanley.mountain>
References: <20250409211727.62710-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211727.62710-1-siddarthsgml@gmail.com>

On Thu, Apr 10, 2025 at 02:47:27AM +0530, Siddarth G wrote:
> Cppcheck warnings:
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> error: Null pointer dereference: fi [ctunullpointer]
>   if (fi->denominator == 0) {
> 
> drivers/staging/media/imx/imx-media-csi.c:795:27:
> note: Calling function imx_media_fim_set_stream, 2nd argument is null
>   imx_media_fim_set_stream(priv->fim, NULL, false);
                                              ^^^^^
This is a false positive.  The false means that we don't call
update_fim_nominal().  Btw, Smatch parses this one correctly.

> 
> drivers/staging/media/imx/imx-media-fim.c:388:3:
> note: Calling function update_fim_nominal, 2nd argument is null
>   update_fim_nominal(fim, fi);
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> note: Dereferencing argument fi that is null
>   if (fi->denominator == 0) {
> 
> To fix the issue, add a check to validate that the 'fi' is not
> null before accessing its members.
> 
> Signed-off-by: Siddarth G <siddarthsgml@gmail.com>

Don't resend because we just ignore false positives instead of
trying to silence them.  But if this were a real bug then it
would need a Fixes tag.

> ---
>  drivers/staging/media/imx/imx-media-fim.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index ccbc0371fba2..25f79d0f87b9 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
>  static void update_fim_nominal(struct imx_media_fim *fim,
>  			       const struct v4l2_fract *fi)
>  {
> +	if (!fi)
> +		return;

If this were a real bug, then probably the NULL check would be better in
the caller.

regards,
dan carpenter

> +
>  	if (fi->denominator == 0) {
>  		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
>  		fim->enabled = false;
> -- 
> 2.43.0
> 

