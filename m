Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 815FDDE809
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 11:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfJUJ0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 05:26:46 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38968 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfJUJ0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 05:26:46 -0400
Received: by mail-ed1-f68.google.com with SMTP id m4so2319826edr.6
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1L1WL+kVT+tB2jiaSn7cOFVb98cmaH6A9E1gyhfd8Q0=;
        b=J72C5Uz1qgt+jUH9HWgsOXaf768POF5C4mxL1VUQjZRSUZRKmOb1KUim2MUKmY5BIi
         7uEmQH75n2B3lcwhpXCtQ3gSsqfjyz8oKPP6xHh4B1NAR9A4u1unDmAoRL993JkKR9cb
         xdO3PMa/fIZcVdImum3NQQJjWQP/2VZQgx3a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1L1WL+kVT+tB2jiaSn7cOFVb98cmaH6A9E1gyhfd8Q0=;
        b=oNbUOhwevETShunTRK7d4wOA+qWk26mp5Nt/mRtMBLCyKZj59Ek5zSK0EXZ3EA7rtN
         Gml+XMUtykFX1gEUwEh1kJ0eu8ToFPQgGdcXli8/yTlE+CWILUgb696H25f1u/PrQjgO
         gb2h6gZNumPqMbw4rXvkdkzYGRAjvnl0LQctUJbtn5eUq94auvgLwkpsmJu+amFqJKuJ
         dndkIK0xsu2+9aSF8S9gE0aWJG7ORubyVNRCQuPFhZpuDJM2lNhKP6h3atklEpWPXbbd
         c9WDY2tl1q2vuTE8jqI85iFJRolFW5YFgsrQLep4mnc/qTCUjBKV3dnMtllPApw1k5yV
         jgUQ==
X-Gm-Message-State: APjAAAUr90FxkVLstW4tiEk1tHQ61FbYYe8EYrJbPb5+45Lg/6r2cg4r
        wu7ZtDiPf5bXUDKv/0u0aoP/ZwxDwQUyew==
X-Google-Smtp-Source: APXvYqxOzUzV/4nM1qey6NYKhsRrpjgmyYQx8fWK2Dv3i6FLsjkuyPsJY6H6I0cBy93NfE3e95UVxw==
X-Received: by 2002:aa7:d90d:: with SMTP id a13mr23837804edr.2.1571650003403;
        Mon, 21 Oct 2019 02:26:43 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id y91sm252954ede.54.2019.10.21.02.26.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 02:26:43 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id v9so1790785wrq.5
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 02:26:42 -0700 (PDT)
X-Received: by 2002:a5d:4491:: with SMTP id j17mr4922816wrq.46.1571650002125;
 Mon, 21 Oct 2019 02:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
 <20191008091119.7294-2-boris.brezillon@collabora.com> <9b289f76-6c09-b088-204d-ce5b5009bd7b@xs4all.nl>
In-Reply-To: <9b289f76-6c09-b088-204d-ce5b5009bd7b@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 21 Oct 2019 18:26:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C7D24teYQThou+ZvZrZ7iH6-hAumSCiRi8U6tDKSdzuA@mail.gmail.com>
Message-ID: <CAAFQd5C7D24teYQThou+ZvZrZ7iH6-hAumSCiRi8U6tDKSdzuA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 21, 2019 at 5:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 10/8/19 11:11 AM, Boris Brezillon wrote:
> > This is part of the multiplanar and singleplanar unification process.
> > v4l2_ext_pix_format is supposed to work for both cases.
> >
> > We also add the concept of modifiers already employed in DRM to expose
> > HW-specific formats (like tiled or compressed formats) and allow
> > exchanging this information with the DRM subsystem in a consistent way.
> >
> > Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
> > V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
> > in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
> > ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
> > of the multiplanar/singleplanar unification.
> > V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
> > drivers and supporting it would require some extra rework.
> >
> > New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> > in drivers, but, in the meantime, the core takes care of converting
> > {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> > still work if the userspace app/lib uses the new ioctls.
> > The conversion is also done the other around to allow userspace
> > apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> > _ext_ hooks.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
>
> <snip>
>
> >
> > +#define VIDIOC_G_EXT_FMT     _IOWR('V', 104, struct v4l2_ext_format)
> > +#define VIDIOC_S_EXT_FMT     _IOWR('V', 105, struct v4l2_ext_format)
> > +#define VIDIOC_TRY_EXT_FMT   _IOWR('V', 106, struct v4l2_ext_format)
> >  /* Reminder: when adding new ioctls please add support for them to
> >     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >
> >
>
> Since we're extending g/s/try_fmt, we should also provide a replacement for
> enum_fmt, esp. given this thread:
>
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg150871.html

While that's a completely valid problem that should be addressed, I'm
not sure if putting all the things in one bag would have a positive
effect on solving all the problems in a reasonable timeline.

>
> So here is a preliminary suggestion:
>
> struct v4l2_ext_fmtdesc {
>         __u32               index;             /* Format number      */
>         __u32               type;              /* enum v4l2_buf_type */
>         __u32               which;             /* enum v4l2_subdev_format_whence, ignored if mbus_code == 0 */
>         __u32               mbus_code;         /* Mediabus Code (set to 0 if n/a) */
>         __u32               flags;
>         __u8                description[32];   /* Description string */
>         __u32               pixelformat;       /* Format fourcc      */
> };
>
> This would solve (I think) the issue raised in the thread since you can now get
> just for formats that are valid for the given mediabus code and the which field.
>

Hmm, why only mbus_code? We have the same problem with mem2mem
devices, where the format set on one queue affects the formats
supported on another queue. Perhaps it should be defined to return
formats valid with the current state of the driver? If we want to
extend it to return formats for arbitrary states, perhaps we should
use a mechanism similar to the TRY_FMT slot in subdevices, where we
can set the configuration we want to test against and then ENUM_FMT
would return the formats valid for that configuration?

> Other improvements that could be made is to return more information about the
> format (similar to struct v4l2_format_info). In particular v4l2_pixel_encoding
> and mem/comp_planes would be useful for userspace to know.

An alternative would be to go away from mixing mem_planes and
pixelformats and just having the "planarity" queryable and
configurable separately. The existing duplicated FourCCs would have to
remain for compatibility reasons, though.

>
> Finally, we can also add a new ioctl that combines ENUM_FMT/ENUM_FRAMESIZES/ENUM_FRAMEINTERVALS
> and returns an array of all valid formats/sizes/intervals, requiring just a single ioctl
> to obtain all this information.

While it definitely sounds like a useful thing to have, it would be an
interesting problem to solve given the inter-dependencies between
pads, queues and other state, as in the mbus example above.

Best regards,
Tomasz
