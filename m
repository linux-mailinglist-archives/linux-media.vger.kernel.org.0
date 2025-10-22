Return-Path: <linux-media+bounces-45234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B68BFBD8E
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B48518C4D11
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B33344032;
	Wed, 22 Oct 2025 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L8wu3/Sq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C98343D71
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761136173; cv=none; b=YjHHkYJ5t9ehp2Q3i4NznpZHu6HOAPP8j8GrTG7mCdBcEIHCQd218H0YnOuPESUQKUPwGVzZ9+ScO8NDkInF1WWnKRz/hpTDdJ8ZXRVwAn5rYuPT7pviFJHgG+c4r09O1Nlj3FTyeAOmvttnR9UReecAfhb4OPoT2xanQJjro1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761136173; c=relaxed/simple;
	bh=EN74wRmhRMfF20ZojltjPHZiNIUseVkOwqwVbG+3HwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao+qwmpF2AvKEo4rteE0MkJw5gHuG+OlZVaJ0paNonMwIK6KSJuvuIWHFEkQznkL7rKKsBhyWKKgN2AKztqyOd6+Y9tLVGey61IP7VWSxZlZIm0KlxFSR1fF/O78JPg2R+UtTfJKe7NUfpbsecXXNy5aGu+3WrNinzOoOMLEV4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L8wu3/Sq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-373a1ab2081so72018731fa.3
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761136170; x=1761740970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SK/895TH4727JPcOv1LzX820iwrH4WkE7bHuzdndNvE=;
        b=L8wu3/SqQJ1PX6zzcNSvZ+ib27z6mv5fENbmqGpv+8G1IDk2yZ0hA9H+UrYDB4x0s8
         uFX+dmC6Wzerl1+zJlrM3T53lj4y/UyuWimMdwlQ8y8n2o00PZNajgB6wAKTkfQVuYeq
         KE4xbsPAlmp+9PajoqawyA7vFvpGomPHok9Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761136170; x=1761740970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK/895TH4727JPcOv1LzX820iwrH4WkE7bHuzdndNvE=;
        b=Sb/UsR07NrLPiGNTexwcKwNVBgyddw83ONKv8xhwphdMWaB0vECp9b0YtuzNiCl9Sa
         VAnOm3H5tcPnSQthA4XEulfXB97w5MOFMpTf5OCjvGf21vHahvtfB/WoqRkkA1qN8lgy
         cGjM/on0bxOb3oBE34BFMIvlnu9tIKkP+LiV/8kV6tJpmF0huOyge+vvi/G5gpjgCA1I
         iGfq+1fjr35yYYmgyMiP2YzneuEnuKwGzAJ+YBYQMDthXQt6/od76vKRLdRgHytflctI
         QLMoqaaPAFar0Zg9BoAFebJjbl9Y+s/5V22hBLoXAJ74h79wg+WVw2xvWtE78ZCru7cc
         YBYw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFerU3yuxiDRkZzkWaqTLigYJ7eRrvn8PU8nwErip1EB9zjbLLrhPPjBpr9UdXioNpUoZu2VIJzqrMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8tIzHo4VkTtUtXtdTshiCP+sJkRo4SWHWGO1PT/PIVcYO9E4
	srjMRYGY+28Ykm7g9jrPaSefTJrKNeuYfT5lLDKtVUYTEuBKlxcImTYeTz157cimw673LS0BKH6
	o1LQFuA==
X-Gm-Gg: ASbGnct2rBNCq2Yef0KFAAMPvTzlAoSLIO1Q4BdQ7i165q2uHt54DibxESaWjg7Has5
	ZzlKrFNjvhsJDCWcaLWkXZMlFSJyqYvs20CcQrQrtstIq48yfL1OLxC+AE7FhlC+L3fTWoJvFDg
	mycQCNcRXw1rfgv6Us8aVYhe90D+JGQTnng3rY4g7GySNXwoxb4ocX4sAeIFUH4T3gwy+C9RvwC
	vGQ7g23Gpb04S7eqaiMI0sp/F5glcuasVvgvfG6lF7YmHb6Vt2Vs9nrwzyHQnUcbMgA5Pm3SrDk
	fN90TF34pqhMpBxl2dNB3eVz6bU/cpJ+RXtQJjIm53tSjUdLQhXdtOLQhgtPZSW4UrZPxBJsXIX
	oIjzd3idTPXq8pGI8UcaQ5ZfzdJjWEqBm4+YvkC9OrJYI3X5twTFYagFlHvDED2MGJiZ490ruGw
	U3OvcoDtScjykZqePA2oBDUYPMlWAnGBySdoYHwwvQNoBbfeYP
