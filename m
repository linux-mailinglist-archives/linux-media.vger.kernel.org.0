Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70B4F269B2
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 20:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfEVSPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 14:15:30 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41958 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfEVSPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 14:15:30 -0400
Received: by mail-qk1-f195.google.com with SMTP id m18so2093941qki.8
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=F+3WHsssrstnT7OuTRHdjOXffUtBJ5jFmBM7YNeCPEw=;
        b=e4dxFcQl6La+KmpAOdyHVV8D+G2E5OONvpQbrizoL/7HopRdnZRgotQzOmFqpp4kzN
         NtVWMEeQfXvjaDYXLW5i4p1D2AAV15VdH6INWxDm2u6So6tvfQfpdUZLvm7LFXtakMDy
         7oTUQinI1Wc8Hn+3WedCFOaCzksQ9YwKN7sG4ZCA3TFJm1BG2dnhMnw8lhz/cSZ4pf96
         rulrBKbNmCk2viSWce0axg6L9lW7NHGk6i2NisBkePjHIaSMavz3GD3iHEr0gMS48HOt
         vt4UbZNemAOpep4rwuNVX5/XqVIUFonCD0i5fcQy3IdqthEoIw0Js4YqoQbEhPWqOvZ4
         2ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=F+3WHsssrstnT7OuTRHdjOXffUtBJ5jFmBM7YNeCPEw=;
        b=p+lrRs+BZQGSjGAE1HiYAN8dJwitPXaZn4CRgGVlbH1UK+NNTP1YIr/dlFYbAEA46i
         NSKE6DOSBM5kbD/QQIZQP1iWLkTalZ/AeFyiC6jcz2mXkTbRju+0IRm3f3uGEECAgsUm
         KWnsvB6NCQYfqDUyt1Q0GUjldNAfFUW9SXyFODULIReUBT6cYCFblHlYtM7rvx2Fol72
         +8uKyu2PRyWEFH/l62pXoevCL7BOR5NZTQXiQBw8wad6R4QGB8SakmzjsUSRT/Akaj/W
         jmr3+t6wRxEdxBFcRCQL1kwvwjBNg81CqIqvplXVy5NR4SlQ+vNyIP6dABMV4PI/CLad
         MGCg==
X-Gm-Message-State: APjAAAWsFZg9hqVMS55m1gCfsCuvU4JWazEJPf94U0f/986QgO0rOYxI
        vAaSJxrIvhBLWszUMQjt6+5uWg==
X-Google-Smtp-Source: APXvYqysNsPq8uSjRdrjYs8H5nzxGYuJtCWDuK5CBodsfw1DG7vpSDDgNv0ScXgkkIUGRadgh2c6xg==
X-Received: by 2002:a05:620a:47:: with SMTP id t7mr22772153qkt.327.1558548929174;
        Wed, 22 May 2019 11:15:29 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id z29sm12729119qkg.19.2019.05.22.11.15.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 11:15:27 -0700 (PDT)
Message-ID: <b685052546d788a8096ea9ea4f181397c5cadea6.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 22 May 2019 14:15:26 -0400
In-Reply-To: <CAAFQd5C4qgfm7oi=kC8Z-9du954G3gMOANOw0bDXO2-Ny6_=yw@mail.gmail.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
         <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
         <CAAFQd5C4qgfm7oi=kC8Z-9du954G3gMOANOw0bDXO2-Ny6_=yw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-SnWuFaxOwPK7ylCJjGIn"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-SnWuFaxOwPK7ylCJjGIn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 mai 2019 =C3=A0 15:01 +0900, Tomasz Figa a =C3=A9crit :
> On Tue, May 21, 2019 at 8:45 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
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
>=20
> ^^ Here I meant the "userspace multiplexing".

Thanks, I was confused for a moment (specially that browser is your use
case).

>=20
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
> No, that's not what I meant. Obviously the driver can switch between
> different sets of private buffers when scheduling different contexts,
> as long as the userspace doesn't attempt to do any multiplexing
> itself.
>=20
> Best regards,
> Tomasz

--=-SnWuFaxOwPK7ylCJjGIn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOWRvgAKCRBxUwItrAao
HBFyAKCx5Xur+MT6UVmYrZXXYzvoxJ64pQCdGdn6FSCrD9uj1T9+6LnUVg0koyQ=
=xmBW
-----END PGP SIGNATURE-----

--=-SnWuFaxOwPK7ylCJjGIn--

