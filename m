Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA8D25F1B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 10:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfEVII6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 04:08:58 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:39295 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfEVII6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 04:08:58 -0400
Received: by mail-wm1-f43.google.com with SMTP id n25so1133111wmk.4
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7HvbE/0BIpLfSTVkGloNWHf8c3bl4DIEneBol9c+CMA=;
        b=IddGXv1snBieJLrJHNIswIWfzKgiiI7/CCfxY1qjNXOqoiVus+3Gxh4yCmGbCCfR9w
         jJ66PvTrGFg7kYGxllSzs63GCwAPU1CuKpqcJ6+Cj9XQdP6S2Z75eEUGXZUckGK/NZYz
         bmFR73QSAZSVZWxeH00PKDf+lvI7Ai9Fws1kvaNFCZsAWPMCX2szalW1RuNVaHjUgjVT
         hLeU7Yqf+MG7hwk87YcNYRyKxYrxBmSuvjRXxntXLofgA1HSkoz8n2vr/xznV79JRL32
         1u2Mmy1ie2G446AVzATO7RZNnVcqYqsyGmeP9fhZUn2IBkMOBSSMUbkDuVXhOVnwyIUR
         Y29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7HvbE/0BIpLfSTVkGloNWHf8c3bl4DIEneBol9c+CMA=;
        b=SDnaPtItggjx0y80Def93qqCU9gwSomnqTdgBKzHV8Yn/0lLq2mlw07TYvO7O8gNPM
         W5wMIFVF/jYOHIp85C4uAI3/7F3HEI0yT4FuVyf5sGe96VETbRTlRm54lXAucw3XRkgM
         BLwYJCM4LzP3Uk2JoG4HoGVUmwBKszcMl4mpAbA9juzccv0v7mbJF1xxybj0U1uu+3sy
         rh2JsUaeirFdWTj7sq8/IHSFPPMPezE7hZl4OYLdcrJ6XkaCz/CQrnxDL0Jegec3rghO
         dYuFdbXdPVIr+FP8dPGmOTsFc0i0e8MNx1RAQp2SoQ5fahuGWOLHswopaJ6G+4MVQ/wl
         ohRA==
X-Gm-Message-State: APjAAAUC/TA5OHQ57tPHPKbyoDIPKnT+Jq1nlNBKJdkH9f/nyqGMKfxW
        roA+pp8chp9MJD9OTne/RFE=
X-Google-Smtp-Source: APXvYqxpGFUluikVxyh8XxVEqocZ8brEagBLlONS6CYSWAA/CFLkVwXPUCdfRdZ6n9+qkhTWsb3nGw==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr5893991wmc.40.1558512536023;
        Wed, 22 May 2019 01:08:56 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 91sm36673875wrs.43.2019.05.22.01.08.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 01:08:54 -0700 (PDT)
Date:   Wed, 22 May 2019 10:08:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190522080853.GA30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
 <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
 <20190521150939.GB7098@ulmo>
 <e8d228e84075e1dd4d89c5094192e282bc76003f.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <e8d228e84075e1dd4d89c5094192e282bc76003f.camel@ndufresne.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 12:07:47PM -0400, Nicolas Dufresne wrote:
> Le mardi 21 mai 2019 =C3=A0 17:09 +0200, Thierry Reding a =C3=A9crit :
> > On Tue, May 21, 2019 at 01:44:50PM +0200, Paul Kocialkowski wrote:
> > > Hi,
> > >=20
> > > On Tue, 2019-05-21 at 19:27 +0900, Tomasz Figa wrote:
> > > > On Thu, May 16, 2019 at 2:43 AM Paul Kocialkowski
> > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > > Hi,
> > > > >=20
> > > > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =
=C3=A9crit :
> > > > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a=
 =C3=A9crit :
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > With the Rockchip stateless VPU driver in the works, we now h=
ave a
> > > > > > > better idea of what the situation is like on platforms other =
than
> > > > > > > Allwinner. This email shares my conclusions about the situati=
on and how
> > > > > > > we should update the MPEG-2, H.264 and H.265 controls accordi=
ngly.
> > > > > > >=20
> > > > > > > - Per-slice decoding
> > > > > > >=20
> > > > > > > We've discussed this one already[0] and Hans has submitted a =
patch[1]
> > > > > > > to implement the required core bits. When we agree it looks g=
ood, we
> > > > > > > should lift the restriction that all slices must be concatena=
ted and
> > > > > > > have them submitted as individual requests.
> > > > > > >=20
> > > > > > > One question is what to do about other controls. I feel like =
it would
> > > > > > > make sense to always pass all the required controls for decod=
ing the
> > > > > > > slice, including the ones that don't change across slices. Bu=
t there
> > > > > > > may be no particular advantage to this and only downsides. No=
t doing it
> > > > > > > and relying on the "control cache" can work, but we need to s=
pecify
> > > > > > > that only a single stream can be decoded per opened instance =
of the
> > > > > > > v4l2 device. This is the assumption we're going with for hand=
ling
> > > > > > > multi-slice anyway, so it shouldn't be an issue.
> > > > > >=20
> > > > > > My opinion on this is that the m2m instance is a state, and the=
 driver
