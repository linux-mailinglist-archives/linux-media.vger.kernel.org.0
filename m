Return-Path: <linux-media+bounces-7611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BC886946
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 10:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F87E28A170
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A32208DD;
	Fri, 22 Mar 2024 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b+z2rRRu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3290B3F8FF
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711099762; cv=none; b=I++FXEy+T1f4H35mw2JSfxqpuytutojIuhH1bA1Bgw9oC+15i3pNOlA7ssAw/M8FVj+yhLsEtDuvzsNcRhMv9Hy38w2dSEeHkWLC68dwx6QdJCe1GjJfzbdXd9Nbi9MxuqdLqSZ4h5bZAuvBfL2PGSVi/02Vd8I8caewp3AHxLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711099762; c=relaxed/simple;
	bh=jMhYX92bX0+vMk1M5ZgqlQ2n3cIBs+In3AcE7fbzqBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cu0olhOKXI/h8zOuwgOSkU2GuepIp1NXhG33bplQ0A3LVyt15HzEYuNcgG8Dyww2WvaeENERw0zCrC1zDmpsBQz+p5hRZZdNdf6svvV+F6X8ffY3SToJ+TICbmhbjn8b36oe+rmI2hbBhR6n9Pz9ShVb+r71vuGPGSkr5FO9Kh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b+z2rRRu; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4d42ea640f0so651827e0c.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711099759; x=1711704559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nZvtGqTa73gh7kUTMmd8F/7eYyLnJTG6tNdg5WPt/L0=;
        b=b+z2rRRuiiXAjY4qifgtkTWGCyDPITjKUY9/o86GwcKYn5dKwn5G6GBl8sD2M6/ZDX
         iRchka3iFWLW+zKVC06ZbOuYrjAUX/LHw8g8idD3KbTwETWiwEgCHqgm3JTYQWvWYY6M
         Ie6Ni8BO02HLBn0vvigFtFtCKxaoZvzAFh4Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711099759; x=1711704559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZvtGqTa73gh7kUTMmd8F/7eYyLnJTG6tNdg5WPt/L0=;
        b=i4GxC9DE9CIy6Maj+cYfWIqYw1W9RQboVVDeQbVQ7nGHHxYW2AiPKccBBUXW4yekKT
         S49Z3deWi2lWI/Yl5IbylurT6XBM83w5RBnxwKyI9qZLQ84uOyjo0xXCRu8bfy/N4itP
         d+AX37K9xJinAtuIq4mZwJrMV7zTHjKbWlHI1ttbwvrFRc2FP2t8Y8DpizqnvlvRQm5P
         nBHEAk7mWbZ5nkGm1+sQOwtnAp/v4gt2zgotU+AFsqdM4nK0XKabo+HtDyVTBKRGjjjt
         mjq+1V93PcG32zViBmrBOJSr+hwg0mJhriEOJw9YnpjTzs0/DLu/9AzgRgTMPkDB7SAi
         ROFg==
X-Forwarded-Encrypted: i=1; AJvYcCXyo7yCrxF3xGUd3h+tXIvjiMzQGEAf+Esx4xavwekcsZkNN/7rY3NfCsZd9i+G35RANLBw+UUvAGQ+NhzscL57Iv9GrbLpIq1Jvps=
X-Gm-Message-State: AOJu0Yy43t8bHLgrlPJ1LcI5cbb5jF4M3YlYfNEZyj7jJ6m0LZz4KnRv
	5fRDzR3Sy/alFHiv/M693R9SfRGTvF11B6ccWNIjqjxhTIKaz32CybZhFZNEwg89rrbBTj3OrqU
	=
X-Google-Smtp-Source: AGHT+IFNd49pN38v9cwIgNyINY8h9dqpIbeqFKdC2+RaNP5UrNoJbeAt/mI9/SYxJ2SB8z2RitlAIw==
X-Received: by 2002:ac5:c90e:0:b0:4d4:3716:5d99 with SMTP id t14-20020ac5c90e000000b004d437165d99mr1593391vkl.5.1711099759336;
        Fri, 22 Mar 2024 02:29:19 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id b6-20020ac5c746000000b004b6c66b5493sm250735vkn.0.2024.03.22.02.29.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 02:29:19 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4d4226edea8so654237e0c.1
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 02:29:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqVV1UgLfsfthCsphKTcuKE+/H7PsVAaTJPzLLuFGVTuH3SHyeyXWywTYPP5UDn6Iow+9azoqovOK7YE8/8VhBxfLStXbqrSUt2HU=
X-Received: by 2002:a1f:140b:0:b0:4d8:770f:65a7 with SMTP id
 11-20020a1f140b000000b004d8770f65a7mr185723vku.9.1711099758263; Fri, 22 Mar
 2024 02:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-1-55a89f46f6be@chromium.org>
 <20240212225940.GA19316@pendragon.ideasonboard.com> <CANiDSCuoskaERyyzuLen+ReGHBNnOrFducbWYAvFQ6HfbUCPcg@mail.gmail.com>
 <20240219104046.GB13043@pendragon.ideasonboard.com> <CANiDSCsqYHModDZCi2hooDYsFgu+bN_OioBGEJQJuZgdiJO=ug@mail.gmail.com>
 <20240321215047.GA20938@pendragon.ideasonboard.com> <20240322091948.GA10059@pendragon.ideasonboard.com>
