Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17B625F92
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 10:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfEVIce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 04:32:34 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:33067 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728784AbfEVIce (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 04:32:34 -0400
Received: by mail-wm1-f51.google.com with SMTP id c66so4145500wme.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X3hxowui42rvOVqxWQKg3nCZ/EQuD8g44cM3fDxu9Kc=;
        b=WxJbBiWBwgu2T0DXvHfShseNTB5d88vbxRJQ5Zm3jRcxYpQDP/0WF+v5FsGCkNUkVa
         7Om8aivBmhwOFkDYFj0ednLrnx1juu/5jsfPabGo7M9kn3PE6Xqk9hceNlcV8dBdo3QI
         V1sHhM6Pq0d7WgTRJl8sSgh83GLFrd5oCRJj98v0WWR5sliVFMiTwnF44KPLMOKYLhKO
         aMQd9TVEcpATeCFiR9/u/59c2JI+HtU4mbMn+qkETLRXCRscIIya2ZCtzYK2ODPW9WMW
         u5eqWkgLxEnInzbEuHfcaSC6S4BkGrsVwBiw3jdZm5moMhKmUfF2u1vxLUu9rhPz+d+j
         jhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X3hxowui42rvOVqxWQKg3nCZ/EQuD8g44cM3fDxu9Kc=;
        b=OXlK5G6tji0+w3gjlWz/XuqTNzyiN4eLK01soiVwPcZNZYKo9uawP6tsheL8eYnmji
         qo3X8VC6XkKvShaO5tjuDdys33HE3l18+YMSC+J5YPg5hN3suC4JdqjC8r/6+3N2X4R4
         nO+Ifk4/aKNlxIpyUF3S92lMsdmtRi+/UvNwHHY7fZu0+PYIdDChw28MMV5IneoQaXQ4
         x7fErxvkKGPJK6j//1kRbIf99fYtxKiLc4i1KoJELTKRGbhtXdEwLwZcSUX86jQaPS21
         bjSE7NzpS2hesMiTp/B1Qzrdddmzu4hMeM01d65vMkypER7ffSV893WEx/obRVte9+BA
         Wrsg==
X-Gm-Message-State: APjAAAWKobqcPFwHC1YfeGNetnzyxbikzRYl71bPDApyLqlygBKILqyp
        MjJPG/tnfLudidg1B5iXof4=
X-Google-Smtp-Source: APXvYqxRshfMHZImKAQBgmPTPD9xvDlgYATtqLizTqIaN+Ejj2mnAfz3bvNHUlpAJ8bsHf8eexWT6Q==
X-Received: by 2002:a1c:e714:: with SMTP id e20mr6339164wmh.143.1558513951164;
        Wed, 22 May 2019 01:32:31 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id b12sm11833641wmg.27.2019.05.22.01.32.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 01:32:30 -0700 (PDT)
Date:   Wed, 22 May 2019 10:32:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190522083229.GB30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <20190521154358.GC7098@ulmo>
 <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
 <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
 <20190522092924.116b212e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <20190522092924.116b212e@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 09:29:24AM +0200, Boris Brezillon wrote:
> On Wed, 22 May 2019 15:39:37 +0900
> Tomasz Figa <tfiga@chromium.org> wrote:
>=20
> > > It would be premature to state that we are excluding. We are just
> > > trying to find one format to get things upstream, and make sure we ha=
ve
> > > a plan how to extend it. Trying to support everything on the first try
> > > is not going to work so well.
> > >
> > > What is interesting to provide is how does you IP achieve multi-slice
> > > decoding per frame. That's what we are studying on the RK/Hantro chip.
> > > Typical questions are:
> > >
> > >   1. Do all slices have to be contiguous in memory
> > >   2. If 1., do you place start-code, AVC header or pass a seperate in=
dex to let the HW locate the start of each NAL ?
> > >   3. Does the HW do support single interrupt per frame (RK3288 as an =
example does not, but RK3399 do) =20
> >=20
> > AFAICT, the bit about RK3288 isn't true. At least in our downstream
> > driver that was created mostly by RK themselves, we've been assuming
> > that the interrupt is for the complete frame, without any problems.
>=20
> I confirm that's what happens when all slices forming a frame are packed
> in a single output buffer: you only get one interrupt at the end of the
> decoding process (in that case, when the frame is decoded). Of course,
> if you split things up and do per-slice decoding instead (one slice per
> buffer) you get an interrupt per slice, though I didn't manage to make
> that work.
> I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is not
> fully decoded") on the first slice and an ASO (Arbitrary Slice Ordering)
> interrupt on the second slice, which makes me think some states are
> reset between the 2 operations leading the engine to think that the
> second slice is part of a new frame.

That sounds a lot like how this works on Tegra. My understanding is that
for slice decoding you'd also get an interrupt every time a full slice
has been decoded perhaps coupled with another "frame done" interrupt
when the full frame has been decoded after the last slice.

In frame-level decode mode you don't get interrupts in between and
instead only get the "frame done" interrupt. Unless something went wrong
during decoding, in which case you also get an interrupt but with error
flags and status registers that help determine what exactly happened.

> Anyway, it doesn't sound like a crazy idea to support both per-slice
> and per-frame decoding and maybe have a way to expose what a
> specific codec can do (through an extra cap mechanism).

Yeah, I think it makes sense to support both for devices that can do
both. From what Nicolas said it may make sense for an application to
want to do slice-level decoding if receiving a stream from the network
and frame-level decoding if playing back from a local file. If a driver
supports both, the application could detect that and choose the
appropriate format.

It sounds to me like using different input formats for that would be a
very natural way to describe it. Applications can already detect the set
of supported input formats and set the format when they allocate buffers
so that should work very nicely.

> The other option would be to support only per-slice decoding with a
> mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
> only support per-frame decoding know when they should trigger the
> decoding operation. The downside is that it implies having a bounce
> buffer where the driver can pack slices to be decoded on the END_FRAME
> event.

I vaguely remember that that's what the video codec abstraction does in
Mesa/Gallium. I'm not very familiar with V4L2, but this seems like it
could be problematic to integrate with the way that V4L2 works in
general. Perhaps sending a special buffer (0 length or whatever) to mark
the end of a frame would work. But this is probably something that
others have already thought about, since slice-level decoding is what
most people are using, hence there must already be a way for userspace
to somehow synchronize input vs. output buffers. Or does this currently
just work by queueing bitstream buffers as fast as possible and then
dequeueing frame buffers as they become available?

Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlCRoACgkQ3SOs138+
s6Hllw//Tkyc9LuIKlkx/ClOGBzJC7QhRnDfBO7LT7FwzGlPwV9ItXIKyvGHSJ+h
aeqe3wLsYfLFYIWFJ1MQwI1uibK4t/sFSx2KDmhnD/Rv5K7h14krYnKry05qT0Tq
0+S3AOY4xxRZyHp/ZLn//xq2ic0VmcHe+/J54nQNsPrYDWvXi1R2Gwxn772ya1Ns
E2FvH18p5AFKO+39WCxzcAs0VK7fLmGV9eWWX/McLfiU3VtfajBnziwh3U9/Tth7
QuS3rXuSttiXxfIcjX28PoUjmj6dc8WdZFRRhwxGFYhUVDSzgPUEnLNltVYBm+SM
bHieiMRqYT7heXOzV+u58bUlT5NECemUszGq1/VvQKWc8b4NeIafGWUL8eNPWsqM
f0OkeNjGtGPbJiEWa5NcfTVPG4PXmfbsnszgMQIeahzeuR9e6qacYVBPuK0Ckrb8
8Sq78p0yAkDQ3rKJ+gZG9ksq4LsmpE7Q85NweRsN2NL6sEtc+Ac67mFUtgOYnfJI
iZCoLfUNJrNz8Xk43LB+0IlI/bf32lkStGy3di4DW+h6NzxmukEUXNN7oMGgUW2G
OCeQwu0/a8boOvC+emoIAqvR7h2MIDvMuD14w0qa3nUyzQhPxDJHLipAgWl3wlAb
7Sbc0E4V/6f1P3h4ipbo6hm+LmoY3heDjlpQEe1ihOz9ghMVPlY=
=be6m
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
