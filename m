Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE2878CA4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 15:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387629AbfG2NTP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 09:19:15 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40780 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387402AbfG2NTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 09:19:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so59277694eds.7
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0k0A8HOuK8qntry9AzOiBypiNkgrUW7+554kVdGOHro=;
        b=RPekit8rnvloyJKZrtAw8Z/RX5wr0cBlai33ad7SPby/3sndoSqBWXuTRAhnHfgLu2
         N+ZBuDky83njprTs1iuAKUxj+MYCEv942mWemg/9OZ3Jqnsn/j2ZsCvZpyUcGxg4Lw+T
         V9lH/qvcW9z0kDGdZxvfdMSrZQyiWSCXwrTPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0k0A8HOuK8qntry9AzOiBypiNkgrUW7+554kVdGOHro=;
        b=TuClUVTGfzCcUragiHb6q3tkQ6IawSCCTBwW42aYEWz3FO08QsPbxVyVhYZGSC7wBH
         DuyuNLEVooiw6jCSWpp0TLpQPciQ3mV1Ix32Nle8cyGuS9l1660kjxXIb7cv8GSZHeBi
         hs47FgVpX8FoQg99OZPLsIuVItBtwTwnqGKVhNamJ56N6imtuGq9/NAUf1hTkAbPKeht
         SIxdNvwvYemYz5oA2HHA5oGZ4feGVJQRoEs9R+RHIgOQVUczDqTE2/zv8IWDtzRvM4SH
         on5eMsNwk3sTzEFDM4WzvrRrWuqp83mzSb4m35S14UsMCJkeBtLqLxRlX+Xd1eTs3IMw
         lZgg==
X-Gm-Message-State: APjAAAVsHtvlUgoL9NntktZqGEPpGQqUQd38o5etubQTTmlKdp/qTaZG
        EhJ+3dLo4XohBlHg5ZBf1hPp9en/AYCGKQ==
X-Google-Smtp-Source: APXvYqz36T3le4nT5CDI0uh9H0rvYosVRc5KWQaWHxQnFHdK4uhp4QP4DJgLAbKajPcHFE0XhB277A==
X-Received: by 2002:aa7:c999:: with SMTP id c25mr95371861edt.134.1564406352245;
        Mon, 29 Jul 2019 06:19:12 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id jt17sm11618445ejb.90.2019.07.29.06.19.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 06:19:10 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id h19so43015119wme.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr80552087wml.64.1564406349812;
 Mon, 29 Jul 2019 06:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-3-hverkuil-cisco@xs4all.nl> <20190727093745.GB16618@aptenodytes>
 <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com> <20190729131229.GB24269@aptenodytes>
In-Reply-To: <20190729131229.GB24269@aptenodytes>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 29 Jul 2019 22:18:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Au5+AZvSG-5p9Zp32aUUANyEi-b68wHf=g_diBw-+2BQ@mail.gmail.com>
Message-ID: <CAAFQd5Au5+AZvSG-5p9Zp32aUUANyEi-b68wHf=g_diBw-+2BQ@mail.gmail.com>
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

On Mon, Jul 29, 2019 at 10:12 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Sun 28 Jul 19, 23:05, Tomasz Figa wrote:
> > On Sat, Jul 27, 2019 at 6:37 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
> > > > Add an enum_fmt format flag to specifically tag coded formats where
> > > > full bitstream parsing is supported by the device.
> > > >
> > > > Some stateful decoders are capable of fully parsing a bitstream,
> > > > but others require that userspace pre-parses the bitstream into
> > > > frames or fields (see the corresponding pixelformat descriptions
> > > > for details).
> > > >
> > > > If this flag is set, then this pre-parsing step is not required
> > > > (but still possible, of course).
> > > >
> > > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > ---
> > > >  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
> > > >  Documentation/media/videodev2.h.rst.exceptions   | 1 +
> > > >  include/uapi/linux/videodev2.h                   | 5 +++--
> > > >  3 files changed, 12 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > index 822d6730e7d2..4e24e671f32e 100644
> > > > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
> > > >        - This format is not native to the device but emulated through
> > > >       software (usually libv4l2), where possible try to use a native
> > > >       format instead for better performance.
> > > > +    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
> > > > +      - 0x0004
> > > > +      - The hardware decoder for this compressed bitstream format (aka coded
> > > > +     format) is capable of parsing the bitstream. Applications do not
> > > > +     need to parse the bitstream themselves to find the boundaries between
> > > > +     frames/fields. This flag can only be used in combination with the
> > > > +     ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> > > > +     formats only.
> > >
> > > Should this flag be set for stateless codecs as well? It seems a bit over-kill
> > > for this case. I am not sure whether "compressed bitstream format" clearly only
> > > covers the formats used by stateful decoders and not the ones for stateless
> > > decoders.
> >
> > I'd suggest using a different name for the flag, because "bitstream
> > parser" is actually one of the core differences between stateful and
> > stateless. All stateful decoders have bitstream parsers, the only
> > difference between the implementations is the unit on which the parser
> > operates, i.e. full stream, frame, NALU.
> >
> > Perhaps V4L2_FMT_FLAG_CONTINUOUS_BITSTREAM (as opposed to discrete,
> > framed/sliced chunks)?
>
> Sure, that seems like a more explicit name regarding what it's supposed to
> describe in my opinion.
>
> > Regardless of that, it doesn't make sense for a stateless decoder to
> > set this flag anyway, because the userspace needs to parse the whole
> > stream anyway and the whole stateless API is based on the assumption
> > that the userspace splits the bitstream into frames (or slices).
>
> Indeed, I agree that it doesn't make sense, but I thought that the name of the
> flag could be confusing. Since there is no direct equivalency between
> "stateless" and "doesn't parse the bitstream" (as we've seen with the rockchip
> decoder needing to parse the slice header on its own), that could have been
> ambiguous. I think the name you're suggesting mostly solves this concern.
>
> I'm still a bit unsure about what "compressed formats" entails or not, so it
> could be good to explicitly mention that this applies to stateful decoders only
> (but it's just a suggestion, advanced users of the API will probably find it
> straightforward).

My understanding is that a compressed format is any format that
doesn't have a directly accessible 2D pixel matrix in its memory
representation, so all the bitstream formats should have it set.

Best regards,
Tomasz
