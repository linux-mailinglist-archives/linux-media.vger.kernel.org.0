Return-Path: <linux-media+bounces-12137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006A8D2D1A
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C77B1F21DFC
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 06:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3516C15F41B;
	Wed, 29 May 2024 06:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cuSxQGjE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2482E15B124
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716963575; cv=none; b=SE+OEwikrpUbmT8OAsNrmV1GrYs6zAoUbRX0cfcLMWpGE1cTrwIiAjGojm6j4452zdL+yKpEkZLVkQ511rfwlDh5zFHQLPn8y18d9e2S2LjPytH4Oz/rxZBbseipV0zFuKBau8F+TaLWPc8jDcvIjmhcJ3nVG6AtdM/6Gqxs11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716963575; c=relaxed/simple;
	bh=5q25FCkx6/PUWxR9ImTBgVgAd5dorLXR5yzR77dfnNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee1MqRWjf35Tdt4FcBGcIyTq1R8yLcZjO4moy45JlR1NVhXjmT4ImkG4HIUnFYhHOdyDrLjGqCariOTYo6pM2TGDUqx3ldE8rCsQSK3tNvpgDNUrXKfOmoVI2GKlxODWlcRD+Exv8y8Tc+y5L6cPKwIYvnyZegeESFcJYW2/c/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cuSxQGjE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f8f30712d3so364304b3a.0
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716963573; x=1717568373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fK2YCNC3izJsF1MvF0HgktiFwQJjQP30j11830xzgU=;
        b=cuSxQGjEsgVPNxqgS4cZLpwLiwxNiFD9UYP7y05tCuqs+esWy8jnxwFikSiHskG9Nd
         ePRl8hUylWIcZR5BqQfTw3hxOLd+aqga4PIPbzi4GCvP70cnRRLaDVLm1KI2PGO2xc5K
         nWk5ndjndPEZtzbg6FvZPGMRGfWz9vtE2dDV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716963573; x=1717568373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fK2YCNC3izJsF1MvF0HgktiFwQJjQP30j11830xzgU=;
        b=MoeCLrMo3fjmJ8YGbdRVGKax6UDpihZRbncCFY7Y6uEV9rKc93R02OzNnmFqJroRy9
         ZB1Di5DbgzrPwMw8VNHTk+W/mJRZweqJLxqcsDxvOnfqfEEmAtxz7GF32pN8xIe/J8Tn
         R+wg/40bA9WRpbcy6RI+6Ka/BDeA1rHPhlFN0ppX6XniDPs8akq5SjDowQWjO8okKZns
         Ggjch5Lz65TbLIaG4sJgv8kkTzIBZBZ0YZBk5atjxVVO6TJeyHUrsvZ/QIjsS/pE1WBo
         c4VvJt/VZiaByKdVFeJlLnwEK10AiLHDb9APjLPRkIjHDSW39PdZhjOx7rZO24NEN5cu
         Oqkg==
X-Forwarded-Encrypted: i=1; AJvYcCURS+w2hPDtcnQgsGqoHvqXwssYGsBx9dDmPVWJJuFsCgJi3TXXwiu/ayHCLYZeQ5TKksuV0IMgGKBKARHyhB994sw2u5mGlepGSr0=
X-Gm-Message-State: AOJu0Yy8dbL68aTZUDxdZ42W2Iy9CZ0Znaj6abx6+dkxuniIvg2TxgZn
	QxgS/mR042QByf2nG1R3wd3N1QENetLnxZhQrBuhNQdXPu5Rsy4rTCzvaL7tgx+SsUweWUIHhd1
	fXQ==
X-Google-Smtp-Source: AGHT+IGlXLWtYJNm3H9465KCBVlMdIcqjch8xwgpSxyj1UHj01g5OqyxZNsYmor5W4uvwDvNi/R01g==
X-Received: by 2002:a05:6a00:2d1a:b0:701:98c4:48a9 with SMTP id d2e1a72fcca58-702029f430dmr2204645b3a.5.1716963573249;
        Tue, 28 May 2024 23:19:33 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-68221891986sm8415793a12.22.2024.05.28.23.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:19:32 -0700 (PDT)
