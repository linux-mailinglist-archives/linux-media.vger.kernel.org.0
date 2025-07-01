Return-Path: <linux-media+bounces-36464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3CAF03B9
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 21:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A295C4E652E
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC77280331;
	Tue,  1 Jul 2025 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iNwdXlzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4726E6FE
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397977; cv=none; b=YmVneLv/holBdKBsBCfrg7VZOxwn0hLxWW6F+9dYjBV0lqMCP4UjTwJg6NsR5DSKq1bb+xN1fIjOLBL78T9ohzS0DGxJpXB2ACJC5lN1kuGXwyRd8u89aa7EkDFulE78cPtJiditzyakOQtJoS5nFDpuklL+DPpJZnURSGI2arc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397977; c=relaxed/simple;
	bh=cwajf2NZRN6+ve8yn+VW0OKQnhusAApLlfPHRPDUiGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3TgMK5zxOVtdWlIBQaKlJpDZQqJ+s88/5Qa9ffZy8QBXKyzfyLDOov+szI7z012arbMGHDHJ/HV5tkVp5Qq6YUtyeNx7IVb/TsXyrAhR6ITbsMFyWX2ksSFrdx3dLPv0u8xua0PQ3io5jETH9tjPkGh4AmbMbQ3OUbOgHhjXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iNwdXlzd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b5165cf5so8126703e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751397974; x=1752002774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4utgEvH9OCXANPspYqWuw9qzjmvBfVTuyM3bVpcn8U=;
        b=iNwdXlzdrRpEafhsPioK3mLOjuAK4Y5MEq1/sWN5noXCUIjmwiLsVzrruot5z6fcWu
         q0JRb+LgBRK6Rv89EI+hhN/lSlgUP++PYfsUsdUt6T/xvnJ9V6uoYjTb4R1V0qugC8Ek
         Y8ANFRTIyxXQwhOZQo6GZYqGc2F1NRW1JwbbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751397974; x=1752002774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4utgEvH9OCXANPspYqWuw9qzjmvBfVTuyM3bVpcn8U=;
        b=f4Mja3vbywMb+Mfi7GRGqpmJ5x+kJXnlFal0Y2zTGtUMjav2e66vZOxdij6CBFSDwt
         fPy0Lfv0ODOrAbCGY/Pyx3vTSTh3oM16pXNFk+rXZZSnejmbXJMztZ4V6JshlCbwXaDF
         8XwvqJdmK3J1uv/G0NhXj8WzOLLwcOnOLyDq2itb4CSAbHyv6TVLj6ZbRC7nO9285wKf
         qzvysxaxMYOOhLNczlFGS/n94L+jKucuVvFcFuv4N6HJr/mSGzjBnDuWQL7yFUcy3i8f
         Z8S15L5PXT1QygkOXEM1vtZJUMLLsS1d0CX9VzcrI9nzMbZ9lbXv5LoNZFffxlfxNh2j
         RpxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy+z4vuBY1R7eQyRkEDv8CQ1H/dkFkuPpWtMbGABDTmqUg/lzj6vHCIFRE1GFcGZb8Xy38DBBBbZ09bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCH3hvMz4/HjdkQqi9GUu43zo3LmJRkAdyc89WYCXReQbjNbGf
	NmbL/itqgpTnGwG+i0gyxrZKHcPOFVQgtQ93Ctj7DcdBoQg6RHMG7Bh92hKlGQNF+AWqlg5xuTy
	Oq2VulA==
X-Gm-Gg: ASbGnctFmIvBKffpXSgO7Ogh8gfPZ+xgo5C7g5Z3bKdW/YoIfmtk9RnBa5ZP5d3rNnA
	Z+ygD0qjiU3KfRjqNyuOEQn1oZoViKNzJkhMfwTlfHadReMYf6MOtymsKikdY4ooOawa5D31Etr
	m9l8RDV7R+79+elOiXsrImNvoinrCHqVX2vGKdFIhrKsElEvxLN+UBtjsgKFBpafzahCSEhGt6p
	OBIvuP1cq8CZ5ZOVTHVGHYPCtpTc7aJy5j32PTatzZxQR1YKY2CLuhtotN/YALYBoBRP2RDqZ8z
	aG/6a0KMsDENjxANf1YdZcUAJEpRT0p9CapGIOBgavdDTj6xZ3AVz01j1R6laieKsHJ6u90d+Y8
	HiJLth5fokehPyxpdgsE++f/M
