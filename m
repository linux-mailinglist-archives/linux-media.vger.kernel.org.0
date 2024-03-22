Return-Path: <linux-media+bounces-7616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19B8869C2
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 10:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970881F26896
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC4C224F1;
	Fri, 22 Mar 2024 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aouaI61O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC2383BD
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711101243; cv=none; b=gk/1IYmPsWQO3tD1jCfzkOKPFYjfGKh9dAqnlR+XZDJ6Tj0X39bxFIHGPWpO+mrtq7UWZi3PvPjAA8HNf4sX6m/pJBUTY1/IZGBafHf3xpQYTkPNpMeILuxQHtzuIWs5s1VXqz3NC4TCbF9iU0xFpxmOHiDOMLFFHLSGHWBO1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711101243; c=relaxed/simple;
	bh=vjqEObL0QUT0FRkhgE1k7Zaz2Z1i6sWZd0ubJaupmIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=najr+jhC8D4oFokJ3wiMi5ES/NFQn25TxRjFhArnfT++CLShOJ5IBTsj/9Musw1COYKPPw48KYn0ShKw+ysRORvBE4cCqGW3vKBln5B44DUUmbLmxkpEmBiyONHevvgnYl3PS0sDwDxMc+S+pZ1vt14vtDPJ0NnNNJRsUFfGF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aouaI61O; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-430acf667afso12294061cf.1
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711101240; x=1711706040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8WbPf4u/guZtL0UBxRr9aD1eeF4y1ReSS6bv+KKsBZY=;
        b=aouaI61O10wMESOg5XL662lDhULohs7faebQWsCOuGc1CQ5xUeiufqpsQJygwG1zk0
         sdXNuQhBEsqypSKYfLghR+Mlqb9NSVcXtwsZqSquVP+lZSfGi9Vt7d9GR5k6tSRsdGcd
         wHLZ7wre65LSlQ7Yqj1C7nN9VuBcbVEK7YSec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711101240; x=1711706040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WbPf4u/guZtL0UBxRr9aD1eeF4y1ReSS6bv+KKsBZY=;
        b=iU7M1wSLy1CDsK/60i7RqXHyifJY6WsZaWMwpSfNf3Tiii90cipoyG/kmqRAr5Ix6k
         fgTy85dvqq68GIPAWjX0b+xWn8pj71Hk7ktRxFaO/AB4KYD59tlrUin7MVE1289v3BJ2
         URI/+rF15PlkF65xyyih62s3/AgJ1rrPo2oN2i94LAdqWG3f17V128XhSt/jtYS9BUmQ
         tiQ+/TUcwckGYRgvq5yCJj8yN68Iqfm9JWmMZUSgL2gw6mirLcYhPAkb4LSoVLtAo8D+
         AFsYaJ4iTNwCwAM44t+BorRitn6fznB35VlsMNmyxCnSbFEBr9SHByiNCfcHvgDGOmb5
         OIAg==
X-Forwarded-Encrypted: i=1; AJvYcCUGFljHU44bQWKPzTD5ya+sNZZvXJ+gRtnqIekMwMrP7xROxunmdZljDY1i9bYDh3bWQzi2gw3mgYBokAXxWynKaKzTK4eV0x+nUyA=
X-Gm-Message-State: AOJu0YyVIVhQPAPC2xfduRvhz9Y1MezwPGm6Ez8h4QJxoIWHGGIHwc+D
	eZMd2wl0MK4wU7hlybWgO2ld3lFTTrXiF5XygleV68MCQrhwpKL4wRSpp8vpfYxzG2V8t5tJR3g
	=
X-Google-Smtp-Source: AGHT+IGe0SORMJa+9EjeeYkariYMRkXoVl1icluVU0zm4DBW3e/gQnbPeuwuDYBMIGqLV6MUxFKLvQ==
X-Received: by 2002:a05:622a:393:b0:430:d2ed:3bbe with SMTP id j19-20020a05622a039300b00430d2ed3bbemr1739653qtx.59.1711101240058;
        Fri, 22 Mar 2024 02:54:00 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id ex9-20020a05622a518900b00430bcec5432sm730786qtb.85.2024.03.22.02.53.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 02:53:59 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-69670267e87so1535696d6.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 02:53:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxddemWysOtSueMlfxg+blqg2xd+k4aWyI0yinWawmTpHG3k1oFdfHTIceqIXJ6a8tZ0eyGDztxvXDc/ImhX+mxsNaGcA1iR/tm7k=
