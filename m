Return-Path: <linux-media+bounces-16368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C94954403
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 10:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4392D1F247A6
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 08:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC44113A256;
	Fri, 16 Aug 2024 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YCfEYCcm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAE1386C6
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796465; cv=none; b=mWHnsnoGGIX26INERgLWwU9r9DZvYWTvWjVwmkKOBbWMI0rMF9ImKcWSoKsZTTNxTjnp7mAxD/sypo/ww6kgg+wjj9PoMsgSX2m52eEg5y/TG5W3RVuCUBErocLj+O4euiZXp7g5Kurzm7+hq1wGCuwpxjKaEeQEAr7pUnX3SDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796465; c=relaxed/simple;
	bh=pjR5Rw759ocubFmIOUn73J03NLut28Juca+Qkhn2W0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYx6IAGIAnLwPlHZeUSytwzkk7zmfVpokWPzvQs//AkGZcqB2gVJXe4zWZLBVaT1PX/aR7Yq0+cfAFHxOy9Py4eudVmbj98qUikKqLm+4U8X2/eoUunnzc3H5mh74ufvm+/OiWDY1nxYj/zOEDK9bin97Grs96I8gdG1P/X5zbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YCfEYCcm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04c29588so2440845e87.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 01:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723796461; x=1724401261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GnJ6TsYoSud9MApn7rwl8Z23Mz2pLw066Z6s9uY0Fr4=;
        b=YCfEYCcm0FgI9msQ6XNKSUZ4HTgErKbfSllRIAdvJGalaPLENchqTtiyrNO+de/hqz
         TbkAWDy6QJUmQOPuxO94lHj7cO15b+DwzHK9YyoH/BX3BO1+fNfA+r9ipXugRb1RaXpx
         LeUvkht9S4r46/4V4kdMI/vAkvbfmck6IBMAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723796461; x=1724401261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnJ6TsYoSud9MApn7rwl8Z23Mz2pLw066Z6s9uY0Fr4=;
        b=kLi8fxZOcLEtS3Du+GNnMTkOUx46+m7Wx7ay+FflukDtS3/wzwH18JBwU/6ri3OwQj
         dbC96+WSse5RjHUKyd6kZ1BsnIOznXsSwb/WNXn0eCPhoaQzI2QuKepx1EigGpk2b4iw
         MGVL0MODjCombF06v28Y2nRX44lwxoklma1EWIheGBeTFGzE56VjFwGT/OMzPqbrp0uS
         CcFiBrbuiRdWjIyOtpyiJwYkTCcda7tEqFGYh7n8CFhktyCAPsccx9MqxYPXU2CXZh7E
         tsD16B4euWjyYFrtUHcp6gwbS6PX5GIfkDrKfnMpf3IROFXfFgf2IMpPaNKw6MChITdu
         Ywxw==
X-Forwarded-Encrypted: i=1; AJvYcCXaBSW7zkR5/yrno64jgVD+EFoYruSAbXhPGhAxHteU9rfpLlvVH9btpCQVSWpAM9mFlRaaEdXRLWRSpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgtMWEKr4Kky8l/wfn0cUYVhsWWgl/Q6AVU/SiSYESqjabpAe+
	6T6mHGAtF58fEUtBMVzdapQ0zYgNvZwKA9xJY5j1RwIWcJj7xQxOlJ+w0T0/D7/0m43grhPg0xM
	=
X-Google-Smtp-Source: AGHT+IEIEl6xXkWXdgHcIoawlcFCOMUlV7IaZcTa7s3usI/iCIWJpJOS88leUpPVhMFMm7RHQMr2qg==
X-Received: by 2002:a05:6512:3984:b0:52e:9d2c:1c56 with SMTP id 2adb3069b0e04-5331c6b3fa9mr1395043e87.35.1723796460214;
        Fri, 16 Aug 2024 01:21:00 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6687sm221078366b.33.2024.08.16.01.20.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:20:59 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so495365a12.0
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 01:20:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgITRpmY7ZHDAB5qqo3MkHWfyPuWi/64mAgU37xWhqMwmmmnQkc9XQePJuf0A6IlUP1VSxNMWIN3WHYw==@vger.kernel.org
X-Received: by 2002:a17:907:86a4:b0:a7d:34bf:600e with SMTP id
 a640c23a62f3a-a8392a4a586mr121120766b.60.1723796459189; Fri, 16 Aug 2024
 01:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
 <20240814-coccinelle-followup-v2-2-88b4e4a9af56@chromium.org> <20240816101642.5ef4e461@foz.lan>
In-Reply-To: <20240816101642.5ef4e461@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 10:20:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCtk=_Qb4aC15otZiUrdysV2h82ihbA2eP2kWyQSovq=MQ@mail.gmail.com>
Message-ID: <CANiDSCtk=_Qb4aC15otZiUrdysV2h82ihbA2eP2kWyQSovq=MQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Fri, 16 Aug 2024 at 10:17, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 14 Aug 2024 14:10:23 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > Split out the wait function, and introduce some new toys: guard and
> > lockdep.
> >
> > This fixes the following cocci warnings:
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
>
> Hi Ricardo,