> > > > > > should be responsible of doing time-division multiplexing across
> > > > > > multiple m2m instance jobs. Doing the time-division multiplexin=
g in
> > > > > > userspace would require some sort of daemon to work properly ac=
ross
> > > > > > processes. I also think the kernel is better place for doing re=
source
> > > > > > access scheduling in general.
> > > > >=20
> > > > > I agree with that yes. We always have a single m2m context and sp=
ecific
> > > > > controls per opened device so keeping cached values works out wel=
l.
> > > > >=20
> > > > > So maybe we shall explicitly require that the request with the fi=
rst
> > > > > slice for a frame also contains the per-frame controls.
> > > > >=20
> > > >=20
> > > > Agreed.
> > > >=20
> > > > One more argument not to allow such multiplexing is that despite the
> > > > API being called "stateless", there is actually some state saved
> > > > between frames, e.g. the Rockchip decoder writes some intermediate
> > > > data to some local buffers which need to be given to the decoder to
> > > > decode the next frame. Actually, on Rockchip there is even a
> > > > requirement to keep the reference list entries in the same order
> > > > between frames.
> > >=20
> > > Well, what I'm suggesting is to have one stream per m2m context, but =
it
> > > should certainly be possible to have multiple m2m contexts (multiple
> > > userspace open calls) that decode different streams concurrently.
> > >=20
> > > Is that really going to be a problem for Rockchip? If so, then the
> > > driver should probably enforce allowing a single userspace open and m=
2m
> > > context at a time.
> >=20
> > If you have hardware storing data necessary to the decoding process in
> > buffers local to the decoder you'd have to have some sort of context
> > switch operation that backs up the data in those buffers before you
> > switch to a different context and restore those buffers when you switch
> > back. We have similar hardware on Tegra, though I'm not exactly familiar
> > with the details of what is saved and how essential it is. My
> > understanding is that those internal buffers can be copied to external
> > RAM or vice versa, but I suspect that this isn't going to be very
> > efficient. It may very well be that restricting to a single userspace
> > open is the most sensible option.
>=20
> That would be by far the worst for a browser use case where an adds
> might have stolen that single instance you have available in HW. It's
> normal that context switching will have some impact on performance, but
> in general, most of the time, the other instances will be idles by
> userspace. If there is not context switches, there should be no (or
> very little overhead). Of course, it's should not be a heard
> requirement to get a driver in the kernel, I'm not saying that.

Sounds like we're in agreement. I didn't mean to imply that all drivers
should be single-open. I was just trying to say that there may be cases
where it's not possible or highly impractical to do a context switch or
multiple ones in a driver.

> p.s. In the IMX8M/Hantro G1 they specifically says that the single core
> decoder can handle up to 8 1080p60 streams at the same time. But there
> is some buffers being write-back by the IP for every slice (at the end
> of the decoded reference frames).

I know that there is a similar mechanism on VDE for Tegra where an extra
auxiliary buffer can be defined where extra data is written, though it's
only used for some profiles (H.264 constrained baseline for example does
not seem to require that). I think this has to do with reference picture
marking. It may very well be that the other internal buffers don't
actually need to persist across multiple frame decode operations, which
would of course eliminate any concurrency issues.

Sorry for this being somewhat vague. I've only begun to familiarize
myself with the VDE and I keep getting side-tracked by a bunch of other
things. But I'm trying to pitch in while the discussion is ongoing in
the hope that it will help us come up with the best solution.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlA5IACgkQ3SOs138+
s6HXdg//QiYB5Q4PBUyVuwmpCtmcvY63godklB/brEpU1XDIJUHuMBIwvGnjQs3C
Gvoedb2MvJ2c40X9ziw8eVRF0U8nD7NDE/CCSaEDHRjoLBVttYgLyWrX9DobbVLd
z8tfRpFMGPPnCxi+75LZXET4d3Kkiqnxz91ZUc020xlB6vQcuq9IjG5YULdGVwzD
OEy/e8ZC1BerPTnG2QNVxhlzmL84t0Kw/jaGTO3fjaOCyX7nOcdmDWQpbp2FOMfz
0EQJ1Hp42HRjZ5q6eTvIJVgWG8U6W2tOtwh70227NiQ6U8uoD9vGBh8kkkdthDKp
TEywE3QWcGNZv1RJlK1tmtUStEvUA2PkxgzY70DHKPjS7Bj9a7JQCs8ZHxFJlaZ/
yuvG726rQQmyct2rkj4F5c4rKpv6XAG2wvLMYn4HXvwAoIiSh1HmYvLjpFER7tX0
1HXiTp9CTY8iFuXugR6H4Tf9KWndeUhrwUadY2tDws2EjXgxTNOrQ+Lk51zs/OER
lmMEosonUzekrD/rHxcqKkJekx5fCT+/SCSCfQnvG0iO11/QB4G6Y7eJ5juw2fiA
WBmZg5z1gRG4+KXUNbvbx4iZhZJTYQcd+BgEPP5Bw4DElSpk3T/UR3o4zuXwfwos
jR66u3GCCMbHUshU+bK20AsCOFuZ1VQ/IksB7PylEh9rwGLIPiU=
=osCS
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
