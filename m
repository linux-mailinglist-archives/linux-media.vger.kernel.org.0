Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772D4254E4
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 18:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbfEUQHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 12:07:53 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:46396 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfEUQHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 12:07:52 -0400
Received: by mail-qk1-f179.google.com with SMTP id a132so11337638qkb.13
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=Zfpz4jPAMTdeib1AnC8rFZIRlWb18DBKPeUXHGMfePo=;
        b=mNUDH3usV1c0i0D/JM9sk3KtnyjvxfnhvXIbZGa6lWBw890YhvoaCcost0P/5TGKUI
         qjICCG0hQPRLma9xqhJYdj53WK6gfsQeaJC20CRKcNMfcjfQNSlPeVVUCb93/i2atMaj
         OofNI9tdHd4+HCqVAkDrI4YosujH0LMVr2mDpF6XlvxlN34CC6IGwG4/cXPiQXchLryO
         cofTbaHK6Bb8mHdsjHXjFKoptaTXT6B8FSWp17ogw0pg0keLqxI0wyeTdugSGqkpn7ph
         a9Ttw3FGHfce2jFmY3CEoLZgq4Q/EARvFy70/ZjpfhPMDnxbWEhSVeAbD3BjvURmhhs8
         BJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Zfpz4jPAMTdeib1AnC8rFZIRlWb18DBKPeUXHGMfePo=;
        b=GjzXGpxqkpa6UtkHCl3Z9BFAUIogxGVzEgj7h3Eb4Dt4De6hdx66qOFQ4z04fWZc8T
         6Um97yRUHHVJN31mRqL4TaIbSnWnHRu1Lp1O5qic2AWtqziMkt4s5oxz6kPzLUHJGPQn
         kaQZst8w5i/COCWyQjFwnOe4quZ/tps76iz+1+wgjvXyUSvRf6HdKme4xkVc1RCYXNWX
         mlgjb71SqRnyK02lmcg1s44to9mh9lwJ0UTU6WOjIuC4tCKkppfTtZoLlFPuOrI1GZNI
         P6Azqcenpi8rA+hgbU4ys/WDo6U1jxBWJJUhpvB0kAJqT963egjVqzH4wRfHOW4/8xy4
         R7wQ==
X-Gm-Message-State: APjAAAWYq8GJn3Epdz7MSbIJ3gcyKjQgawGFLx40qW+ByZqeJpatXLZp
        9Xtrpkwf56DnFkY5Ea09swfAsA==
X-Google-Smtp-Source: APXvYqwQvL5c3abBnctBoW8pzqpt262lhACtriaLHz5gEu1nFLAZL75NMatW2cJ7pwd6gaeso9m5XA==
X-Received: by 2002:a37:ad12:: with SMTP id f18mr63754889qkm.145.1558454871413;
        Tue, 21 May 2019 09:07:51 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id y47sm6185032qtb.55.2019.05.21.09.07.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 09:07:49 -0700 (PDT)
Message-ID: <e8d228e84075e1dd4d89c5094192e282bc76003f.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Tue, 21 May 2019 12:07:47 -0400
In-Reply-To: <20190521150939.GB7098@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
         <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
         <20190521150939.GB7098@ulmo>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-rkd2tl0f6Qh2tn6dJXar"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-rkd2tl0f6Qh2tn6dJXar
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 21 mai 2019 =C3=A0 17:09 +0200, Thierry Reding a =C3=A9crit :
> On Tue, May 21, 2019 at 01:44:50PM +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Tue, 2019-05-21 at 19:27 +0900, Tomasz Figa wrote:
> > > On Thu, May 16, 2019 at 2:43 AM Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> wrote:
> > > > Hi,
> > > >=20
> > > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=
=A9crit :
> > > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =
=C3=A9crit :
> > > > > > Hi,
> > > > > >=20
> > > > > > With the Rockchip stateless VPU driver in the works, we now hav=
e a
> > > > > > better idea of what the situation is like on platforms other th=
an
> > > > > > Allwinner. This email shares my conclusions about the situation=
 and how
