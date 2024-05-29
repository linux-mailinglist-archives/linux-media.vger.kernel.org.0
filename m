Return-Path: <linux-media+bounces-12145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FB8D30E2
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0819A28AD56
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82453169AFF;
	Wed, 29 May 2024 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GjD1UzgB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B541168C24
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716970409; cv=none; b=lh4Q1oQ3z1Xb1PfYD7rs51Bywq7wNd8NjZ+52Mwugynn5MRgAoHPKdUd6OzXDPINeqOq8oValUqk95viCczC39tcm/qKZxjG28JqiYxcj1Z+Ok0K33xNqoQXOSZDTzCZw/Sy1soEfY6XkR6HFK/Ig6AG2zgXClQWKSJeGnRgUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716970409; c=relaxed/simple;
	bh=9VbDPNEu/9Dxf1kTh3/W0kU2GDoa/+MsCrbp+0lfEIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKXEfGF88K342i/loiOiT1hAE1/kERwqv4Ir/0nDwTwwVsXw2DnRUQfTXalfSpqPjYsvMsybEOdGU9tRoWJQwreuHF0i2QwXVHz9fu1EH7uX58qopsYx2kIhK8+Ykz3qMnkiF6A3qvUols/BdVxQj+Y+AmPJQ/bPnS+a5kTtKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GjD1UzgB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2bdfa8ef0c3so1564330a91.0
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716970405; x=1717575205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2InNfmycQm3nukMaGI50qiR5OFIJgqpPbj6TUNjDnhI=;
        b=GjD1UzgBX0vIzUD2cSClx+Ll7l7gUARWgRbC3a3Nb5Ia3AXXwzvfn6izJKsNCe3/DX
         QHmlp35FrbipMcJdOHotAyeNt313lmHimcuFAY1Q8aC7gYcfpZV+NLHXAYUVKjsP/tjm
         NLSD43hL2nzpaMixBIVlTm+BLdXnw5EWc4los=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970405; x=1717575205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2InNfmycQm3nukMaGI50qiR5OFIJgqpPbj6TUNjDnhI=;
        b=s0EW86Vt38LjFWf3ITpK3GYS4ijqlTGdzLPZptrfE3JmEymF1QeVJl5Nzg+KxXJ8gg
         /zzP9jEJVVCYleLC4bScnwTeOJZf3iSBQdkqO8LA4WjP+YyppjEQ4AwRMXfjxGHLWjum
         RORwhxTPF4pXrbKALLYigdxa2CcwHTTCMqUwF/tcWvJsBn+EcmL2OUeLb2cJYw8ebpeG
         IbmVc/8SKR2mCGHV6MROrkUZBT95SuPG4WCVpYf4hyu8c1G4ecoHCnEbZOxflvAMh2Ol
         j3xmyCSbJ6E5BDZ1O9dQInF82l8o1u4997327k4YxLMz1neU2kqcAzK8IRjZ3im6ka+P
         6mlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFAhalk6O7e7Ouj6dWgu6HV/ZWWk9SM/f5H0oP2/1WQ+TFNhXjGEQ6YEtREfXmfgp2Bz1+v6m1P0floZZPaFiQNGTGUznlMVOIsfA=
X-Gm-Message-State: AOJu0YxkGFMKVFD4M1IKm1RCA3yhtyD8SFRaBuivZDaPALm4i6EZtszJ
	uIXzq7WxalganTqiXPsOnAVsqT+uS3D2ngaaT/bWo6mOyiktKkHUDqV/XSWRXqmpa2juwU3MBj6
	g8A==
X-Google-Smtp-Source: AGHT+IHr762F9r3TLiKVq8gyeele4yYhnjym9F1FZFi7bseI5MisLm2rLrJw8L2cH+mPL2HwsRY+yg==
X-Received: by 2002:a17:90b:438a:b0:2bf:597d:f1d5 with SMTP id 98e67ed59e1d1-2bf5e4738famr13532318a91.5.1716970405183;
        Wed, 29 May 2024 01:13:25 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f6155b6sm9989292a91.29.2024.05.29.01.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:13:24 -0700 (PDT)
Date: Wed, 29 May 2024 17:13:21 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 5/6] media: uvcvideo: Refactor clock circular buffer
Message-ID: <manyf44d4ijttnnz2ml52zygg7hvyuhtligivcslx6hjbp7y2u@jqb6fnysnn2a>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-5-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-5-b08e590d97c7@chromium.org>

On Sat, Mar 23, 2024 at 10:48:06AM +0000, Ricardo Ribalda wrote:
> Isolate all the changes related to the clock circular buffer to its own
> function, that way we can make changes easier to the buffer logic.
> 
> Also simplify the lock, by removing the circular buffer clock handling
> from uvc_video_clock_decode().
> 
> And now that we are at it, unify the API of the clock functions.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 83 +++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 47 deletions(-)
> 

