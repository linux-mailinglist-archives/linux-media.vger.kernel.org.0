Return-Path: <linux-media+bounces-36374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE44AEED51
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD813B979B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 04:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA49E21128D;
	Tue,  1 Jul 2025 04:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DDbEIsbN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC71E5B7C
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 04:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751344824; cv=none; b=iS1I3J8eU9POxoRjxldDIqHd/VgInPO6Xs2qMRc8j987m1lTx2G0n3E2lvGAlpFh8gn2azN5SnxiL93EObSbNaKEy3s7yPpi0ZeT5kIQYhNhYdXARRpTuVKYjbFoIjmUUqqx7kDoMPI8H7oMBcHKJ5rdUFgP+o+o9BpSJeg0fOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751344824; c=relaxed/simple;
	bh=CYmy2H6dallMLWHK/Xm8cQj0mMftS1YKv0q1HOUJcE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNpuhS7uj/NaE0xEw3rEk8QqF8H0AofiK4pzMSeWtgoilY1c8kPDwdWGJBiraW/cPbU4hABISelaKFqymB3otomM8JV0vGurKYKG4/Z0nkPJdg+I3xlPyJIB4N9HRF+dbCxw6c11kVf2bwu7ZD915x5Y52TOYP3Qs9ZP3SP8wkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DDbEIsbN; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso26209441fa.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 21:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751344820; x=1751949620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ttKaGOM1HLHnoSRZq1EsamPtO7ym6WKYXwUSXbl5tM=;
        b=DDbEIsbNmO2zh+/dXij8l9OLF3FjuWdzMHDmv9V2waTcPl2GbwojiKPfmMq9v7DJNS
         zlnq63y61kw4ru8o5xT+zpnq21hghTWedRaOEEbFP9B2+Y57Ujf7QoNmJPOTxaOmiPU6
         eRrLRlJlGgxL/PvggfUTpGo4d4TNB+yVG7FtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751344820; x=1751949620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ttKaGOM1HLHnoSRZq1EsamPtO7ym6WKYXwUSXbl5tM=;
        b=k0yOJHKZJ7adM+fYO8n0Bp3+zxowx7Vymp4oiBQ/ttbKZwDHPjk/CFM83EDkoEXRcp
         mkeVPwdVmm95auddVwMIfjl/NWhyhDaIbGrrUsAMtuVRqNfeN9iDGWoB23uN1l7m5iNS
         BXqwqK9rYh8E8frY3qdrCuKSeZWT0X3UMDOqmEC76As13KRAU9GKX0/fF5hKcKkdT+07
         2zqtzaXDDCfNT6r/w8bJ0woCRw0nHW1oAiSOay/HizgWlhNlAcn8XSOZabsJXUwI+fPb
         Kpgd4+lr13KgaLJgYdzcs9zmdcqbUkWrzldY/dmfjLiJBznbedghbSduTIYzoQExm+wz
         p4XA==
X-Forwarded-Encrypted: i=1; AJvYcCUstNFRmAGa0WD3Gjfgg35ConYgJqFgZEcAuooxzsAN2KMtqOKYzdxhhPOviwBLyO6h8X5SL2h9fKZsQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsDC/3ohHADjsasFS6/amWMRQoAdbjTobhp1K0PXr2CFXD6ZR
	bbVtoErTsQVF+wTwQ8qFueY3TR1afzRget4dJhpDkxsSt0JPfpnX2c0VeQBjKnQq+29IzWCXcya
	2KmMjbQ==
X-Gm-Gg: ASbGncv2s2NEoyjVqXRRyWHQQTaJU7NxdaML2U5UtmWzpscajaqzCjy9rLcdLilp6WD
	3E7VGBmtrHKK0T8IcvdppJRGc/8y8sY2n8LJH+aHJbzTmlJu2Kt+3O4q7wQQeuDzGuzjxEEJk0v
	m7JfZoKwNXR9K8HKkQ4asetVu7kfrDq63BUoYtPLbUojZvF2m7EI16ohmRfa/fcVlDbcLF5cWKj
	UzTfpUdoTYnv/tP/x70XZ37GMGA7c4/WNq4uvT544w7yF1vWAfha6nEAL38CWmjoHN8zC6N8E9z
	j/TKa3P+kna1g/ks8lowzvA3XrCfkFHnAJasZ3dA2rpz4jqwp/Fo5bhFxCuWTDNGCvmzw4WVqwo
	/HyiFCyNYYaKichc6eJo5UOeIZisDAstckV8=
