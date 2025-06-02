Return-Path: <linux-media+bounces-33897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130FACAD6B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568B93BE2A9
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B52B21171D;
	Mon,  2 Jun 2025 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hboljHut"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0427920E026
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748864425; cv=none; b=fDYDidHzDDOET1/5QQ0fNnS1+2aExjvF2nORdMnvaHxRM25omGFge5wTYxLmgf6f+ITGj0wt4FaKynFEtNStvYHkD18UmsqHPLh9e+6AqcbjrngdR6tv4fbBKL6G6eHoAicmsEgqNMJIvUb+Lt0x2fVItFSC1KzZ+OpZBC6+75I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748864425; c=relaxed/simple;
	bh=dRUdYyLiv7HUQ7bUBwyNfD4MB8oZDgxtM3+ZPWYebCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE7KN5OmvlJB5JGMtVFaZSl9W1fNlsfXok4v2Le4C5z6p6aU5m00q/Nitb0GCQ1EpNQh03DnU2Az0L+pjdMVRr4xYUNP7G7wryFb/XFhiMBc/AQbjc9u7frMWWY0SjTtpgcJiSsYAkai1CMwNEZ5awEsPq0dyo6qJ/8IbLb3/Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hboljHut; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553331c3dc7so4654059e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748864421; x=1749469221; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gil6AlHmzhgpcu56HDGcVLiUYTQhdxpwRL+hujim4tE=;
        b=hboljHutKh6U5QUHDVKKGp+njuJk7pR9uHeKORIdP/d5zG1w5RMU8DpEGQnoW4P8DB
         Xj5m4yBa8IsSk9WVD5O/v4L2Zos/SdjwtEvm3Qvkxdj0K8+wm2JwtjxookG4ugWwypgF
         U2pk4H5eQjZekRFxrbEKeOpO9uo5qxLfBO5Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748864421; x=1749469221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gil6AlHmzhgpcu56HDGcVLiUYTQhdxpwRL+hujim4tE=;
        b=vK6gSk1DVyxm3gOwSshy3/TlHrfwVIrV4mxjeqPXPDJsYi4A5/GQ13I1Kk4GeWNH4k
         +TzFRPpaUNrSH/x6ytsSe28UqTuEgqH9qmfiUN95Sn0/+g54XxFnNzfT0rAwWYQbIg6G
         KOJHJp2YpZurr/c72luoirnivyAwBV4hjvU+WNUU7dB4BMnkqOfOl1ZKdsqF0Qe7PvRF
         ITl/G8KUtZ8AkTi3DcBUghENkLHpNNMoRd+TI7nUdO7xrSCUqnK46D2ykjaZuNDEwLSQ
         9M/w4mdkatCnxGJ72su/5B6J7ynq4f6WbUvTcPia1Wfi6DCafGytOaNbvQm9d4d3kma4
         QTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH4JWEs0Odkp7m/LlfIwgU902WAikQl25j8EQJ3TSEWqNEqD9hVPTr8CFyTK+USFERvwkoyzPp6dWHqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7904ui7ZGoK1EDpJS1LU/0ej03OA1uo2opw1lYsBCWQWdg6a
	dp1ikiDImHcjxsGNU9BSpT5uLGgWG26Z+GWLiB8rrjOdA9AqekOFP5D2Pk3eIFM6XtxihagfCKq
	OBJ4=
X-Gm-Gg: ASbGnctefAaxtSpFsGZTXZK+VRjgw3K3jl372uN5ElRkEKCdqC/eaUVaAFzVjyxKUL/
	bv5bPJXzHRDy9vAj8zTpLILyvK5yjrpKIMsjvg/YrELrQXEK+3vFqd4/y3P7PSqhIsFEYitQptz
	w5f7MmqA5lTykT5lJI7FroTOp+Rr8UaHfuutxWF1aaudbtonwHPf9jk6dwrl/42UC+XLC1Nb4Tb
	ZvTW7Z8pcXhS7khtmCRFRSyVsuc8PzDpDlaLxOs5Ldvb8/PUDmWOdRAEBiV200aHV5RoebguMt6
	+ig16rhsv0czieTN4KsuCQ6lQT7prSHoFE2vRv1Pf4oyjtO1JDuLS2UPgaQvgNONybqBMVk6WNy
	V+NKl9PE6R2ft1wW5rj+iZnDR
X-Google-Smtp-Source: AGHT+IELWbCnFmKqPKf9iT/DSIpyyLAqqjRwoRWufkFOmaZgW8Z024ctZV1jUNeIS5P/XRNDqBR6rg==
X-Received: by 2002:a05:6512:1196:b0:553:2e99:c18 with SMTP id 2adb3069b0e04-55343183334mr2142980e87.38.1748864420750;
        Mon, 02 Jun 2025 04:40:20 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533793780asm1557177e87.222.2025.06.02.04.40.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:40:19 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55342bca34eso1933147e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 04:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhDLzCz3e8z7PfrQnFtaijDKuw22JPs2hmruyoVRvdbfY03K4QMECHclBuVCoRe5A+B2woaCO6n8tVCQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3b25:b0:553:3332:b65f with SMTP id
 2adb3069b0e04-55342f54624mr2167585e87.12.1748864418670; Mon, 02 Jun 2025
 04:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
 <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org> <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
 <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org> <CANiDSCsXNu2xa_ATGUJbKY_t7xxXgSGdpZMf+P4LT+x3qcP1tg@mail.gmail.com>
 <69885612-75ea-422c-ba13-07eaf4325005@kernel.org>
