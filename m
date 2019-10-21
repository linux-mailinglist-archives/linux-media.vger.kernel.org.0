Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC233DE875
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 11:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfJUJtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 05:49:06 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37946 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfJUJtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 05:49:06 -0400
Received: by mail-ed1-f68.google.com with SMTP id l21so9509852edr.5
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IqzB5Fa41i1gd2b7kA4XSv4l8ntb4CA7FK1yoBU2oSU=;
        b=lF/fTCYCUJqwDnujGoSjMOgEEV5k43bgJeoVbnrXsInQKd5y/iVqxKGVNOqXKaG6Jg
         aKsVoSq2GsvZc6frYuCWyJV8jKJeSH0dYtRfZQP3iC+FejGj/b/mIgrwRUjB8oEKUCRc
         N2VkwPMvUBBn2UlEAqd4y0GgELanxjNtXkTis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqzB5Fa41i1gd2b7kA4XSv4l8ntb4CA7FK1yoBU2oSU=;
        b=B7WSXIPpvbohaa3WWXkryvr8DwR3q36S8TV3aR1Hp/8Dh2Q9uHwh7IwqzoS8X0fS37
         6aP8qtcjjGu+4/qckw+M06Cv5oK6931GfAV25O9wtHG1Xc2g6hbllsjO8VJek8jo6GXK
         Fy8SQ2RWeHaCUMbaoVBgW9IMJ1Q6AiWl2btav8TBCq/kHaPBeSBTAf1n0sjCowSAM5H7
         YSZrYJpN/ho6epFOVM0JMo7vilJvHZF5PLb5fsO+laqrX7EvnixE/RFPEhbsLlCgsGbF
         P/v075zenwMkl40U3RKyC72HT5S3jNSS8M25UcE6YdFp6FNJ0fW0aX48EOmw3PT0zWMm
         NgUw==
X-Gm-Message-State: APjAAAVIHCZiW3pWgEROctx85yGTHvfPswmfxZSO5Q/625zqAFgGRjVi
        +CUN5XEeReKVKhWtAHGWqhznYANHJB6jvA==
X-Google-Smtp-Source: APXvYqwD8XOhgSHYAcI9VOJpQMD5fZFMAiAjCI4ZTtuEaNs2hj08p/zMm+/m1VSxEQotU9AKy1orRQ==
X-Received: by 2002:a17:906:6a8e:: with SMTP id p14mr21137771ejr.137.1571651343096;
        Mon, 21 Oct 2019 02:49:03 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id t30sm615403edt.91.2019.10.21.02.49.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 02:49:02 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id g24so3343114wmh.5
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 02:49:01 -0700 (PDT)
X-Received: by 2002:a1c:a516:: with SMTP id o22mr19603524wme.116.1571651341321;
 Mon, 21 Oct 2019 02:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
 <20191008091119.7294-2-boris.brezillon@collabora.com> <9b289f76-6c09-b088-204d-ce5b5009bd7b@xs4all.nl>
 <CAAFQd5C7D24teYQThou+ZvZrZ7iH6-hAumSCiRi8U6tDKSdzuA@mail.gmail.com> <ce4639c3-fcae-e8ca-d2b8-dd79b14f7204@xs4all.nl>
In-Reply-To: <ce4639c3-fcae-e8ca-d2b8-dd79b14f7204@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 21 Oct 2019 18:48:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BJ9OiABCdOFPhgqv1j7=z-K4Y2DsGyH13-QzeZ-cJaAA@mail.gmail.com>
Message-ID: <CAAFQd5BJ9OiABCdOFPhgqv1j7=z-K4Y2DsGyH13-QzeZ-cJaAA@mail.gmail.com>
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