X-Google-Smtp-Source: AGHT+IG193G1i2RkkvRDKsaFuTdO1JxiG8VIWFnT5ffvNm4ylJMf6765Voe5tgBdohy1Enx4ijv7IQ==
X-Received: by 2002:a2e:bcc1:0:b0:338:e6:e0bc with SMTP id 38308e7fff4ca-37797830eccmr69164901fa.2.1761136169529;
        Wed, 22 Oct 2025 05:29:29 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950a1d7sm37246491fa.29.2025.10.22.05.29.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 05:29:29 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so6520879e87.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 05:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5jVoMJt+Q4ROeEoGLaX8QGnK6by2anUBeT4GGozI9QtAAp+7BfhFZSZMjoPzJu8B3Atrt/obnRGcwDQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3a88:b0:578:6ccf:d031 with SMTP id
 2adb3069b0e04-591d8534106mr6173368e87.35.1761136167907; Wed, 22 Oct 2025
 05:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org> <20251022120849.GD727@pendragon.ideasonboard.com>
In-Reply-To: <20251022120849.GD727@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Oct 2025 14:29:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCvtqe8MKpb=O-=Mv28dK+g=REi7kpdr-eyAD-mLLpzQJw@mail.gmail.com>
X-Gm-Features: AS18NWBM5UwpZqxEvO3DsR977BkO4xv27-2tIdMI9svnnbokKy7BTnfKbh2UjOs
Message-ID: <CANiDSCvtqe8MKpb=O-=Mv28dK+g=REi7kpdr-eyAD-mLLpzQJw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Create a specific id namespace for
 output entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 14:09, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 22, 2025 at 11:55:16AM +0000, Ricardo Ribalda wrote:
> > Nothing can be connected from an output entity. Which means that no
>
> s/output entity/output terminal. Same below.
>
> Did you mean s/from an/to an/ ?
>
> > other entity can reference an output entity as baSourceId.
> >
>
> Some output terminals have controls, so we need to preserve their ID.
> That's why my proposal only set the UVC_TERM_OUTPUT bit for the
> *streaming* output terminals, not for all output terminals.
>
> > Use this fact to move all the output entities to a different namespace
> > id.
> >
> > The output entities are usually named after the dev_name() of the usb
> > device, so there should not be any uAPI change from this change.
> >
> > Although with this change we can handle some id collisions
> > automagically, change the logic of uvc_alloc_new_entity() to keep
> > showing a warning when a camera has invalid descriptors. Hopefully this
> > message will help vendors fix their invalid descriptors.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Hi, this patch fixes support for some devices with invalid USB
> > descriptor.
> >
> > It is orthogonal to:
> > https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t
> >
> > Some devices will be fixed by the other patch, other devices will be
> > fixed by this. In my opinion is worth to land both patches.
> >
> > Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..40f8ae0df89e104992f5d55af3d3539dea3d146e 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -165,10 +165,14 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> >       return NULL;
> >  }
> >
> > +#define ENTITY_HARDWARE_ID(id) ((id) & ~UVC_TERM_OUTPUT)
>
> This needs a UVC_ prefix, and should probably go to uvcvideo.h. You can
> also & 0xff, as the UVC descriptors store IDs in 8-bit fields.
>
> > +
> >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> >  {
> >       struct uvc_streaming *stream;
> >
> > +     id = ENTITY_HARDWARE_ID(id);
> > +
> >       list_for_each_entry(stream, &dev->streams, list) {
> >               if (stream->header.bTerminalLink == id)
> >                       return stream;
> > @@ -810,10 +814,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >       }
> >
> >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > -     if (uvc_entity_by_id(dev, id)) {
> > -             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > +     if (uvc_entity_by_id(dev, ENTITY_HARDWARE_ID(id)))
> > +             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > +                     ENTITY_HARDWARE_ID(id));
>
> It's not an error anymore if there's no collision of the full 16-bit ID,
> right ? Should it be demoted to a dev_warn() ?

if it is OK with you I'd rather keep the dev_err(). If an ISP
manufacturer tests their camera in Linux I want them to really notice
that there is an error.
Besides that, I have implemented all your proposed changes.

I cannot test it until tomorrow in real hardware. But the changes are
trivial, let me know if I shall send the v2 right now or wait til it
is tested.

Regards

>
> > +
> > +     if (uvc_entity_by_id(dev, id))
> >               id = UVC_INVALID_ENTITY_ID;
> > -     }
> >
> >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> >       if (num_pads)
> > @@ -969,6 +975,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >       struct usb_host_interface *alts = dev->intf->cur_altsetting;
> >       unsigned int i, n, p, len;
> >       const char *type_name;
> > +     unsigned int id;
> >       u16 type;
> >
> >       switch (buffer[2]) {
> > @@ -1107,8 +1114,16 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return 0;
> >               }
> >
> > +             /*
> > +              * Nothing can be connected from an output terminal. To avoid
> > +              * entity-id's collisions in devices with invalid USB
> > +              * descriptors, move the output terminal id to its own
> > +              * namespace.
> > +              */
> > +             id = buffer[3] | UVC_TERM_OUTPUT;
> > +
> >               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > -                                         buffer[3], 1, 0);
> > +                                         id, 1, 0);
> >               if (IS_ERR(term))
> >                       return PTR_ERR(term);
> >
> >
> > ---
> > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