Date: Wed, 29 May 2024 15:19:30 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 2/6] media: uvcvideo: Ignore empty TS packets
Message-ID: <fikctxwprluipwcf2ijewvyosyzzbu5n5pw2wjq6rfacwbwzkt@pi72dfa3v6zj>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-2-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-2-b08e590d97c7@chromium.org>

On Sat, Mar 23, 2024 at 10:48:03AM +0000, Ricardo Ribalda wrote:
> Some SunplusIT cameras took a borderline interpretation of the UVC 1.5
> standard, and fill the PTS and SCR fields with invalid data if the
> package does not contain data.
> 
> "STC must be captured when the first video data of a video frame is put
> on the USB bus."
> 
> Some SunplusIT devices send, e.g.,
> 
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a
> 
> While the UVC specification meant that the first two packets shouldn't
> have had the SCR bit set in the header.
> 
> This borderline/buggy interpretation has been implemented in a variety
> of devices, from directly SunplusIT and from other OEMs that rebrand
> SunplusIT products. So quirking based on VID:PID will be problematic.
> 
> All the affected modules have the following extension unit:
> VideoControl Interface Descriptor:
>   guidExtensionCode         {82066163-7050-ab49-b8cc-b3855e8d221d}
> 
> But the vendor plans to use that GUID in the future and fix the bug,
> this means that we should use heuristic to figure out the broken
> packets.
> 
> This patch takes care of this.
> 
> lsusb of one of the affected cameras:
> 
> Bus 001 Device 003: ID 1bcf:2a01 Sunplus Innovation Technology Inc.
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 ?
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1bcf Sunplus Innovation Technology Inc.
>   idProduct          0x2a01
>   bcdDevice            0.02
>   iManufacturer           1 SunplusIT Inc
>   iProduct                2 HanChen Wise Camera
>   iSerial                 3 01.00.00
>   bNumConfigurations      1
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 659c9e9880a99..b2e70fcf4eb4c 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -478,6 +478,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	ktime_t time;
>  	u16 host_sof;
>  	u16 dev_sof;
> +	u32 dev_stc;
>  
>  	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
>  	case UVC_STREAM_PTS | UVC_STREAM_SCR:
> @@ -526,6 +527,34 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (dev_sof == stream->clock.last_sof)
>  		return;
>  
> +	dev_stc = get_unaligned_le32(&data[header_size - 6]);
> +
> +	/*
> +	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
> +	 * standard states that it "must be captured when the first video data
> +	 * of a video frame is put on the USB bus". This is generally understood
> +	 * as requiring devices to clear the payload header's SCR bit before
> +	 * the first packet containing video data.
> +	 *
> +	 * Most vendors follow that interpretation, but some (namely SunplusIT
> +	 * on some devices) always set the `UVC_STREAM_SCR` bit, fill the SCR
> +	 * field with 0's,and expect that the driver only processes the SCR if
> +	 * there is data in the packet.
> +	 *
> +	 * Ignore all the hardware timestamp information if we haven't received
> +	 * any data for this frame yet, the packet contains no data, and both
> +	 * STC and SOF are zero. This heuristics should be safe on compliant
> +	 * devices. This should be safe with compliant devices, as in the very
> +	 * unlikely case where a UVC 1.1 device would send timing information
> +	 * only before the first packet containing data, and both STC and SOF
> +	 * happen to be zero for a particular frame, we would only miss one
> +	 * clock sample from many and the clock recovery algorithm wouldn't
> +	 * suffer from this condition.
> +	 */
> +	if (buf && buf->bytesused == 0 && len == header_size &&
> +	    dev_stc == 0 && dev_sof == 0)
> +		return;
> +
>  	stream->clock.last_sof = dev_sof;
>  
>  	host_sof = usb_get_current_frame_number(stream->dev->udev);
> @@ -564,7 +593,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	spin_lock_irqsave(&stream->clock.lock, flags);
>  
>  	sample = &stream->clock.samples[stream->clock.head];
> -	sample->dev_stc = get_unaligned_le32(&data[header_size - 6]);
> +	sample->dev_stc = dev_stc;
>  	sample->dev_sof = dev_sof;
>  	sample->host_sof = host_sof;
>  	sample->host_time = time;
> 
> -- 
> 2.44.0.396.g6e790dbe36-goog
> 
> 

