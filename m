Return-Path: <linux-media+bounces-32136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67639AB15EF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCBC3AAA39
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1B92918D2;
	Fri,  9 May 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m4Unt46N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC740855
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798723; cv=none; b=gkJJanwG99JBuKFdf+MBoYvK1ykIuRH58f3G+rg1hnSzU1tjjeCGsD5CzouJoc4OaUtFwSxei5z8b7Hyn8vJ4x7hjhdkYAexC1N1/RhX05JKZM0gEGKawxzis8vEQLiMGivKm12d0s5bnei3z2dmj4VHUf5Egh7y5lvdRJ/+554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798723; c=relaxed/simple;
	bh=xSi3SQWrLWCR+2uoRJltv4xcKkEVO8oIQbo95yWp1hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yz8z43NlHFI0aawaAgFRgiT9VxCL/QW5p3UpzWgfUz3d5fMaVWXomYXQs/i8CCFi/1mexPz8lW60ipoohNkf/iu6hOdZH2qkKTPItHKe0gA+9tvtWYkGlsEDK3yf1VPpH5DWh44EOFGRBu7llJEfyp/PLb62L19Dcvj9BqpKyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m4Unt46N; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso2685003e87.1
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746798720; x=1747403520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tVLjzfrQL3LKJR87gCuySpYYpzmYD7FiFUMoW7plIE4=;
        b=m4Unt46NFl7mXf8EoWzrObScJb7A5XVtKKj0mNNPjH/71+0ok1xNuAXqLUNRLP7nx+
         1oz4PXfJjasg9ccfKNClnqc/WLrH1m9eq7e0a3YVPz1cxlnhqmndKgg+lHqKfyComuso
         qpoVMdkZJv6ARNJI0LtDZXkqv87MVjTFyJF/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798720; x=1747403520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVLjzfrQL3LKJR87gCuySpYYpzmYD7FiFUMoW7plIE4=;
        b=D3lJ1NH/G1yGbZUpRJyEziTXi6KH2d4gwz7GjpeqV5hXQbztL3K5rSvZm1uz6rehkZ
         Co5odJItwd2IeyKJc3KkX1HAInnWTNaynbIDpgRQkbcymNbmMbqeQ/ksmerOYSm49BoG
         30PE5qgLif9j8rscXZqHOrc0GFZXa37spFAkHF9ZOE2Yhx7lbk8PjnaeSCj/tlkWAt34
         U4Hfjbz7LlDFO/Fvfrvm+tyEo64yxbEvwCbWFNEtv5cZI6FiNwHDBr7s19FyXp/LMHPr
         HI/FfgkHzxNJ/l8yHCvasF4wg8ltTkySziMCNG/gLgGZXmefaIr+xiaLPmHBQ1MyAbKj
         V39g==
X-Forwarded-Encrypted: i=1; AJvYcCV+bfZQwgV6bHLVRgpCvMgkkBu0+7/a35SrSqc8se58UarAasDb8OHYAY5umyE2RpIrQ8XnXAjnz6Lbcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2MB7pw8vNjZ7tCh2GS5yUUJIkXvQIXULHUN/Mi0lFbLK6sa7V
	yoWgNigeBb5hrzJqnnZhB8HfNmY5+Jt/PGfB8FjasdjLt+f98JFTvtRGx2+RAP7wSIIJOtJv4r0
	=
X-Gm-Gg: ASbGnct9vEXqals8frtp9QPs/XF1IyUhEkHeF+cVsJFZYvuPg8nbz9k1O4aczveoS3V
	ESb5k0ZWYyysuS7pWHW8rABsy7/vOjPhcGA3nByyO6q/Vq7tIF7FsDtm5TNnHUhnxBA5w8/cFWN
	mgWYabn9yicQKmdsbfJ8OK9vGwZFZsKU6qMtBV7Py1p9GaF1Ls8+tAcC3u3wR51xb9L6rtONmbf
	57ewc5ByNoU3SWQ/fyarvvo9vvKvlVSSUKNYpnZzi1LxWBUXsxGBEZEr4/RlJUpxnNfK4/BefAY
	fEfj2cAltPR4LWlr3QtjQHfih3g39NN4CrQ93kAsO7idJhkkoB+xKWPuwlQYR2ZD3GjVWtXu+Vu
	0xzhjhBdNGY/tRQ==