In-Reply-To: <20240322091948.GA10059@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Mar 2024 10:29:03 +0100
X-Gmail-Original-Message-ID: <CANiDSCuxytDTC73Ni51h9v7yCZ46D5489fvt0Hy0ugcm=jcKRQ@mail.gmail.com>
Message-ID: <CANiDSCuxytDTC73Ni51h9v7yCZ46D5489fvt0Hy0ugcm=jcKRQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] media: uvcvideo: Fix negative modulus calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 22 Mar 2024 at 10:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 21, 2024 at 11:50:48PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 19, 2024 at 04:07:12PM +0100, Ricardo Ribalda wrote:
> > > On Mon, 19 Feb 2024 at 11:40, Laurent Pinchart wrote:
> > > > On Mon, Feb 19, 2024 at 11:28:03AM +0100, Ricardo Ribalda wrote:
> > > > > On Mon, 12 Feb 2024 at 23:59, Laurent Pinchart wrote:
> > > > > > On Wed, Mar 15, 2023 at 02:30:12PM +0100, Ricardo Ribalda wrote:
> > > > > > > If head is 0, last will be addressing the index 0 instead of clock->size
> > > > > > > -1. Luckily clock->head is unsiged, otherwise it would be addressing
> > > > > > > 0xffffffff.
> > > > > >
> > > > > > I'm not following you. In the expression
> > > > > >
> > > > > >         (clock->head - 1) % clock->size
> > > > > >
> > > > > > clock->head is an unsigned int, and 1 as a signed int, so the result of
> > > > > > the subtraction is promoted to an unsigned int. When clock->head is 0, the expression evaluates to
> > > > > >
> > > > > >         0xffffffff % clock->size
> > > > > >
> > > > > > clock->size is a power of two (hardcoded to 32 at the moment), so the
> > > > > > expression evaluates to 31, as intended.
> > > > > >
> > > > > > Am I missing something ?
> > > > >
> > > > > Take a look to: https://godbolt.org/z/xYeqTx6ba
> > > > >
> > > > > The expression only works because the size is a power of two. In this
> > > > > set I am allowing sizes that are not powers of two.
> > > >
> > > > Could you then update the commit message to explain that ?
> > > >
> > > > I'll review the rest of the series this week.
> > > Thanks
> > >
> > > Will update with the following text after the review:
> > >
> > > The tail of the list lives at the position before the head. This is
> > > mathematically noted as
> > > ```
> > > (head-1)  mod size.
> > > ```
> > >
> > > Unfortunately C, does not have a modulus operator, but a remainder
> > > operator (%).
> > > The reminder operation has a different result than the modulus if
> > > (head -1) is a negative number and size is not a power of two.
> > >
> > > Adding size to (head-1) allows the code to run with any value of size.
> >
> > Could you please add
> >
> > This does not change the current behaviour of the driver, as the size is
> > always a power of two, but prepares for reworks that will change the
> > size to a non power of two.
> >
> > or something similar ?
> >
> > > > > > > Nontheless, this is not the intented behaviour and should be fixed.
> > > > > > >
> > > > > > > Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
> >
> > I think this should be dropped, the patch doesn't fix an issue, but
> > prepares for further changes that add new features. I'd also like to
> > update the commit message to avoid stating "Fix", to avoid this being
> > picked for stable kernels automatically.
>
> After reviewing the whole series, it seems that clock->size stays at its
> current value of 32. Do we thus need this patch ?

I remember that at some point, when I changed the size, it had been
really painful to figure out why the code was not working.

I'd rather keep this patch with a different commit message.

"""
This does not change the current behaviour of the driver, as the size is
always a power of two, but avoid tedious debugging if we ever change its size.
"""

WDYT?


>
> > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/media/usb/uvc/uvc_video.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > index d4b023d4de7c..4ff4ab4471fe 100644
> > > > > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > @@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> > > > > > >               goto done;
> > > > > > >
> > > > > > >       first = &clock->samples[clock->head];
> > > > > > > -     last = &clock->samples[(clock->head - 1) % clock->size];
> > > > > > > +     last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
> > > > > > >
> > > > > > >       /* First step, PTS to SOF conversion. */
> > > > > > >       delta_stc = buf->pts - (1UL << 31);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

