Return-Path: <linux-media+bounces-33552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E409AC70AE
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BC41C00BC6
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 18:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC16C28DF4F;
	Wed, 28 May 2025 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O27ncaaH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FC111AD
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455573; cv=none; b=C9711zYf7yJBJ+aZuN99zsDijWj/A1kE0QdpPwQJK8qQrI7xJknxpPZPQEsky+sdNLmBzSQB44AypyZMWaSJadl4puFaeoqv3ywCbrOA3TOqVI4oNjDcP06LzI0c8O9TgwLLpwniFM8RAHUfh/4MumPhks0u/R37KmLLE0vkKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455573; c=relaxed/simple;
	bh=VRd1lkT9N5ACH+1BjDwXdFBCq75yta6YVidqEhnw3us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIWU/4NhhI1XLInYLGaZIDXStoS4UVYBOe2+6FjNQVYqKCd8y34dQodgr0Cj7ziXUUxjHDWVgIev/pCg5aO5knoZb+kQdvzY8c0M/xkOMFI6nR5xWsWXT31FOlk0xV23QTZ7grHuzsTRuIwJau7xYx6MzYm+R2fSl+/L+nyuY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O27ncaaH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2349282084bso1860425ad.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455570; x=1749060370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+fgzLhtoA+AV7JPQdrF/lZ8VWpagMNnkYPcAKrhW+k=;
        b=O27ncaaHONV8Fpwnyc854cfdEUDy3sR+u7dqsjWjsluZBYimtwqFBsN0EAycBkPVMa
         X5i8avPF4luDglYPYyvdQLOJ1NUefmCyP+Ec5KUhPACUI3HCPQvQcFiAKPqH5aBVU3ne
         xgYdcURZ5/k7hU0vC9qhnWTENVum02bJL9tGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455570; x=1749060370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+fgzLhtoA+AV7JPQdrF/lZ8VWpagMNnkYPcAKrhW+k=;
        b=j9mHnDxIsp63BKJ51r0cgC8ejaqFOJEVyF8Cx+6i8cefS3NOEMG5iFSbBoz/I9jMuh
         /8Qg46xv2rGJY5qWOx5iekASDAzZanMnorMCbfWpHCytoDPkntrWb3zVCbebUYMWPc91
         nqRcpj2QlArM9ynyl24F0B4a03c2YkmBba1X9B0p38z/sPTon2SrMfCYPzB/idBsLpOc
         /B69nJpmWovV5AJ5BLedNQRkojvgdzDLw5Hv4zt4ubeuOrNYYD1ifJawRBLE5/MQJkhF
         ifZqzDIaTNRuwG0GhIBsAh6HFF1jXSesrL8l83glRXG2HCCQLSrwrB0zCWXdITA8FbIL
         FjwA==
X-Forwarded-Encrypted: i=1; AJvYcCVux0IuuRHHnLvtU9FB5CrD5sQuuHOsxBO6XBANB2pm5X96s4wgFzYluTKwOg6hUQQeBWXVklTe4GFPoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydru+6WT13QWllUuSs1YLpEZXT7ZVQllWWaNWYypaPFl/zlhnG
	3eLGPZgb23or/kUoE4MXMcBGuQFmI+l9e40ePMP2EdkfM+dg/f9mwY5NVtc/Eszq6YbqilRwDe6
	7zReFMw4I
X-Gm-Gg: ASbGncv/LSvP5oQUv/pq0rLyENUeA34210yRgxIx/YSNBb78dy/UAU0cIZ4mNlb7Qyv
	Nkg0tttFvcuz/t+cu/IPTCjuQTQBtK37YQL1dNbtH4t76IClCLDr7FHUX7iJULSsh+797aENGYf
	fgj/bCiPyD0pcqqfZlIs8SWm7V86TbF5gIIKI6bO1amljbWuGmvs5MXY6jkOzz4B2OTeHxuv1SF
	/SNcOlIHSfl/nGK5ipIQ3yCvt5GdeoSXCh1qraUTbm3kaJqWGXRzAw+wUlu1oYnYq2MLld5efuQ
	uwyluK/N40nMxihF2bUoNoggVYP0HZNHii/FNWSJrF1/gGamb30hf+/zZ4DHBe1bMtd1hxw+ELs
	immuy8cIo6H63koM/6A==
