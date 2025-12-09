Return-Path: <linux-media+bounces-48452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6464CAF0F4
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 07:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE913068D79
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 06:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7812741A6;
	Tue,  9 Dec 2025 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nnC/ZLXv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C17270565
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765262521; cv=none; b=jJq/Mz7YVJl1d6/SiNuQ+wZxpRYKO7XZgdn4wACcP7hRuc7iE6sl5634vp+F6LQ9Ua/0sVLVVwrz2GzciLq57burOEnRsFLwrd1m0I9/YnKp85TYbyUX/NVzizZudVnMwKdGPVaeInFqSNJJSAljMw4JN9MaFWnin7UkWiY5Cr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765262521; c=relaxed/simple;
	bh=lJU4xMyw0Ics4R7iF/dtEFW5XPTHjrAML86unhjdaw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyieuU5V7I4MTS9PzAsALs6D5fg0MAPbh/VA/S54LUTglYoyzNXBjqJsYOR9A2Y0KPNfFVJRNbM8X3Yr4P5ThFuTW7pFgHps2zp4VSTQJOmPWjYs0ZB5U2iDr/djqgCS0FXb6X2uBzy0Lp7NGe9rua+TLd6gsjHNKdPzDdnwdkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nnC/ZLXv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5958931c9c7so6512899e87.2
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 22:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765262517; x=1765867317; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0V9C2N/EaSoH4hcssL4pcExp5whRbaljeVrNMKSIqrs=;
        b=nnC/ZLXvq3XPs7p02QXsO6248ejhG/ZW3MDZk205fBX2Ubipn3AuwGUa5zywxuiKcu
         fSuAzrOwkzTP6kiN1Uzrf2QpeeFlbqP9QkB4OQ8zJ/iP056XEM3u/iNXn+8UUe0Lnbbe
         YoEudusLXN+Jz2S0TkeuqIJpinCc8iLiAeWG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765262517; x=1765867317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V9C2N/EaSoH4hcssL4pcExp5whRbaljeVrNMKSIqrs=;
        b=rUGItw99BZo9rvbIzYf9rLS6k+taXdc/rvHSQlOsN86avepJqeHa33AuM8NP2thVt/
         ZaOdAUDyS4Y25n7HvohZiQFhA35THkdmJwTZ9ge4YfHZZ9ydRVaehU3IDujhuTu1vb/f
         q7t886ofjliqeoGI/k9TZNMFkydi6AhDtZRQq3OEeQcDZVEH2M6RogdIjwunt0zKGMkl
         y0FGlQF1bA6qaeZA45/JQ49+d7ofchaUGe1/rfbMhIZLEzXFPCdY2iEVKp5GshSQC+17
         59LE+jhXw3kYBvcQcW3lKw/k4j6XvKG5Og8fWnnci1MgqlRL4njBXCEZCBzkPSrzu6O/
         Eumg==
X-Forwarded-Encrypted: i=1; AJvYcCUt2USRTxGB9Xs0yE3erbJf7mopPzXgbYkCrIXPAhrfLAe8NE8kBoHfvZxN4uvmAnt3OkvRlWPoOdzZow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkVPgv5JeNFa0hiJWxFFib6H5oc60SWrP75FU5/9Y6r3FWX4g
	Q97KQl+2+6bFC+751TIkARpCs8C+cvFtDIDrB6vd5vZB2c5McrArgae4NV/nf+ShCbRJ3sX9W7o
	G5gaCnQ==
X-Gm-Gg: ASbGncvc5HAmKQupUq0cTIY/q2HNLupCWvyrOogkYaOue5fzfqMT8Rt44pitswq6bxo
	yTNOOlYLr4rthOKOjGK1ucFjOaEUszz0hrpXR2haGNyfQI5Hyq4JInfz4+txaCymQuhejRhkSwx
	3CLw3W6rWDRKYDJORudEUw7FPw14+gfjiqGNcgDR0e4t5GcXLiqmBfl2MDr9nxo/4PTmWVchLrJ
	gKCwLm6rfqf3zKis/44OYbp3u1v/f5Pe2WPDnzhLniJyYiEnLnzkF/0GtDKgBaxGXCKeDC7xTYO
	eDq1uFVozJE1Otd6VKy3zYX5uv0vCV0ucJDBad/bZkZoitsgaRxkOMUqoeiVSgIRZUs6pAEeDET
	TpGxU9HhuKo7IC2x5nnHhefTC9dP2NmQ3xzx93Kps9GRUPuy00P5HH/3gCymBozuppTd7+pF4+C
	hzbhL49uMmEmWhElOZtNE4OwF4urtdJUSt+PjZPBEyim3T1qC+
