Return-Path: <linux-media+bounces-33877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEDACAABA
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 10:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58FC17A32F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 08:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02E71D5CC4;
	Mon,  2 Jun 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FYPAka//"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B519C55E
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853540; cv=none; b=flYPONCvfq1ifOK3LLJ/2Dt0zQAEBDrhs3+ABpOgLyJTTH9D6aySmZ8NCL+7zyXGidtZym7w++2hW+X72+Zjy1E6d2ghkmwzz1l8r791Tw6iW/MoWUDTW+60fA+EUua+S/HVmKXomIBDN8h0gAWGugWdko7LMcK1EDqryE6pyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853540; c=relaxed/simple;
	bh=M4dMnLIz1HIUssVepnpQnYX6YjNDveUp4I6hVplMyQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBhQqbkMu1bxhphl3VDEJgZ+51Rdbsr8nW0+hpbYFFG510qkWcwG9KQiIteam5rmmPHR5MVBtF0FIMYCuFKY0VzU6fxi1nzSPWn9npU8jk3/kNVo7Ue1uDPxQAYhf142RLXKJe3EzgiPp32VAMpCi0CVn2eCl9uJqbWYWOGIF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FYPAka//; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5047252e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748853536; x=1749458336; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3D1MqOk55yyF+QvJZLd9AC11tpsnZTeUoMSqzJses+Q=;
        b=FYPAka//22AYwf+md6CLMSJQJr4DjT8CB7L2l57z0LLI6T/+WpMIoms8lwr5sj3GGV
         qqpDjjJO0BlJ5yzpnKys7bKBhMuxDYBABP6wwyVdFHmy0PEPQ407LQ0mQTfWBrjAig2G
         7WGeuM1u1QQ5hbYGfXOFMdmaYxAYu8zJKFlTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853536; x=1749458336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3D1MqOk55yyF+QvJZLd9AC11tpsnZTeUoMSqzJses+Q=;
        b=f+I7wZPlyey/CC4kKnpCGYaVKyMlwD1EZJtISN7lYKt6YgtIp/zq5Rn1r+QCufBD1I
         XGxOUas06NySWEPod/nmvCCwiVq0MWnEB3F2UGBu8Xyv4vaMRyc+GLAZJWxnokxCDN47
         1UzseDbD1HJmwNMyjSLGIxvkXoelywV01TggYqt/iKJUL1j6bx4tfxSjz5UhgtCGd9Ts
         ltdAR46mQreqLkrQJrMjFJd6r2TtM8teSuJ8TEIROG7bsA6AAW/IIw62TjQwt+6xVoXl
         m7MdxpbYKtvacJSPt1pxRYn9qx0Cn8KBOE3F0fnPgQo0W1upjsNMTfhxwuBG2AYECH01
         FZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV61E2o30HjINt7jYq65BTDz8FtMVdsk+hnc5VoLI1jczQkL69aB3UDTAI/h+Xi3Fawa6gYdS1dO29Y7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YziUeuNh/UHy0VHGdJBw8So7lgPXk7zBD/4xeaYXb0Df0BxEQtJ
	PruI6R+Q2eUZrXXaPmnd5eCM2pEkbpPwF25CM504SYWHCvpdiGaHSqpHg+2B6qTEUrqa1wfjz14
	yipJhbA==
X-Gm-Gg: ASbGncsdZ8sgL4pXcE8vULrGkgXKsCGK5CwswwVetLf+iB/xV+DiQaNrq+GM+MRsM4z
	W9GfxMrndt0h1oxmPpI2CW7XgwX6UQj/xhrgDeVFQpvMnIAoCYWEqmgG5eqoO+emlZMplo3pzOW
	mByannNSJM4Xb6GOjptIVhD7o8uG2Tm5lDTNIij/3UKH8LCRH6cgDPHjh6xwuUJbrjwJiWH1bTY
	qtU92CmeZVDzjnOoFxUQBOgTnA2sl9nhYG7shP0JL3XB7dZBpXNM7WyPL+OHoJriCH6GXK12HPn
	4G/ZJoOUEldT/AH6N/Wg8jycasR6QU6WYpCzm75/z3ImfrBa3RG5i2Xl9lovKkX579x+Eg5X8x2
	ngO80CnmVt0a/ogc2W5zGlWAY