X-Google-Smtp-Source: AGHT+IFBP5vhct560MWKj6q2E4sc/U0ZSrEapTiJU4TS+FtIr7uxt5OuIVIlEhi5Gkgso/bkaneBeQ==
X-Received: by 2002:a17:902:db05:b0:234:ba37:87b6 with SMTP id d9443c01a7336-234ba379da9mr80600265ad.17.1748455570619;
        Wed, 28 May 2025 11:06:10 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d99e2ce91sm1282758a12.42.2025.05.28.11.06.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 11:06:08 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so109547a12.2
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTUawvCDkQUPcVyTN7scYT7MBSkjEfdCJ8tfc5/fomaq5Dzy2RQw4GExacK4T2eprL9/4ZjTUMVIwCuQ==@vger.kernel.org
X-Received: by 2002:a17:90b:1e11:b0:311:fde5:e224 with SMTP id
 98e67ed59e1d1-311fde5e3a7mr2621369a91.6.1748455567945; Wed, 28 May 2025
 11:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-5-35a2357ff348@chromium.org>
 <64c00146-e6d2-448d-a416-19d5ae7ae3f6@jjverkuil.nl> <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
In-Reply-To: <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 20:05:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCv6vb=o-gizVr33XX2sVfBookaze2S1hkzshUyNNnzTbw@mail.gmail.com>
X-Gm-Features: AX0GCFtPgVMd2juZVahO7Uk3bU64vKS_xa1UhEfT0crKE5AC7K-BWl6NWKkoiUE
Message-ID: <CANiDSCv6vb=o-gizVr33XX2sVfBookaze2S1hkzshUyNNnzTbw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Do not turn on the camera for
 some ioctls
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 15:51, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Hans
>
> On Fri, 9 May 2025 at 15:44, Hans Verkuil <hans@jjverkuil.nl> wrote:
> >
> > On 27/03/2025 22:05, Ricardo Ribalda wrote:
> > > There are some ioctls that do not need to turn on the camera. Do not
> > > call uvc_pm_get in those cases.
> > >
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index 0f1ed0387b2611c8d21e211afe21a35101071d93..668a4e9d772c6d91f045ca75e2744b3a6c69da6b 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -1440,6 +1440,26 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> > >       struct uvc_fh *handle = file->private_data;
> > >       int ret;
> > >
> > > +     /* The following IOCTLs do not need to turn on the camera. */
> > > +     switch (cmd) {
> > > +     case VIDIOC_CREATE_BUFS:
> > > +     case VIDIOC_DQBUF:
> > > +     case VIDIOC_ENUM_FMT:
> > > +     case VIDIOC_ENUM_FRAMEINTERVALS:
> > > +     case VIDIOC_ENUM_FRAMESIZES:
> > > +     case VIDIOC_ENUMINPUT:
> > > +     case VIDIOC_EXPBUF:
> > > +     case VIDIOC_G_FMT:
> > > +     case VIDIOC_G_PARM:
> > > +     case VIDIOC_G_SELECTION:
> > > +     case VIDIOC_QBUF:
> > > +     case VIDIOC_QUERYCAP:
> > > +     case VIDIOC_REQBUFS:
> > > +     case VIDIOC_SUBSCRIBE_EVENT:
> > > +     case VIDIOC_UNSUBSCRIBE_EVENT:
> >
> > Wouldn't it be better to check against the ioctls that DO need to turn on the camera?
>
> I thought it was safer this way. I will look into inverting the logic
> in a follow-up patch.

https://patchwork.linuxtv.org/project/linux-media/list/?series=15601

>
> Regards!
>
> >
> > That is more future proof IMHO.
> >
> > If a new ioctl is created, and uvc implements it and that needs to turn on the camera,
> > then presumably you will realize that when you add that ioctl in uvc.
> >
> > If a new ioctl is created and uvc does not need to turn on the camera, then you will
> > almost certainly forget to add it to this list.
> >
> > I'm not blocking this patch, but I think it will be hard to keep this list up to date.
> > Inverting the test is probably much easier to handle in the future.
> >
> > Apologies if this has been discussed before, if so, just point to that discussion so I
> > can read through it.
> >
> > Regards,
> >
> >         Hans
> >
> > > +             return video_ioctl2(file, cmd, arg);
> > > +     }
> > > +
> > >       ret = uvc_pm_get(handle->stream->dev);
> > >       if (ret)
> > >               return ret;
> > >
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

