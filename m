Return-Path: <linux-media+bounces-33892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A8EACAC6D
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 12:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B3B217E9C0
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7628A202F60;
	Mon,  2 Jun 2025 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ehE0AqZk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771E1E520A
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860090; cv=none; b=dXo2ByYncu+M+/d89E/8hckK3PuqzyOEyJKmoNQP6/46qSgOHRbgUy+Iqb1n5C4d5tZHJTpe6xGwngimeTto3KsypwubL2WxvZCFppC30KJH4xa2NEr9zzeq+A3v5lWBKL7eCEbxRBQLvh8aiB9CMvXBsu1OZc4d7LJTQzeYcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860090; c=relaxed/simple;
	bh=Z1Oaw9PYh4rAiOMggpsLlXotaotYo6wDSbLMVBxFYnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATx7M9GybCiPou+IsrgL6/3Nti57T0y87cIaeQi4n4iAxSGWo7fYYLe5JILdATzVqQDXbXLIrQynsQlMPCJn7FBo95/7ehd286VkufdhypZ5wiMQSha3g81HvgnjhuxWBOl+S6AJ53sgKzmfghOuUCvT6yqYg00xftUuHKfQ8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ehE0AqZk; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so38204591fa.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748860085; x=1749464885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3eFHenNabcyPxNBLH8XYBq5FpRR6YY+YC341Og5xruM=;
        b=ehE0AqZkXst1LOr0+14tbi7/k/EnFQv/qzn9CSgOjWgqL1zMGvi+Ihofr/MJHKpXFB
         lxtTYETFMnUvwGuFJsYL7I9KYsUOYgpO96hnxDlF9cvaR3HHxFSaxh8yvX+FPP/ZRR4A
         s0LpYHsWAutBBhnitv+natrFeuZB1UQDRzUBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860085; x=1749464885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eFHenNabcyPxNBLH8XYBq5FpRR6YY+YC341Og5xruM=;
        b=a8p6q2qJq0qpLArI48oqVW8ca6ZL/sqCiKMoCQUX2KQjIqATaPV/4imxK3nZp5SkuR
         zxQssYMguEEyTvrCwMIrOnB+7MZCeIIM+zBD6PGCKjoEEuB4U6wqBbsNV4VM63JG+tfw
         RbnIt/T6lI55FHuY8rSP0E+zndydDJfJkitc7oFCbX8GzINw3k6iyv/D3RazPQKUBBwn
         yP2jjhRnGuCfFhwZAn//X/YdqFJTEifxbl/BnxhkEdQ7VWwiTxXrIrlJaobmwDLdt4QO
         PTR3Uv8Ws1WOKlLdAqenyR17Yl3ayzHcJu5VI9wOiELSoE5KFISnDEbNiq26j+YGEMy+
         IvfA==
X-Forwarded-Encrypted: i=1; AJvYcCUMOaP4YZAyVG0UwKT6Xta+K7j/VSgsgUqIbdHbPKDnCzYyirBBA4KpuAlwVIhoDOlVs6nYdCTzUleR5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8ESFBzQ956pzO/X2VJuDsXt4KpAaN3HUOxzsDXgaQGd7NS1e
	ByXXvc8BFkRx7Oa5A7qoKxAfxOre+eecP77S3rLRZETalWrGYsAlAnZHhx87Kb2cTNmRjY8cSxZ
	aAvo=
X-Gm-Gg: ASbGncugMC773ymtux56zV025PGjpsQPJzAjNZ1CvU4fYYwnTrS39f748Ar4kAlj9OX
	KQ0mivN94/8hP2f67dHasBxZaSMYafk9fU8Rip5rUbWLR5hALN1cbFM0wMTqMk0pJx8fF1ys7mp
	/EvDQg8+R8Myze3JT2y09dJ94RQyWT+phMWlEfU0gG8lDuCA7P0Jaq96TlHQSWD8gBY+hBdTH55
	ieXNpSOtJs2/FkzuWyfQVKiC8/tyFakslmLN1ZE85Ob+hczdKiOR5rOIyHShekChCcisLTGMo1Y
	VGlr5F/NjcP4+tgOiNMIuPrIifaastT+xu9cXvBCJFnuHehIc59iiuV2ys+0NJAPSzcFyQP4NFM
	6PXOtPHBOsWj4/A==
