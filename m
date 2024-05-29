Return-Path: <linux-media+bounces-12146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C81178D3236
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF353B2CAF6
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924F216E866;
	Wed, 29 May 2024 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AG4zH0A9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0F169361
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971434; cv=none; b=jV7OVhUm+jpV9hnGZfn+luRKzwfXBMScLQzhiWluX8PqAnRHlBc/G31W3xxb00/Y9pgxed64SmrmWvJJj/vQudCSK3LGxuWodujsDcWJxX7GA6zZDETUM4DFPQwrRLXlVEoHB6E9QXYBCQ6+BWeM7O+lzlSY/2zNBzVmBhI3jOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971434; c=relaxed/simple;
	bh=KalOd4VNB9ddnqI5SJEA/fxZiA7LJ85CstT18qQ+mEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWEvbA0gTcTyHfg2ZDajkGIV/vkCiZGmUNr5mIzgedeimP2/+HHVsWJR0eKQsX/wx+61ZNGe4+FdBKqpaMxlUsJa1f3xRFQDBB9KS3XjXab3kDXUatv2Ao166tvMZLTQIsyi5mUv9TCSN3/4zRI/jq4d8RjW6LIsvn62NmWYfrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AG4zH0A9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7021ab0d0f5so146436b3a.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716971431; x=1717576231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qenqQXhZZCyagreSZ+ZOYO//Et9NuVOjmhUJ/lmfY0=;
        b=AG4zH0A9IWb1LVOZAVTzjwqJpHpt9d4/DKxdxn7HS1+aelMJ0zXazylpAUxuw82fxE
         8xMBPOpyFW9ERkZ3cSSYc5aGcUiPJXoIJ8uY3wrOyRddUseAe5vO73oIPeNykgz/1P72
         iGZUHkFMUTWEPhm/5NJPAXaztaaiNoLUiVSrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971431; x=1717576231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qenqQXhZZCyagreSZ+ZOYO//Et9NuVOjmhUJ/lmfY0=;
        b=DKhVwGvvKDpQsZUBx0WXPnX1UEPJXKo06TnXHdSt20nwTTSow/HQnryG3BX924CKBH
         8ohCMJ0MJ+HYVwS9EvRO7O9+LbdMwVT1xsL1r41Yj5tKiBJvBgWu93ff5LMZ2TZSyp0E
         E4DxCm1fhDXfCnAWY2DwB5quau29eT9dmqvIqYL+kkbEt85S1B+mLkrPCAM5c3SgnNUZ
         AjAEvs9bS/eD142QccJ90I+sWQ+jy0KtBJYoTAHhlFPzm8N8FSxZfPj6ZKmebsdITLV9
         hJxX9XU8bhht4iyOh3NAUiLNnMcmch9gNQu0hsRBryOzL0vqh6w3BOacQyC/qL5E6FtH
         Mefg==
X-Forwarded-Encrypted: i=1; AJvYcCVHFIO+lpXMJuM8YZVsYw59NsDCAaOFUKhEdmSC80+p9Kg+wcccRSbyS0UAPW5RgFrjuGDq+Y3Uws8HLdzEaFu8zs+knZcngt1CcXk=
X-Gm-Message-State: AOJu0Yw5I2PGAGTvEhrAv4qzSUm9jgq3jnXRlg+cT89GiJNBTbhGaIwx
	iMdo2E8ovyNQVBNWsCIf/26P8XomTV+Ea8S9Wv8p0+ChhtdSxiO6YRqUDJ078w==
X-Google-Smtp-Source: AGHT+IEKKnlncqrQ+kEjd4U5yF4d7zX7PXa2e7lk0PLPAQVbSpQp5HDbTrt3J6bgh2D9uEk1OmzcPw==
X-Received: by 2002:a05:6a00:4405:b0:6f4:3fe7:7aa9 with SMTP id d2e1a72fcca58-6f8f2d6e5f3mr18821491b3a.10.1716971430731;
        Wed, 29 May 2024 01:30:30 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbf2e3c8sm7576786b3a.41.2024.05.29.01.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:30:30 -0700 (PDT)
Date: Wed, 29 May 2024 17:30:27 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 6/6] media: uvcvideo: Fix hw timestamp handling for
 slow FPS
Message-ID: <djwmp42odw4cre3yzvhlhsaxgp437qcg36kcvqzqadqqtc45zo@mzvernwjawfi>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-6-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-6-b08e590d97c7@chromium.org>

On Sat, Mar 23, 2024 at 10:48:07AM +0000, Ricardo Ribalda wrote:
> In UVC 1.5 we get a single clock value per frame. With the current
> buffer size of 32, FPS slowers than 32 might roll-over twice.
> 
> The current code cannot handle two roll-over and provide invalid
> timestamps.
> 
> Remove all the samples from the circular buffer that are more than two
> rollovers old, so the algorithm always provides good timestamps.
> 
> Note that we are removing values that are more than one second old,
> which means that there is enough distance between the two points that
> we use for the interpolation to provide good values.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 5df8f61d39cd1..900b57afac93a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -471,8 +471,31 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>  {
>  	unsigned long flags;
>  
> +	/*
> +	 * If we write new data on the position where we had the last
> +	 * overflow, remove the overflow pointer. There is no overflow
> +	 * on the whole circular buffer.
> +	 */
> +	if (clock->head == clock->last_sof_overflow)
> +		clock->last_sof_overflow = -1;
> +
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> +	/* Handle overflows */
> +	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> +		/*
> +		 * Remove data from the circular buffer that is older than the
> +		 * last overflow. We only support one overflow per circular
> +		 * buffer.
> +		 */
> +		if (clock->last_sof_overflow != -1) {
> +			clock->count = (clock->head - clock->last_sof_overflow
> +					+ clock->count) % clock->count;
> +		}
> +		clock->last_sof_overflow = clock->head;
> +	}
> +
> +	/* Add sample */
>  	clock->samples[clock->head] = *sample;
>  	clock->head = (clock->head + 1) % clock->size;
>  	clock->count = min(clock->count + 1, clock->size);
> @@ -616,6 +639,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
>  	clock->head = 0;
>  	clock->count = 0;
>  	clock->last_sof = -1;
> +	clock->last_sof_overflow = -1;
>  	clock->sof_offset = -1;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index cb9dd50bba8ac..fb9f9771131ac 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -499,6 +499,7 @@ struct uvc_streaming {
>  		unsigned int head;
>  		unsigned int count;
>  		unsigned int size;
> +		unsigned int last_sof_overflow;
>  
>  		u16 last_sof;
>  		u16 sof_offset;
> 
> -- 
> 2.44.0.396.g6e790dbe36-goog
> 
> 

Given that majority of cameras kind of run ~30 fps, this should improve
the timestamps for quite a lot of the users. Thanks.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

