Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68E153418F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfFDIQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:16:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40357 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfFDIQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:16:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id p11so9940545wre.7
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jKBIH1+9shbSjfLvQlG1aWVJYHfcaZQ4P8HbRMqQPIM=;
        b=hfXOkKuUAhAQLGoizHVjqBkI0wHYEYtL0Qz+/7gRJsEuxpOl00doLpODuG5ESyNtOR
         6b2hkwnPq5JXXO0rMydQVW8MQ0G+CNfmGliyB09MKLDaCVcnyteSBAPQ39oqHWLn7TUJ
         mEMSGVzvI+iuWrbb5cJlszwPXu810FqNocFEBhDsK3oirbe82+gXs47sd8BwyfCosUo+
         DjAWEAJcxdagf2QdEkXIwyQa3jiC6ASer77G0+lCqtE1UBUmw5WzM9ukjIyN0Br244KW
         +cTTZUKxoQsdTVmDgaGpbp68ETw/NTEA+bG/9ChdFwRR7phXTcvzDZbOn+JoandsuLGV
         XHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jKBIH1+9shbSjfLvQlG1aWVJYHfcaZQ4P8HbRMqQPIM=;
        b=Ps/PRMqcCySZTS/5Ezr4Cz7qMK6gB5HJFivHmnxxBDUXmUG8VX59MyrYODM1hT629E
         ss3+3008p9HvsW8Z/Rlan8WtGIClsBk0acnqBWSiZQLHoInPFl8PusXfnCu1gqm//qXN
         r9XO8pjU3Ed0+2dk2HRGb3A91mPGYcvAAuWBa/ne9We0Syb1dFPTp3VfUEnZg62oO8Nf
         tKinqT/383x7TTNvV1l2ynqW2vszUAOSo67fCigPjkaNx/Ex8CE7pt4HeGJZolvPhWqo
         pVkLimIuzKe6+dv7kvF2zRH99SyikY4IlUGy8ikhG2Yjh4DYLRR5RFsiNrRl82ngI5TH
         4v3w==
X-Gm-Message-State: APjAAAVn92IAR1KGogTHx3A4rYRd8a9gKJvg6fmyqqElgxpWrnp7Qj/G
        PRmvZXW4BwOIJqptUx4JUSqE0Yqi
X-Google-Smtp-Source: APXvYqzDxCL1KlLJRD+xv5Km/MF6OBsxSoAZfeoqM8+Jnn3OVU8/O/5Bmv1OqvU1Wz/AynH+kc55XQ==
X-Received: by 2002:a5d:6b49:: with SMTP id x9mr2422014wrw.170.1559636168846;
        Tue, 04 Jun 2019 01:16:08 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y2sm28980621wra.58.2019.06.04.01.16.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 01:16:07 -0700 (PDT)
Date:   Tue, 4 Jun 2019 10:16:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC 2/6] media: uapi: h264: Add the concept of decoding
 mode
Message-ID: <20190604081607.GB9048@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
 <20190603110946.4952-3-boris.brezillon@collabora.com>
 <20190603123020.GC30132@ulmo>
 <20190603145058.0c46febd@collabora.com>
 <20190603140526.GF30132@ulmo>
 <20190603173711.716b96c4@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <20190603173711.716b96c4@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 05:37:11PM +0200, Boris Brezillon wrote:
