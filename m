Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8126346F99
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 03:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhCXCer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 22:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbhCXCef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 22:34:35 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD47DC061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:34:34 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u9so30363899ejj.7
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/tPoD35zw5EpWxZC5d80CVQfmjQQVATTl9B5CWjRNo=;
        b=kxAnCU7o8LZMAzUf62eCyvsXvoYuMM5vNkRG1v1l2XDgtwNMhD00i5DN7sNeV3f0xT
         j705//jCC1652IobRypa3/MYe/9/QzETBhuhpa26SDXfbjzDJsWLjUD/tIqQUJ4JOIqb
         kvswotXYIW4rXIDBBVHLSNjCYSC4/cHclmR9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/tPoD35zw5EpWxZC5d80CVQfmjQQVATTl9B5CWjRNo=;
        b=Q197YyXLT8y0vgTigb976WQ2SqWa+zuh5Slx2qfDGCoWQliIFgdbPGOeRXBjSsBPMZ
         oUMPri+43u3Nn9mVQ2ua/u+f9/6nPpma2/cwG2mx6WidypdeJ0a9On8q6NfhMyAIPMuP
         yYXE84cRJ8pE4LMzQtZ+DwmpkGokQRLsZSmCoMkvSnMu6xK863MBaNX4Em6QOzO7Ti8a
         wC0ERYzX1c34K7xpqvP8Ne+lX60duhTAuxNrSih2hfuwpk5PI4y3U6V4rwCHAH8ovV+x
         KIxlSFxL8B1Y93h6NxYJ/zNObeWVFy5Crfh3xws+4uko40LdSY3aclOJYsbxfbJ22q3E
         faAA==
X-Gm-Message-State: AOAM533ZREeeXCLM35YIJnsTLYobq3qRZFumCLj2+TUVmDBff7qCKcu3
        FHRDXC7bxn+Qf2lJldifXpIcuSeRTZFNgA==
X-Google-Smtp-Source: ABdhPJxMjwn6v8ocpmY+4xXxqvTqyn7ja3/MWVWmTgQeU1lM+/H+Q6/HRr2RgiraHVLArRbS1O+0zw==
X-Received: by 2002:a17:906:39cf:: with SMTP id i15mr1223559eje.534.1616553273380;
        Tue, 23 Mar 2021 19:34:33 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id h24sm252308ejl.9.2021.03.23.19.34.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 19:34:32 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id c8so9943561wrq.11
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:34:32 -0700 (PDT)
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr899073wrm.32.1616553272193;
 Tue, 23 Mar 2021 19:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org> <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com> <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
 <YFqkaumASvjrYP/n@google.com>
In-Reply-To: <YFqkaumASvjrYP/n@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Mar 2021 11:34:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
Message-ID: <CAAFQd5AdJfNLoXwDEgCf90cm5e30rT98SO5CRJ=oR8Do_T566A@mail.gmail.com>
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

On Wed, Mar 24, 2021 at 11:31 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/03/24 11:14), Tomasz Figa wrote:
> > > > > +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> > > > > +                          struct v4l2_selection *sel)
> > > > > +{
> > > > > +       struct uvc_fh *handle = fh;
> > > > > +       struct uvc_streaming *stream = handle->stream;
> > > > > +       struct uvc_roi_rect *roi;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (!validate_roi_bounds(stream, sel))
> > > > > +               return -E2BIG;
> > > >
> > > > Not sure if this is the correct approach or if we should convert the
> > > > value to the closest valid...
> > >
> > > Well, at this point we know that ROI rectangle dimensions are out of
> > > sane value range. I'd rather tell user-space about integer overflow.
> >
> > Adjusting the rectangle to something supported by the hardware is
> > mentioned explicitly in the V4L2 API documentation and is what drivers
> > have to implement. Returning an error on invalid value is not a
> > correct behavior here (and similarly for many other operations, e.g.
> > S_FMT).
>
> Well, in this particular case we are talking about user-space that wants
> to set ROI rectangle that is knowingly violates device's GET_MAX and
> overflows UVC ROI rectangle u16 value range. That's a clear bug in user-space.
> Do we want to pretend that user-space does the correct thing and fixup
> stuff behind the scenes?
>

That's how the API is defined. There is a valid use case for this -
you don't need to run QUERY_CTRL if all you need is setting the
biggest possible rectangle, just set it to (0, 0), (INT_MAX, INT_MAX).

> > > Looking for the closest ROI rectangle that suffice can be rather
> > > tricky. It may sounds like we can just use BOUNDARIES_MAX, but this
> > > is what Firmware D returns for GET_MAX
> > >
> > > ioctl(V4L2_SEL_TGT_ROI_BOUNDS_MAX)
> > >
> > >         0, 0, 65535, 65535
> >
> > Perhaps the frame size would be the correct bounds?
>
> I can check that.