X-Google-Smtp-Source: AGHT+IFan4zSrgLleQONNx0rL2peJffiy2SDsjc1hya4oe39hvuvv70Kq/Ob8n/so/1/KQ2f+0C1GA==
X-Received: by 2002:a05:6512:110f:b0:553:2edd:a7e0 with SMTP id 2adb3069b0e04-556282c133amr60892e87.16.1751397973667;
        Tue, 01 Jul 2025 12:26:13 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c5da6sm1898773e87.151.2025.07.01.12.26.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:26:12 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b5165cf5so8126655e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 12:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHOeF3ApJ14+MwvypH9X7OlFz37pPD7/iKf+ECyh3297zAJ+SYRUHZjr36nk411ccM2iZo67TU4d4omw==@vger.kernel.org
X-Received: by 2002:a05:6512:1293:b0:553:2868:635c with SMTP id
 2adb3069b0e04-5562834a344mr50157e87.48.1751397972437; Tue, 01 Jul 2025
 12:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701145240.105959-1-desnesn@redhat.com> <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
 <CACaw+ex_T5xS9rw1651TV_z1myXxPGmtpeEB4HWA7S0xU+C9GQ@mail.gmail.com> <20250701184134.GC1936@pendragon.ideasonboard.com>
In-Reply-To: <20250701184134.GC1936@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 21:25:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCt5OZ8dAvZ7G_fic6eCaCsGvmnprjmG9p_9kLbv9cX76A@mail.gmail.com>
X-Gm-Features: Ac12FXwM6kmb2sRGcL5AthygUsvgAzOtk6TXflHlfutcb8FC2IwoXTjoll11H3w
Message-ID: <CANiDSCt5OZ8dAvZ7G_fic6eCaCsGvmnprjmG9p_9kLbv9cX76A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Desnes Nunes <desnesn@redhat.com>, hansg@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Jul 2025 at 20:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 01, 2025 at 02:20:53PM -0300, Desnes Nunes wrote:
> > On Tue, Jul 1, 2025 at 1:48=E2=80=AFPM Ricardo Ribalda <ribalda@chromiu=
m.org> wrote:
> > > On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
> > > >
> > > > This avoids a variable loop shadowing occurring between the local l=
oop
> > > > iterating through the uvc_entity's controls and the global one goin=
g
> > > > through the pending async controls of the file handle
> > > >
> > > > Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM cou=
nter per IOCTL")
> > > If you add a fixes you need to add
> > > Cc: stable@kernel.org
> >
> > Thanks for letting me know
> >
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/u=
vc/uvc_ctrl.c
> > > > index 44b6513c5264..91cc874da798 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *d=
ev)
> > > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > >  {
> > > >         struct uvc_entity *entity;
> > > > -       int i;
> > > >
> > > >         guard(mutex)(&handle->chain->ctrl_mutex);
> > > >
> > > > @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handl=
e)
> > > >         if (!WARN_ON(handle->pending_async_ctrls))
> > > >                 return;
> > > >
> > > > -       for (i =3D 0; i < handle->pending_async_ctrls; i++)
> > >
> > > nitpick: I would have called the variable i, not j.  For me j usually
> > > means nested loop. But up to you
> >
> > Noted - I used a different variable name because I wanted to
> > differentiate the loops.
>
> Variable declaration in the loop statement is relatively new in the
> kernel, so there's no consensus yet (to my knowledge) on clear coding
> styles, but I would have simply used the same variable name in both
> loops, with two separate declarations:
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 303b7509ec47..6b9486749c3f 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3299,7 +3299,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3317,7 +3316,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>         if (!WARN_ON(handle->pending_async_ctrls))
>                 return;
>
> -       for (i =3D 0; i < handle->pending_async_ctrls; i++)
> +       for (unsigned int i =3D 0; i < handle->pending_async_ctrls; i++)
>                 uvc_pm_put(handle->stream->dev);
>  }
>
> Is there a downside to this ?

The toolchain that they are using does not seem to like it, and there
is no benefit for having two initialization vs one.

(also makes the lines shorter... but that is just a matter of taste).

I don't really have a preference.

>
> > > I am also not against your first version with a different commit mess=
age.
> >
> > Third time's a charm then!
> >
> > Will send a v2 with the first version having this commit message.
> >
> > Thanks for the review Ricardo,
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

