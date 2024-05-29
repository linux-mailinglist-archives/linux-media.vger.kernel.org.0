Return-Path: <linux-media+bounces-12136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9238D2CF8
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBF951C25429
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 06:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B0315E5C2;
	Wed, 29 May 2024 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ObHQyTi2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0547A15CD41
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 06:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716963234; cv=none; b=i1XBzuUH/vgw0aP4RYB6Isv/GHBiojXiZC+aXAMpF0H5OPax5p+wAfaSL7gqnOtDmxIJbUUOb7VlgJUkwL591F5xrB5l8iC3ZkK2sGJfpRZvp4q+8+fyYAV9XARVQsdsmMEO+Wasr/rZxfXmf2QeGcuX9cidCCfOth7N1b5Fu/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716963234; c=relaxed/simple;
	bh=3FSvLZlOgEc+aUu5jFCR372lA79UDHQsiGqRizvsNeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkkoS/RqIC21LBmaE2iFFRdfdHPtFQ1yJ89nbZsqrzxFrJUlDC786Rp2coVVMrafiRHejXE0l5j6KLAbN6bvTVDYAt5cnC8EhxBg0oyhdIzu9MBFSefSUMGks7H7EXwK0LJVptviWCquc6tHK7178wrcIgFyQp/cHfYfUm9gprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ObHQyTi2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f449f09476so3385005ad.1
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716963232; x=1717568032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mb1XJXdu2//C7Xx7gnMlD9T15Ki5dUYRiH8NLKoSURY=;
        b=ObHQyTi2uozW3LJSjuzasfLf5XFeatxXArsoz5kulkjHaV/vtzdFsBE21GyGaxvKw7
         s+k/4A+bGU2bulqQjVdb+2pT1xmVC5vuLMY5Vy9pHN6FBCsBEXUWnT3ufRsTkI4XVZNj
         Qgu2JNJbzpP6vaAUVsOh2G0uWcoMhP7mEOWRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716963232; x=1717568032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb1XJXdu2//C7Xx7gnMlD9T15Ki5dUYRiH8NLKoSURY=;
        b=sKfN7hYgeUJPRZRIG/d/0ak//BMzvOSoYhhgU0QbkVvTt70HtXDWGSHxYT3NgqtIOn
         lnRxL2/bTF6643P5dlbljSIbNZyNTs479lJJutgR18nTyjTKAoXYVWPWTaRHyo4vziLc
         nkn3bEynDUYkwdit+C3Ljy/G14ncYu5npL/j14ap3xV6jhjtVCon2nyyvNBOMyq0BFRr
         ea3ux/+GIQGrdpEnYLGlggh5rx3EuJrnCWztSHCymNg4XI6w/puE82yWy8Z40w7sQ2N/
         pa/KPjdaA637qSsyxiplSC3sT4gjKbdUGqO08jHw+r2goRJFb0X1CjrRKFRfkJQ0/G2F
         MX7w==
X-Forwarded-Encrypted: i=1; AJvYcCU9Hyp25Mr2ee8Ar0C5iPkANN5qaAyLtLzie20SZZiAtss68vcniIooE4/7OVeU5LhmGXckRrPwBePwKzQgX31LExl4vuOrYcqBWfw=
X-Gm-Message-State: AOJu0YzLVdsN6OTRJ78pWMNuxg9mzW+gVCqTbh4udahIgBZKWf4BJ/EK
	tZjIbITve7pSAw63xUqE+yK6lUUXDugQvNIqScsosNsNFU5ZzcZicB1T6AvRrLvaVRxJERodIU9
	I2w==
X-Google-Smtp-Source: AGHT+IGM70tAxQ5wUXo06dTx7marcWxV7pZaxCusq+1MywGIjjvwFQbPhH0jgK7VJkUjD6z9/QpLMA==
X-Received: by 2002:a17:903:18a:b0:1f4:736a:27fa with SMTP id d9443c01a7336-1f4e95f4709mr20001565ad.0.1716963232293;
        Tue, 28 May 2024 23:13:52 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f47efff203sm61305385ad.241.2024.05.28.23.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:13:51 -0700 (PDT)
Date: Wed, 29 May 2024 15:13:48 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 1/6] media: uvcvideo: Support timestamp lists of any
 size
Message-ID: <ga5jxpqrz33js4nzziuj234vxlkjhcanofqymjcy2vi2x7irjb@bkubcfb43ylm>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-1-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-1-b08e590d97c7@chromium.org>

On Sat, Mar 23, 2024 at 10:48:02AM +0000, Ricardo Ribalda wrote:
> The tail of the list lives at the position before the head. This is
> mathematically noted as:
> ```
> (head-1) mod size.
> ```
> Unfortunately C, does not have a modulus operator, but a remainder
> operator (%).
> The reminder operation has a different result than the modulus if
> (head -1) is a negative number and size is not a power of two.
> 
> Adding size to (head-1) allows the code to run with any value of size.
> 
> This does not change the current behaviour of the driver, as the size is
> always a power of two, but avoid tedious debugging if we ever change its
> size.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 7cbf4692bd875..659c9e9880a99 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  		goto done;
>  
>  	first = &clock->samples[clock->head];
> -	last = &clock->samples[(clock->head - 1) % clock->size];
> +	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
>  
>  	/* First step, PTS to SOF conversion. */
>  	delta_stc = buf->pts - (1UL << 31);
> 
> -- 
> 2.44.0.396.g6e790dbe36-goog
> 
>

It could be worth mentioning that basically head == 0 is the problematic
case here, but otherwise good catch.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

