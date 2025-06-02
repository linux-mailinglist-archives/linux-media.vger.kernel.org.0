Return-Path: <linux-media+bounces-33895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB97ACAD07
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE7B17D03F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E5620F062;
	Mon,  2 Jun 2025 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GLff3gk7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E878205AB9
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862704; cv=none; b=JSii0a6fO/5nuQp3RvAqXA6XT2+3yBphpYMlbvupZr8FtBYPgSKO6ZFawq18hJr7wfdGA3BO123ocf5bAXlWiYdaYhzg0OCxbZq0VTq3APw+IMRBpF9ay5NEirRF3M9JVU8Uoqd/nhQfyRLdmX56fsr1OdWforkyvpfZr8uznNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862704; c=relaxed/simple;
	bh=hNdnuh44B/F1hjK+F9l0HSaJdSwmz3eC9NCNEdhciPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+sAGhMVp64r0YF+aPOCgMzwgyB+B2Smz7UqSGOBgV3X5fdvDd1oRn9fKH2r8zlx6juCIxyJb0hwUsdCoaSevSgikF8tv3PO4t9r/ByJE7S652e4GnpAHG47zrSfjkcHYLPgI/Fjfn0j5kqvjfBdNoGYvdBmcHB5M7aNIvIVGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GLff3gk7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55220699ba8so5276454e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 04:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748862699; x=1749467499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IVIFALh9arlZ0GzLjKlBZ0OasfOj5lZdM76le7bw4Bc=;
        b=GLff3gk7b3xPBJWvNwUnoZWJ07L5KwdKH3p4mkkvty4wvvO4QZg2AJYyJlzKs7XGdc
         BsxGibY0UlSMpiTa8v515gaLPD2zoduP3usLzaD9uCuVj8cjCaQLJIxUkgf7+Chcm8Gb
         gTIlnN5eQFywK3Q5i/ARB3rtG/Njen5hCFZ4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862699; x=1749467499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVIFALh9arlZ0GzLjKlBZ0OasfOj5lZdM76le7bw4Bc=;
        b=fpuLq5Y7OjDFI/KgBKukMURfk0salChfPT5kL7mjB0ERP8dZwA2UQ/pg7VFpjf5njY
         bGtGtUFyDlwN7pC7m41olXzXf6nAC+LDD5a1CId8Ba/7BD+tHdL6+OfXREPdsnU5B4Ze
         6mpHLVcEaaKAagPH8rl/2lRUH/ftr0DV+VzaHdWuB5D+23IE7IWO/+Ue7sdWPf1V5uS1
         HWuT0VSLdud6wWAhyZOpu10dpirwP2qAjp8+zf02wGKtqNnPag2/vDsWSsMtzthwbb5j
         IkbAs5CiHKTo1KLE/Z/FTVvBhPT2bsFGLzFHBlO5aIguCE9pHrkG20favsrXEExptixL
         +CKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO1o15D9b8kQbYfgFFllJVs+R9dDc4/+4YjKqBqY9yDxaMVdhGAhivcA0YcIm7s3ZzqvYSxwVGsaT4oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUuQmo73j4fEhPzScC+y2WPFoQEJjOI1cP5+k8vtoZRug3d1P
	LqcYDRvtsCho7nigvLFvkv7OpXWsaXLokB1DD3Ghu33XI3nE0bgDVCQKoxgMN8D6/Az3QHXeeGL
	TZzI=
X-Gm-Gg: ASbGncspfRgK9m/zu6HuI5R2tyIxizA1QMpVTN87cRfz2f3pl0grf/qo7L5oPyNigLH
	kP15JUc/vWENBse6TsFucElqOVp5yQaR7osYeIycD5uBOn/5naATqnm012wg6Iuq1VO09TiolgV
	jHC6Lyesrgrta07OYB0JSRl+QUXHimG6c5AZjmCl5BbeST6ZsIUS3rE5NXGl5E5oYkQhnQNB5XP
	UYFr4R+TcC+QxKyBOrlIHDrdNDyllhC/KYiCm7jkt1+nnPh/GD5BZwvWBpRUvzo/3Rmr1aYROb+
	BiFlSLrkjj8SNoJPd+zwwmstQtTMYi0DUi5dW9iMrjPrtlgdfiADV8IkTAGYLm+TI3IZgxxOI5I
	l9pxxPxY+4K90AQ==