> On Mon, 3 Jun 2019 16:05:26 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Mon, Jun 03, 2019 at 02:51:13PM +0200, Boris Brezillon wrote:
> > > +Maxime
> > >=20
> > > Oops, just realized Maxime was not Cc-ed on this series.
> > >=20
> > > On Mon, 3 Jun 2019 14:30:20 +0200
> > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > >  =20
> > > > On Mon, Jun 03, 2019 at 01:09:42PM +0200, Boris Brezillon wrote: =
=20
> > > > > Some stateless decoders don't support per-slice decoding (or at l=
east
> > > > > not in a way that would make them efficient or easy to use).
> > > > > Let's expose a menu to control and expose the supported decoding =
modes.
> > > > > Drivers are allowed to support only one decoding but they can sup=
port
> > > > > both too.
> > > > >=20
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > ---
> > > > >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 42 +++++++++++++=
+++++-
> > > > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> > > > >  include/media/h264-ctrls.h                    | 13 ++++++
> > > > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/D=
ocumentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > index 82547d5de250..188f625acb7c 100644
> > > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_cod=
ing_type -
> > > > >      * - __u32
> > > > >        - ``size``
> > > > >        -
> > > > > +    * - __u32
> > > > > +      - ``start_byte_offset``
> > > > > +      - Where the slice payload starts in the output buffer. Use=
ful when
> > > > > +        operating in per frame decoding mode and decoding multi-=
slice content.
> > > > > +        In this case, the output buffer will contain more than o=
ne slice and
> > > > > +        some codecs need to know where each slice starts. Note t=
hat this
> > > > > +        offsets points to the beginning of the slice which is su=
pposed to
> > > > > +        contain an ANNEX B start code
> > > > >      * - __u32
> > > > >        - ``header_bit_size``
> > > > >        -
> > > > > @@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_cod=
ing_type -
> > > > >        -
> > > > >      * - __u16
> > > > >        - ``num_slices``
> > > > > -      - Number of slices needed to decode the current frame
> > > > > +      - Number of slices needed to decode the current frame/fiel=
d. When
> > > > > +        operating in per-slice decoding mode (see
> > > > > +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> > > > > +        should always be set to one
> > > > >      * - __u16
> > > > >        - ``nal_ref_idc``
> > > > >        - NAL reference ID value coming from the NAL Unit header
> > > > > @@ -2022,6 +2033,35 @@ enum v4l2_mpeg_video_h264_hierarchical_cod=
ing_type -
> > > > >        - 0x00000004
> > > > >        - The DPB entry is a long term reference frame
> > > > > =20
> > > > > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > > > > +    Specifies the decoding mode to use. Currently exposes per sl=
ice and per
> > > > > +    frame decoding but new modes might be added later on.
> > > > > +
> > > > > +    .. note::
> > > > > +
> > > > > +       This menu control is not yet part of the public kernel AP=
I and
> > > > > +       it is expected to change.
> > > > > +
> > > > > +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. flat-table::
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE``
> > > > > +      - 0
> > > > > +      - The decoding is done per slice. v4l2_ctrl_h264_decode_pa=
rams->num_slices
> > > > > +        must be set to 1 and the output buffer should contain on=
ly one slice.   =20
> > > >=20
> > > > I wonder if we need to be that strict. Wouldn't it be possible for
> > > > drivers to just iterate over a number of slices and decode each in =
turn
> > > > if userspace passed more than one?
> > > >=20
> > > > Or perhaps a decoder can batch queue a couple of slices. I'm not su=
re
> > > > how frequent this is, but consider something like a spike in activi=
ty on
> > > > your system, causing some slices to get delayed so you actually get=
 a
> > > > few buffered up before you get a chance to hand them to the V4L2 de=
vice.
> > > > Processing them all at once may help conceal the lag. =20
> > >=20
> > > Hm, so we'd be in some kind of slice-batch mode, which means we could
> > > trigger a decode operation with more than one slice, but not
> > > necessarily all the slices needed to decode a frame. TBH, supporting
> > > per-frame (or the batch mode you suggest) on a HW that supports
> > > per-slice decoding should be pretty simple and has not real impact on
> > > perfs (as you said, it's just a matter of iterating over all the slic=
es
> > > attached to a decode operation), so I'm fine relaxing the rule here a=
nd
> > > patching the cedrus driver accordingly (I can't really test the
> > > changes though). Paul, Maxime, what's your opinion? =20
> >=20
> > We could perhaps have a test program to orchestrate such a scenario. I
> > think the assumption should obviously still be that we don't cross the
> > frame boundary using slices in one batch.
>=20
> We should definitely forbid mixing slices of different frames in the
> same decode operation, since each decode operation is targeting a
> single capture buffer.
>=20
> > Just that if a frame was made
> > up of, say, 4 slices and you first pass 3 slices, then 1, that it'd be
> > nice if the driver would be able to cope with that.
>=20
> Yep, that makes sense.
>=20
> > It's something that
> > could probably even be implemented in the framework as a helper, though
> > I suspect it'd be just a couple of lines of extra code to wrap a loop
> > around everything.
>=20
> I also thought about providing generic wrappers, both for this case and
> the per-slice -> per-frame case (this one would be a bit more
> complicated as it implies queuing slices in a bounce buffer and
> triggering the decode operation only when we have all slices of a
> frame).

I like deferring the addition of that kind of helper until a clear
pattern emerges out of the drivers that need this, just because that
gives us real examples on which to model those helpers. But yeah, I
think it should be possible to have helpers for these for most cases.

Thierry

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2KMYACgkQ3SOs138+
s6GrCg/9HORv6Vyc3PLAeZQkxiT7K0vBi/yz8T3nBMbM5g2mZFP+e5t/zRqteubW
claSc365QojaMOk6UYFfp1rlJO88fXhXtDq+5yuHNYOMeBunAzmfRkZUk/C+NIHu
nCxB9flKeqY8976ZPDjv9gliokG0p2Pusm3cSMKkEwiv7KeDjcBFiUeMhcy9qUEG
Q7Wkd9ZQ6t0rUsRz8wxO1x0J1yS7dfMUN1azh1U1hOAhtNdhVmleV/cZr66U8tCk
LYcWbW7gIXpjjowj8BAXXNH7T+UQNsjQ70jTbTJvbTKb1RsUP6VGytZ7FVJvXx8D
0A4Zx6HvoZ+H5ZFfVxm0ewb7llsaw2rUmfQJzixB1OqJCHAx5b5OXve/D26GGBag
2KLwWgt6zVWSUTrABdBuixcmwq0kO5DU176NzBofH0nczYFJoRUxy7NTGijyffZq
U0HmKJ5QUawnYoZBPdsLDXu2EiVtbYAmr2hS9WP113t4zcJghGMzF4wMaIeU8lRV
zv4avSWKevuuEK7+AGFS/WAGUfN9w+eVfICITxj158+CDIEO/FEOjCDWj6MwRcWx
RFCRTuhC+cQplIow5rRnfRu92wJJbO3mHpzwxGk6VZs4yVDpIEaTAisGkl4gyJaQ
e9ONsHZ/Vt/DsedXE9eExCIIMuJOaezJXniO8wdz/WIIN1qAgIU=
=B9e9
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
