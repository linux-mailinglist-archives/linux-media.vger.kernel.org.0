Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3098E59376
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 07:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfF1Ff0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 01:35:26 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34019 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfF1FfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 01:35:25 -0400
Received: by mail-ed1-f67.google.com with SMTP id s49so9437053edb.1
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8JjfGAF1MeAgg8vIJfQ+jsjPDJCSDu7Vw7HGO75cduc=;
        b=AujeVKPdowq7mh0fYuEUrWTlEoq4xLrWKNr9UZWga26vHsjiL50vcpHPFR+r0reGvy
         hqDuj+tlsvCWVqRWFYW3XqIZsu2KiE+q8r8RqJ/+2ekSydUKAjtN3CpLP1DF7YojVp22
         ZYhnFYu7eXs5cakMqxM2OImZPJw8aXN/+awVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8JjfGAF1MeAgg8vIJfQ+jsjPDJCSDu7Vw7HGO75cduc=;
        b=F6ovN91uawLI23PTZG+nP/JSxIOhhdop13f6K3kDJbadhKmLyiF09duVmFbLtjXU7O
         PrzrclWp4f6T+LNfx8yBN+H5+lSBbnfAOZW28vKKznwrYSetSMNFkENkzLVpfFCdahl9
         F7Bmqm9FSn5sPdxiSgNaAcEz02iuy1y47hgsT6fEdIdWQ/QBEOFCMWnRlS+HdIBTRJaq
         HZz2bjlMWMt9mLVGKxURsOa2sPfYQnd6y+nY0wNP73e6nOv3jsQ7jVwAQRYyCedXXZp4
         o83gU29xxuxn6SE0+Wh/HSK4YoZ75T/hcsWqkSJjdCttQazuVpAf753VUDwMXzCKg1+l
         e5gg==
X-Gm-Message-State: APjAAAXcXE8ADgXB52FJIJc+NwHmStVsTUV5+O4QSb9h6spCUtmkSEtv
        yEay7tyqtHwLbj6LTMxfh0LIZYB2dBiQng==
X-Google-Smtp-Source: APXvYqx86oqoOZOdybYrS+XrBqjXd7li8miflm2ZxBGS/ZJ7c4C60LPbKg55oWeKMZ6nkhepIsCN9Q==
X-Received: by 2002:a50:a4ad:: with SMTP id w42mr8759500edb.230.1561700123731;
        Thu, 27 Jun 2019 22:35:23 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id k10sm368771eda.9.2019.06.27.22.35.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 22:35:21 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id a15so7753611wmj.5
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 22:35:20 -0700 (PDT)
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr6007169wml.90.1561700120209;
 Thu, 27 Jun 2019 22:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190610085250.3255-1-boris.brezillon@collabora.com>
 <20190610085250.3255-3-boris.brezillon@collabora.com> <b8212cca2e824c199b439bc7fb1c235693d79cbd.camel@bootlin.com>
 <20190626172629.51f6c572@collabora.com>
In-Reply-To: <20190626172629.51f6c572@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 28 Jun 2019 14:35:07 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BdNNJjF+DgXa7GjKtYgQaHvRXKuk7JKPT9XhH0RSp+ew@mail.gmail.com>
Message-ID: <CAAFQd5BdNNJjF+DgXa7GjKtYgQaHvRXKuk7JKPT9XhH0RSp+ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: uapi: h264: Add the concept of decoding mode
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 27, 2019 at 12:26 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 26 Jun 2019 13:30:38 +0200
> Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:
>
> > Hi,
> >
> > On Mon, 2019-06-10 at 10:52 +0200, Boris Brezillon wrote:
> > > Some stateless decoders don't support per-slice decoding (or at least
> > > not in a way that would make them efficient or easy to use).
> > > Let's expose a menu to control and expose the supported decoding modes.
> > > Drivers are allowed to support only one decoding but they can support
> > > both too.
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Changes in v2:
> > > * Allow decoding multiple slices in per-slice decoding mode
> > > * Minor doc improvement/fixes
> > > ---
> > >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 46 ++++++++++++++++++-
> > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> > >  include/media/h264-ctrls.h                    | 13 ++++++
> > >  3 files changed, 67 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > index 82547d5de250..e3b9ab73a588 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > >      * - __u32
> > >        - ``size``
> > >        -
> > > +    * - __u32
> > > +      - ``start_byte_offset``
> > > +      - Where the slice payload starts in the output buffer. Useful when
> > > +        operating in per frame decoding mode and decoding multi-slice content.
> > > +        In this case, the output buffer will contain more than one slice and
> > > +        some codecs need to know where each slice starts. Note that this
> > > +        offsets points to the beginning of the slice which is supposed to
> > > +        contain an ANNEX B start code.
> > >      * - __u32
> > >        - ``header_bit_size``
> > >        -
> > > @@ -1931,7 +1939,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > >        -
> > >      * - __u16
> > >        - ``num_slices``
> > > -      - Number of slices needed to decode the current frame
> > > +      - Number of slices attached to decode the operation. When operating in
> > > +        per-frame decoding mode (see
> > > +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field should
> > > +        be set to the number of slices needed to fully decode the frame. When
> > > +        operating in per-slice decoding mode this field can be set to anything
> > > +        between 1 and the remaining number of slices needed to fully decode the
> > > +        frame.
> > >      * - __u16
> > >        - ``nal_ref_idc``
> > >        - NAL reference ID value coming from the NAL Unit header
> > > @@ -2022,6 +2036,36 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > >        - 0x00000004
> > >        - The DPB entry is a long term reference frame
> > >
> > > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > > +    Specifies the decoding mode to use. Currently exposes per slice and per
> > > +    frame decoding but new modes might be added later on.
> >
> > I would maybe formulate this as slice-based and frame-based decoding
> > since I feel like per-slice implies that slices have to be passed one-
> > by-one. This wouldn't be the case with the latest proposal for slice-
> > based decoding, where more than one slice can be passed at a time.
> >
> > About that, I'm wondering how we could handle that in our drivers.
> > It will probably be something like:
> >
> > device_run -+-> decode slice i -> IRQ -+-> job_finish
> >             `----------- i++ ----------'
> >
> > And I'm wondering if there could be common helpers to help implement
> > this, if that's needed at all.
>
> Yep, we could probably have that kind of helper. I haven't had time to
> work on the generic m2m stateless codec layer since last time we talked
> about it on IRC, but I plan to resume working on this task soon. I'll
> try to think about this generic "decode all slices" helper once the
> basic building blocks are ready.

Most of the time it's a good idea to just open code it in one driver
first and then another driver needs to do the same (or very similar)
thing, generalizing the code from the first driver into a helper.

Best regards,
Tomasz
