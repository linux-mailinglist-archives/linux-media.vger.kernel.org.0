Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6FB477FC1
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 16:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfG1OF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jul 2019 10:05:58 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46249 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfG1OF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jul 2019 10:05:58 -0400
Received: by mail-ed1-f67.google.com with SMTP id d4so57110964edr.13
        for <linux-media@vger.kernel.org>; Sun, 28 Jul 2019 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hnCdmUG6UDvoO/r6L6hB2JLasXkd1XI+qawPhI1Upn8=;
        b=DgGnyIYOJt+PwxJJgyMI3JIJGweVBMmRk1UIoABPgZhv1zr3ger5M/W5jODLjtwuoQ
         tunL10DymsOflkR5cTY5x2zekrDM+E8pBH7ODlxTbEOJpl2O2ju+Cs0zo7pcJ5pAyBIU
         joJUuL3lGV3GyVWV4XrrWnzT5nWxzeXdFVdTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hnCdmUG6UDvoO/r6L6hB2JLasXkd1XI+qawPhI1Upn8=;
        b=FrB59my+WcF0H+3RyPhrR5GRtIwNeDxgPbWnSlv16k9bsAsZBFLEWWYPitPMOHJ3bM
         oShwOzJDvF8FH7DYB4S7Xwnns1obDp0cMcKDdejJtTKvSmTtPdNYfKoIMkfwNgkRRsrT
         b/ZXiUv4gVmfdVEqZ1AUoYzHbEnj98lz1y5fpPLPjdCb38Px9kGv2NOJH/+MmmyNp4BX
         Ik+14G3cs4QUClePP8b2K8WNmCjPGckBn6DYpDrWb+WCuYWUShczHJF4in7CpscR6wBJ
         PYv/x/3VV7VkhJXce/6TAAZmzW7tF8jZLnuOnw813lqBmgm3CUjCuGVP5kU6DkzbyvJO
         NiOQ==
X-Gm-Message-State: APjAAAW5TsAtWnbJ++JviRe4riRF1lZflisfka4Q6vO0Fl68mN8OmWWY
        DV7NKTETyFiH6ol/rqA1rrhgPo2bMyowYg==
X-Google-Smtp-Source: APXvYqx6Vzp5R17zan7u5roq/MciAOVCmUmLtJ3lipo+mjruTB4943WDQynDFMNrmIqcCsDhzwl/nQ==
X-Received: by 2002:a17:906:f211:: with SMTP id gt17mr79798342ejb.263.1564322756300;
        Sun, 28 Jul 2019 07:05:56 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id h10sm15564320eda.85.2019.07.28.07.05.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Jul 2019 07:05:53 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id n9so59126007wru.0
        for <linux-media@vger.kernel.org>; Sun, 28 Jul 2019 07:05:53 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr109239166wro.162.1564322752779;
 Sun, 28 Jul 2019 07:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-3-hverkuil-cisco@xs4all.nl> <20190727093745.GB16618@aptenodytes>
In-Reply-To: <20190727093745.GB16618@aptenodytes>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 28 Jul 2019 23:05:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com>
Message-ID: <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com>
Subject: Re: [PATCH 02/14] videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 27, 2019 at 6:37 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
> > Add an enum_fmt format flag to specifically tag coded formats where
> > full bitstream parsing is supported by the device.
> >
> > Some stateful decoders are capable of fully parsing a bitstream,
> > but others require that userspace pre-parses the bitstream into
> > frames or fields (see the corresponding pixelformat descriptions
> > for details).
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
> > index 822d6730e7d2..4e24e671f32e 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
> >        - This format is not native to the device but emulated through
> >       software (usually libv4l2), where possible try to use a native
> >       format instead for better performance.
> > +    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
> > +      - 0x0004
> > +      - The hardware decoder for this compressed bitstream format (aka coded
> > +     format) is capable of parsing the bitstream. Applications do not
> > +     need to parse the bitstream themselves to find the boundaries between
> > +     frames/fields. This flag can only be used in combination with the
> > +     ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> > +     formats only.
>
> Should this flag be set for stateless codecs as well? It seems a bit over-kill
> for this case. I am not sure whether "compressed bitstream format" clearly only
> covers the formats used by stateful decoders and not the ones for stateless
> decoders.

I'd suggest using a different name for the flag, because "bitstream
parser" is actually one of the core differences between stateful and
stateless. All stateful decoders have bitstream parsers, the only
difference between the implementations is the unit on which the parser
operates, i.e. full stream, frame, NALU.

Perhaps V4L2_FMT_FLAG_CONTINUOUS_BITSTREAM (as opposed to discrete,
framed/sliced chunks)?

Regardless of that, it doesn't make sense for a stateless decoder to
set this flag anyway, because the userspace needs to parse the whole
stream anyway and the whole stateless API is based on the assumption
that the userspace splits the bitstream into frames (or slices).

Best regards,
Tomasz
