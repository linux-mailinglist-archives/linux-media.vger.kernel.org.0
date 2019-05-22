Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3EEA25DDC
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 08:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbfEVGCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 02:02:04 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:35962 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfEVGCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 02:02:04 -0400
Received: by mail-ed1-f54.google.com with SMTP id a8so2031503edx.3
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 23:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dix/4D/hmMjfzk6ndIY9b/lFgw9MVKURoZP+I9g7lpk=;
        b=PW9A9aQeK/e1HMQNGjmw0lB4lGRGy943l8+cEplLhtvfeN++fmdW/nAD9Cg+DFivry
         DVb4MlKy+Vr05UZzlmmfmxYJH6lvrwEpzlVX96bUbcoFQeGcQg1Ve3aWyX8Wd/4VO4+9
         AN/R3Si069t2L/x6CUtaQ6a2zAH98RxctRxU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dix/4D/hmMjfzk6ndIY9b/lFgw9MVKURoZP+I9g7lpk=;
        b=sn+9TATo+qvsdTHhNhltWC/XNUVvaHeosThUr8oME7NnoOsRFdf82BaTn+rKWGRLGQ
         W2pe5Fl8SvQXQsbSyS4Dx8Ufd/nZ4JUqQm2s3y6oCCh0J9y8/NC6gkuBQ/xGxPknlXpD
         Pco1Ypm3AVS4TTmBkIeX8ERWkHbv+3ccsvNnA50SqTDYpy4SGkl+qStqIaOIBm9thB4y
         PbHGVlt8OCF8gbsqzHzUDnSC/Pbpzra2pcIdrZOgqglnIDUi3WX5of9vscREcamWTlec
         FLKDWLrVALGen15Ic/7G/TJ3CsFf2BJEFk/9eDqDHxLGyP4RtO/g9PHe3RECOzRq5nld
         ozyw==
X-Gm-Message-State: APjAAAVz3HVGiuxlxJjVBjsJowsgyLKzwxIsqBgjZ7Rue09U3F6ZuatK
        darhkknlCSorKELXEAdwC7Bux2YH68Ci+Q==
X-Google-Smtp-Source: APXvYqwIgZXF7bx4luU+5U0O+sBOMH2SFZK3vrY9Lr8PkdT38iN4Tj/V0T8a4nbCYqpaws1+9QQEJw==
X-Received: by 2002:a50:a522:: with SMTP id y31mr86484388edb.69.1558504922357;
        Tue, 21 May 2019 23:02:02 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id i33sm6914795ede.47.2019.05.21.23.02.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 23:02:01 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id f8so784461wrt.1
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 23:02:01 -0700 (PDT)
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr41341474wrr.149.1558504920656;
 Tue, 21 May 2019 23:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com> <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
In-Reply-To: <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 22 May 2019 15:01:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C4qgfm7oi=kC8Z-9du954G3gMOANOw0bDXO2-Ny6_=yw@mail.gmail.com>
Message-ID: <CAAFQd5C4qgfm7oi=kC8Z-9du954G3gMOANOw0bDXO2-Ny6_=yw@mail.gmail.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 21, 2019 at 8:45 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Tue, 2019-05-21 at 19:27 +0900, Tomasz Figa wrote:
> > On Thu, May 16, 2019 at 2:43 AM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > > Hi,
> > >
> > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9=
crit :
> > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > Hi,
> > > > >
> > > > > With the Rockchip stateless VPU driver in the works, we now have =
a
> > > > > better idea of what the situation is like on platforms other than
> > > > > Allwinner. This email shares my conclusions about the situation a=
nd how
> > > > > we should update the MPEG-2, H.264 and H.265 controls accordingly=
.
> > > > >
> > > > > - Per-slice decoding
> > > > >
> > > > > We've discussed this one already[0] and Hans has submitted a patc=
h[1]
> > > > > to implement the required core bits. When we agree it looks good,=
 we
> > > > > should lift the restriction that all slices must be concatenated =
and
> > > > > have them submitted as individual requests.
> > > > >
> > > > > One question is what to do about other controls. I feel like it w=
ould
> > > > > make sense to always pass all the required controls for decoding =
the
> > > > > slice, including the ones that don't change across slices. But th=
ere
> > > > > may be no particular advantage to this and only downsides. Not do=
ing it
> > > > > and relying on the "control cache" can work, but we need to speci=
fy
> > > > > that only a single stream can be decoded per opened instance of t=
he
> > > > > v4l2 device. This is the assumption we're going with for handling
> > > > > multi-slice anyway, so it shouldn't be an issue.
> > > >
> > > > My opinion on this is that the m2m instance is a state, and the dri=
ver
> > > > should be responsible of doing time-division multiplexing across
> > > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > > userspace would require some sort of daemon to work properly across
> > > > processes. I also think the kernel is better place for doing resour=
ce
> > > > access scheduling in general.
> > >
> > > I agree with that yes. We always have a single m2m context and specif=
ic
> > > controls per opened device so keeping cached values works out well.
> > >
> > > So maybe we shall explicitly require that the request with the first
> > > slice for a frame also contains the per-frame controls.
> > >
> >
> > Agreed.
> >
> > One more argument not to allow such multiplexing is that despite the

^^ Here I meant the "userspace multiplexing".

> > API being called "stateless", there is actually some state saved
> > between frames, e.g. the Rockchip decoder writes some intermediate
> > data to some local buffers which need to be given to the decoder to
> > decode the next frame. Actually, on Rockchip there is even a
> > requirement to keep the reference list entries in the same order
> > between frames.
>
> Well, what I'm suggesting is to have one stream per m2m context, but it
> should certainly be possible to have multiple m2m contexts (multiple
> userspace open calls) that decode different streams concurrently.
>
> Is that really going to be a problem for Rockchip? If so, then the
> driver should probably enforce allowing a single userspace open and m2m
> context at a time.

No, that's not what I meant. Obviously the driver can switch between
different sets of private buffers when scheduling different contexts,
as long as the userspace doesn't attempt to do any multiplexing
itself.

Best regards,
Tomasz
