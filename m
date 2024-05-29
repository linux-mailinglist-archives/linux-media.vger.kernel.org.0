Return-Path: <linux-media+bounces-12144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9F8D3064
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D8761C2645E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF0016ABC7;
	Wed, 29 May 2024 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ygf4SeWD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B40167D98
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716969794; cv=none; b=CjF1kbglUuK8dvoGvJ9oU+e/cR0PaMMIHEVfMWeDLv8QGw7FBuweVL/7q7g1f0sSdiHbFlmz1GN0F5ZmDCuYNQ35NlGEpH1jrLeLXnI3V0UDssNXX0IYicDJowSEivZdEKvSslklUfK5QRGaRMSsTn/KMejffZAWHf9VF6sHRW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716969794; c=relaxed/simple;
	bh=yyzwBwMrHhyzP+KoX7+xVQUPiv1GRQhCclALjtWRz8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crU9ZLfRJrxlliuW7SzcJeAId0ewIfnCYEWCsNTtvmW8uUWfuTIUfFx4obH9Pn5oTFjLNKF7fTXrAnGiSUvqW5N5b6Rlxj2hx27MOPk9aGLyFo4R97kVptiL1DD34HB0VgOeBNlD2O/oSENxz5Ir2xZCrP/IS4ddbIbDTavaHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ygf4SeWD; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3737b281d89so6954475ab.0
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716969792; x=1717574592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ogaI7Gpfs636qO5hyNT7bNNQENqOhw8naK259iAtrjo=;
        b=Ygf4SeWD7mAFcv0rp79qvcE6+GEX/2QtjVtg8teXVLUVK3r2CRsH8cJ/RzO+Th25+c
         RsgW4bG5nKDkdLiT9HQ9FQp2G9kkLUTrYFaQe0VDldhEcqViMrnOl8rXzLn8TEoK2evp
         MVR/QVVfYxWalCCU1wIsB6caDYRSiqINM5eUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969792; x=1717574592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogaI7Gpfs636qO5hyNT7bNNQENqOhw8naK259iAtrjo=;
        b=VaWbmZj9+gTFgaKSweWr+0UuycupanUlWfEhRVkRW9eZAtsCE7n28ZjLhqPt6bAAc5
         MRwcxQvJIBU/oyzjU6N3fLga4KYr1Y+Z/5VoLTEZZa1Zmst1vJPBTq24ni1Z+gBY2edL
         nZnOELKVs5tNaOmzYx4Ocbu4cqqPrGzYDJoJ5osxrqNifAA40G8Nj+B56nEg/vYG9mfF
         yDrBCj6B2iQTzo0LLg6+uy2Tx4YivxOaB46v+ttPcJyeFBcv87PmZZt3FJiPyBfQqH4Y
         9tXnjgp1JGb7u0hu6sHbzRP4Wjvmh7UuqoQzOIX9+gEAt2WTDEQh0P2vVW/uz44cP2tD
         kaVw==
X-Forwarded-Encrypted: i=1; AJvYcCUq8XVFCFho4b+mQxxy+rnxpXcGrRzjAqOgywKFzOWo2NZZ69+FBGL8dF/9qiaeVsuQP3/v2S4rLyJbQqf5Ap8qWkFO3U21/X+zfv4=
X-Gm-Message-State: AOJu0YzVj0r9mw4VjeHqWXFNbCnQFgvvEUGbGgV77bAGFoEEYnWmh4W6
	2MeUfurQzRroko4UIyPa+ilYxKu+XmfGQPHT97iHwtUpM29sQLOwpvL37kDX5A==
X-Google-Smtp-Source: AGHT+IGdbowjE3p9FsKUQs1U+S3A4H33kvzBquL28Ht/5QUfhl6pM3qzARUiGZqakco6aEOBwwMFCw==
X-Received: by 2002:a05:6e02:12c1:b0:36d:b381:4852 with SMTP id e9e14a558f8ab-3737b31e049mr175673375ab.15.1716969791822;
        Wed, 29 May 2024 01:03:11 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822189197asm8553266a12.20.2024.05.29.01.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:03:11 -0700 (PDT)
Date: Wed, 29 May 2024 17:03:08 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
Message-ID: <4kck7oedsnj6kfiv7ykwsjg35qodg5bdktu5t5w3xtg2xuscto@2yh6kfdqwimc>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>

On Sat, Mar 23, 2024 at 10:48:05AM +0000, Ricardo Ribalda wrote:
> With UVC 1.5 we get as little as one clock sample per frame. Which means
> that it takes 32 frames to move from the software timestamp to the
> hardware timestamp method.
> 
> This results in abrupt changes in the timestamping after 32 frames (~1
> second), resulting in noticeable artifacts when used for encoding.
> 
> With this patch we modify the update algorithm to work with whatever
> amount of values are available.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index d6ca383f643e3..af25b9f1b53fe 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> -	if (clock->count < clock->size)
> +	if (clock->count < 2)
>  		goto done;
>  
> -	first = &clock->samples[clock->head];
> +	first = &clock->samples[(clock->head - clock->count + clock->size) % clock->size];
>  	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
>  
>  	/* First step, PTS to SOF conversion. */
> @@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  	if (y2 < y1)
>  		y2 += 2048 << 16;
>  
> +	/*
> +	 * Have at least 1/4 of a second of timestamps before we
> +	 * try to do any calculation. Otherwise we do not have enough
> +	 * precision. This value was determined by running Android CTS
> +	 * on different devices.
> +	 *
> +	 * dev_sof runs at 1KHz, and we have a fixed point precision of
> +	 * 16 bits.
> +	 */
> +	if ((y2 - y1) < ((1000 / 4) << 16))
> +		goto done;

Not a comment for this patch directly, but...

This kind of makes me wonder if we don't want to have some documentation
that specifies what the userspace can expect from the timestamps, so
that this isn't changed randomly in the future breaking what was fixed
by this patch.

Anyway:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

