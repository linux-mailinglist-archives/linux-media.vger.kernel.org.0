Return-Path: <linux-media+bounces-38925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70116B1B324
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 14:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BB0F1891E4E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD7626CE2C;
	Tue,  5 Aug 2025 12:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJd7KIyT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E12F30;
	Tue,  5 Aug 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396000; cv=none; b=YM2epT4KlN+tzQJmdqj8/+gfUiwKfhznhyNUF8h0j1xf4qL59XuZsV97SS30NRMSYHgkXs/o8Goy17yuKB1+YZFdxU3lVcyk6EI2l660jxRiCjeVqsLLIOuWvX9aVPFKSKa4sBWfD31MDqBB0NrH1UyzVDhLF0y+yGyTAzRH6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396000; c=relaxed/simple;
	bh=EwgV03aMmUigY4Ai2ZcUT6R7WsVFMtOcHbmjEh5+jE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9aC6SZcH2aQk3TKldkcfVG7OYQVfpHdMfTfJyURSQscHb7fHz0/uoQq+zlyyyvY7NYm5gD96v5SawG5AuNkiguBKEhNAiYAiMrEUfPkBc/3BeTxHf5U4abTt5aWwXMw4I58CsB/DVhUUCdnI6YtOZ6VVdbucm7Ue2ufOOYYSf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJd7KIyT; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71a1ce529e0so2500537b3.2;
        Tue, 05 Aug 2025 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754395998; x=1755000798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8V2DgHri8YgTejj87JvYTtqdyOnLtF+JDKa1lXF5to=;
        b=QJd7KIyTutj045OGpUop01mhE8sI3qJ6ZK3gMawUrWe2yGiQG+rXaFnSz1XVpUsqUH
         96Q+Hg04XRQpF479xj5sa5QntKCBwXSV16nMHNCE6hhRvZffeLcUm8a/j1OfzjNQ+1XS
         u0OMI4j+J1oSwchMfqOOQdo1JP6fYnEfJvpRam92s7t+fPZfCIvCFQ68pgy9GBvelTUO
         gqaQXhL/YI8Mocqgl67FVDQKKD1pS3tWHIJ6bZi02g1HLkBhQHeCLRFzX6P4odCbc/yd
         bvHLLuIw5Kjer4o75HKd0ynG7O9bGr4SxY5zcqnUxotRetvTlsT63RoHiOQPOPt4nMi3
         KTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754395998; x=1755000798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8V2DgHri8YgTejj87JvYTtqdyOnLtF+JDKa1lXF5to=;
        b=T3E2LupnHZoF9rK78S5Dqvb/BDWhnDMAxclzWeyfSR3xa+yOvGqGnaCqx3TQT3X/w2
         y6EfXWtBOON6Jt+gu7F9K+gC5SVqjvSPSyjezEk6DMUCO5WII0zPxrvv0HxLXQC9pEN6
         6pawHqCnXK+WKVrp5WfTGcIdz6FHQmtOCJKAQgxRpzw5UmhisTqx2fYAQWMvRi+ZdA+h
         4+/s5gqUlDBN3LWojNgSr1vGrVMlG4L1cE7885whZlbJ/+KwDVNUsaG2g/puKXS3x+jc
         Hz0pVw+xqM39389AKs5y0BOQRhexWZmA1BQTHw2GQaMLhi2LCyGyZeSCACw1jOf8IIhS
         MaMw==
X-Forwarded-Encrypted: i=1; AJvYcCVRG6yZ7RE7CQypk07kW6r1NXb3d6r6+xOgQKW8rpcYV3P7CBARhxGzTq/3wzYdzaMmOZTsnGNP4g5jo28=@vger.kernel.org, AJvYcCW0yzCM07FrkrlYXBHe6Z1oInv7sxvqS7PztZr7ibXVZwXB8c8xTNMHPeYXfxjIAWrw87vCIqiXCx1sAJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1B5wSaJ0sO+Km5KpDC8who9I3jk7siN79z12fyF3WNqKCdNQy
	jJ+Jjm4cUjtbfJRZRjyBG5Imb1jxBxE/HrbCoFSDyb+JYVYBhirEAT6cnGsbBdjA6+Q6/0FSDhs
	QTNHPPhX3V+YBhjcXStURKuuSRRb6Y6aAqXBA
