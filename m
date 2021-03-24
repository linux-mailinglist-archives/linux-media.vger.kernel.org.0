Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3BE346FC3
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 04:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbhCXDBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 23:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234967AbhCXDBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 23:01:03 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270ADC061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:01:03 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u21so12467263ejo.13
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PBjcpQgIglZYIQCLYI/ABjzh4xZMbSaRaKT1WiivV+Y=;
        b=P+Cj5trNRI+g0OmQ7t84I96iN9b9Xc6vphPi42LmTQYbZXpFuxaYlAE/p34MW97Ker
         GY+7qxE6jvn0R8H5lpa3DkiNdekJkuMU7n4hJ+Run6n8/EWdh1PxJVdfHdU0UNFWvlnf
         BvEUsJQ+8eDyNI+EEsY/6bDwocR274HobSDGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PBjcpQgIglZYIQCLYI/ABjzh4xZMbSaRaKT1WiivV+Y=;
        b=D7D9aU4k/ptLYFX4iBwK4gfSx+9hcnZPPLn/EFE4KRhqZrwzt56Lm6FVePP0GlBSxC
         KHcFrTTl0dVOiUJI+tDt4+QngwRPQzsiuemUmuVcbF+wjkuZ9QEwWqOdkXsxjkwlYgCg
         OFJnSunLvM+dMSva913dDySsJXxXtMm++dDtN7bSq8nSeamCXIPfl1Qx28d5L78r9sop
         gsCkF3OHv5h3yVgw4d3yPx2OzCskah8my/59py4keMsugUm0KlnQ4pbDJ99VSTp/mEM4
         zK6kR93re9SdN9YIq8OWDteBmcWaWLFhAN52RwugmEyGBnUzSdNpYGQDKPJ/++vPO6k6
         +lqg==
X-Gm-Message-State: AOAM53089dI9S4KSOzY40mLo5E3pis209BA8UdfuLIkFEpO5eDFleCJc
        v+O26ytoZc631cKvQFtGec4+/j1SWopRRA==
X-Google-Smtp-Source: ABdhPJzZMdiS6IYO6hbw0a9ewrm2LTKqLCBQdRlatwNb8PN0s4AK9voxfyc1eSfvwDDkExbo7DgUmA==
X-Received: by 2002:a17:907:e8f:: with SMTP id ho15mr1294309ejc.541.1616554860658;
        Tue, 23 Mar 2021 20:01:00 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id ha5sm267823ejb.39.2021.03.23.20.00.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 20:01:00 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so341453wmd.4
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 20:00:59 -0700 (PDT)
X-Received: by 2002:a1c:c282:: with SMTP id s124mr710113wmf.99.1616554859441;
 Tue, 23 Mar 2021 20:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org> <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com> <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
 <YFqkaumASvjrYP/n@google.com> <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
 <YFqpcR60384JWbNP@google.com>
In-Reply-To: <YFqpcR60384JWbNP@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Mar 2021 12:00:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CJBPtLo22u2dM-vOGmqaD2e=TU5Qv1eoKcHsxuumgXGw@mail.gmail.com>
Message-ID: <CAAFQd5CJBPtLo22u2dM-vOGmqaD2e=TU5Qv1eoKcHsxuumgXGw@mail.gmail.com>
Subject: Re: [PATCHv3 5/6] media: uvcvideo: add UVC 1.5 ROI control
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 24, 2021 at 11:52 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/03/24 11:34), Tomasz Figa wrote:
> > On Wed, Mar 24, 2021 at 11:31 AM Sergey Senozhatsky
> > <senozhatsky@chromium.org> wrote:
> [..]
> > > > Adjusting the rectangle to something supported by the hardware is
> > > > mentioned explicitly in the V4L2 API documentation and is what drivers
> > > > have to implement. Returning an error on invalid value is not a
> > > > correct behavior here (and similarly for many other operations, e.g.
> > > > S_FMT).
> > >
> > > Well, in this particular case we are talking about user-space that wants
> > > to set ROI rectangle that is knowingly violates device's GET_MAX and
> > > overflows UVC ROI rectangle u16 value range. That's a clear bug in user-space.
> > > Do we want to pretend that user-space does the correct thing and fixup
> > > stuff behind the scenes?
> > >
> >
> > That's how the API is defined. There is a valid use case for this -
> > you don't need to run QUERY_CTRL if all you need is setting the
> > biggest possible rectangle, just set it to (0, 0), (INT_MAX, INT_MAX).
>
> I guess in our case we need to talk about rectangle,auto-controls tuple
> that we send to firmware
>
>         rect {
>                 (0, 0), (INT_MAX, INT_MAX)
>         }
>         auto-controls {
>                 INT_MAX
>         }
>
> For ROI user-space also must provide valid auto-controls value, which
> normally requires GET_MIN/GET_MAX discovery.
>
> v4l2 selection API mentions only rectangle adjustments and errnos like
> -ERANGE also mention "It is not possible to adjust struct v4l2_rect r
> rectangle to satisfy all constraints given in the flags argument".
>
> So in case when auto-controls is out of supported range (out of
> GET_MIN, GET_MAX range) there is no way for us to tell user-space that
> auto-controls is wrong. We probably need silently pick up the first
> supported value, but not sure how well this will work out in the end.

Shouldn't the autocontrol selection be done via a separate bitmask
control rather than some custom flags in the selection API?

Best regards,
Tomasz
