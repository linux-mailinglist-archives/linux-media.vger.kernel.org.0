Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F140A341D9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfFDIcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:32:03 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:53329 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfFDIcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:32:02 -0400
Received: by mail-wm1-f51.google.com with SMTP id d17so6136936wmb.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8xHt+8Ca1vEgJJhk4mjfiO5d0YmcqSZqFTuRxyCJNvA=;
        b=aWpr2rBabJn4pBOLULxg8zaFiar5MvPcPaZjSRTe8Ds3nPfgzFxHrv9QeJ62X0SEPz
         JEDPC9MhihRSnIRJcPGs4cAXzCjJDtfsbiUIYtkKO7O9b4TNqj3orWRHZ03W5EI2+PvO
         FhfRJ4yvwOofzw0IFiFsyr4AZm396Rc+CRKNPZNGVXppJYkjFUp4+t3ncTYgOQH+pZ0n
         0Pd8Jm5zYsIX48P73cWhGBbdNLrWk8KPaxjcGi7B0o3EyHYtFmdvm/tJ9ch4luJWO/8Y
         vyidTDHWj6xhWFwIKADAZoaLjJrQ/qM8uAx1hxb/ta/4E8hHjxvcLHB7qkTusMYOzpN/
         CxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8xHt+8Ca1vEgJJhk4mjfiO5d0YmcqSZqFTuRxyCJNvA=;
        b=F4D0dKTV7FR5OZlIdyWMlE0OTg/uJLgBsWoHdDnlV5Ft8KzNtPjT72l2WgzzMkeWF5
         dQfFQ3siwxl2ET45A0hiBzH9cERus5nHLGqakMB7PS65/WiTIn2sFk6HSJjB3xwnGI02
         i61fhp4ZUuVqv+KdLekGVto6nv821dM0O2CPXDNDon4XMz1i91f6PQaevESrPg9zD/IQ
         XBfwz5c4FDcaq+bjwwEVsNzzumq3S8JcJeeQKZbwvf2X3P05otNnXjx7em1mXwiALdGx
         FhnP7rJLVQzWsjPDjgfvVsX7AiC35Dj9qynzg8JQoV+GVU8ulzcP6YbP3WW0F0IPW1NA
         n+9w==
X-Gm-Message-State: APjAAAXupUyAt0fBb97Va/dtABZZEMNeZFWSBG0DWR/hQKf1f4gF7jAG
        UFKpWxayO9jGks2knurs584vzJrP
X-Google-Smtp-Source: APXvYqzocS3DAtioPoy6pikCSI0iNF2f7c+liIQ3hGv0jfCh1jB+YTwvTh0n+J+pVgssUYBiHFxRTw==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr16919396wmh.103.1559637119249;
        Tue, 04 Jun 2019 01:31:59 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id k13sm11237716wmj.10.2019.06.04.01.31.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 01:31:58 -0700 (PDT)
Date:   Tue, 4 Jun 2019 10:31:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190604083157.GC9048@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <20190603112449.GA30132@ulmo>
 <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
 <20190603214117.664f6ba1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline
In-Reply-To: <20190603214117.664f6ba1@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 09:41:17PM +0200, Boris Brezillon wrote:
> On Mon, 03 Jun 2019 14:52:44 -0400
> Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>=20
> > > > - Dropping the DPB concept in H.264/H.265
> > > >=20
> > > > As far as I could understand, the decoded picture buffer (DPB) is a
> > > > concept that only makes sense relative to a decoder implementation.=
 The
> > > > spec mentions how to manage it with the Hypothetical reference deco=
der
> > > > (Annex C), but that's about it.
> > > >=20
> > > > What's really in the bitstream is the list of modified short-term a=
nd
> > > > long-term references, which is enough for every decoder.
> > > >=20
> > > > For this reason, I strongly believe we should stop talking about DP=
B in
> > > > the controls and just pass these lists agremented with relevant
> > > > information for userspace.
> > > >=20
> > > > I think it should be up to the driver to maintain a DPB and we could
> > > > have helpers for common cases. For instance, the rockchip decoder n=
eeds
> > > > to keep unused entries around[2] and cedrus has the same requirement
> > > > for H.264. However for cedrus/H.265, we don't need to do any book-
> > > > keeping in particular and can manage with the lists from the bitstr=
eam
> > > > directly. =20
> > >=20
> > > There was a bit of concern regarding this. Given that DPB maintenance=
 is
