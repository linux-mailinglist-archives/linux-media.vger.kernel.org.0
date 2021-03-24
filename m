Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99381346F4D
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 03:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhCXCPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 22:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbhCXCOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 22:14:42 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D285C061765
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:14:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id j3so25770455edp.11
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O8zPt+tX1pbVPAM3udwHPOIYrqd9MhATH5T9DQ7ZiAk=;
        b=KVMcomrOgf2fmHTfZGpEK++znFqoqBoWpA4ArOcX45OvlfJ0VHelN6fA5nt+IR9t8k
         NQV0TQwwiETVOeAeypZXBK+Ky9/qu5Yl4P60ZmnQdSPIlWtiuRQL/Cw0TxmNbCDeK8d4
         jUI3K5tl+VX97Fyd6nljnEr013QaL2UiuyG8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8zPt+tX1pbVPAM3udwHPOIYrqd9MhATH5T9DQ7ZiAk=;
        b=GA3lsGpz5B3PKb27DtE6dk+FJQwu1AKnUMmlEDU+iuoSsNnRAZV9acTWe9fzin5KCQ
         c+MLgCoOBUne87J9gyVrZVmdrlSJH7jSFNXVGE7sbJKGSspbt87HCnEiVOMRBm8fGnZD
         itAe8EOWhr0sfhJ16ixhhYY6v/9Nx+VR/iaGU6WnmwXaQDnsrREOPpyT+jciAf7qnEzz
         4W9G90uKWhkm6GOMsiPdt8B1uk97lC4xDzAOkYwyGUaYLem1h6hoV9Onxl/CSPC4Eu2b
         jYeMZnNLK87wOcbsVBrqA+skTk3ad0QcMKF1wxuCKOHFg8bxDR5RQtL0LG9rVPRutV1T
         i3JA==
X-Gm-Message-State: AOAM5315TdcqRJfqPuJlYDTabS9duesipoYXZlqvG2sQ5igmTVnooWq8
        2A3tyyCoDSQte0aQZzNar+VYrzaq3e4gxw==
X-Google-Smtp-Source: ABdhPJyJJvqUFclkTLSPhf5MkDbsN7pW77oCucNrhn/qg87qVPwUGDRiEQQYZHSkBRH6Xej+c35muQ==
X-Received: by 2002:a05:6402:100c:: with SMTP id c12mr915478edu.200.1616552079883;
        Tue, 23 Mar 2021 19:14:39 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a22sm383019edu.14.2021.03.23.19.14.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 19:14:39 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id x7so355133wrw.10
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 19:14:39 -0700 (PDT)
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr798703wra.103.1616552078692;
 Tue, 23 Mar 2021 19:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-6-senozhatsky@chromium.org> <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
 <YFqdaHCQak5ZM0Sf@google.com>
In-Reply-To: <YFqdaHCQak5ZM0Sf@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Mar 2021 11:14:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
Message-ID: <CAAFQd5DaDZA8==HPrL1v1M=1a5g3DgY58nuq7KnA8USQ6UuiTQ@mail.gmail.com>
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

On Wed, Mar 24, 2021 at 11:01 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/03/23 17:16), Ricardo Ribalda wrote:
> [..]
> > > +static bool validate_roi_bounds(struct uvc_streaming *stream,
> > > +                               struct v4l2_selection *sel)
> > > +{
> > > +       if (sel->r.left > USHRT_MAX ||
> > > +           sel->r.top > USHRT_MAX ||
> > > +           (sel->r.width + sel->r.left) > USHRT_MAX ||
> > > +           (sel->r.height + sel->r.top) > USHRT_MAX ||
> > > +           !sel->r.width || !sel->r.height)
> > > +               return false;
> > > +
> > > +       if (sel->flags > V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY)
> > > +               return false;
> >
> > Is it not allowed V4L2_SEL_FLAG_ROI_AUTO_IRIS |
> > V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY   ?
>
> Good question.
>
> I don't know. Depends on what HIGHER_QUALITY can stand for (UVC doesn't
> specify). But overall it seems like features there are mutually
> exclusive. E.g. AUTO_FACE_DETECT and AUTO_DETECT_AND_TRACK.
>
>
> I think it'll be better to replace this with
>
>         if (sel->flags > USHRT_MAX)
>                 return false;
>
> so that we don't let overflow happen and accidentally enable/disable
> some of the features.
>
> > > +
> > > +       return true;
> > > +}
> > > +
> > > +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> > > +                          struct v4l2_selection *sel)
> > > +{
> > > +       struct uvc_fh *handle = fh;
> > > +       struct uvc_streaming *stream = handle->stream;
> > > +       struct uvc_roi_rect *roi;
> > > +       int ret;
> > > +
> > > +       if (!validate_roi_bounds(stream, sel))
> > > +               return -E2BIG;
> >
> > Not sure if this is the correct approach or if we should convert the
> > value to the closest valid...
>
> Well, at this point we know that ROI rectangle dimensions are out of
> sane value range. I'd rather tell user-space about integer overflow.

Adjusting the rectangle to something supported by the hardware is
mentioned explicitly in the V4L2 API documentation and is what drivers
have to implement. Returning an error on invalid value is not a
correct behavior here (and similarly for many other operations, e.g.
S_FMT).

https://www.kernel.org/doc/html/v4.8/media/uapi/v4l/vidioc-g-selection.html

>
> Looking for the closest ROI rectangle that suffice can be rather
> tricky. It may sounds like we can just use BOUNDARIES_MAX, but this
> is what Firmware D returns for GET_MAX
>
> ioctl(V4L2_SEL_TGT_ROI_BOUNDS_MAX)
>
>         0, 0, 65535, 65535

Perhaps the frame size would be the correct bounds?

Best regards,
Tomasz
