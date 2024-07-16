Return-Path: <linux-media+bounces-15035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16493218E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0531A1F2294D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 07:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAAE55887;
	Tue, 16 Jul 2024 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XUFB1NY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD633A28B
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721116715; cv=none; b=RHMQqoSNnHoLHta1N4I8o3ErQBisLdRHNfJ8pU3dnrWlVzNoNtorp0qltUF1NDiu0U2/WCC9WMB4/baLcp59W5j6XLNWnDCcWbEiiAidvDqixgPqeF7AQjMWqUf7+YFH1B5TqXR3dkondAl9GXt3SYpeYKgS5TgIsupRuHY/ciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721116715; c=relaxed/simple;
	bh=CrreSbAjmImz4EteMaMuO0v7SCe483gsNTGFCzQY1II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1f84Sb1sQNRi+ulY7t09zpDCZXcVJ6mOsxII1LZpz6ovu2epdMsdgDvuOsEguqdzoTFFz8lVHE9HxKtWF6/GWM4Vfm8mkIPw+1mR34iLbkzWvyCsrdFRfz8awTofMqQNI3vqfsREigb9M6py8LQesPn4nvyG/DkJhXiyNkea/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XUFB1NY8; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-65f9e25fffaso27953777b3.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 00:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1721116712; x=1721721512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=poqDzwlJcYF+g0GvkAy1bFVLo1qDziWZK9LGkKpNMzo=;
        b=XUFB1NY8eh24ZT5w+8nympRyEGQ7+q1rzHUGGNWMUvjv77vu+kYyIZz7NeINwfHYfa
         nJi17KqoR7MGinmPzLY78p9aI0f/spUO7F7E7rUFxIdKaGT9M1bjpB5kWAnGeEifTFcX
         Z1HiCCZnJd3znD/hEjs7J0iYG5pA+C1qH7EqXENjRttyZYqVlF6yDuD0iGw5xF9dP7BY
         +GGqGaVA75CFCGZqQ+m6MHIa/ZyuVOU4cpmpXLGEU+EiVt1T7w+mksU2jpv1g13TwsTZ
         pdcgW6uxciERQtv9gKXA8ckR2RKlA1Fr9njFuUupJ529V3zAwoEDMT964wVpi3lSXkBv
         RpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116712; x=1721721512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poqDzwlJcYF+g0GvkAy1bFVLo1qDziWZK9LGkKpNMzo=;
        b=Cn4Y/dBsSsaJMulHGVq+sRTMlRj5djo9tneItxW1DyN0YTvB2XYNy1aB+ThiZTLgeu
         2/P9H2cIA+EefdZ8SmZMnSG83Jms6i24IyHViw4rKqBJSj+qsiVCDZRnMbvp+gMPZNC0
         qhgSu5DpMGugaUgaFKpvitRZ4ZdckB6Y5Qt3NXJpllHazbyeTqCajYFEWqFDNp839sf8
         4apNR4eH4aYbQWnZDyP0eU2fUdqiMhhTf6WuXluRPEx89C3GOUPBQ35Y6JTpy+AxAYJJ
         k8tfSVaxaPp0XmHvUoSAuxP+OI8wotiMNT6U2D0DF14C02cPUToY0tK6O4JOFOB7//Y/
         NrDg==
X-Gm-Message-State: AOJu0YxI2R2X6c5ViwBfrBcR1jCbn4jnQAVxHB0IDUGfOwqJWku3lu+d
	Ics9YOgpeFw2IQR562mq0XExxXkDenosQBIl3MEfq/LRpou+1S2snZceImFMUMK6SrTpe+UPi2b
	sNimSTKruB9qHhHcTorubinwhuJ296tIs2M39SQ==
X-Google-Smtp-Source: AGHT+IFAJKzxaseMRIZM0dvT0kXA3OCTgrxc21OFJhMogkiHoq9/SrpLrDYQBLXzlBxFQtZSfr3FumVWqfE3Pu/4RoM=
X-Received: by 2002:a0d:e4c1:0:b0:61a:c316:9953 with SMTP id
 00721157ae682-6637f2bab70mr17264387b3.11.1721116712057; Tue, 16 Jul 2024
 00:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715102425.1244918-1-naush@raspberrypi.com> <t4zv56rnrprztgyjyjx3k3lzaitddky3c22bqslykq3qvxi7gi@jaafmm5uw6rs>
In-Reply-To: <t4zv56rnrprztgyjyjx3k3lzaitddky3c22bqslykq3qvxi7gi@jaafmm5uw6rs>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 16 Jul 2024 08:57:56 +0100
Message-ID: <CAEmqJPrUbK-gpHfJG84iBeA_9WOJYLDoa4JaGjLvZYoq-nUgdg@mail.gmail.com>
Subject: Re: [PATCH] media: pispbe: Protect against left-shift wrap in V4L2_COLORSPACE_MASK()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

On Mon, 15 Jul 2024 at 15:30, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Naush
>
> On Mon, Jul 15, 2024 at 11:24:25AM GMT, Naushir Patuck wrote:
> > Ensure that the user requested colorspace value does not wrap when
> > using the V4L2_COLORSPACE_MASK() macro. If the requested colorspace
> > value >= BIT_PER_LONG, revert to the default colorspace for the given
> > format.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>
> Thanks for handling this
>
> > ---
> >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > index e74df5b116dc..bd5d77c691d3 100644
> > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -1124,8 +1124,9 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
> >        * not supported. This also catches the case when the "default"
> >        * colour space was requested (as that's never in the mask).
> >        */
> > -     if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> > -         fmt->colorspace_mask))
> > +     if (f->fmt.pix_mp.colorspace >= BITS_PER_LONG ||
> > +         !(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> > +           fmt->colorspace_mask))
> >               f->fmt.pix_mp.colorspace = fmt->colorspace_default;
>
> Isn't it better handled in the macro definition itself so that future
> usages of the V4L2_COLORSPACE_MASK() macro won't need to be protected
> like this one ?
>
> Would this silence the smatch warning ?
>
> -#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
> +#define V4L2_COLORSPACE_MASK(c)        BIT((c) < V4L2_COLORSPACE_LAST ? \
> +                                           (c) : V4L2_COLORSPACE_LAST)
>

I did consider this, but did not like the undesired behavior it would
introduce.  With your suggested change above, we now switch the color
space to an unsupported value (V4L2_COLORSPACE_DCI_P3, assuming we
shift by V4L2_COLORSPACE_LAST - 1) if the user passed an invalid
value.  Of course, this does subsequently get fixed when used in
pispbe_try_format(), but not for the usage in pisp_be_formats.h.  In
my original change, we revert to the default for the requested format
instead.  Although, perhaps my test should be if
(!v4l2_is_colorspace_valid(f->fmt.pix_mp.colorspace) ... instead.

I'm ok with changing the macro considering the UAPI is unlikely to
change, and usage in pisp_be_formats.h will likely not hit the problem
any time.  Thoughts?

Naush

>
>
> >
> >       /* In all cases, we only support the defaults for these: */
> > --
> > 2.34.1
> >

