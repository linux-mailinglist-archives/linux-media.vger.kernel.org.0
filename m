Return-Path: <linux-media+bounces-717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 600C67F3ECF
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0187DB21118
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 07:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A9F1E52C;
	Wed, 22 Nov 2023 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OTXSxcB/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEE5D50
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:21:14 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso6501884b3a.1
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700637673; x=1701242473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btzJxuP/9DloLjZH5Va9+pYoBGlTVhIo1JatCNov9xI=;
        b=OTXSxcB/hdCPN9wWpvhc1t9YyOZCEl8YYTNquxBsentcZgQTu8CODH6gO7ctNQfpYr
         8E5wjKhJvFsPPSUWpKXHMvNH+Bf3CXUUG5Uz3M8EHnaYqnnZa7FDiFPU888bIo9VR67n
         4GC7la2XlPg1inBa6FT+aS4OuyCaSx0+vFG1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700637673; x=1701242473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btzJxuP/9DloLjZH5Va9+pYoBGlTVhIo1JatCNov9xI=;
        b=vE/H/S5N+nipYcT2cQJq74p6CWTWmZszNM/9k4uLPB89UP5a2DkM9IU925XCYe8un+
         y6xmeZcOiX183Q9Sm0T/2Ya547fiB+o4H4oqFOpc4ant+kbxgyMl8LiAClhfpcy4y9LZ
         prqxpgOp3bSfgibPqdu8p06hahqs8znkqtwXYDb2TaeUEEhXL+hR++gE7pw10QTYCbx0
         RybFLDZjwMHDSmap93vcbQwvWDviPWQ8KQ5eSScWtkxzpYjR6GVNy5SPa/LYnkBzjIFZ
         RTySWhdgXgHXWWTGB4UlaUDPatI73MCH+JRa8kXhHL63Wbk7duG75pRJHsgLlYr5+yav
         /Obw==
X-Gm-Message-State: AOJu0Yz+CoDzFQE71oor9c4TwQLtqwjjHUBiDtcnhE2ciRH3DKoUTOjg
	iyljTSrqK39awE4RGmHYyJxFFA==
X-Google-Smtp-Source: AGHT+IG/SnMh/5aBN5j16Wk503icTKW0NfJndoV03B0S/arEvoFTCyFqbThSvKq/emWxyGb5baAOFw==
X-Received: by 2002:a05:6a21:3288:b0:186:736f:7798 with SMTP id yt8-20020a056a21328800b00186736f7798mr1645887pzb.11.1700637673410;
        Tue, 21 Nov 2023 23:21:13 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:1aba:fb75:807e:7620])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902860400b001c74df14e6fsm9024022plo.284.2023.11.21.23.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 23:21:13 -0800 (PST)
Date: Wed, 22 Nov 2023 16:21:08 +0900
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
Subject: Re: [PATCH v3 1/3] media: uvcvideo: Always use uvc_status_stop()
Message-ID: <20231122072108.GA1465745@google.com>
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-1-d8a5eae2312b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121-guenter-mini-v3-1-d8a5eae2312b@chromium.org>

On (23/11/21 19:53), Ricardo Ribalda wrote:
> uvc_status_stop() handles properly the race conditions with the
> asynchronous worker.
> Let's use uvc_status_stop() for all the code paths that require stopping
> it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 4 ----
>  drivers/media/usb/uvc/uvc_status.c | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c2761..8e22a07e3e7b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2765,10 +2765,6 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
>  	struct uvc_entity *entity;
>  	unsigned int i;
>  
> -	/* Can be uninitialized if we are aborting on probe error. */
> -	if (dev->async_ctrl.work.func)
> -		cancel_work_sync(&dev->async_ctrl.work);
> -
>  	/* Free controls and control mappings for all entities. */
>  	list_for_each_entry(entity, &dev->entities, list) {
>  		for (i = 0; i < entity->ncontrols; ++i) {
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index a78a88c710e2..0208612a9f12 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -292,7 +292,7 @@ int uvc_status_init(struct uvc_device *dev)
>  
>  void uvc_status_unregister(struct uvc_device *dev)
>  {
> -	usb_kill_urb(dev->int_urb);
> +	uvc_status_stop(dev);

Sort of feels like this needs dev->lock somewhere here. Should we move 3/3
to the head of the series?

The question is, can this be called in parallel with uvc_v4l2_release(),
for instance?

>  	uvc_input_unregister(dev);
>  }