On Mon, Oct 21, 2019 at 6:38 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 10/21/19 11:26 AM, Tomasz Figa wrote:
> > On Mon, Oct 21, 2019 at 5:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 10/8/19 11:11 AM, Boris Brezillon wrote:
> >>> This is part of the multiplanar and singleplanar unification process.
> >>> v4l2_ext_pix_format is supposed to work for both cases.
> >>>
> >>> We also add the concept of modifiers already employed in DRM to expose
> >>> HW-specific formats (like tiled or compressed formats) and allow
> >>> exchanging this information with the DRM subsystem in a consistent way.
> >>>
> >>> Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
> >>> V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
> >>> in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
> >>> ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
> >>> of the multiplanar/singleplanar unification.
> >>> V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
> >>> drivers and supporting it would require some extra rework.
> >>>
> >>> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> >>> in drivers, but, in the meantime, the core takes care of converting
> >>> {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> >>> still work if the userspace app/lib uses the new ioctls.
> >>> The conversion is also done the other around to allow userspace
> >>> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> >>> _ext_ hooks.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>
> >> <snip>
> >>
> >>>
> >>> +#define VIDIOC_G_EXT_FMT     _IOWR('V', 104, struct v4l2_ext_format)
> >>> +#define VIDIOC_S_EXT_FMT     _IOWR('V', 105, struct v4l2_ext_format)
> >>> +#define VIDIOC_TRY_EXT_FMT   _IOWR('V', 106, struct v4l2_ext_format)
> >>>  /* Reminder: when adding new ioctls please add support for them to
> >>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >>>
> >>>
> >>
> >> Since we're extending g/s/try_fmt, we should also provide a replacement for
> >> enum_fmt, esp. given this thread:
> >>
> >> https://www.mail-archive.com/linux-media@vger.kernel.org/msg150871.html
> >
> > While that's a completely valid problem that should be addressed, I'm
> > not sure if putting all the things in one bag would have a positive
> > effect on solving all the problems in a reasonable timeline.
>
> I'm not sure what you mean with this. We can't ignore this either, and if
> we're going to add these new ioctls, then let's try to fix as much as we can.
>

My point is that this series solves a completely orthogonal problem
without a need to touch ENUM_FMT at all. Is there any reason why
solving this particular problem separately would make solving the
ENUM_FMT problem more difficult in the future?

> >
> >>
> >> So here is a preliminary suggestion:
> >>
> >> struct v4l2_ext_fmtdesc {
> >>         __u32               index;             /* Format number      */
> >>         __u32               type;              /* enum v4l2_buf_type */
> >>         __u32               which;             /* enum v4l2_subdev_format_whence, ignored if mbus_code == 0 */
> >>         __u32               mbus_code;         /* Mediabus Code (set to 0 if n/a) */
> >>         __u32               flags;
> >>         __u8                description[32];   /* Description string */
> >>         __u32               pixelformat;       /* Format fourcc      */
> >> };
> >>
> >> This would solve (I think) the issue raised in the thread since you can now get
> >> just for formats that are valid for the given mediabus code and the which field.
> >>
> >
> > Hmm, why only mbus_code? We have the same problem with mem2mem
> > devices, where the format set on one queue affects the formats
> > supported on another queue. Perhaps it should be defined to return
> > formats valid with the current state of the driver? If we want to
> > extend it to return formats for arbitrary states, perhaps we should
> > use a mechanism similar to the TRY_FMT slot in subdevices, where we
> > can set the configuration we want to test against and then ENUM_FMT
> > would return the formats valid for that configuration?
>
> Good point.
>

We might want to keep the control'ification of the API in mind, which
should simplify dealing with state inter-dependencies, because all the
state would be represented in a uniform way.

> >
> >> Other improvements that could be made is to return more information about the
> >> format (similar to struct v4l2_format_info). In particular v4l2_pixel_encoding
> >> and mem/comp_planes would be useful for userspace to know.
> >
> > An alternative would be to go away from mixing mem_planes and
> > pixelformats and just having the "planarity" queryable and
> > configurable separately. The existing duplicated FourCCs would have to
> > remain for compatibility reasons, though.
>
> Interesting idea, but I don't know if this would make the API more or less confusing.
>

Yeah, this definitely needs more thought. My experience with working
with many people trying to use V4L2 in the userspace tells me that the
existing model is confusing, though. DRM and most userspace libraries
use FourCCs only to define the pixelformats themselves and planarity
is a separate aspect.

The target model that I'd see happening would be to have the
multiple-memory plane semantics used everywhere, so all color planes
are described as separate entities, up to having different DMA-buf
FDs. Then the single memory plane case would be just one of the
specific cases, where all the DMA-buf FDs point to the same buffer and
color plane offsets are laid out contiguously, which could be enforced
by generic code when queuing the buffer if that's a hardware
requirement.

> >
> >>
> >> Finally, we can also add a new ioctl that combines ENUM_FMT/ENUM_FRAMESIZES/ENUM_FRAMEINTERVALS
> >> and returns an array of all valid formats/sizes/intervals, requiring just a single ioctl
> >> to obtain all this information.
> >
> > While it definitely sounds like a useful thing to have, it would be an
> > interesting problem to solve given the inter-dependencies between
> > pads, queues and other state, as in the mbus example above.
>
> This is definitely a separate issue for further in the future.

Agreed.

Best regards,
Tomasz
