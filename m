Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B36025388
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 17:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfEUPJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 11:09:45 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:56220 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbfEUPJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 11:09:44 -0400
Received: by mail-wm1-f48.google.com with SMTP id x64so3368097wmb.5
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M+hEE1g5GDPcT2UlDm0UsoaK0r1tFbtPNLXH89vCFxA=;
        b=ktaU4tMkfNZr7wQ3caH4Fbepb8VfLGt+0LVUNxdpRchdeQJ3OStM425zRRc/szDgnQ
         EC1tvx/m0PosDyoIWt3GAHgvrmVo7xuUVD1lPjCA2t8bOr5RlvrRJCDiZK7mOKuOX096
         kM7C2ibw1/sbvnnrzta0bvhFeANu62Fp6MFy+eMaC4YnvJ3iSWFasbAvJCUCk5rlz5p5
         u1huBxj0whwxxQEyRrq+yxmbsV9fQj4FDQS6gA4aTlaANvI5hOMS/HUGl91p2uelxV3n
         pR7aTpYVyUtTDamaipvOpxmIiSzfM94iwyS+H8eHHZq4+JC5WYvuIiinwJJJg+gprfhJ
         nCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M+hEE1g5GDPcT2UlDm0UsoaK0r1tFbtPNLXH89vCFxA=;
        b=pCLHj8YFm+g2j6MACHxZB8D4+TRZH8Y0K5SZDODyslm/sHApPBiNZ+DMGpwZAyerNL
         BHvVRI+uvczHITR0rdYbp7cUXnVbw6aOKXQatboOP83r9AH0S7yeL9Ov6jogJK4z+D2R
         VPVSXC3/CXj8xcfBemdnpYCqx+dNvU1O9/Eu6TbIkvB+kUF74RnHaPPyWuyzx4tJwjPU
         7Dhr3EOebXCueGO3GhwpD5qsc6wXjH2PEQmILvbUTb3Z35iJAb12WII6Oxd0bwFwkgXM
         kItCdGUV/U9y7a3fewhLqpxwAzH5xDQyJtDBMJOrUJjT3aY4tqvWavLMFVjJAqVnb/ni
         A7Ew==
X-Gm-Message-State: APjAAAWGnlcxGxaDziNQyPwPXW1qiHv1fsabPOdVo4zVCsDifwhezpaB
        IMGF5MwIdA0ff/+ByPT7hVA=
X-Google-Smtp-Source: APXvYqyvTO7HiQRHj1jGqhzIN5sGh2doeKiwrtYnrOYPL7ywhxw9fv2fyiEWhmcl6pn5xs6J7uu8nw==
X-Received: by 2002:a1c:a904:: with SMTP id s4mr3665989wme.92.1558451382016;
        Tue, 21 May 2019 08:09:42 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v184sm5052662wma.6.2019.05.21.08.09.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 08:09:40 -0700 (PDT)
Date:   Tue, 21 May 2019 17:09:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
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
Message-ID: <20190521150939.GB7098@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
 <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 01:44:50PM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue, 2019-05-21 at 19:27 +0900, Tomasz Figa wrote:
> > On Thu, May 16, 2019 at 2:43 AM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > > Hi,
> > >=20
> > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9=
crit :
> > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > Hi,
> > > > >=20
> > > > > With the Rockchip stateless VPU driver in the works, we now have a
> > > > > better idea of what the situation is like on platforms other than
> > > > > Allwinner. This email shares my conclusions about the situation a=
nd how
> > > > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > > > >=20
> > > > > - Per-slice decoding
> > > > >=20
> > > > > We've discussed this one already[0] and Hans has submitted a patc=
h[1]
> > > > > to implement the required core bits. When we agree it looks good,=
 we
> > > > > should lift the restriction that all slices must be concatenated =
and
> > > > > have them submitted as individual requests.
> > > > >=20
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
> > > >=20
> > > > My opinion on this is that the m2m instance is a state, and the dri=
ver
> > > > should be responsible of doing time-division multiplexing across
> > > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > > userspace would require some sort of daemon to work properly across
> > > > processes. I also think the kernel is better place for doing resour=
ce
> > > > access scheduling in general.
> > >=20
> > > I agree with that yes. We always have a single m2m context and specif=
ic
> > > controls per opened device so keeping cached values works out well.
> > >=20
> > > So maybe we shall explicitly require that the request with the first
> > > slice for a frame also contains the per-frame controls.
> > >=20
> >=20
> > Agreed.
> >=20
> > One more argument not to allow such multiplexing is that despite the
> > API being called "stateless", there is actually some state saved
> > between frames, e.g. the Rockchip decoder writes some intermediate
> > data to some local buffers which need to be given to the decoder to
> > decode the next frame. Actually, on Rockchip there is even a
> > requirement to keep the reference list entries in the same order
> > between frames.
>=20
> Well, what I'm suggesting is to have one stream per m2m context, but it
> should certainly be possible to have multiple m2m contexts (multiple
> userspace open calls) that decode different streams concurrently.
>=20
> Is that really going to be a problem for Rockchip? If so, then the
> driver should probably enforce allowing a single userspace open and m2m
> context at a time.

If you have hardware storing data necessary to the decoding process in
buffers local to the decoder you'd have to have some sort of context
switch operation that backs up the data in those buffers before you
switch to a different context and restore those buffers when you switch
back. We have similar hardware on Tegra, though I'm not exactly familiar
with the details of what is saved and how essential it is. My
understanding is that those internal buffers can be copied to external
RAM or vice versa, but I suspect that this isn't going to be very
efficient. It may very well be that restricting to a single userspace
open is the most sensible option.

Thierry

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzkFLMACgkQ3SOs138+
s6G9dQ//djxhqo4M6crBU3/KY5T6CcPbS8DQgVr6OsybWFETSK9KZDKt8MfbHwQM
oWBDOlmZ6XairSua0Q7gKb3h6avxqkRs/C8hZCMF2vQ28ksaJ4lLK4bcj0QKNuKp
0835+9bu/eJcAG9uxqAVj6Pz/CHjpr0cW/mIl77nQZdxM8f7w1ikysW6TN8aSKeJ
L3A3huar/Q0S1z/6bxSxKTAb9PPZoObVjNmuM9MFIC4NxR5IcLf9UcxGi5Gmn7Ij
4ss63jkl83q6NjFO/LqDgEOnT2f9S6Ijvr6CzAIQA6iE77aitPd8YCQyWL7DzLDb
CRYmDwJPFvjJsQN4d2DhUDFxkgnwCpUhm0e9wxrPy7JQPwuLHYlYew7IyTcu+SwJ
mzcH6K/FXcOGFS09klD/lOY08wofd+iMHvWYCq6Yun/oOrulVSS6JmaXCxyr2K0c
EwFY+W+5nXcx3WqF6EG8KPBDgfSR5AmmLY0eq5Zhi09PAgEl+KwjJkDFvwtJjwzV
RAgbgnrft06AwsYzQmhcXhSw4hGZ5N/ynqL/dOc+XeV6fTCtaryfhQQMgda2wSkp
gYsL2uwM/Z/WQIgqAWjLoeO8WCg2BV7AIJCnIkixjeLV0iSvGi3WnlRuB3QgxYXo
PQ8VRzCi7nNicNaL4fJXTaKGMbCGOvtbVsN1irn8s0vnd8zy/18=
=hO+j
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
