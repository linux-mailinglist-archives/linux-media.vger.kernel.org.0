Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5034B6437C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 10:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfGJIYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 04:24:08 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45301 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfGJIYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 04:24:08 -0400
Received: by mail-ed1-f67.google.com with SMTP id e2so1312155edi.12
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2019 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nVtz/RtjwCEYdQFLJCW6G4ORFWnvHXCMUmZJUUl1vhA=;
        b=IXgXXgvXPtimF3q16gy1j+I8+arnl9Bg8UFUc7zPylYDNgUcqEsKezdXlSkr8TinyM
         RP3PPF87dV6otolRQcTPjk7kghAfb6pWq1K46lzseOnIq4tZl7XjeLRTMmGa5VQ/E/I2
         w9tPkxOIQyi2ZWBT0spXNJI/M92dIJI5K3O34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nVtz/RtjwCEYdQFLJCW6G4ORFWnvHXCMUmZJUUl1vhA=;
        b=MOhYOFlwTBB2w2IuzGwhEgbWXnD1lYB4jMmE67We3cNjHYYrF+G558qBD99w6JUpt8
         j8L5ztfK62s1stNa/F7RpE3Q8Igc08Y07FL293lxKoC7ZTmEDuf1wxrPpRuIyQp1LtLB
         HNuhqNq/R+KDlxeNdXFODYui2mf10/XvscQx7vsyRJE/ggZbJB3szToHfTKxWSb6BY86
         qg1UCQY8i4Mq6dgA8KAdJI2MbSRvov34LTBfNy55AAyZ2n8wYiYKG+4+WMx+3bTUiie1
         GclVab49Od4ojUWnT70wXlCubiFhfGxadkzkSaaUPoFJZULpJEZPzfvEsuKEFMH+/pHb
         w+XA==
X-Gm-Message-State: APjAAAVeWhToWpbD2mcDgmxSnwAXuWA7BXuOJ4/OdATI7yMmdAHgtib8
        6eV5iujKB7yeV/L/ofieHMP8sLX1BmHifw==
X-Google-Smtp-Source: APXvYqw7rxYNy6/Eo3QtG3Q6vSidtQ+JzuKbvCXTXgOMqCbMljw5TAsSDnG+oMSRQO1fnPk1bDjx0w==
X-Received: by 2002:a05:6402:6d0:: with SMTP id n16mr30048755edy.168.1562747045602;
        Wed, 10 Jul 2019 01:24:05 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a9sm508192edc.44.2019.07.10.01.24.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 01:24:04 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id p74so1262999wme.4
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2019 01:24:04 -0700 (PDT)
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr4020308wmk.10.1562747044241;
 Wed, 10 Jul 2019 01:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
 <20190603112835.19661-2-hverkuil-cisco@xs4all.nl> <CAAFQd5Aa-PQEakeg3sC_EDYdKy15hHx09Qmk6Jik4COeBe3xVA@mail.gmail.com>
 <02da6340-3174-c03b-ffad-cc9a0a58afab@xs4all.nl>
In-Reply-To: <02da6340-3174-c03b-ffad-cc9a0a58afab@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jul 2019 17:23:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A4+o9MZL8_TTdKOYa04O87GEi81PU2Kipa_Seeg98oMA@mail.gmail.com>
Message-ID: <CAAFQd5A4+o9MZL8_TTdKOYa04O87GEi81PU2Kipa_Seeg98oMA@mail.gmail.com>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 10, 2019 at 5:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
>
> On 7/3/19 6:58 AM, Tomasz Figa wrote:
> > Hi Hans,
> >
> > On Mon, Jun 3, 2019 at 8:28 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> =
wrote:
> >>
> >> From: Tomasz Figa <tfiga@chromium.org>
> >>
> >> Due to complexity of the video decoding process, the V4L2 drivers of
> >> stateful decoder hardware require specific sequences of V4L2 API calls
> >> to be followed. These include capability enumeration, initialization,
> >> decoding, seek, pause, dynamic resolution change, drain and end of
> >> stream.
> >>
> >> Specifics of the above have been discussed during Media Workshops at
> >> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> >> Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> >> originated at those events was later implemented by the drivers we alr=
eady
> >> have merged in mainline, such as s5p-mfc or coda.
> >>
> >> The only thing missing was the real specification included as a part o=
f
> >> Linux Media documentation. Fix it now and document the decoder part of
> >> the Codec API.
> >>
> >> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 ++++++++++++++++=
+
> >>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
> >>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
> >>  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
> >>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
> >>  5 files changed, 1132 insertions(+), 16 deletions(-)
> >>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> >>
> >
> > Thanks a lot for helping with remaining changes.
> >
> > Just one thing inline our team member found recently.
> >
> > [snip]
> >> +Capture setup
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> > [snip]
> >> +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_FM=
T` on the
> >> +    ``CAPTURE`` queue. The client may choose a different format than
> >> +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +      ``pixelformat``
> >> +          a raw pixel format.
> >
> > The client should be able to set the width and height as well. It's a
> > quite frequent case, especially in DMA-buf import mode, that the
> > buffers are actually bigger (e.g. more alignment) than what we could
> > get from the decoder by default. For sane hardware platforms it's
> > reasonable to expect that such bigger buffers could be handled as
> > well, as long as we update the width and height here.
>
> I've added this:
>
>      ``width``, ``height``
>          frame buffer resolution of the decoded stream; typically unchang=
ed from
>          what was returned with :c:func:`VIDIOC_G_FMT`, but it may be dif=
ferent
>          if the hardware supports composition and/or scaling.
>
> Is that what you were looking for?
>

Not sure if composition is a requirement here, but I guess it depends
on how we define composition. Most of the hardware today at least
support arbitrary strides (+/- some alignment), but still write the
pixels at (0,0)x(w,h).

In fact, there would be already some composition happening, even
without arbitrary strides, because G_FMT would return values aligned
in some way, but only the visible rectangle would contain meaningful
pixel data.

Best regards,
Tomasz
