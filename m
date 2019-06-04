Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECB634229
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfFDIu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:50:59 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:35464 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFDIu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:50:59 -0400
Received: by mail-wr1-f45.google.com with SMTP id m3so14908699wrv.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B6qtQs63JTAPtNfv5QlagBIo1ZZ8NkemlVREptLJIDY=;
        b=n78nQzE+mU1dw4sapX/4B9pXuIll537vjRx8YcUc1pQi4yljIWn1tIZuydxK0ythT3
         rBasQqUhFnb2jpDUORrZ8jFtj2Xx6RUcTy1FlNHtFPol/rhcLu4BRGHXIOtowY6eN/GT
         b6hDuOeUMi9m4YSqfg6aK1Wt+KITfw9JPPc866qnCq/TQ8I52ab8bbwWTaTtDZAl+z5u
         CET7zqEa2FqA/4OFxOmB+7hslnkzVNuazvhqfJOyHxH/qe47e8oI300GINn3xk9HFlSO
         oxWxOvNkIMlKc/AiCrJl7OLWRcVVZvowazddbU2M4Gr5sCwT9sY/hngZ7KmC0GthyjGO
         FGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B6qtQs63JTAPtNfv5QlagBIo1ZZ8NkemlVREptLJIDY=;
        b=t2yAjqWXVtGh35EuXT8ldHXLZL7temmw0gQfcztGJAVr/V5fkAmQNakk7v4UCyJwOF
         oUEHxR/mIZIKAuD/094EJN8kynjpOomrZWFteup8HvBzpgpwMZpdh7fyjuZr2mopz7Tn
         KmuxBrrHkBhBfQ8mgdf8vFHLRnRdudtdPDtlhxnrUE7udm8lOas1ce6D1NkOu5RIq1qf
         rRU1kirLH2qZakacJTnhfXaO3dhEAXMNz8AQ675WNhVu1cwE22WdONtMxoOJ4aJGZqC3
         yDmELdiMD/Rtn+1Yr9GZfOrhSX3CjJBqKEe0m9NLVd+UQAUHa4pWBcAIca0C8N65xqQX
         lg/w==
X-Gm-Message-State: APjAAAVs1U2AOnoIjafXvHp914lS7KGsLTEDA+VJ2sBuGWMTlZiJHDYD
        CFSVXfL4UNPEuGcCU2W0BLY=
X-Google-Smtp-Source: APXvYqw3aiHIBgenTgdmDjvl4zqqPzD6boTh865dCNt/m/uuwdmGAH/+lmUsf8Ft+aUXppD+r/EgzA==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr2989333wro.168.1559638256789;
        Tue, 04 Jun 2019 01:50:56 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d2sm12793393wmb.9.2019.06.04.01.50.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 01:50:56 -0700 (PDT)
Date:   Tue, 4 Jun 2019 10:50:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190604085055.GD9048@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <20190603112449.GA30132@ulmo>
 <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline
In-Reply-To: <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 02:52:44PM -0400, Nicolas Dufresne wrote:
> Le lundi 03 juin 2019 =C3=A0 13:24 +0200, Thierry Reding a =C3=A9crit :
> > On Wed, May 15, 2019 at 12:09:45PM +0200, Paul Kocialkowski wrote:
> > > Hi,
> > >=20
> > > With the Rockchip stateless VPU driver in the works, we now have a
> > > better idea of what the situation is like on platforms other than
> > > Allwinner. This email shares my conclusions about the situation and h=
ow
> > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > >=20
> > > - Per-slice decoding
> > >=20
> > > We've discussed this one already[0] and Hans has submitted a patch[1]
> > > to implement the required core bits. When we agree it looks good, we
> > > should lift the restriction that all slices must be concatenated and
> > > have them submitted as individual requests.
> > >=20
> > > One question is what to do about other controls. I feel like it would
> > > make sense to always pass all the required controls for decoding the
> > > slice, including the ones that don't change across slices. But there
> > > may be no particular advantage to this and only downsides. Not doing =
it
> > > and relying on the "control cache" can work, but we need to specify
> > > that only a single stream can be decoded per opened instance of the
> > > v4l2 device. This is the assumption we're going with for handling
> > > multi-slice anyway, so it shouldn't be an issue.
> > >=20
> > > - Annex-B formats
> > >=20
> > > I don't think we have really reached a conclusion on the pixel formats
> > > we want to expose. The main issue is how to deal with codecs that need
> > > the full slice NALU with start code, where the slice_header is
> > > duplicated in raw bitstream, when others are fine with just the encod=
ed
> > > slice data and the parsed slice header control.
> > >=20
> > > My initial thinking was that we'd need 3 formats:
> > > - One that only takes only the slice compressed data (without raw sli=
ce
> > > header and start code);
> > > - One that takes both the NALU data (including start code, raw header
> > > and compressed data) and slice header controls;
> > > - One that takes the NALU data but no slice header.
> > >=20
> > > But I no longer think the latter really makes sense in the context of
> > > stateless video decoding.
> > >=20
> > > A side-note: I think we should definitely have data offsets in every
> > > case, so that implementations can just push the whole NALU regardless
> > > of the format if they're lazy.
> >=20
> > I started an NVIDIA internal discussion about this to get some thoughts
> > from our local experts and to fill in my gaps in understanding of NVIDIA
> > hardware that we might want to support.
> >=20
> > As far as input format goes, there was pretty broad consensus that in
> > order for the ABI to be most broadly useful we need to settle on the
> > lowest common denominator, while drawing some inspiration from existing
> > APIs because they've already gone through a lot of these discussions and
> > came up with standard interfaces to deal with the differences between
> > decoders.
>=20
> Note that we are making a statement with the sateless/stateful split.
> The userspace overhead is non-negligible if you start passing all this
> useless data to a stateful HW. About other implementation, that's what
> we went through in order to reach the state we are at now.
>=20
> It's interesting that you have this dicussion with NVIDIA specialist,
> that being said, I think it would be better to provide with the actual
> data (how different generation of HW works) before providing
> conclusions made by your team. Right now, we have deeply studied
> Cedrus, Hantro and Rockchip IP, and that's how we manage to reach this
> low overhead compromise. What we really want to see, is if there exist
> NVidia HW, that does not fit any of the two interface, and why.

