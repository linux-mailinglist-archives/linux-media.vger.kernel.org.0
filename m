Return-Path: <linux-media+bounces-727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B382B7F3F2C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5F71C20C23
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 07:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67192208DA;
	Wed, 22 Nov 2023 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ed7MWDsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5DB10E
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:47:47 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ce3084c2d1so54360975ad.3
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700639267; x=1701244067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xSslZ87O8gm8ECVDRusqRDaovztLCrl5qgvaEZ6Clyk=;
        b=Ed7MWDsQfSXqjYq5NpP/K7pu9Y1cUr5rQnHFL78z7M7vWfV6mGv48UR20/9exZSpAc
         OxeyeNbWLiYl5StAUBDVyThQr67AwyDs71xHxtAaWa0SxQqIkDrLFvBh3M0UAw2+zgpT
         NkBbNA1+b3RB+NYEV71fmGdVwdbGnHqemZ0Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700639267; x=1701244067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSslZ87O8gm8ECVDRusqRDaovztLCrl5qgvaEZ6Clyk=;
        b=BHYfiLsSEFvgXriYyn7X/Atx6zzY4VkhBwrJst1dT8KcPiH6PuvxdbPEFP0QRjuJvi
         +POfPEuiBmAKSSn4g3417b9t/aT1Ao+FYuQjIEIwHfzhzvt/uj9UsQ/O8FFphiSy7NUS
         avwwF71mFUiLFsG/rJ2jy5H8wtA2pV2xGvP6jyP6ZwqeDSrjLyaJdkh/tA3ynFn1Jjcz
         TTvWSJ3VoMk04HNmpUbwx7LT9+g4iiCS1boXA8TtfaZEkASFHvmZTOo9NFdjYrDj048D
         bUw2gHqf7+zEHjZp2aBSWG4IJpvMrS1XgH6UkJ0KcsWl+KNhqkkEMMdY8tJrh+uB7mE5
         rRrQ==
X-Gm-Message-State: AOJu0YziOPAhviqDtLkkx+cdS2Dclt3GycNpPtBB1FNo/htmSKJf/NR8
	TFYITfodb8qQIGdhqICRgu+nlw==
X-Google-Smtp-Source: AGHT+IECNClYO1LaWKWeX1noutwtFiNs4YaYyUIMp8wEuuTx1lDdfzGhFQs83fwaV5XDfo1fwtqQlQ==
X-Received: by 2002:a17:902:b687:b0:1cf:6d46:9f2f with SMTP id c7-20020a170902b68700b001cf6d469f2fmr1501436pls.48.1700639267184;
        Tue, 21 Nov 2023 23:47:47 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:1aba:fb75:807e:7620])
        by smtp.gmail.com with ESMTPSA id jd22-20020a170903261600b001ce160421aesm9182064plb.200.2023.11.21.23.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 23:47:46 -0800 (PST)
Date: Wed, 22 Nov 2023 16:47:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Do not halt the device after
 disconnect
Message-ID: <20231122074742.GB1465745@google.com>
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org>

On (23/11/21 19:53), Ricardo Ribalda wrote:
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 08fcd2ffa727..413c32867617 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2257,6 +2257,8 @@ static void uvc_disconnect(struct usb_interface *intf)
>  		return;
>  
>  	uvc_unregister_video(dev);
> +	/* Barrier needed to synchronize with uvc_video_stop_streaming(). */
> +	smp_store_release(&dev->disconnected, true);
>  	kref_put(&dev->ref, uvc_delete);
>  }

[..]

> +void uvc_video_stop_streaming(struct uvc_streaming *stream)
> +{
> +	uvc_video_stop_transfer(stream, 1);
> +
> +	/*
> +	 * Barrier needed to synchronize with uvc_disconnect().
> +	 * We cannot call usb_* functions on a disconnected USB device.
> +	 */
> +	if (!smp_load_acquire(&stream->dev->disconnected))
> +		uvc_video_halt(stream);
> +
>  	uvc_video_clock_cleanup(stream);
>  }

Can the following happen?

CPU0                                            CPU1
 uvc_disconnect()
						uvc_video_stop_streaming()
 usb_set_intfdata()
 uvc_unregister_video()

						if (!smp_load(&dev->disconnected))
							uvc_video_halt()

 smp_store_release(&dev->disconnected, true);

 kref_put(&dev->ref, uvc_delete);