X-Received: by 2002:ad4:5e89:0:b0:696:45f2:a3f4 with SMTP id
 jl9-20020ad45e89000000b0069645f2a3f4mr1891856qvb.63.1711101238442; Fri, 22
 Mar 2024 02:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-6-55a89f46f6be@chromium.org> <20240322093522.GN18799@pendragon.ideasonboard.com>
In-Reply-To: <20240322093522.GN18799@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Mar 2024 10:53:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCvZc9CyqkJ5Noz_vzisErVk+dzHW2GUGchQnG2h=d6oTw@mail.gmail.com>
Message-ID: <CANiDSCvZc9CyqkJ5Noz_vzisErVk+dzHW2GUGchQnG2h=d6oTw@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] media: uvcvideo: Fix hw timestamp handling for
 slow FPS
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 22 Mar 2024 at 10:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Mar 15, 2023 at 02:30:17PM +0100, Ricardo Ribalda wrote:
> > In UVC 1.5 we get a single clock value per frame. With the current
> > buffer size of 32, FPS slowers than 32 might roll-over twice.
> >
> > The current code cannot handle two roll-over and provide invalid
> > timestamps.
> >
> > Revome all the samples from the circular buffer that are more than two
>
> s/Revome/Remove/
>
> > rollovers old, so the algorithm always provides good timestamps.
>
> Wouldn't it be better to support multiple rollovers instead ?

I believe one second is enough to provide a good ramp for the clock
interpolation,
with as little as 1/4 we are getting results good enough to pass CTS.

To support multiple roll-ups we would need to keep track of the
"generation" of every timestamp, and numerical overflows will start to
be an issue....

IMO it is better to fix what we have broken and If we ever need more
accuracy we could add a follow-up patch later.


>
> > Note that we are removing values that are more than one second old,
> > which means that there is enough distance between the two points that
> > we use for the interpolation to provide good values.
> >
> > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h  |  1 +
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 1db0d1bc80e6..c58b51207be6 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -471,8 +471,31 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
> >  {
> >       unsigned long flags;
> >
> > +     /*
> > +      * If we write new data on the position where we had the last
> > +      * overflow, remove the overflow pointer. There is no overflow
> > +      * on the whole circular buffer.
> > +      */
> > +     if (clock->head == clock->last_sof_overflow)
> > +             clock->last_sof_overflow = -1;
> > +
> >       spin_lock_irqsave(&clock->lock, flags);
> >
> > +     /* Handle overflows */
> > +     if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> > +             /*
> > +              * Remove data from the circular buffer that is older than the
> > +              * last overflow. We only support one overflow per circular
> > +              * buffer.
> > +              */
> > +             if (clock->last_sof_overflow != -1) {
> > +                     clock->count = (clock->head - clock->last_sof_overflow
> > +                                     + clock->count) % clock->count;
> > +             }
> > +             clock->last_sof_overflow = clock->head;
> > +     }
> > +
> > +     /* Add sample */
> >       memcpy(&clock->samples[clock->head], sample, sizeof(*sample));
> >       clock->head = (clock->head + 1) % clock->size;
> >       clock->count = min(clock->count + 1, clock->size);
> > @@ -605,6 +628,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
> >       clock->head = 0;
> >       clock->count = 0;
> >       clock->last_sof = -1;
> > +     clock->last_sof_overflow = -1;
> >       clock->sof_offset = -1;
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 07b2fdb80adf..bf9f5162b833 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -499,6 +499,7 @@ struct uvc_streaming {
> >               unsigned int head;
> >               unsigned int count;
> >               unsigned int size;
> > +             unsigned int last_sof_overflow;
> >
> >               u16 last_sof;
> >               u16 sof_offset;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

