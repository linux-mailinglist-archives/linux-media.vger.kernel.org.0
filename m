Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591138E5FD
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbfHOINb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:13:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42119 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfHOINb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:13:31 -0400
Received: by mail-ot1-f68.google.com with SMTP id j7so4170847ota.9
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j2X6+wnhEZ+dwFc1xFvS5j4R+UQwgxL7Tmyv7OJKXfw=;
        b=C5EAOX87Z3Ay8QQ35h9IEerr67vm6be1cqzJOVSIBClk7gcv3ua+0E+j97U3wAeWGE
         XfWxohGIYDFmcCP16kWz63BvlVh/fSSMKC1IH3DYclynBnytsV+jyKlV0MGqLGWOG8l/
         f6LO17b2QggpqtmXFRvEvOJob4ON+0FBMqO2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j2X6+wnhEZ+dwFc1xFvS5j4R+UQwgxL7Tmyv7OJKXfw=;
        b=IiNU2DjGFGg8rShYy/g7jQ1xEK8uoUt+0NtIFgaRGIzE5vGXpT3v7zQjcMADMRetk2
         M7YSge/CKwySx3vzdl4E0C/yBgMc668t6cB0w5DlqQeLAatRzFoVs82GdMynBJl4mtA8
         ENtNhy49QldaE0MSqPRMK6SSQjiQRoh5lYzoNrlzyx0zW1aFZjMLGnUH76syjuX87oss
         mozrf0la+7HPpjvnFzwd0UwcuhiQVV7y/WqHHHBGIiHbRQMwp5AGHm31TkdSAayJfWB3
         Y007JGMi2y+mV+YtPOmHDVDYh2lyIqObCMowF35A+qSOb1Ft07OzBz4omrd4XjIqc5/Q
         RmSQ==
X-Gm-Message-State: APjAAAVj21oOPCWpyesEaWqgCIOVSEEKMPV9vbPEOsmopBVuE5RnbKsW
        5yu7/xf3VnGfUOWAgAiMl8cauHG4R8k=
X-Google-Smtp-Source: APXvYqw4ix0Zn3vZ75JIehizxPi/fKbdfdcA5LpjzWo4ermcrT5+lVQAK/UXQy+2ZEjFJmtHbnN/4Q==
X-Received: by 2002:a05:6830:144b:: with SMTP id w11mr2597055otp.185.1565856809601;
        Thu, 15 Aug 2019 01:13:29 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id i21sm781993otl.24.2019.08.15.01.13.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:13:28 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id b1so4215814otp.6
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:13:28 -0700 (PDT)
X-Received: by 2002:a9d:c67:: with SMTP id 94mr1720310otr.33.1565856808252;
 Thu, 15 Aug 2019 01:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-2-hverkuil-cisco@xs4all.nl> <CAPBb6MWtJyCTJwJii-e6O05idwFd2s8yEstCzfnM7b750h56uQ@mail.gmail.com>
In-Reply-To: <CAPBb6MWtJyCTJwJii-e6O05idwFd2s8yEstCzfnM7b750h56uQ@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 15 Aug 2019 17:13:16 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUQB7e_8vSyO=b9nEwyEN2M5bGV5RUFJFPL7rnwqOqriw@mail.gmail.com>
Message-ID: <CAPBb6MUQB7e_8vSyO=b9nEwyEN2M5bGV5RUFJFPL7rnwqOqriw@mail.gmail.com>
Subject: Re: [PATCHv2 01/12] videodev2.h: add V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 5:11 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Mon, Aug 12, 2019 at 8:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > Add an enum_fmt format flag to specifically tag coded formats where
> > full bytestream parsing is supported by the device.
> >
> > Some stateful decoders are capable of fully parsing a bytestream,
> > but others require that userspace pre-parses the bytestream into
> > frames or fields (see the corresponding pixelformat descriptions
> > for details).
>
> Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
>
> This patch does not update the pixelformat descriptions though, are we
> planning on doing this?

I pressed Send too fast, patch 8 takes care of this. Sorry for the noise.

>
>
> >
> > If this flag is set, then this pre-parsing step is not required
> > (but still possible, of course).
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
> >  Documentation/media/videodev2.h.rst.exceptions   | 1 +
> >  include/uapi/linux/videodev2.h                   | 5 +++--
> >  3 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > index 822d6730e7d2..ebc05ce74bdf 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
> >        - This format is not native to the device but emulated through
> >         software (usually libv4l2), where possible try to use a native
> >         format instead for better performance.
> > +    * - ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
> > +      - 0x0004
> > +      - The hardware decoder for this compressed bytestream format (aka coded
> > +       format) is capable of parsing a continuous bytestream. Applications do
> > +       not need to parse the bytestream themselves to find the boundaries
> > +       between frames/fields. This flag can only be used in combination with
> > +       the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> > +       formats only. This flag is valid for stateful decoders only.
> >
> >
> >  Return Value
> > diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> > index 8e7d3492d248..a0640b6d0f68 100644
> > --- a/Documentation/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/media/videodev2.h.rst.exceptions
> > @@ -180,6 +180,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
> >  # V4L2 format flags
> >  replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
> >  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
> > +replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
> >
> >  # V4L2 timecode types
> >  replace define V4L2_TC_TYPE_24FPS timecode-type
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 2427bc4d8eba..67077d52c59d 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -774,8 +774,9 @@ struct v4l2_fmtdesc {
> >         __u32               reserved[4];
> >  };
> >
> > -#define V4L2_FMT_FLAG_COMPRESSED 0x0001
> > -#define V4L2_FMT_FLAG_EMULATED   0x0002
> > +#define V4L2_FMT_FLAG_COMPRESSED               0x0001
> > +#define V4L2_FMT_FLAG_EMULATED                 0x0002
> > +#define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM    0x0004
> >
> >         /* Frame Size and frame rate enumeration */
> >  /*
> > --
> > 2.20.1
> >
