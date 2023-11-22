Return-Path: <linux-media+bounces-733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 855447F3F66
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EFC1282200
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEC620B22;
	Wed, 22 Nov 2023 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R9zSnFGK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52649F9
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 00:01:37 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6cbc8199a2aso805434b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 00:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700640097; x=1701244897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMmjhnu0PvfBZhQhustU0DH60MxPgIkfUurMB4lRK1U=;
        b=R9zSnFGKEZ5FPcLqarhekvkDlcMotsnh9Bv36hA5B0s8COuClFyhr4P5aC9lM6ftTj
         ks+WdrB06oV0PsSEHXUQ3eu0HsTxygpHA11tCXeHOdjSFRmIoHE4oED9Wx+fXj9Lklgk
         9ice6PrrNTy2bvUjM0T1Ivomxpv6JHBNUqL5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700640097; x=1701244897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMmjhnu0PvfBZhQhustU0DH60MxPgIkfUurMB4lRK1U=;
        b=nAVHTAt/i2iv7YSAjq2JsCBjM7ONYC1NnRT5RyJXMrYq/TkgdOzcW9DJB5C+vrYkwd
         +7HwEsz8qrY2kwiI8Kenbe3Q+ZRqRodJce0lmPZS8zRB/DPy6B+F2XOdve4U8Q2ahdeC
         1Bjj7s324YNzMlLhMJe4y1q+9ThIP0Dzv1QOwCtlSa+RHaN2FQiLTXM8/noPol49N1in
         DfbXiFJZg2LlFNvdC1lWhH6PxpdyiqcuWwdryPmpbQ7cmWsU/0PRqYbYZKKrTVUgbDy6
         jN2FPd4lVLTJ4/Dj6oH/X/66hNd0UzsgXGLzbWIPpuQudj/FiFoVcEtNkAWF2Ddx9KB/
         bz+A==
X-Gm-Message-State: AOJu0Yx/L+xFOhYYTfFlp/KjElyIqUk50RHzwTSei7oiKvA7Am2sn+Eb
	TV2C6B3jFkvom0SDkkQG64qSf8J7lvpsfVZI558=
X-Google-Smtp-Source: AGHT+IHN/u7HmN+bTOEsR0eDkQ7DJteSflN8Sc29ZQN2H1z6RusngfhDIKmoCGd6Y4A8KibwRamZIA==
X-Received: by 2002:a05:6a00:1c9c:b0:6cb:a60c:2143 with SMTP id y28-20020a056a001c9c00b006cba60c2143mr1807945pfw.9.1700640096790;
        Wed, 22 Nov 2023 00:01:36 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:1aba:fb75:807e:7620])
        by smtp.gmail.com with ESMTPSA id v1-20020aa78081000000b0065a1b05193asm9219898pff.185.2023.11.22.00.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 00:01:36 -0800 (PST)
Date: Wed, 22 Nov 2023 17:01:32 +0900
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Do not halt the device after
 disconnect
Message-ID: <20231122080132.GA1526356@google.com>
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org>
 <20231122074742.GB1465745@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122074742.GB1465745@google.com>

On (23/11/22 16:47), Sergey Senozhatsky wrote:
> Can the following happen?

Consider the following case (when CPU1 experienced a delay, a preemption
or anything):

> CPU0                                            CPU1
>  uvc_disconnect()
> 						uvc_video_stop_streaming()
>  usb_set_intfdata()
>  uvc_unregister_video()
> 
> 						if (!smp_load(&dev->disconnected))
> 
>  smp_store_release(&dev->disconnected, true);
> 
>  kref_put(&dev->ref, uvc_delete);

> 							uvc_video_halt()

That uvc_video_halt() cannot be legal, right?

