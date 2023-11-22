Return-Path: <linux-media+bounces-769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862387F42F4
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5CE8B20D28
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D66721352;
	Wed, 22 Nov 2023 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C93DymPH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3744010F9
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:55:30 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5cbbe2cba33so14199537b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700646928; x=1701251728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R43NIo2R73VFGzF1JM47RjgeeYfm8PK9++R7O6siHDc=;
        b=C93DymPHwAeqrJ61DqxMBceoZr5Dleo4gbsUe9uqNfgEncXtZ3nH0YmQ0nb4pVJYQc
         wB1/Lb5ulr7noGMjYgC6+/e0/8IkOGI6Bk4aP5Va3en/kPGCaiWia4Ss11UgypNnyaqN
         FyBeuTQMp5xIrv+86vzggkLPvLWZ9m+sJoZoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646928; x=1701251728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R43NIo2R73VFGzF1JM47RjgeeYfm8PK9++R7O6siHDc=;
        b=iUwWXa93I04Tpe7zVlUSivpAt7ZCxA4JskbqhfYOmajnggGpjaEugNghNgmR+B5R3/
         Xa0eLE4LT3RxpAjsWtpgKEJDt7z6yK2lPI06Pk9VdMenQs5iwqTXc64hFhtJrAmL8UnI
         gBvc9wPiZKwEtaHyT1a2920B4bZmCflzhNM0Y9eaj4Xyb0Gkqa5tQIrvLUbh1mcWsX9c
         NwZBYRvlcnO6HTWln+rj536BSB6nF8J80YyuXW3W6IY2Lo85rgOqYQbu7EWItT2w2Dan
         VqH+1Giw4FINzszpn5zvz9lKpn8TsCBvmEQ510q4zkLO3MxzX+PtEOhj9lwxsQK+4sFS
         KMLA==
X-Gm-Message-State: AOJu0Yy9goO3+rAqUJHNOwQLQtyIbF2SahT0vE5WTBvx9ej4wEyWzN5C
	E5VspKWX5ra50/tBfWrwrC6EKikf8VJRhPlfn6HWwg==
X-Google-Smtp-Source: AGHT+IGcvfZgVgCvBJvWAWus6NY/kiiqBvI05+KMcYf5yy8j963Lwsx14ykezjC8W2FxFYqK37So2w==
X-Received: by 2002:a0d:cc49:0:b0:5ca:8979:e65d with SMTP id o70-20020a0dcc49000000b005ca8979e65dmr1676595ywd.1.1700646928364;
        Wed, 22 Nov 2023 01:55:28 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id ne7-20020a056214424700b00679f2d55852sm781620qvb.3.2023.11.22.01.55.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 01:55:28 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-66d0c777bf0so25832066d6.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:55:28 -0800 (PST)
X-Received: by 2002:a05:6214:27c9:b0:679:e48e:1ec1 with SMTP id
 ge9-20020a05621427c900b00679e48e1ec1mr1682833qvb.38.1700646927641; Wed, 22
 Nov 2023 01:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org> <20231122074742.GB1465745@google.com>
 <20231122080132.GA1526356@google.com>
In-Reply-To: <20231122080132.GA1526356@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 10:55:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCuT6uK+qGJJus=s2DjsnvqxKg4ek9xbssOw5bpmQm_e-A@mail.gmail.com>
Message-ID: <CANiDSCuT6uK+qGJJus=s2DjsnvqxKg4ek9xbssOw5bpmQm_e-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Do not halt the device after disconnect
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sergey

On Wed, 22 Nov 2023 at 09:01, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (23/11/22 16:47), Sergey Senozhatsky wrote:
> > Can the following happen?
>
> Consider the following case (when CPU1 experienced a delay, a preemption
> or anything):
>
> > CPU0                                            CPU1
> >  uvc_disconnect()
> >                                               uvc_video_stop_streaming()
> >  usb_set_intfdata()
> >  uvc_unregister_video()
> >
> >                                               if (!smp_load(&dev->disconnected))
> >
> >  smp_store_release(&dev->disconnected, true);
> >
> >  kref_put(&dev->ref, uvc_delete);
>
> >                                                       uvc_video_halt()
>
> That uvc_video_halt() cannot be legal, right?

This patch only takes care of calls to uvc_video_stop_streaming()
after .disconnect.

Guenter's patch from this series should take care of the concurrent
calls. I will resend making it explicit.

Thanks!


-- 
Ricardo Ribalda

