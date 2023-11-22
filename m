Return-Path: <linux-media+bounces-751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B687F4004
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00EBB20E9A
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9882C21105;
	Wed, 22 Nov 2023 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m5i+UpSr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B145B9
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 00:23:03 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5845213c583so3505803eaf.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 00:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700641382; x=1701246182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1tLro5qVWpp7kyrB0acm9exDu7RQojZgmOKkDhEynw=;
        b=m5i+UpSrxa9CwjPpDyMIRs//Fc3+trBYFfVkj3BNE8HAlfNmm5wDTaPmqU4MVmdR6+
         Z4s7gIPgSknW7uytsGQ4ztSac/YoQ6XFVDyggC/w73N/LNkD2AnVVYzpdRdygZEpZBC1
         yor5YiDBdKgt/OY2hLBB6FOcSXHhUe7k9x3kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641382; x=1701246182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1tLro5qVWpp7kyrB0acm9exDu7RQojZgmOKkDhEynw=;
        b=NodrqpxSOQSAappLrTUHbFfyHwhS0mK/O7BdGvjATcnmoSRPqUuRjQKw/uY1rcSJwo
         9iS+NTuLOtoCHB/aQgFZKPYNkjGvk5DOpmBdiXFSHSKZvYoKICduZzuM/P0Qi87iAwdj
         Iy4/FiBTTp/uX+XV7+siAzMYb0aMofvDXdgWHjXIAo5qQ4sJF2PhUnOX0yl00k9ZpLlj
         AuskLEmNj44uzQkQeT8vwsPQPKa0Y36RF031YLOLRppBdOGhDBqxhwEkqNmnuZAFbFuZ
         3rX3m/jJpxvHE3XMaGEvcgN2/7rE4B29U7dE8RqFhJvN6wARc0ulJq7WyWNPSFsxU4A+
         IqWQ==
X-Gm-Message-State: AOJu0Yyo0GsHmICHpUcoRpJXxKtgmVqlQFauu3llObzJPlHlA6rCtWX1
	NrkSLZCsQnhuXW5dlTX+48UZsA==
X-Google-Smtp-Source: AGHT+IHthHR4uSwyBMbf5L0LPuBScubFWeTz3LWQhscIQ7SlJqGt1wJujwql08okmUIRt1e/T+Tjnw==
X-Received: by 2002:a05:6358:5e0f:b0:16d:aead:f750 with SMTP id q15-20020a0563585e0f00b0016daeadf750mr1978924rwn.7.1700641382487;
        Wed, 22 Nov 2023 00:23:02 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:1aba:fb75:807e:7620])
        by smtp.gmail.com with ESMTPSA id j26-20020a63551a000000b005b529d633b7sm8989061pgb.14.2023.11.22.00.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 00:23:02 -0800 (PST)
Date: Wed, 22 Nov 2023 17:22:57 +0900
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
Subject: Re: [PATCH v3 3/3] media: uvcvideo: Lock video streams and queues
 while unregistering
Message-ID: <20231122082257.GB1526356@google.com>
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-3-d8a5eae2312b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121-guenter-mini-v3-3-d8a5eae2312b@chromium.org>

On (23/11/21 19:53), Ricardo Ribalda wrote:
> The call to uvc_disconnect() is not protected by any mutex.
> This means it can and will be called while other accesses to the video
> device are in progress. This can cause all kinds of race conditions,
> including crashes such as the following.
> 
[..]
> 
> Call Trace:
>  usb_hcd_alloc_bandwidth+0x1ee/0x30f
>  usb_set_interface+0x1a3/0x2b7
>  uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
>  uvc_video_start_streaming+0x91/0xdd [uvcvideo]
>  uvc_start_streaming+0x28/0x5d [uvcvideo]
>  vb2_start_streaming+0x61/0x143 [videobuf2_common]
>  vb2_core_streamon+0xf7/0x10f [videobuf2_common]
>  uvc_queue_streamon+0x2e/0x41 [uvcvideo]
>  uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
>  __video_do_ioctl+0x33d/0x42a
>  video_usercopy+0x34e/0x5ff
>  ? video_ioctl2+0x16/0x16
>  v4l2_ioctl+0x46/0x53
>  do_vfs_ioctl+0x50a/0x76f
>  ksys_ioctl+0x58/0x83
>  __x64_sys_ioctl+0x1a/0x1e
>  do_syscall_64+0x54/0xde
> 
> usb_set_interface() should not be called after the USB device has been
> unregistered. However, in the above case the disconnect happened after
> v4l2_ioctl() was called, but before the call to usb_ifnum_to_if().
> 
> Acquire various mutexes in uvc_unregister_video() to fix the majority
> (maybe all) of the observed race conditions.
> 
> The uvc_device lock prevents races against suspend and resume calls
> and the poll function.
> 
> The uvc_streaming lock prevents races against stream related functions;
> for the most part, those are ioctls. This lock also requires other
> functions using this lock to check if a video device is still registered
> after acquiring it. For example, it was observed that the video device
> was already unregistered by the time the stream lock was acquired in
> uvc_ioctl_streamon().
> 
> The uvc_queue lock prevents races against queue functions, Most of
> those are already protected by the uvc_streaming lock, but some
> are called directly. This is done as added protection; an actual race
> was not (yet) observed.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

