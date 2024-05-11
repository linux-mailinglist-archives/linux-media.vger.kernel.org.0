Return-Path: <linux-media+bounces-11374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA038C3027
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 09:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2E4283F01
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 07:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF24210953;
	Sat, 11 May 2024 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z+0mO1Z3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C528E7
	for <linux-media@vger.kernel.org>; Sat, 11 May 2024 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715413684; cv=none; b=PNBV7JpY8OHENXts4Zx4dcLx/C2+ktvALEm8G9QxoHaQ585TRzCha2CDwR2TJ5YXT9cy14dSTqovaGjtXmaRzlfBrMRiDIIysu5/rPwkmmg5f4AR2RC+3+zqvh/jqJRVjjQEyaSF6BrKABXsfdscq48MZ8WbhAmJf4vfGxbbvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715413684; c=relaxed/simple;
	bh=meEYPUOj/04dXwOusDQMM9xj3Jdxdafr9sQJyUHw6mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5VM2eQexrL0gLNHnCB+SvsEKtYHgJk/Q8DR9eIUsA2qZLxfT09u/DXNpcsow+e6B7tvP9YAVDkU6zbfM5UDBB1AZN5QzID11GGV7Dtwsn6tZIMxPA6ZRc4v/N5SJ5MXM/3AuXMrVVFKSwvBKQ98aghs74fLTjQxZixhCaT4k6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z+0mO1Z3; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-439656c1b50so16121991cf.1
        for <linux-media@vger.kernel.org>; Sat, 11 May 2024 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715413681; x=1716018481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3jrMWE928Q6BhVEHep/QBR94dnpPtsG7+6WCG1J7Ms=;
        b=Z+0mO1Z3EV9/NLnjERPm+2uU9Te7K9r6557Zzk+HU+ZIQxpuHzh3vPNV3g6TkvN040
         tSI6p241QpyNDhLM+X4VEOAYNs5oCRTmyDYOsaQwPnb919kZHG74yENP6zTLmiMwdl+7
         3+YPAbKcWc8AhUg6rBuK/VnaE80/lFQou1roI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715413681; x=1716018481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3jrMWE928Q6BhVEHep/QBR94dnpPtsG7+6WCG1J7Ms=;
        b=ioYfcxSsbJAF5qC8RhpbeUGHe5UOTIZiCQaVT3aQRHNy5Rr++FQCYbL+I1EIs07FEV
         oy8AYqOTYQsISA20M1P2v8YwbPWoWzJM3e5cGrUO0kDBwsxVq2QjClp88+wNGc3TdK9p
         5YKQTrfKPmkpbXNodBSuCuLbQeoDEjIsG4VYe3VP9/JNIue+Zy8W1JYEtuK3bFrcHPqV
         MgAYXP+9gRcaEmuCaZHbkTwdy5bPjni2wU9vp98uBiOSAGzgFzzu14+wQZqkzfcdbs9P
         UIQbsTpq6KwfC2J8qxobkYknUZ6t2JHhJAzlArxzfluaY3+ewsLE0erdyOHbtQKPDL6K
         8oQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3DBwCV+PqCzYiFUOSejlzWZkhy7AfPBeSRjw2Rs4UKE8B1g4ECr53yCtPH8NMEk2EJS5MFIQtHLVmNoGvfut9G3IagfFlmhyc8SI=
X-Gm-Message-State: AOJu0YxA7xGogyYRJEg76mG5pkzQ4V3JV1JicvzmXS9ailuliny4p2iH
	drHzjgUnbrr0oU4gN0lU8bH0Z7Lg908J+zMAisyeYJa7mSpNied0xvMtY8PWf5w/IkLpektwWKg
	=
X-Google-Smtp-Source: AGHT+IFt2W8z0P3KeqcU+PeOqbrwRv6ZCrDJc0NZvFFo5RtR7dMsVdOVBe1+DWJXd1HDfDBzJ9k3Bg==
X-Received: by 2002:a05:622a:1b19:b0:43a:712a:bb97 with SMTP id d75a77b69052e-43dfda8cf19mr60126341cf.7.1715413681134;
        Sat, 11 May 2024 00:48:01 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e0d56dce5sm1395421cf.58.2024.05.11.00.47.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 May 2024 00:48:00 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6a073f10e8eso12766446d6.2
        for <linux-media@vger.kernel.org>; Sat, 11 May 2024 00:47:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3VCAyoFc1vRNhd5QNwZOdpP3kZ73O+Xpy4QPub7kbOH1Vgokcx351b3YmQUPwmLGy3nDuwTyoL0Y6aszUE9jk+DI/dYI+dhYfLCY=
X-Received: by 2002:a05:6214:398f:b0:6a0:ada7:1ffa with SMTP id
 6a1803df08f44-6a16815f8eamr48583366d6.17.1715413679256; Sat, 11 May 2024
 00:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-fix-hi846-v1-1-1e19dc517be1@chromium.org> <20240509193900.GA32013@pendragon.ideasonboard.com>
In-Reply-To: <20240509193900.GA32013@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 May 2024 09:47:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCsv8S68x7z+aV1PhbZ+5Ktr=86nYUXaNpb1w4q4y1v38Q@mail.gmail.com>
Message-ID: <CANiDSCsv8S68x7z+aV1PhbZ+5Ktr=86nYUXaNpb1w4q4y1v38Q@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY get_selection()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Martin Kepplinger <martink@posteo.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 9 May 2024 at 21:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, May 09, 2024 at 05:05:55PM +0000, Ricardo Ribalda wrote:
> > The current code does not return anything to the user.
> >
> > Although the code looks a bit dangerous (using a pointer without
> > checking if it is valid), it should be fine. The code validates that
>
> I think you meant s/code/core/

Yes, sorry, fatty fingers :)

If you are planning to send a v5 of this
https://patchwork.linuxtv.org/project/linux-media/patch/20240508214045.24716-4-laurent.pinchart+renesas@ideasonboard.com/

Maybe you could include this patch there?

I found the issue when the CI tested your series (eventhough it is not
caused by your series)

Regards!

>
> > sel->pad has a valid value.
> >
> > Fix the following smatch error:
> > drivers/media/i2c/hi846.c:1854 hi846_get_selection() warn: statement has no effect 31
> >
> > Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> > While running media-ci on the last patches there was a new sparse
> > warning:
> > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/58524338/artifacts/external_file/junit/test-smatch.log.txt
> > ---
> >  drivers/media/i2c/hi846.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> > index 9c565ec033d4..52d9ca68a86c 100644
> > --- a/drivers/media/i2c/hi846.c
> > +++ b/drivers/media/i2c/hi846.c
> > @@ -1851,7 +1851,7 @@ static int hi846_get_selection(struct v4l2_subdev *sd,
> >               mutex_lock(&hi846->mutex);
> >               switch (sel->which) {
> >               case V4L2_SUBDEV_FORMAT_TRY:
> > -                     v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > +                     sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> >                       break;
> >               case V4L2_SUBDEV_FORMAT_ACTIVE:
> >                       sel->r = hi846->cur_mode->crop;
> >
> > ---
> > base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
> > change-id: 20240509-fix-hi846-c3d77768622e
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

