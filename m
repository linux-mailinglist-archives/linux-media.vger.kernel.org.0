Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272CD36E03
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 10:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfFFIBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 04:01:19 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36202 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfFFIBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 04:01:18 -0400
Received: by mail-ed1-f68.google.com with SMTP id a8so2012015edx.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d7JG5evE27I5RNoXzECCxFcvxIR1LFWVngwrZFTHaEE=;
        b=Jhc5ZPvkgb1atrckBpBQoTCReGqX50FEonRmXpYTqD0a+EIVLrkSAI16fRaYjvQFri
         A/gxmJWHuEiFt2z8RoPqulLllecpRcJ1Jhh6M2hGBOrGGZq/DAXjke50ui/ua3u8FVQq
         DCr9R9cw88A8ugXrSLQT7j24Ux2hMp0pBJwl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d7JG5evE27I5RNoXzECCxFcvxIR1LFWVngwrZFTHaEE=;
        b=PDp1Nq4N55KwOqgVe8LOT+AbjdAyJH8SKfpgLo1AB3n6Cia1XcfKf6lsvyzkx7kWVj
         LVOGviUyv8l/EMSxgpgLPlOSPVrZzvYmm6OJr2cIrRXbcbeZWnHQgFlRZBSpsdgvGv93
         xgVfuPX2mKA5Cxs54ICm4LrHEG6/HngSQVcqW2aOXr8caajQe6jr2Ywc2jsVlBTUzvio
         kms9uELGpPYyXKbB7RG9MRhkaG3WOcGNPZlCT3siOzVI7rC1SaBN8dXSQ7/C2p/3KHqc
         uSRTg6AcM4INRKlaerlo3vu4WW6tUQBlqGHg5fcV0jGGfdxyl4kj0HSUiLw4OJE2wGj2
         Zh3Q==
X-Gm-Message-State: APjAAAURSzqpB+IpyJlsmO6FWIb9gWjSspDm72hXMds3VN7mZMN0g4SW
        v6bx1sMmnlvq9jIS4hgMU8FSt5pULsAH+Q==
X-Google-Smtp-Source: APXvYqwrL42pigAL+FtGCG16CcldZq95UF9UrZMUx4J45Aa3O6iObfu9NeI8jUVmqO3EI3/jQBgL/w==
X-Received: by 2002:a17:906:858f:: with SMTP id v15mr40092683ejx.252.1559808076227;
        Thu, 06 Jun 2019 01:01:16 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id w18sm196835eji.44.2019.06.06.01.01.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 01:01:15 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id n9so1365845wru.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 01:01:14 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr13719608wro.162.1559808074447;
 Thu, 06 Jun 2019 01:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190605164625.5109-1-boris.brezillon@collabora.com>
 <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
 <20190606085159.3454aecb@collabora.com> <15371dbc-9981-bf7e-648c-d321aaa0e1b9@xs4all.nl>
In-Reply-To: <15371dbc-9981-bf7e-648c-d321aaa0e1b9@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 6 Jun 2019 17:01:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CZR1Sa38QexNeXmUNFG6pXwQyOY4M34bUW5PLOuatfeg@mail.gmail.com>
Message-ID: <CAAFQd5CZR1Sa38QexNeXmUNFG6pXwQyOY4M34bUW5PLOuatfeg@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2: Fix the _MPLANE format check in v4l_enum_fmt()
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 6, 2019 at 4:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 6/6/19 8:51 AM, Boris Brezillon wrote:
> > On Thu, 6 Jun 2019 12:53:57 +0900
> > Tomasz Figa <tfiga@chromium.org> wrote:
> >
> >> On Thu, Jun 6, 2019 at 1:46 AM Boris Brezillon
> >> <boris.brezillon@collabora.com> wrote:
> >>>
> >>> CAP_M2M_MPLANE means the device supports _MPLANE formats for both
> >>> capture and output. Adjust the check to avoid EINVAL errors on
> >>> such devices.
> >>>
> >>> Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane")
> >>> Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
> >>>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> index b4c73e8f23c5..ace9b9761bed 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> >>>         struct video_device *vdev = video_devdata(file);
> >>>         struct v4l2_fmtdesc *p = arg;
> >>>         int ret = check_fmt(file, p->type);
> >>> +       u32 cap_mask;
> >>>
> >>>         if (ret)
> >>>                 return ret;
> >>> @@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> >>>         switch (p->type) {
> >>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> >>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> >>> -               if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
> >>> +               cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> >>> +                          V4L2_CAP_VIDEO_M2M_MPLANE;
> >>> +               if (!!(vdev->device_caps & cap_mask) !=
> >>
> >> Shouldn't devices that report V4L2_CAP_VIDEO_M2M_MPLANE have also
> >> V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
> >> reported anyway?
> >
> > That's the other option, force drivers that set
> > V4L2_CAP_VIDEO_M2M_MPLANE to also set
> > V4L2_CAP_VIDEO_{CAPTURE,OUTPUT}_MPLANE (or we can let the core do it).
> >
>
> No, we decided at some point not to do that. The M2M cap makes it explicit
> that this is a memory to memory device, and it avoids applications from
> trying to use it as a webcam since most apps just check for the VIDEO_CAPTURE
> capability.

Fair enough. Feel free to add

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