> > > purely a software construct, this doesn't really belong in the kernel=
=2E A
> > > DPB will be the same no matter what hardware operates on the bitstrea=
m.
> > > Depending on the hardware it may use the DPB differently (or maybe not
> > > at all), but that's beside the point, really. This is pretty much the
> > > same rationale as discussed above for meta data.
> > >=20
> > > Again, VAAPI and VDPAU don't require drivers to deal with this. Inste=
ad
> > > they just get the final list of reference pictures, ready to use. =20
> >=20
> > I think we need a bit of clarification from Boris, as what I read here
> > is a bit contradictory (or at least I am a bit confused). When I first
> > read this, I understood that this was just about renaming the dpb as
> > being the references list and only require the active references to be
> > there.
>=20
> It's really just about renaming the field, it would contain exactly the
> same data.
>=20
> >=20
> > So what I'm not clear is where exactly this "active reference list"
> > comes from. In VAAPI it is describe "per-frame" ....
>=20
> That's my understanding as well.
>=20
> >=20
> > >  =20
> > > > - Using flags
> > > >=20
> > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > represented as flags. Using flags also helps with padding.
> > > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > > default for that sounds fine (we definitely do want to keep some ro=
om
> > > > available and I don't think using 32 bits as a default is good enou=
gh).
> > > >=20
> > > > I think H.264/HEVC per-control flags should also be moved to u64. =
=20
> > >=20
> > > There was also some concensus on this, that u64 should be good enough
> > > for anything out there, though we obviously don't know what the future
> > > will hold, so perhaps adding some way for possible extending this in =
the
> > > future might be good. I guess we'll get new controls for new codecs
> > > anyway, so we can punt on this until then.
> > >  =20
> > > > - Clear split of controls and terminology
> > > >=20
> > > > Some codecs have explicit NAL units that are good fits to match as
> > > > controls: e.g. slice header, pps, sps. I think we should stick to t=
he
> > > > bitstream element names for those.
> > > >=20
> > > > For H.264, that would suggest the following changes:
> > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_head=
er;
> > > > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > > > where they belong, which seems to be slice_header; =20
> >=20
> > But now here it's being described per slice. When I look at the slice
> > header, I only see list of modifications and when I look at userspace,
> > That list is simply built from DPB, the modifications list found in the
> > slice header seems to be only used to craft the l0/l1 list.
>=20
> Yes, I think there was a misunderstanding which was then clarified
> (unfortunately it happened on IRC, so we don't have a trace of this
> discussion). The reference list should definitely be per-frame, and the
> L0/L1 slice reflists are referring to the per-frame reference list (it's
> just a sub-set of the per-frame reflist re-ordered differently).
>=20
> >=20
> > There is one thing that come up though, if we enable per-frame decoding
> > on top of per-slice decoder (like Cedrus), won't we force userspace to
> > always compute l0/l1 even though the HW might be handling that ?
>=20
> That's true, the question is, what's the cost of this extra re-ordering?

I think ultimately userspace is already forced to compute these lists
even if some hardware may be able to do it in hardware. There's going to
be other hardware that userspace wants to support that can't do it by
itself, so userspace has to at least have the code anyway. What it could
do on top of that decide not to run that code if it somehow detects that
hardware can do it already. On the other hand this means that we have to
expose a whole lot of capabilities to userspace and userspace has to go
and detect all of them in order to parameterize all of the code.

Ultimately I suspect many applications will just choose to pass the data
all the time out of simplicity. I mean drivers that don't need it will
already ignore it (i.e. they must not break if they get the extra data)
so other than the potential runtime savings on some hardware, there are
no advantages.

Given that other APIs don't bother exposing this level of control to
applications makes me think that it's just not worth it from a
performance point of view.

Thierry

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2LHkACgkQ3SOs138+
s6HmgQ/+JMQhoGPqqKKqCjmdRv4cCGDH5wv0w+oEEHwehaQ0vH7EibD1rnemSIjl
D/y1YSNS7KD2Dld9p6HYrSQNE2Sr1aMdhWyV1reBK1PE+/TUBCAXLGuN5UmXZjXO
O83zA+ICTLZTzBoFXMNqumESFQGhss3jcIoUfjQl9fPno9ZJDElbQq+kC0cc8+rd
vpHBu/j/hSEHuvQvML8VNos5rSoZ6AwBwJsQztAzRzUhFldg5Abp1eeXc07zMzYQ
RhPFuftd4fG0k+3G6EaQdz/0YNTjHuZwsLCwsC2T6N+WWATxh2HrRJlcJJsLSEOG
iRBtvtuFYl/NwznZVUI2RS3feoJ3F4iypXtZK3C8o1X3+c5eqj3DJ4O9eKtATbJt
d4KGTFK0J9fPqI+0ghumCUPOHy7YBKHX48MZVSl2rE9j1Ss1ZEXaqC5gXZVqde/3
6PbL188A4euvrksPKD6vhSu670+IHioLm8EESoHj8WsQkZhqbaR7nwH6mt7DChjo
j7GScLfoxPNuW8umOYCxDHhD+S0arv/MDQUdEuouVdOekkQNrk5DE54O5iKffwph
2oCZw94Z/i503dLMu2QGyeUVEMtS9gBPrsiBKX6vDYXZR82/TEGtt0OeC8ImYP1d
RgotYf/4uhQc6nZkFlK7fTMBC+hqyZ2qRmBCtq576U0vtyBgeuw=
=f5jG
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--