X-Google-Smtp-Source: AGHT+IG8k5kxdnbW85pxNYJaHUKGq8XBB276ZF6X9TlbTfcMxGG3EnVESJHBGSR+BnBIHO1qI+xKPA==
X-Received: by 2002:ac2:4c54:0:b0:553:cfa8:dd25 with SMTP id 2adb3069b0e04-5550b81122cmr6541972e87.3.1751344820185;
        Mon, 30 Jun 2025 21:40:20 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec6974sm14232211fa.54.2025.06.30.21.40.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 21:40:19 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3124905e87.0
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 21:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqRoCj5txkAofFKSBWdlm2hJ8bMeyxX+arVg2WVJL+4zK/lTYSubIMfgn+gzRPthU0SyH6J9kRg+AOUQ==@vger.kernel.org
X-Received: by 2002:a05:6512:6d0:b0:553:2def:1ae8 with SMTP id
 2adb3069b0e04-5550b8b0b26mr4937295e87.30.1751344818626; Mon, 30 Jun 2025
 21:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
 <20250630-uvc-grannular-invert-v3-6-abd5cb5c45b7@chromium.org> <20250630221439.GB15184@pendragon.ideasonboard.com>
In-Reply-To: <20250630221439.GB15184@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 06:40:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCvhqp-m6=Tijrk77KpHAQJV3XA5WpbYmprwhQaTsikwdg@mail.gmail.com>
X-Gm-Features: Ac12FXwBINTRyFxGvfZfPUmWTCRuWET0Fgjjg3b8Tw-xFADZ51wdeV9Hi008xwg
Message-ID: <CANiDSCvhqp-m6=Tijrk77KpHAQJV3XA5WpbYmprwhQaTsikwdg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] media: uvcvideo: Do not enable camera during UVCIOC_CTRL_MAP*
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, 1 Jul 2025 at 00:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Jun 30, 2025 at 02:20:31PM +0000, Ricardo Ribalda wrote:
> > The device does not need to be enabled to do this, it is merely an
> > internal data operation.
>
> How about the following code path ?

Ups, thanks for catching this.

I will probably rename uvc_ctrl_add_mapping() to
uvc_ctrl_add_xu_mapping() in a future set.

Regards!

>
> uvc_ioctl_xu_ctrl_map()
>   uvc_ctrl_add_mapping()
>     uvc_ctrl_init_xu_ctrl()
>       uvc_ctrl_fill_xu_info()
>         uvc_query_ctrl()
>
> ?
>
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff..350cd2cc88f872d2e8bd19e2b8fb067894916364 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1178,10 +1178,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >       void __user *up = compat_ptr(arg);
> >       long ret;
> >
> > -     ret = uvc_pm_get(handle->stream->dev);
> > -     if (ret)
> > -             return ret;
> > -
> >       switch (cmd) {
> >       case UVCIOC_CTRL_MAP32:
> >               ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > @@ -1197,9 +1193,15 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >
> >       case UVCIOC_CTRL_QUERY32:
> >               ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
> > +             if (ret)
> > +                     break;
> > +
> > +             ret = uvc_pm_get(handle->stream->dev);
> >               if (ret)
> >                       break;
> >               ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
> > +             uvc_pm_put(handle->stream->dev);
> > +
> >               if (ret)
> >                       break;
> >               ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
> > @@ -1212,8 +1214,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >               break;
> >       }
> >
> > -     uvc_pm_put(handle->stream->dev);
> > -
> >       return ret;
> >  }
> >  #endif
> > @@ -1226,6 +1226,7 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >
> >       /* The following IOCTLs do not need to turn on the camera. */
> >       switch (cmd) {
> > +     case UVCIOC_CTRL_MAP:
> >       case VIDIOC_CREATE_BUFS:
> >       case VIDIOC_DQBUF:
> >       case VIDIOC_ENUM_FMT:
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