X-Google-Smtp-Source: AGHT+IEHN2R6Zx9mZOBOMJU7X45MQ0x0k/Lo59pS+5eOCQtfl/fyPthXR/8iWMOa7ooLlRVjlZ1IiQ==
X-Received: by 2002:a2e:bc29:0:b0:32a:651c:9af3 with SMTP id 38308e7fff4ca-32a90804ccdmr34451021fa.37.1748862699440;
        Mon, 02 Jun 2025 04:11:39 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b35d56sm14762461fa.41.2025.06.02.04.11.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:11:27 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553246e975fso5140316e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 04:11:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVARBnCKqS3IYsMvlXJ24+ab4acH+FK939Lh3l5zh4E0D8bjXisqTKda50uV/x/bozArWMzzvUz1Un5Ag==@vger.kernel.org
X-Received: by 2002:a05:6512:158e:b0:553:291f:92d with SMTP id
 2adb3069b0e04-5533d1b9382mr3248824e87.57.1748862686655; Mon, 02 Jun 2025
 04:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
 <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org> <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
 <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org>
In-Reply-To: <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 13:11:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCsXNu2xa_ATGUJbKY_t7xxXgSGdpZMf+P4LT+x3qcP1tg@mail.gmail.com>
X-Gm-Features: AX0GCFtWelR45Zu24ZuT095kB3Y-gdxCQlx3vPsZ1dozrH4C2vT7gf0b3-vwRzk
Message-ID: <CANiDSCsXNu2xa_ATGUJbKY_t7xxXgSGdpZMf+P4LT+x3qcP1tg@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 13:07, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 2-Jun-25 12:27, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 28-May-25 19:58, Ricardo Ribalda wrote:
> >>> Right now we cannot support granular power saving on compat syscalls
> >>> because the VIDIOC_*32 NRs defines are not accessible to drivers.
> >>>
> >>> Use the video_translate_cmd() helper to convert the compat syscall NRs
> >>> into syscall NRs.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
> >>>  include/media/v4l2-ioctl.h           | 1 +
> >>>  3 files changed, 5 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
> >>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
> >>>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >>>                                   unsigned int cmd, unsigned long arg)
> >>>  {
> >>> -     /*
> >>> -      * For now, we do not support granular power saving for compat
> >>> -      * syscalls.
> >>> -      */
> >>> -     if (in_compat_syscall())
> >>> -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
> >>> +     unsigned int converted_cmd = video_translate_cmd(cmd);
> >>
> >> It looks like something went wrong here and you did not test-compile this?
> >> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
> >> so this should not compile.
> >
> > Hmm... Actually I am pretty sure that I tested it on real hardware.
> >
> > Did you miss the EXPORT_SYMBOL() on the patch?
>
> Ah yes I did miss that, sorry.

My bad, I doubt it till the last second if I should split it or not :)

>
> For the next time please split core changes out into their own
> separate patches.
>
> In this case I think the core changes are not necessary instead
> you can just do:
>
>         unsigned int converted_cmd = cmd;
>
> #ifdef CONFIG_COMPAT
>         converted_cmd = v4l2_compat_translate_cmd(cmd);
> #endif

I believe this should work as well:

unsigned int converted_cmd = cmd;
if (in_compat_syscall())
  converted_cmd = v4l2_compat_translate_cmd(cmd);

the compiler knows that CONFIG_COMPAT=n means in_compat_syscall() will
be always fails.

If it is ok with you (and it actually works :) ) I will use this version.

Regards

>
> Regards,
>
> Hans
>
>
>
>
> >
> >>
> >> You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
> >> otherwise that symbol is not available.
> >
> > I tried now without CONFIG_COMPAT and it built fine.
> >
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>>
> >>>       /* The following IOCTLs do need to turn on the camera. */
> >>> -     switch (cmd) {
> >>> +     switch (converted_cmd) {
> >>>       case UVCIOC_CTRL_QUERY:
> >>>       case VIDIOC_G_CTRL:
> >>>       case VIDIOC_G_EXT_CTRLS:
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> >>>       return ret;
> >>>  }
> >>>
> >>> -static unsigned int video_translate_cmd(unsigned int cmd)
> >>> +unsigned int video_translate_cmd(unsigned int cmd)
> >>>  {
> >>>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> >>>       switch (cmd) {
> >>> @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
> >>>
> >>>       return cmd;
> >>>  }
> >>> +EXPORT_SYMBOL(video_translate_cmd);
> >>>
> >>>  static int video_get_user(void __user *arg, void *parg,
> >>>                         unsigned int real_cmd, unsigned int cmd,
> >>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> >>> index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
> >>> --- a/include/media/v4l2-ioctl.h
> >>> +++ b/include/media/v4l2-ioctl.h
> >>> @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
> >>>  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
> >>>                              void *mbuf, size_t array_size,
> >>>                              unsigned int cmd, void *arg);
> >>> +unsigned int video_translate_cmd(unsigned int cmd);
> >>>
> >>>  /**
> >>>   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda

