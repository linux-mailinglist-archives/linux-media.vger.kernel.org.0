Return-Path: <linux-media+bounces-33231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77D3AC1DDC
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 09:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D432A24DB4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 07:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7B3227EA0;
	Fri, 23 May 2025 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IoVrpkCx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E92080C8
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986296; cv=none; b=qIXf9o6ANVVdqoHg9UMg5xab+sB8naGkqvA0NFc04aDW/JLHkj2wn6flB+N7CVMVjXlbXT8HQMzIvNjwjSgdIegf4/CDCJDNA53zG6vWpfVsLqKDOT/gJHgN+kv6GZ/9cXgUWd7vqLn6zL1iuu2nwBEs8F2MiKvylIHSVMt0iJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986296; c=relaxed/simple;
	bh=iEq39/wjtR3s0C+z3oPs0UaJ/LJdHtfnxUOR4aef97I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9WKVZGIx9k58JQzotmGcgd2GWelYuy1CvFC0Y7o2GS2T0cdbv3eQc2w6GpwrkW/9DnNIKERp2aiJu+OQmQJIR1QrPZ7JFFVuxK2qtKhs8j5Exp7ywG2/AkV7p3IFptbhvRXXFbCLwDr+BeUn4uesShfUJD/mIsqs5kp66m1+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IoVrpkCx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551f00720deso5500660e87.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747986293; x=1748591093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iuc9W+ryC1YyeQDNKOCf6Uzg63zQlxEysMeSbkSkY1w=;
        b=IoVrpkCx9Na6WdVnBBrRQSYBKUFHYDbIi/2L56wRvl5w+E3rWm0Y5gGp/ygOmSMNKd
         qrFYoSzO4Mxrm0tO6e/rv811ohU5Y00NoclWrie4jMsK9PXJpk0ZIRirrF7QShTavtxk
         vj9yfW6HGRS4uk75Ck1GugTFjREvMSCjxKYZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986293; x=1748591093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iuc9W+ryC1YyeQDNKOCf6Uzg63zQlxEysMeSbkSkY1w=;
        b=Xy6UcNrejQDmynPFddaGp5TPmNhCPoWvK+1/+I9QELBx0D1v7Wc+eZ/rW28L6nhwBm
         lMPSnKwP1aKmLWAH8BisZ6Ajv/PMegtBQL9OJlsKvTKAa1NzKoGqI1QoKbfi14WWylS+
         Wi0Ob6N+u69FzSpuFrAR5Mzd3KWq+C1f2+kV8glmIr/WvrpOp4lGvh3D+m+aXt/Ex7Io
         HSCQHFJfw65ODioj1OzTu6kO1iKRqRYO/0MSelCklYia2AzGHZV46pyZWS/l+WP1cjLY
         cyedui7xQQd2CIPpXNI/t4K7xTHfAmdzj7+R5vck5V9AiC5kzvL5aQ4MI6N7+3uNFH7X
         JqcA==
X-Forwarded-Encrypted: i=1; AJvYcCUEoS2qbZyzDBNFbMYXdt7uhiw1rXHsGJuDg8cK7pb2GiMO9dpjzR1oSjcwb1QDmKgFPCbLAYA7aTXyng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl23W3203czd9WXKOY8c2fTP/O6Egi7dQwEKFjtMyimpD2LhDd
	1q3KFO5OYhzPxjuhfhMTkddF7wgQkB7IanO6VrHA56i4RAjR7iOinOGTKJPiFdet5PS/PJ1Ar9s
	pYOc9nw==
X-Gm-Gg: ASbGncs2LeKUh8X1zXMP+xpaSO432M2SQ6nsjUQT5UaO2++Lv0LBEkh1//CxDA4simW
	LhTqb4K4uB1TJW4ZuJbiQAgX1xsrdZZji8GDrpy24ROz3FUNfM1zFxsKK1/U5/ZgXl8gogSgW66
	pQq5Zx3b2kS9rKhkraWpnV0IW/Zem1si7ILOpBlcHQBOSUqmulZu13qXSom3+a86n6tBhOlHDkV
	AhsaZhCY5JaO1C+bfbMTBs4a3cW9inEA1qLYpICcKh9m8+91FBhnbefMH/CFfZh7I9uK45C4Ibw
	qnZB3yB3yqDYX1aNyI5ZC9a34ck21crDanPblXepGL5IQ6b0ugb4CqRd+7IcmEdIlknVMNd7TxW
	kIsbM8FPPwENI0itT/g==
X-Google-Smtp-Source: AGHT+IFe1XUSUxZNfaQfVavRTV9dEYOT5Qz5JjaB45ozipzg/D4kcd6dTXpQDskUn9HqcuQN1V3c3g==
X-Received: by 2002:a05:651c:146b:b0:310:856b:6875 with SMTP id 38308e7fff4ca-328096d3b9bmr93643641fa.14.1747986293109;
        Fri, 23 May 2025 00:44:53 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c91sm36229641fa.25.2025.05.23.00.44.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 00:44:51 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso73867291fa.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 00:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDu97dae9Fzd9q8ScRyndHKXWURa3Av6PztJu6C1c1VA+ACXqk3EP8erZDHx4qaNjCI8G7AHDP1sSQcA==@vger.kernel.org
X-Received: by 2002:a05:651c:31cf:b0:30b:ba06:b6f9 with SMTP id
 38308e7fff4ca-3280978063fmr81120791fa.26.1747986291131; Fri, 23 May 2025
 00:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
 <20250522-uvc-fop-v1-1-3bfe7a00f31d@chromium.org> <20250522214002.GY12514@pendragon.ideasonboard.com>
In-Reply-To: <20250522214002.GY12514@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 09:44:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCvesD5QzVuAAG6ofZ3NT0z9yVkycS3VSnxeGTqK4UP18Q@mail.gmail.com>
X-Gm-Features: AX0GCFvNrvNAQBnuQSv3by2k1BtXIm9DTlqmbPAmI-OeK7Jiu_yB7sYrt-v0HME
Message-ID: <CANiDSCvesD5QzVuAAG6ofZ3NT0z9yVkycS3VSnxeGTqK4UP18Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Refactor uvc_queue_streamon
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

Thanks for your review

On Thu, 22 May 2025 at 23:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, May 22, 2025 at 05:58:46PM +0000, Ricardo Ribalda wrote:
> > Do uvc_pm_get before we call uvc_queue_streamon. Although the current
> > code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
> > this change makes the code more resiliant to future changes.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Unless you say otherwise I will copy this Review-by to the original
series where this patch belongs to.
https://patchwork.linuxtv.org/project/linux-media/list/?series=15227

Thanks!


>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >       if (handle->is_streaming)
> >               return 0;
> >
> > -     ret = uvc_queue_streamon(&stream->queue, type);
> > +     ret = uvc_pm_get(stream->dev);
> >       if (ret)
> >               return ret;
> >
> > -     ret = uvc_pm_get(stream->dev);
> > +     ret = uvc_queue_streamon(&stream->queue, type);
> >       if (ret) {
> > -             uvc_queue_streamoff(&stream->queue, type);
> > +             uvc_pm_put(stream->dev);
> >               return ret;
> >       }
> > +
> >       handle->is_streaming = true;
> >
> >       return 0;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