Hi Mauro

>
> Every time someone tries to fix this lock, we end having regression reports,
> because of the diversity of devices, and the way they registers there.
>
> That's specially true for devices with multiple frontends and custom
> zigzag methods.
>
> On what devices have you tested this patch?

I do not have access to any device, it is just "compiled tested".

I think that the patch is mainly a refactor, it does not really change
how the lock is handled.

Regards!


>
> Regards,
> Mauro
>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-core/dvb_frontend.c | 58 ++++++++++++++++++++++-------------
> >  1 file changed, 37 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> > index e81b9996530e..7f5d0c297464 100644
> > --- a/drivers/media/dvb-core/dvb_frontend.c
> > +++ b/drivers/media/dvb-core/dvb_frontend.c
> > @@ -30,6 +30,7 @@
> >  #include <linux/kthread.h>
> >  #include <linux/ktime.h>
> >  #include <linux/compat.h>
> > +#include <linux/lockdep.h>
> >  #include <asm/processor.h>
> >
> >  #include <media/dvb_frontend.h>
> > @@ -2826,6 +2827,34 @@ static int __dvb_frontend_open(struct inode *inode, struct file *file)
> >       return ret;
> >  }
> >
> > +static int wait_dvb_frontend(struct dvb_adapter *adapter,
> > +                          struct dvb_device *mfedev)
> > +{
> > +     struct dvb_frontend *mfe = mfedev->priv;
> > +     struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
> > +     int mferetry = (dvb_mfe_wait_time << 1);
> > +     int ret = 0;
> > +
> > +     lockdep_assert_held(&adapter->mfe_lock);
> > +
> > +     if (mfedev->users == -1 && !mfepriv->thread)
> > +             return 0;
> > +
> > +     mutex_unlock(&adapter->mfe_lock);
> > +
> > +     while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
> > +             if (msleep_interruptible(500))
> > +                     if (signal_pending(current)) {
> > +                             ret = -EINTR;
> > +                             break;
> > +                     }
> > +     }
> > +
> > +     mutex_lock(&adapter->mfe_lock);
> > +
> > +     return ret;
> > +}
> > +
> >  static int dvb_frontend_open(struct inode *inode, struct file *file)
> >  {
> >       struct dvb_device *dvbdev = file->private_data;
> > @@ -2840,19 +2869,16 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
> >       if (!adapter->mfe_shared)
> >               return __dvb_frontend_open(inode, file);
> >
> > +     guard(mutex)(&adapter->mfe_lock);
> > +
> >       if (adapter->mfe_shared == 2) {
> > -             mutex_lock(&adapter->mfe_lock);
> >               if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
> >                       if (adapter->mfe_dvbdev &&
> > -                         !adapter->mfe_dvbdev->writers) {
> > -                             mutex_unlock(&adapter->mfe_lock);
> > +                         !adapter->mfe_dvbdev->writers)
> >                               return -EBUSY;
> > -                     }
> >                       adapter->mfe_dvbdev = dvbdev;
> >               }
> >       } else {
> > -             mutex_lock(&adapter->mfe_lock);
> > -
> >               if (!adapter->mfe_dvbdev) {
> >                       adapter->mfe_dvbdev = dvbdev;
> >               } else if (adapter->mfe_dvbdev != dvbdev) {
> > @@ -2862,34 +2888,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
> >                               *mfe = mfedev->priv;
> >                       struct dvb_frontend_private
> >                               *mfepriv = mfe->frontend_priv;
> > -                     int mferetry = (dvb_mfe_wait_time << 1);
> > -
> > -                     mutex_unlock(&adapter->mfe_lock);
> > -                     while (mferetry-- && (mfedev->users != -1 ||
> > -                                           mfepriv->thread)) {
> > -                             if (msleep_interruptible(500)) {
> > -                                     if (signal_pending(current))
> > -                                             return -EINTR;
> > -                             }
> > -                     }
> >
> > -                     mutex_lock(&adapter->mfe_lock);
> > +                     ret = wait_dvb_frontend(adapter, mfedev);
> > +                     if (ret)
> > +                             return ret;
> > +
> >                       if (adapter->mfe_dvbdev != dvbdev) {
> >                               mfedev = adapter->mfe_dvbdev;
> >                               mfe = mfedev->priv;
> >                               mfepriv = mfe->frontend_priv;
> >                               if (mfedev->users != -1 ||
> > -                                 mfepriv->thread) {
> > -                                     mutex_unlock(&adapter->mfe_lock);
> > +                                 mfepriv->thread)
> >                                       return -EBUSY;
> > -                             }
> >                               adapter->mfe_dvbdev = dvbdev;
> >                       }
> >               }
> >       }
> >
> >       ret = __dvb_frontend_open(inode, file);
> > -     mutex_unlock(&adapter->mfe_lock);
> >
> >       return ret;
> >  }
> >
>
>
>
> Thanks,
> Mauro



-- 
Ricardo Ribalda