X-Google-Smtp-Source: AGHT+IHmm2bG2qB+uYoxuPWYDFnkcNDF0GV99AFdiNlmzn9W+Omg1wZRG8tu4MZwN0f7inkDokFa2A==
X-Received: by 2002:a05:6512:3c83:b0:598:e9f9:bf3 with SMTP id 2adb3069b0e04-598e9f90f01mr356218e87.13.1765262517035;
        Mon, 08 Dec 2025 22:41:57 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a53asm4897134e87.13.2025.12.08.22.41.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:41:55 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5945510fd7aso4250327e87.0
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 22:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaNGsmuTWSRDj3CNizWu6ceaCCafsTOXqevjZ0jjrpQeQ44Yp2Zt3U0Z25PHNQIjkdf4kIIPB2M2ZBOg==@vger.kernel.org
X-Received: by 2002:a05:6512:2312:b0:594:522d:68f4 with SMTP id
 2adb3069b0e04-598853bc5fcmr2669981e87.28.1765262514587; Mon, 08 Dec 2025
 22:41:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org> <f7cbf5ab-7564-4c81-84c9-b38b09e977f9@kernel.org>
In-Reply-To: <f7cbf5ab-7564-4c81-84c9-b38b09e977f9@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 9 Dec 2025 07:41:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCvr7VRw91-AuJ8JTuhsuJNcg5XqLVvgjJycmqOKMcf3fg@mail.gmail.com>
X-Gm-Features: AQt7F2oN1rLCiK5YAJ9rb0hF0CEMsaJ2yvHl5AqU5ZukcLwFi80je33jOhwtgDM
Message-ID: <CANiDSCvr7VRw91-AuJ8JTuhsuJNcg5XqLVvgjJycmqOKMcf3fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans


On Mon, 8 Dec 2025 at 20:17, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> > The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
> > control.
> >
> > This mapping is usually created by the uvcdynctrl userspace utility. We
> > would like to get the mappings into the driver instead.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
> >  drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
> > --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > @@ -109,6 +109,8 @@ IOCTL reference
> >  UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > +**This IOCTL is deprecated and will be eventually removed**
> > +
> >  Argument: struct uvc_xu_control_mapping
> >
> >  **Description**:
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
> >       switch (cmd) {
> >       /* Dynamic controls. */
> >       case UVCIOC_CTRL_MAP:
> > +             pr_warn_once("uvcvideo: " DEPRECATED
> > +                          "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
> >               return uvc_ioctl_xu_ctrl_map(chain, arg);
> >
> >       case UVCIOC_CTRL_QUERY:
>
> Deprecating and then removing this is going to be a long slow process.
>
> I was thinking that rather then remove it we would keep accepting the ioctl but instead
> of calling uvc_ioctl_xu_ctrl_map() we would simply return 0. E.g. change the above to:
>
>         case UVCIOC_CTRL_MAP:
>                 pr_warn_once("uvcvideo: " DEPRECATED
>                              "UVCIOC_CTRL_MAP ioctl will eventually be ignored.\n");
>                 return uvc_ioctl_xu_ctrl_map(chain, arg);
>
> And then say in one year after a kernel with the above is released change it to:
>
>         case UVCIOC_CTRL_MAP:
>                 pr_warn_once("uvcvideo: " DEPRECATED
>                              "UVCIOC_CTRL_MAP ioctls are ignored.\n");
>                 return 0;
>
>
> I think removing it in 1 year is too soon, but ignoring it is ok. This does mean
> that people will lose the custom v4l2-ctrls for which patch 2/6 is not adding
> mappings into the driver in 1 year after a kernel with the warning is released...
>
> I'm not 100% sure about this plan, so please let me know what you think. For
> outright deprecation warning + full removal I think we need to wait at least
> 2 years after shipping a kernel with the deprecation warning.

Let me rephrase what you have written:

today:
pr_warn_once("uvcvideo: " DEPRECATED "UVCIOC_CTRL_MAP ioctl will be
eventually ignored.\n");
return uvc_ioctl_xu_ctrl_map(chain, arg);

in 1 year:
pr_warn_once("uvcvideo: " DEPRECATED "UVCIOC_CTRL_MAP ioctl is ignored.\n");
return 0;

in  2 years:
return -ENOIOCTLCMD;


Normally I would prefer not to lie to userspace (saying that the
mapping was done, but not doing it).

But in this case, UVCIOC_CTRL_MAP does not seem to be very widely used
(check previous email), so I do not think it really matters if we skip
the "1 year step" and just return -ENOIOCTLCMD in 2 years.

I leave it up to you to decide the deprecation steps.

Best regards!

>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