In-Reply-To: <69885612-75ea-422c-ba13-07eaf4325005@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 13:40:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCtSKCn+mx8pGwuYCre9Wb7gONJYjLqc6tYLWQL3YXBmrw@mail.gmail.com>
X-Gm-Features: AX0GCFsb5l02HNSHjOIwpwsxX7MGOLU1IzK9yeaQ6vL8i18RyuyOrgkhC7K-W58
Message-ID: <CANiDSCtSKCn+mx8pGwuYCre9Wb7gONJYjLqc6tYLWQL3YXBmrw@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Jun 2025 at 13:24, Hans de Goede <hansg@kernel.org> wrote:
>
> On 2-Jun-25 13:11, Ricardo Ribalda wrote:
> > On Mon, 2 Jun 2025 at 13:07, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 2-Jun-25 12:27, Ricardo Ribalda wrote:
> >>> Hi Hans
> >>>
> >>> On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
> >>>>
> >>>> Hi Ricardo,
> >>>>
> >>>> On 28-May-25 19:58, Ricardo Ribalda wrote:
> >>>>> Right now we cannot support granular power saving on compat syscalls
> >>>>> because the VIDIOC_*32 NRs defines are not accessible to drivers.
> >>>>>
> >>>>> Use the video_translate_cmd() helper to convert the compat syscall NRs
> >>>>> into syscall NRs.
> >>>>>
> >>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>> ---
> >>>>>  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
> >>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
> >>>>>  include/media/v4l2-ioctl.h           | 1 +
> >>>>>  3 files changed, 5 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >>>>> index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
> >>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>>>> @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
> >>>>>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >>>>>                                   unsigned int cmd, unsigned long arg)
> >>>>>  {
> >>>>> -     /*
> >>>>> -      * For now, we do not support granular power saving for compat
> >>>>> -      * syscalls.
> >>>>> -      */
> >>>>> -     if (in_compat_syscall())
> >>>>> -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
> >>>>> +     unsigned int converted_cmd = video_translate_cmd(cmd);
> >>>>
> >>>> It looks like something went wrong here and you did not test-compile this?
> >>>> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
> >>>> so this should not compile.
> >>>
> >>> Hmm... Actually I am pretty sure that I tested it on real hardware.
> >>>
> >>> Did you miss the EXPORT_SYMBOL() on the patch?
> >>
> >> Ah yes I did miss that, sorry.
> >
> > My bad, I doubt it till the last second if I should split it or not :)
> >
> >>
> >> For the next time please split core changes out into their own
> >> separate patches.
> >>
> >> In this case I think the core changes are not necessary instead
> >> you can just do:
> >>
> >>         unsigned int converted_cmd = cmd;
> >>
> >> #ifdef CONFIG_COMPAT
> >>         converted_cmd = v4l2_compat_translate_cmd(cmd);
> >> #endif
> >
> > I believe this should work as well:
> >
> > unsigned int converted_cmd = cmd;
> > if (in_compat_syscall())
> >   converted_cmd = v4l2_compat_translate_cmd(cmd);
> >
> > the compiler knows that CONFIG_COMPAT=n means in_compat_syscall() will
> > be always fails.
> >
> > If it is ok with you (and it actually works :) ) I will use this version.
>
> I agree that that is cleaner/better and I also think it should work,
> so lets go with that.

Actually, v4l2_compat_translate_cmd() does not seem to be EXPORT_SYMBOL()ed

So I still need to do some changes in the core.
(It also does not handle COMPAT_32BIT_TIME... but in this case it
seems to be the same).


Any preference between what to use: v4l2_compat_translate_cmd() vs
video_translate_cmd()?

Thanks!
>
> Regards,
>
> Hans
>
>
>
> >>>> You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
> >>>> otherwise that symbol is not available.
> >>>
> >>> I tried now without CONFIG_COMPAT and it built fine.
> >>>
> >>>>
> >>>> Regards,
> >>>>
> >>>> Hans
> >>>>
> >>>>
> >>>>
> >>>>>
> >>>>>       /* The following IOCTLs do need to turn on the camera. */
> >>>>> -     switch (cmd) {
> >>>>> +     switch (converted_cmd) {
> >>>>>       case UVCIOC_CTRL_QUERY:
> >>>>>       case VIDIOC_G_CTRL:
> >>>>>       case VIDIOC_G_EXT_CTRLS:
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
> >>>>>       return ret;
> >>>>>  }
> >>>>>
> >>>>> -static unsigned int video_translate_cmd(unsigned int cmd)
> >>>>> +unsigned int video_translate_cmd(unsigned int cmd)
> >>>>>  {
> >>>>>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> >>>>>       switch (cmd) {
> >>>>> @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
> >>>>>
> >>>>>       return cmd;
> >>>>>  }
> >>>>> +EXPORT_SYMBOL(video_translate_cmd);
> >>>>>
> >>>>>  static int video_get_user(void __user *arg, void *parg,
> >>>>>                         unsigned int real_cmd, unsigned int cmd,
> >>>>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> >>>>> index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
> >>>>> --- a/include/media/v4l2-ioctl.h
> >>>>> +++ b/include/media/v4l2-ioctl.h
> >>>>> @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
> >>>>>  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
> >>>>>                              void *mbuf, size_t array_size,
> >>>>>                              unsigned int cmd, void *arg);
> >>>>> +unsigned int video_translate_cmd(unsigned int cmd);
> >>>>>
> >>>>>  /**
> >>>>>   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
> >>>>>
> >>>>
> >>>
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda

