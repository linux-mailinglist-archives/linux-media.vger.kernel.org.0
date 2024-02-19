Return-Path: <linux-media+bounces-5426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFA85A70A
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 16:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56BCD2815EE
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 15:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6691939FF8;
	Mon, 19 Feb 2024 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oBGA5i0r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C7381D6
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355252; cv=none; b=qSdpBPuDVNpi2noHgPt4SpbyCwXUyKh6zm/frTCvhEswiDCeYnpXPg58/TduJyInA0fVrTFiMsJV1hRn998ttiWwQLkHxUwQdXXTnJchqsMWbFpfuCyQodKjX+cEIsahS+OdZm0fg6IWi2IpUZvJO2zkP0JALbk54L3l6rogT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355252; c=relaxed/simple;
	bh=k3ZpLmugxJI2lN4OSzxdrG3rd3He9lfcuqv7S/sFMB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuXne/rZ5mX2FzyEOii9zRmZKXLuuBN7d31ZL0rR/0ShiArUfcpxJaEVecDrK0QDHtih2FItWZjSNXyGga4+un1mQOVR92DpwnptJJ1Wsd6j7/TcG46/cB+4SgceslNlQ+qBfJ4wMAnp8sVEXhVnONNP4awyI3LGb11VwpQpTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oBGA5i0r; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6861538916cso27211896d6.3
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708355250; x=1708960050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2nL77bInzFplBZ+VWzOztLM8N7iZgudzQjJjsipF2Gk=;
        b=oBGA5i0rXzi34zZluVJWTXbAnqqr2PzmWYlS9Fm1fvgYPbb2MBakiLD3FRN5NNUDpe
         VEB+6DzPSx756x6rTPWOE4RRbu0mVaQJWNCtbURGxrafTkaQQsuWgRkQdCIgqIfbRgoB
         CbK1VTm70u9WUcRvZgsJV/KLv/vYidI9ngmGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708355250; x=1708960050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nL77bInzFplBZ+VWzOztLM8N7iZgudzQjJjsipF2Gk=;
        b=P68kwXj/jEW4xoy0ukR8UzYiIU09bmEWlE8/V70EcqdDVWc2ou9tL7O8kE0Vg0iH6r
         ictMy5T5b0v+EQ1XQCkNtBrm+bdR7WJKC1TPlbR74yr+oT1Uva1DADx/YuYRJQ8dBhLC
         KxjCSoBTng8rnlJt8Hp9+7kGTx7EFSibF03X/hpg/RyGuT6axOve9JHEQe7trG9Cj6zz
         HvNUqlzLQjvTJCHeMroC6X1FJUMqFDHZlaw/KB586n+5/ZbGAYgsJN9OrfSNFTNCZ9DH
         G3rbjiXaBIonnUg6O9QWettj2y2ols6lmSApS07/6Z7RdQYNAqR5BXD+OuO6IMK8vV/J
         j9ng==
X-Forwarded-Encrypted: i=1; AJvYcCVphDCRUj0mjbUI8OFcj+ZmtAvOYhlqDn6ZQ1kZILniZrC3ot9n2fQiTtD45lbtnPvr8U+o8tJkPNYZrf4Egk7A2yOfEmdE8zgRHNM=
X-Gm-Message-State: AOJu0YzLx7WInsUM0ZXNN+VgNn/Q8+/Wl+/nWh5T2l5qHNlUitFV4/xF
	aJHEZFlnYeZZxf1laRICs7AYwutRvMiQ3/yEfVq8qH8KCuamktjljWfrHl5itrL3eaMJUZkT/Gk
	=
X-Google-Smtp-Source: AGHT+IHc3wHOBa0fRA7FdQfleB9qArJ6LoGHOS3flRi3J9cdI+pdt8hP9gaNCxkRZjrKOfBTn3YoKg==
X-Received: by 2002:a05:6214:21e8:b0:68f:60fd:d328 with SMTP id p8-20020a05621421e800b0068f60fdd328mr5056115qvj.43.1708355249705;
        Mon, 19 Feb 2024 07:07:29 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id pd2-20020a056214490200b0068f59567778sm2220512qvb.127.2024.02.19.07.07.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 07:07:28 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68f571be9ddso13867796d6.0
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 07:07:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhNZPivx/N51KgMcxNEkY9QFDRt5jBaO1dGzJrubs+iFSbsLJlRjGxL02Mf9dNgcyyYtO5pyVGKsmXJDCoTOGkar1IqhqeYJDDrIM=
X-Received: by 2002:a05:6214:62c:b0:68f:611d:9a2b with SMTP id
 a12-20020a056214062c00b0068f611d9a2bmr5361673qvx.63.1708355248348; Mon, 19
 Feb 2024 07:07:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-1-55a89f46f6be@chromium.org>
 <20240212225940.GA19316@pendragon.ideasonboard.com> <CANiDSCuoskaERyyzuLen+ReGHBNnOrFducbWYAvFQ6HfbUCPcg@mail.gmail.com>
 <20240219104046.GB13043@pendragon.ideasonboard.com>
In-Reply-To: <20240219104046.GB13043@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 19 Feb 2024 16:07:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCsqYHModDZCi2hooDYsFgu+bN_OioBGEJQJuZgdiJO=ug@mail.gmail.com>
Message-ID: <CANiDSCsqYHModDZCi2hooDYsFgu+bN_OioBGEJQJuZgdiJO=ug@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] media: uvcvideo: Fix negative modulus calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 19 Feb 2024 at 11:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Feb 19, 2024 at 11:28:03AM +0100, Ricardo Ribalda wrote:
> > On Mon, 12 Feb 2024 at 23:59, Laurent Pinchart wrote:
> > > On Wed, Mar 15, 2023 at 02:30:12PM +0100, Ricardo Ribalda wrote:
> > > > If head is 0, last will be addressing the index 0 instead of clock->size
> > > > -1. Luckily clock->head is unsiged, otherwise it would be addressing
> > > > 0xffffffff.
> > >
> > > I'm not following you. In the expression
> > >
> > >         (clock->head - 1) % clock->size
> > >
> > > clock->head is an unsigned int, and 1 as a signed int, so the result of
> > > the subtraction is promoted to an unsigned int. When clock->head is 0, the expression evaluates to
> > >
> > >         0xffffffff % clock->size
> > >
> > > clock->size is a power of two (hardcoded to 32 at the moment), so the
> > > expression evaluates to 31, as intended.
> > >
> > > Am I missing something ?
> >
> > Take a look to: https://godbolt.org/z/xYeqTx6ba
> >
> > The expression only works because the size is a power of two. In this
> > set I am allowing sizes that are not powers of two.
>
> Could you then update the commit message to explain that ?
>
> I'll review the rest of the series this week.
Thanks

Will update with the following text after the review:

The tail of the list lives at the position before the head. This is
mathematically noted as
```
(head-1)  mod size.
```

Unfortunately C, does not have a modulus operator, but a remainder
operator (%).
The reminder operation has a different result than the modulus if
(head -1) is a negative number and size is not a power of two.

Adding size to (head-1) allows the code to run with any value of size.

>
> > > > Nontheless, this is not the intented behaviour and should be fixed.
> > > >
> > > > Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_video.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index d4b023d4de7c..4ff4ab4471fe 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> > > >               goto done;
> > > >
> > > >       first = &clock->samples[clock->head];
> > > > -     last = &clock->samples[(clock->head - 1) % clock->size];
> > > > +     last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
> > > >
> > > >       /* First step, PTS to SOF conversion. */
> > > >       delta_stc = buf->pts - (1UL << 31);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

