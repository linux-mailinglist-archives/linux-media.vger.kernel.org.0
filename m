Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8598965CA51
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 00:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbjACXev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 18:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbjACXet (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 18:34:49 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3821413E3C
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 15:34:49 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so37365706pjj.2
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 15:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5/148/emZk2X7NXA2ZwL6cgorWQ0FeFrEoaSTceyS2Y=;
        b=Iwr1w90jote5Q4FWnxggWOj4Td6LX2xnYKBAtTc/ki2FfC2p93XeHqyHZVMuB1Vyfc
         Kz0ETUC4QebjYjglXywNjWLweuAgE0eIZRM8BKob7FgQF8b8z6Ef4IxOfnRlLNsT6TDX
         CvhBTtSz+WPRTBjY6fE/iDWhHXNCFe5kSQZ4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/148/emZk2X7NXA2ZwL6cgorWQ0FeFrEoaSTceyS2Y=;
        b=qGEeQBvNXw70kViCq0EREbXmOHsXovwwhZxBeGkHaXncNxu0/n7jrJjRBKhEI1TANa
         0t6Xx/3qa9BuL/1exHdzJf+TL9NWPMtfMCXhPj96mxUmqH3pafHuUiW97hjEiE7pIOxu
         SSaSqHaWBOGGE6FboGaQQOtDsb7t6pDnxW0Dx56OqYlaQieKyjAZCGhnGNzC/yILYly+
         PgY7Mn5qwmLHbLC/ObOZeqfDAep2cwqwSPX5JlWdH1INXEoG9eImiQjvXoJ9+RI1P4/y
         03p4xDpwFGYPoBu4cUc4uXlJvT9s/uc1bAlx0kUwUWe7OXS78IIGC13W+cGb2lPYPwil
         c3bw==
X-Gm-Message-State: AFqh2kpvaMjqK6exJZ72h25Wu4cidKPwgCnJFufWF2ul4ySmCzc8sY5B
        hzmS3FCPN2iMNZJXnEQPNUtGLg89s+/c6scgHVU=
X-Google-Smtp-Source: AMrXdXvEGsjlXGPLEWH5j+hsOlPkQ5uJzQWU2rFiWlgX37bei6UJzrXNtUGAPECz9JoyxZHVgvUcVA==
X-Received: by 2002:a05:6a21:c08d:b0:af:f1d1:6f7f with SMTP id bn13-20020a056a21c08d00b000aff1d16f7fmr61848920pzc.31.1672788888518;
        Tue, 03 Jan 2023 15:34:48 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id c10-20020a170903234a00b0017f73caf588sm22897933plh.218.2023.01.03.15.34.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 15:34:47 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id d15so34274138pls.6
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 15:34:47 -0800 (PST)
X-Received: by 2002:a17:90a:cf02:b0:219:33a1:d05f with SMTP id
 h2-20020a17090acf0200b0021933a1d05fmr3544224pju.116.1672788886090; Tue, 03
 Jan 2023 15:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v2-0-0d7978a817cc@chromium.org>
 <20220920-resend-hwtimestamp-v2-8-0d7978a817cc@chromium.org> <Y6761ScB9FgMC6zb@pendragon.ideasonboard.com>
In-Reply-To: <Y6761ScB9FgMC6zb@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Jan 2023 00:34:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCtsk+oejXSDGo_DStocHOEsk4=oYOu6KccQdckfBXbj-g@mail.gmail.com>
Message-ID: <CANiDSCtsk+oejXSDGo_DStocHOEsk4=oYOu6KccQdckfBXbj-g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 8/8] media: uvcvideo: Fix hw timestampt handling
 for slow FPS
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "hn.chen" <hn.chen@sunplusit.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, 30 Dec 2022 at 15:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Dec 02, 2022 at 06:02:48PM +0100, Ricardo Ribalda wrote:
> > In UVC 1.5, when working with FPS under 32, there is a chance that the
> > circular buffer contains two dev_sof overflows,
>
> An explanation of why this is the case would be good in the commit
> message. Also, by overflow, are you talking about the SOF counter
> rolling over ?
>
> > but the clock interpolator
> > is only capable of handle a single overflow.
> >
> > Remove all the samples from the circular buffer that are two overflows
> > old.
>
> I would rather support multiple roll-over in the clock interpolator.
> Dropping older sampls will lead to less predictable behaviour and harder
> to debug issues.
>

Multiple roll-over would not necessarily mean better data here. We are
deleting data that is more than 1 second away, and our resolution is
1kHz, which means that we have enough data to provide good results, we
have measured that 250msec already provides good data.

From a logical point of view, this patch is fixing a bug, not adding a
new feature, and it has been validated. I would rather add multi
roll-over as a follow-up patch, or maybe suggest implementing it in
userspace ;).

> > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 15 +++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h  |  1 +
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index c81a8362d582..6b6bd521d6c2 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -471,6 +471,20 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
> >
> >       spin_lock_irqsave(&clock->lock, flags);
> >
> > +     /* Delete last overflows */
> > +     if (clock->head == clock->last_sof_overflow)
> > +             clock->last_sof_overflow = -1;
> > +
> > +     /* Handle overflows */
> > +     if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> > +             /* Remove data from the last^2 overflows */
> > +             if (clock->last_sof_overflow != -1)
> > +                     clock->count = (clock->head - clock->last_sof_overflow)
> > +                                                             % clock->count;
> > +             clock->last_sof_overflow = clock->head;
> > +     }
> > +
> > +     /* Add sample */
> >       memcpy(&clock->samples[clock->head], sample, sizeof(*sample));
> >       clock->last_sof = sample->dev_sof;
> >       clock->head = (clock->head + 1) % clock->size;
> > @@ -594,6 +608,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
> >       clock->head = 0;
> >       clock->count = 0;
> >       clock->last_sof = -1;
> > +     clock->last_sof_overflow = -1;
> >       clock->sof_offset = -1;
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 14daa7111953..d8c520ce5a86 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -647,6 +647,7 @@ struct uvc_streaming {
> >               unsigned int head;
> >               unsigned int count;
> >               unsigned int size;
> > +             unsigned int last_sof_overflow;
> >
> >               u16 last_sof;
> >               u16 sof_offset;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