Very nice clean-up. Thanks!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index af25b9f1b53fe..5df8f61d39cd1 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -466,19 +466,28 @@ static inline ktime_t uvc_video_get_time(void)
>  		return ktime_get_real();
>  }
>  
> +static void uvc_video_clock_add_sample(struct uvc_clock *clock,
> +				       const struct uvc_clock_sample *sample)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&clock->lock, flags);
> +
> +	clock->samples[clock->head] = *sample;
> +	clock->head = (clock->head + 1) % clock->size;
> +	clock->count = min(clock->count + 1, clock->size);
> +
> +	spin_unlock_irqrestore(&clock->lock, flags);
> +}
> +
>  static void
>  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  		       const u8 *data, int len)
>  {
> -	struct uvc_clock_sample *sample;
> +	struct uvc_clock_sample sample;
>  	unsigned int header_size;
>  	bool has_pts = false;
>  	bool has_scr = false;
> -	unsigned long flags;
> -	ktime_t time;
> -	u16 host_sof;
> -	u16 dev_sof;
> -	u32 dev_stc;
>  
>  	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
>  	case UVC_STREAM_PTS | UVC_STREAM_SCR:
> @@ -523,11 +532,11 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	 * all the data packets of the same frame contains the same SOF. In that
>  	 * case only the first one will match the host_sof.
>  	 */
> -	dev_sof = get_unaligned_le16(&data[header_size - 2]);
> -	if (dev_sof == stream->clock.last_sof)
> +	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
> +	if (sample.dev_sof == stream->clock.last_sof)
>  		return;
>  
> -	dev_stc = get_unaligned_le32(&data[header_size - 6]);
> +	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>  
>  	/*
>  	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
> @@ -552,12 +561,10 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	 * suffer from this condition.
>  	 */
>  	if (buf && buf->bytesused == 0 && len == header_size &&
> -	    dev_stc == 0 && dev_sof == 0)
> +	    sample.dev_stc == 0 && sample.dev_sof == 0)
>  		return;
>  
> -	stream->clock.last_sof = dev_sof;
> -
> -	host_sof = usb_get_current_frame_number(stream->dev->udev);
> +	sample.host_sof = usb_get_current_frame_number(stream->dev->udev);
>  
>  	/*
>  	 * On some devices, like the Logitech C922, the device SOF does not run
> @@ -567,9 +574,9 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	 * host, but the exact reason hasn't been fully determined.
>  	 */
>  	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> -		dev_sof = host_sof;
> +		sample.dev_sof = sample.host_sof;
>  
> -	time = uvc_video_get_time();
> +	sample.host_time = uvc_video_get_time();
>  
>  	/*
>  	 * The UVC specification allows device implementations that can't obtain
> @@ -592,46 +599,28 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	 * the 8 LSBs of the delta are kept.
>  	 */
>  	if (stream->clock.sof_offset == (u16)-1) {
> -		u16 delta_sof = (host_sof - dev_sof) & 255;
> +		u16 delta_sof = (sample.host_sof - sample.dev_sof) & 255;
>  		if (delta_sof >= 10)
>  			stream->clock.sof_offset = delta_sof;
>  		else
>  			stream->clock.sof_offset = 0;
>  	}
>  
> -	dev_sof = (dev_sof + stream->clock.sof_offset) & 2047;
> -
> -	spin_lock_irqsave(&stream->clock.lock, flags);
> -
> -	sample = &stream->clock.samples[stream->clock.head];
> -	sample->dev_stc = dev_stc;
> -	sample->dev_sof = dev_sof;
> -	sample->host_sof = host_sof;
> -	sample->host_time = time;
> -
> -	/* Update the sliding window head and count. */
> -	stream->clock.head = (stream->clock.head + 1) % stream->clock.size;
> -
> -	if (stream->clock.count < stream->clock.size)
> -		stream->clock.count++;
> -
> -	spin_unlock_irqrestore(&stream->clock.lock, flags);
> +	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
> +	uvc_video_clock_add_sample(&stream->clock, &sample);
> +	stream->clock.last_sof = sample.dev_sof;
>  }
>  
> -static void uvc_video_clock_reset(struct uvc_streaming *stream)
> +static void uvc_video_clock_reset(struct uvc_clock *clock)
>  {
> -	struct uvc_clock *clock = &stream->clock;
> -
>  	clock->head = 0;
>  	clock->count = 0;
>  	clock->last_sof = -1;
>  	clock->sof_offset = -1;
>  }
>  
> -static int uvc_video_clock_init(struct uvc_streaming *stream)
> +static int uvc_video_clock_init(struct uvc_clock *clock)
>  {
> -	struct uvc_clock *clock = &stream->clock;
> -
>  	spin_lock_init(&clock->lock);
>  	clock->size = 32;
>  
> @@ -640,15 +629,15 @@ static int uvc_video_clock_init(struct uvc_streaming *stream)
>  	if (clock->samples == NULL)
>  		return -ENOMEM;
>  
> -	uvc_video_clock_reset(stream);
> +	uvc_video_clock_reset(clock);
>  
>  	return 0;
>  }
>  
> -static void uvc_video_clock_cleanup(struct uvc_streaming *stream)
> +static void uvc_video_clock_cleanup(struct uvc_clock *clock)
>  {
> -	kfree(stream->clock.samples);
> -	stream->clock.samples = NULL;
> +	kfree(clock->samples);
> +	clock->samples = NULL;
>  }
>  
>  /*
> @@ -2123,7 +2112,7 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
>  
>  	stream->frozen = 0;
>  
> -	uvc_video_clock_reset(stream);
> +	uvc_video_clock_reset(&stream->clock);
>  
>  	if (!uvc_queue_streaming(&stream->queue))
>  		return 0;
> @@ -2272,7 +2261,7 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
>  {
>  	int ret;
>  
> -	ret = uvc_video_clock_init(stream);
> +	ret = uvc_video_clock_init(&stream->clock);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -2290,7 +2279,7 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
>  error_video:
>  	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
>  error_commit:
> -	uvc_video_clock_cleanup(stream);
> +	uvc_video_clock_cleanup(&stream->clock);
>  
>  	return ret;
>  }
> @@ -2318,5 +2307,5 @@ void uvc_video_stop_streaming(struct uvc_streaming *stream)
>  		usb_clear_halt(stream->dev->udev, pipe);
>  	}
>  
> -	uvc_video_clock_cleanup(stream);
> +	uvc_video_clock_cleanup(&stream->clock);
>  }
> 
> -- 
> 2.44.0.396.g6e790dbe36-goog
> 
> 