X-Google-Smtp-Source: AGHT+IEMKdkPCZmTecLtryEWwUZyCU4ZwgFmNRhY9VHQY5n/JlfwLamfPdqLqCdxxIatifpqPNAlOw==
X-Received: by 2002:a05:6512:3d28:b0:553:268e:5006 with SMTP id 2adb3069b0e04-5534318ea8bmr1660580e87.55.1748853536159;
        Mon, 02 Jun 2025 01:38:56 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d0a1sm1495507e87.202.2025.06.02.01.38.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:38:54 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5047217e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 01:38:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3EQE2O3eyi/qpQAMsZbXGnUm2CUTJglPRq+mtUE56QwV397tzNDUX49QApdeor5wChlnS1F/VxE9+Mw==@vger.kernel.org
X-Received: by 2002:a05:6512:244e:b0:553:2668:6f47 with SMTP id
 2adb3069b0e04-55342f931b5mr1417841e87.31.1748853533656; Mon, 02 Jun 2025
 01:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
 <20250522-uvc-fop-v1-3-3bfe7a00f31d@chromium.org> <adb22c62-94c8-4ab5-8aea-cc204affba3c@xs4all.nl>
In-Reply-To: <adb22c62-94c8-4ab5-8aea-cc204affba3c@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 10:38:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCubHc+WMgdQqyyqoDLixeN=ubGm4_ejeRj7M_vA=FA_DQ@mail.gmail.com>
X-Gm-Features: AX0GCFuQ3qLhCsXgJka-N2u6ssEczrawiqsO3Mr8fCMkM9jgnlKUIPt_YufzZJk
Message-ID: <CANiDSCubHc+WMgdQqyyqoDLixeN=ubGm4_ejeRj7M_vA=FA_DQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Jun 2025 at 09:57, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 22/05/2025 19:58, Ricardo Ribalda wrote:
> > The is_streaming field is used by modular PM to know if the device is
> > currently streaming or not.
> >
> > With the transition to vb2 and fop helpers, we can use vb2 functions for
> > the same functionality.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++-------
> >  drivers/media/usb/uvc/uvcvideo.h |  1 -
> >  2 files changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..51419f443f2c43dfd17a9782352bd2cde1094732 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -617,7 +617,8 @@ static int uvc_v4l2_release(struct file *file)
> >
> >       uvc_ctrl_cleanup_fh(handle);
> >
> > -     if (handle->is_streaming)
> > +     if (stream->queue.queue.owner == file->private_data &&
>
> Use vb2_queue_is_busy(&stream->queue) instead of directly accessing the owner field.
> But see below, since this can be dropped altogether.
>
> > +         uvc_queue_streaming(&stream->queue))
> >               uvc_pm_put(stream->dev);
>
> I think patch 1/3 can be improved, which likely makes this patch obsolete.

If it is ok with you, I'd rather not touch 1/3. It has landed already
in the uvc tree.

I am reimplemeing 3/3 using  vb2's start_streaming stop_streaming.

BTW, I see that vb2 keeps track of the streaming state, so most of the
code is gone :)


>
> The uvc_pm_get/put should be placed in the start/stop_streaming callbacks. That's
> where you need them, and it avoids all these is_streaming tests. And it allows you to
> use the vb2_ioctl_streamon/off helpers in patch 2, since the streamon/off functions
> no longer mess with the uvc_pm_get/put functions.
>
> Regards,
>
>         Hans
>
> >
> >       /* Release the file handle. */
> > @@ -684,7 +685,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >       struct uvc_streaming *stream = handle->stream;
> >       int ret;
> >
> > -     if (handle->is_streaming)
> > +     if (uvc_queue_streaming(&stream->queue))
> >               return 0;
> >
> >       ret = uvc_pm_get(stream->dev);
> > @@ -697,8 +698,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >               return ret;
> >       }
> >
> > -     handle->is_streaming = true;
> > -
> >       return 0;
> >  }
> >
> > @@ -707,16 +706,15 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_streaming *stream = handle->stream;
> > +     bool was_streaming = uvc_queue_streaming(&stream->queue);
> >       int ret;
> >
> >       ret = vb2_ioctl_streamoff(file, fh, type);
> >       if (ret)
> >               return ret;
> >
> > -     if (handle->is_streaming) {
> > -             handle->is_streaming = false;
> > +     if (was_streaming)
> >               uvc_pm_put(stream->dev);
> > -     }
> >
> >       return 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -626,7 +626,6 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       unsigned int pending_async_ctrls;
> > -     bool is_streaming;
> >  };
> >
> >  /* ------------------------------------------------------------------------
> >
>


-- 
Ricardo Ribalda