X-Google-Smtp-Source: AGHT+IFt4JQRA7EsRqlQelfOcT3s6iwTJVlQmOiJMhUPvoec5FsoTuUwVs4khwKKJ6UXP7EcgixQwQ==
X-Received: by 2002:a2e:be85:0:b0:32a:5eba:6ee6 with SMTP id 38308e7fff4ca-32a9067bf00mr35684901fa.10.1748860085264;
        Mon, 02 Jun 2025 03:28:05 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b35a65sm14361271fa.36.2025.06.02.03.28.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 03:28:03 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553245cad29so4401085e87.1
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 03:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGBjeMDErcT6gG3DiHcYPzjG66tZMtB6rAEnmVB7XHkm3fc/9UWCtxf1ntTAJnDNNAc8OJtZuxsfvmOw==@vger.kernel.org
X-Received: by 2002:a05:6512:224c:b0:553:36b7:7b09 with SMTP id
 2adb3069b0e04-5533d1c7bedmr3190132e87.54.1748860082823; Mon, 02 Jun 2025
 03:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org> <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
In-Reply-To: <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 12:27:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
X-Gm-Features: AX0GCFuWZkQQBhJx8R0DIICEHhbKF2Pg_-NYAADMPgrknh4YsG2c63DBYFa185s
Message-ID: <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 28-May-25 19:58, Ricardo Ribalda wrote:
> > Right now we cannot support granular power saving on compat syscalls
> > because the VIDIOC_*32 NRs defines are not accessible to drivers.
> >
> > Use the video_translate_cmd() helper to convert the compat syscall NRs
> > into syscall NRs.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
> >  include/media/v4l2-ioctl.h           | 1 +
> >  3 files changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
> >  static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >                                   unsigned int cmd, unsigned long arg)
> >  {
> > -     /*
> > -      * For now, we do not support granular power saving for compat
> > -      * syscalls.
> > -      */
> > -     if (in_compat_syscall())
> > -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
> > +     unsigned int converted_cmd = video_translate_cmd(cmd);
>
> It looks like something went wrong here and you did not test-compile this?
> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
> so this should not compile.

Hmm... Actually I am pretty sure that I tested it on real hardware.

Did you miss the EXPORT_SYMBOL() on the patch?

>
> You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
> otherwise that symbol is not available.

I tried now without CONFIG_COMPAT and it built fine.

>
> Regards,
>
> Hans
>
>
>
> >
> >       /* The following IOCTLs do need to turn on the camera. */
> > -     switch (cmd) {
> > +     switch (converted_cmd) {
> >       case UVCIOC_CTRL_QUERY:
> >       case VIDIOC_G_CTRL:
> >       case VIDIOC_G_EXT_CTRLS:
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> >       return ret;
> >  }
> >
> > -static unsigned int video_translate_cmd(unsigned int cmd)
> > +unsigned int video_translate_cmd(unsigned int cmd)
> >  {
> >  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> >       switch (cmd) {
> > @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
> >
> >       return cmd;
> >  }
> > +EXPORT_SYMBOL(video_translate_cmd);
> >
> >  static int video_get_user(void __user *arg, void *parg,
> >                         unsigned int real_cmd, unsigned int cmd,
> > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
> > --- a/include/media/v4l2-ioctl.h
> > +++ b/include/media/v4l2-ioctl.h
> > @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
> >  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
> >                              void *mbuf, size_t array_size,
> >                              unsigned int cmd, void *arg);
> > +unsigned int video_translate_cmd(unsigned int cmd);
> >
> >  /**
> >   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
> >
>


-- 
Ricardo Ribalda