X-Google-Smtp-Source: AGHT+IFiBdAKUrCkCCAsW+Z8ZcwfBpY+mJmkYyo5/FsHdvZygV3nLEaT5wM28GrynucE1Ltd0jfRlA==
X-Received: by 2002:a05:6512:6810:b0:54f:c52e:5463 with SMTP id 2adb3069b0e04-54fc67cb3ccmr901178e87.27.1746798719656;
        Fri, 09 May 2025 06:51:59 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cf9csm282228e87.54.2025.05.09.06.51.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:51:59 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2716411e87.0
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 06:51:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPWGdSvRc+D1zdPgrkt8RdLnFIVXVJCgCV4+2qrumNGvjKQblheO0/Gwf8jCiv8JRXu41aS0JUUaxXSw==@vger.kernel.org
X-Received: by 2002:a2e:bc0e:0:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-326c4627e18mr14303681fa.25.1746798718846; Fri, 09 May 2025
 06:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-5-35a2357ff348@chromium.org> <64c00146-e6d2-448d-a416-19d5ae7ae3f6@jjverkuil.nl>
In-Reply-To: <64c00146-e6d2-448d-a416-19d5ae7ae3f6@jjverkuil.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 9 May 2025 15:51:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
X-Gm-Features: ATxdqUH8qd_0JqxrGXD24hL8xVd6IQNh0CjzpBXdZtauLNAQq8oQh8buUtDugGI
Message-ID: <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Do not turn on the camera for
 some ioctls
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Fri, 9 May 2025 at 15:44, Hans Verkuil <hans@jjverkuil.nl> wrote:
>
> On 27/03/2025 22:05, Ricardo Ribalda wrote:
> > There are some ioctls that do not need to turn on the camera. Do not
> > call uvc_pm_get in those cases.
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 0f1ed0387b2611c8d21e211afe21a35101071d93..668a4e9d772c6d91f045ca75e2744b3a6c69da6b 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1440,6 +1440,26 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >       struct uvc_fh *handle = file->private_data;
> >       int ret;
> >
> > +     /* The following IOCTLs do not need to turn on the camera. */
> > +     switch (cmd) {
> > +     case VIDIOC_CREATE_BUFS:
> > +     case VIDIOC_DQBUF:
> > +     case VIDIOC_ENUM_FMT:
> > +     case VIDIOC_ENUM_FRAMEINTERVALS:
> > +     case VIDIOC_ENUM_FRAMESIZES:
> > +     case VIDIOC_ENUMINPUT:
> > +     case VIDIOC_EXPBUF:
> > +     case VIDIOC_G_FMT:
> > +     case VIDIOC_G_PARM:
> > +     case VIDIOC_G_SELECTION:
> > +     case VIDIOC_QBUF:
> > +     case VIDIOC_QUERYCAP:
> > +     case VIDIOC_REQBUFS:
> > +     case VIDIOC_SUBSCRIBE_EVENT:
> > +     case VIDIOC_UNSUBSCRIBE_EVENT:
>
> Wouldn't it be better to check against the ioctls that DO need to turn on the camera?

I thought it was safer this way. I will look into inverting the logic
in a follow-up patch.

Regards!

>
> That is more future proof IMHO.
>
> If a new ioctl is created, and uvc implements it and that needs to turn on the camera,
> then presumably you will realize that when you add that ioctl in uvc.
>
> If a new ioctl is created and uvc does not need to turn on the camera, then you will
> almost certainly forget to add it to this list.
>
> I'm not blocking this patch, but I think it will be hard to keep this list up to date.
> Inverting the test is probably much easier to handle in the future.
>
> Apologies if this has been discussed before, if so, just point to that discussion so I
> can read through it.
>
> Regards,
>
>         Hans
>
> > +             return video_ioctl2(file, cmd, arg);
> > +     }
> > +
> >       ret = uvc_pm_get(handle->stream->dev);
> >       if (ret)
> >               return ret;
> >
>


-- 
Ricardo Ribalda