Sorry if I was being condescending, that was not my intention. I was
trying to share what I was able to learn in the short time while the
discussion was happening.

If I understand correctly, I think NVIDIA hardware falls in the category
covered by the second interface, that is: NALU data (start code, raw
header, compressed data) and slice header controls.

I'm trying to get some other things out of the way first, but then I
hope to have time to go back to porting the VDE driver to V4L2 so that I
have something more concrete to contribute.

> > In more concrete terms this means that we'll want to provide as much
> > data to the kernel as possible. On one hand that means that we need to
> > do all of the header parsing etc. in userspace and pass it to the kernel
> > to support hardware that can't parse this data by itself. At the same
> > time we want to provide the full bitstream to the kernel to make sure
> > that hardware that does some (or all) of the parsing itself has access
> > to this. We absolutely want to avoid having to reconstruct some of the
> > bitstream that userspace may not have passed in order to optimize for
> > some usecases.
>=20
> Passing the entire bitstream without reconstruction is near impossible
> for a VDPAU or VAAPI driver. Even for FFMPEG, it makes everything much
> more complex. I think at some point we need to draw a line what this
> new API should cover.

I think that's totally reasonable. I'm just trying to make sure that
this is something that will work for Tegra. It'd be very unfortunate
if we had to do something else entirely because V4L2 didn't cover what
we need.

> An example here, we have decided to support a new format H264_SLICE,
> and this format has been defined as "slice only" stream where pps,sps
> et. would be described in C structure. There is nothing that prevents
> adding other formats in the future. What we would like is that this
> remains as inclusive as possible to the "slice" accelerators we know,
> hence adding "per-frame" decoding, since we know the "per-slice"
> decoding is compatible. We also know that this does not add more work
> to existing userspace code the supports similar accelerator.
>=20
> In fact, the first thing we kept in mind in our work is that it's very
> difficult to implement this userspace, so keeping in mind compatibility
> with VAAPI/VDPAU existing userspace (like the accelerator in FFMPEG and
> GStreamer) felt like essential to lead toward fully Open Source
> solution.

Okay, thanks for clarifying that. Sounds like I was misinterpreting
where the discussion was headed.

We'll most likely need something other than the H264_SLICE format for
Tegra, so as long as that's something you guys will remain open to, that
sounds good to me.

Thierry

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2MOwACgkQ3SOs138+
s6FwOA/9ExVk0LH8eeh8qg4U64eK1Vrik8jydzVRg/XM0WsEOpGYBSEudGjSIEMC
VHun5Jg82jSZBsCbk1h3im3ZT+kUARb4s8jSb8Nblj6tkG4GQ68wUSryxR8OrP7I
WpmRRTvZ3iSNQy55K8uf/N9Vc7cf0zAeq8MhmPicEkqSMyHflF7w+n4VwF0WbUuq
qy4lfCDKSimDb+lpVUbndFTgQ5DC9nhuIJHpiYNBluJxb7ZeYwXy1Ywa0HzMNJXS
Q5BF2TbwTr5XzHfxTlYBToalux04b9zz+N6sGQinnqvkD5+2APD8ZINx8I2TbcvZ
GVTo75aDVhThQYxTQ2Dz8mmKzvNQHMOUE9DJQ/pn5AvXCOIsU2gEDTnweF6kkVS2
zOnRDcqLz+FnuPmT0sCJwNs+8Tf321l95GFMB5t7DKLfAGhrWbKtkxFEQOiMwKui
1O2lsLi5TOuLWfe0m9xsef8mlPvbiw3T9yjoD6BoNFSrmduJvihdyFoFsnc4JduR
YYtWq+/bgnDBk5hh8u35j94nDvyuaaOKMLy14SLe1tH6C7MHAkxefDcrs4ydtIzo
EAxkJqoQrmQo9lXER5/XWFQQgYTqPr74hQE9GpW6Hz8xAaCVt6RqrvxF6yaatF9x
A8cidX/jqRlLkm00Z+GUJydmwTsXLMZO+B9tXDLo+MPwH8PRrh4=
=Vsbx
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