> > > > > > we should update the MPEG-2, H.264 and H.265 controls according=
ly.
> > > > > >=20
> > > > > > - Per-slice decoding
> > > > > >=20
> > > > > > We've discussed this one already[0] and Hans has submitted a pa=
tch[1]
> > > > > > to implement the required core bits. When we agree it looks goo=
d, we
> > > > > > should lift the restriction that all slices must be concatenate=
d and
> > > > > > have them submitted as individual requests.
> > > > > >=20
> > > > > > One question is what to do about other controls. I feel like it=
 would
> > > > > > make sense to always pass all the required controls for decodin=
g the
> > > > > > slice, including the ones that don't change across slices. But =
there
> > > > > > may be no particular advantage to this and only downsides. Not =
doing it
> > > > > > and relying on the "control cache" can work, but we need to spe=
cify
> > > > > > that only a single stream can be decoded per opened instance of=
 the
> > > > > > v4l2 device. This is the assumption we're going with for handli=
ng
> > > > > > multi-slice anyway, so it shouldn't be an issue.
> > > > >=20
> > > > > My opinion on this is that the m2m instance is a state, and the d=
river
> > > > > should be responsible of doing time-division multiplexing across
> > > > > multiple m2m instance jobs. Doing the time-division multiplexing =
in
> > > > > userspace would require some sort of daemon to work properly acro=
ss
> > > > > processes. I also think the kernel is better place for doing reso=
urce
> > > > > access scheduling in general.
> > > >=20
> > > > I agree with that yes. We always have a single m2m context and spec=
ific
> > > > controls per opened device so keeping cached values works out well.
> > > >=20
> > > > So maybe we shall explicitly require that the request with the firs=
t
> > > > slice for a frame also contains the per-frame controls.
> > > >=20
> > >=20
> > > Agreed.
> > >=20
> > > One more argument not to allow such multiplexing is that despite the
> > > API being called "stateless", there is actually some state saved
> > > between frames, e.g. the Rockchip decoder writes some intermediate
> > > data to some local buffers which need to be given to the decoder to
> > > decode the next frame. Actually, on Rockchip there is even a
> > > requirement to keep the reference list entries in the same order
> > > between frames.
> >=20
> > Well, what I'm suggesting is to have one stream per m2m context, but it
> > should certainly be possible to have multiple m2m contexts (multiple
> > userspace open calls) that decode different streams concurrently.
> >=20
> > Is that really going to be a problem for Rockchip? If so, then the
> > driver should probably enforce allowing a single userspace open and m2m
> > context at a time.
>=20
> If you have hardware storing data necessary to the decoding process in
> buffers local to the decoder you'd have to have some sort of context
> switch operation that backs up the data in those buffers before you
> switch to a different context and restore those buffers when you switch
> back. We have similar hardware on Tegra, though I'm not exactly familiar
> with the details of what is saved and how essential it is. My
> understanding is that those internal buffers can be copied to external
> RAM or vice versa, but I suspect that this isn't going to be very
> efficient. It may very well be that restricting to a single userspace
> open is the most sensible option.

That would be by far the worst for a browser use case where an adds
might have stolen that single instance you have available in HW. It's
normal that context switching will have some impact on performance, but
in general, most of the time, the other instances will be idles by
userspace. If there is not context switches, there should be no (or
very little overhead). Of course, it's should not be a heard
requirement to get a driver in the kernel, I'm not saying that.

p.s. In the IMX8M/Hantro G1 they specifically says that the single core
decoder can handle up to 8 1080p60 streams at the same time. But there
is some buffers being write-back by the IP for every slice (at the end
of the decoded reference frames).

>=20
> Thierry

--=-rkd2tl0f6Qh2tn6dJXar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOQiUwAKCRBxUwItrAao
HNlzAJ9uF4PNfVWLLzTLdYdUIKV/CN1jcwCgyNQHzcwneGhWvQcJwjTTH5NS9kg=
=aavA
-----END PGP SIGNATURE-----

--=-rkd2tl0f6Qh2tn6dJXar--