X-Gm-Gg: ASbGncu6cMZZX0/tVcIsqFw0aRCL/oWIHMF0B8mf5Q7fJyJd6BCAwh9edhAqmuKpc6P
	dqzTcE1TmqWBlGfof91PIw9XPUXDO4C2AUIWFZLxkht3o6wtUQOYJor86BTM8lJMfTJN5hkx34n
	IBDCbuN9f4nset+DYeeVyCZIGP2It0pwVIj6ITH7tmALHkSMv+BLncNM2S/MQV4PL+Fj66I4OcW
	GTMRMXY
X-Google-Smtp-Source: AGHT+IFno5ZUE+zPi7eL10QnBpUmwNfmnQnJRM7Ol/kSuAJPwRUHFeKn/aaBiKWgZBJ4/hwctVDxvaI1CZE+sNLrowI=
X-Received: by 2002:a05:690c:3390:b0:71a:2d5f:49b9 with SMTP id
 00721157ae682-71b7ed87a67mr84871107b3.1.1754395997637; Tue, 05 Aug 2025
 05:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com> <5c9bf027-f362-4176-b4af-bcba9aa96e0c@kernel.org>
In-Reply-To: <5c9bf027-f362-4176-b4af-bcba9aa96e0c@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 5 Aug 2025 15:13:07 +0300
X-Gm-Features: Ac12FXwc6JwF_PWuXYoAwmMgTz0-8NbtMwbbTAQwO8Nlhz1mma8RYwLFA7qqMM8
Message-ID: <CAGn2d8MC4JckjW8isvz6q6SMsb9VEAR2QrnNkJHPRuLZtwqqSg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,
Thanks for the feedback.

On Tue, Aug 5, 2025 at 12:00=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
>
> On 17-Jul-25 2:42 PM, Abdelrahman Fekry wrote:
> > The function atomisp_set_fmt() modifies shared device state and expects
> > callers to hold the isp->mutex for synchronization. While most internal
> > callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> > V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> >
> > This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> > (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> > pipe->frame_info may be modified concurrently without proper protection=
.
> >
> > - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
>
> Thank you for your patch, but I'm afraid that this stems from
> not understanding how v4l2 drivers work.
>
> isp->mutex is set as the mutex for the /dev/video# node in:
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:
>
> int atomisp_video_init(struct atomisp_video_pipe *video)
> {
>         ...
>         video->vdev.lock =3D &video->isp->mutex;
>
> This guarantees that any ioctl handlers will be called with
> isp->mutex already held.
>
> The suggested change here will result in trying to lock
> the mutex a second time leading to a deadlock.
great, now i understand.
>
> So NACK for this patch.
>
> What would be useful is adding:
>
>         lockdep_assert_held(&isp->mutex);
>
> to functions which expect the mutex to be held. I regularly
> test the atomisp code with lockdep enabled kernels so this
> will help catch any paths where we indeed are not locking
> the mutex while we should lock it.
will look into that.
Could you please check my other patch series if you have time
https://lore.kernel.org/all/20250712191325.132666-1-abdelrahmanfekry375@gma=
il.com/
thank you !
>
> Regards.
>
> Hans
>
>
>
>
>
>
> >
> > Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_=
set_fmt() without a file handle")
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > ---
> > v3:
> > - Use guard(mutex) as suggested by Dan Carpenter and Andy Shevchenko
> > - Remove extra blank line after variable declaration
> > - Fix include order as requested by Andy Shevchenko
> >
> > v2: https://lore.kernel.org/all/20250717013003.20936-1-abdelrahmanfekry=
375@gmail.com/
> > - Add Fixes tag
> > - use cleanup.h micros instead of explicitly calling mutex_lock/unlock
> >
> > v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry=
375@gmail.com/
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/driver=
s/staging/media/atomisp/pci/atomisp_ioctl.c
> > index bb8b2f2213b0..2690c05afff3 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > @@ -7,6 +7,7 @@
> >   * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/pci.h>
> >
> > @@ -416,7 +417,9 @@ static int atomisp_s_fmt_cap(struct file *file, voi=
d *fh,
> >                            struct v4l2_format *f)
> >  {
> >       struct video_device *vdev =3D video_devdata(file);
> > +     struct atomisp_device *isp =3D video_get_drvdata(vdev);
> >
> > +     guard(mutex)(&isp->mutex);
> >       return atomisp_set_fmt(vdev, f);
> >  }
> >
>

