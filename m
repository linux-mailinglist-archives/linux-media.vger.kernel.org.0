Return-Path: <linux-media+bounces-15242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F052938E28
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1229D1F21DE9
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 11:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344F216D305;
	Mon, 22 Jul 2024 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/b/QCGN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579117597
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648495; cv=none; b=XRsQFOrG9mnB3liDmEIvUiCtsTQP7Qmbx+vnZ2pqISgOQgkRhApApg/JUZnAgBXlhqWsNF0IE8aEk+iVPiH+Z1nbi4RKjGjOE2ZyO5y60E+Pah+j6WLokA2kwKzXxDwSeu1qqaUPpYAQk6FQbIgvcij2/oi+Qn5SM0TsevkMyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648495; c=relaxed/simple;
	bh=Bjh0MAv0P/GsRYNWW4wP61T0kGTHqvY9fDXj4JmqJ9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGMS7+PZ1Wb0oRSXCbcBRLpxxbyHnPdkRb6nOIWD9uxR4wFGEUtitkhkuyl3TXs605foDW05k0j6E0i9EJAkvYnWYIcg37caQJAD6wSEfk3X7+EGyJ3quw7WpzcECl0h0WJjxb9ryvKCNq2cPHIZteprB9dl9rF+OY8lnAFfK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J/b/QCGN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f04c29588so958184e87.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721648492; x=1722253292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W2olEgUDf5J+Y0TXQTQQpwpEdSqToj8rGyfTCMGyLNE=;
        b=J/b/QCGNi9LinFrE1dZ1e/DL53PlQAiVHYMTP+sZ2v7V8y7+KfZS9zloSkYY9kC0yJ
         6Ljm3LcGiODkpKj6GzMOKai8L5VTb7+DUKGEcManz+J62gSuih7T5fWZUmRvn/9xi+kN
         MriHc0Z6Y160kJz5WpZxuXOqzr5wBD9jO3lQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648492; x=1722253292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2olEgUDf5J+Y0TXQTQQpwpEdSqToj8rGyfTCMGyLNE=;
        b=Ouio957tPKeizsHOPgNzu4TDbwp4/AhqWB6M2fIng95PGmp64Nd6cFsjfCyO8T6jnN
         FjucG/+SZOA0GIVkaznBLrjKrKJ4qjsBiaWZvrMSDtdCqGk7Gye7I8uAExGvcjkwoKnx
         4h3j+PYiUjx8tK/wFrwLTny2FsBSHLbMjUnLW51w6Q00UOoh03Vka4OK7DJFXp+C1Zfp
         yhUM3tdhj8vONXpwjX6wB4gTUpPETyUcJnxTNch1fG1/WNoHwlq73xYC44vMoPIXHOT/
         DgYvK5sp4wt0rM+QCHZY9OqYN2MuPrHLpBC0wFTwe5j/4C1newN8RR/OmT+sDq7GlC3P
         qVwg==
X-Forwarded-Encrypted: i=1; AJvYcCVYbmrFtd287FipwqI+4xUBw8CmTFyGw5NH7CQTPWyAd52fGqXs1/ZN2wxwtVFCtxT5TgUaIFzgkwG9s6i4dI14PNfR0+ILvvMMuyU=
X-Gm-Message-State: AOJu0YxucPsJHMU9yQMzSS8C6pKuhywx+RutY3NYAevi1CCIZcheF25G
	ji6L3SvadFxJli0xH2gk4oAsHgO3OK521iOoXOmAoZ4lnjMj0Zk7gtJHeebos9pkG4QXDIBEFOM
	d1g==
X-Google-Smtp-Source: AGHT+IGACHNs0hPFm0a5XdtR/8to/uXsK15H2Gt4v6APf6jDGY5ns757eoXyPAK5kq6ouCRiVha8mw==
X-Received: by 2002:a05:6512:3044:b0:52e:d0f4:7930 with SMTP id 2adb3069b0e04-52efb89fd0amr4015575e87.53.1721648491446;
        Mon, 22 Jul 2024 04:41:31 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c8bea09sm413946466b.101.2024.07.22.04.41.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 04:41:31 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77d9217e6fso394054466b.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 04:41:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5O4Q9A+MG3MybTuHw6z44LmNaOj38jCNWoUx13MWtq3r8bS7Eg7EwbTs7eX6AP2Jhx2JedS7sOzW8LwJ01vjDjiIl2i4OzNNVXHg=
X-Received: by 2002:a17:907:944b:b0:a77:cc90:7734 with SMTP id
 a640c23a62f3a-a7a4c0f440dmr425910266b.42.1721648490580; Mon, 22 Jul 2024
 04:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org> <20240722113836.GE13497@pendragon.ideasonboard.com>
In-Reply-To: <20240722113836.GE13497@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Jul 2024 13:41:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCsvoiUFPMDatH0OiENtscHYysiRJdCpxVCiK-WtQZS-DQ@mail.gmail.com>
Message-ID: <CANiDSCsvoiUFPMDatH0OiENtscHYysiRJdCpxVCiK-WtQZS-DQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix custom control mapping probing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pmenzel@molgen.mpg.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 22 Jul 2024 at 13:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Jul 22, 2024 at 07:59:43AM +0000, Ricardo Ribalda wrote:
> > Custom control mapping introduced a bug, where the filter function was
> > applied to every single control.
> >
> > Fix it so it is only applied to the matching controls.
> >
> > Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>
> > Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> > Cc: stable@vger.kernel.org
> > Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Paul, could you check if this fixes your issue, thanks!
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 0136df5732ba..06fede57bf36 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >       for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
> >               const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
> >
> > +             if (!(uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > +                 ctrl->info.selector == mapping->selector))
> > +                     continue;
>
> I have a slight preference for
>
>                 if (!uvc_entity_match_guid(ctrl->entity, mapping->entity) ||
>                     ctrl->info.selector != mapping->selector)
>                         continue;
>
> If that's fine with you, I can handle that when applying the patch.

That looks also good. I can send a v2 if you prefer. I would also add
the error messages to the commit message.
Let me know what do you prefer, I have time today

Thanks!

>
> This change means that the entity and selector test will use the
> original mapping, not the mapping returned by the filtering function. I
> think that's fine, both mappings should have the same entity and
> selector, only the menu mask is meant to change.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +
> >               /* Let the device provide a custom mapping. */
> >               if (mapping->filter_mapping) {
> >                       mapping = mapping->filter_mapping(chain, ctrl);
> > @@ -2687,9 +2691,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >                               continue;
> >               }
> >
> > -             if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > -                 ctrl->info.selector == mapping->selector)
> > -                     __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> > +             __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> >       }
> >  }
> >
> >
> > ---
> > base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
> > change-id: 20240722-fix-filter-mapping-18477dc69048
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

