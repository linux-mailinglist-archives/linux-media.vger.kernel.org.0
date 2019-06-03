Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03CC331B1
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 16:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbfFCOFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 10:05:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33492 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbfFCOFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 10:05:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so7266wmh.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 07:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mcWde5DhfxVwLrw2zsouKr6v70yrDHFnrJ3TD1Kx6cQ=;
        b=eee5RAAwOeqLPzmReDYnZ+6MgiOK5/stHIYXD6aNCiouRL6OAZ+G0hLga45aX4MiuZ
         m5StiIxht8Yh5XzRcF54aytxVj7iQnY76LEsCcbjERUrslUHIMYgoU8wCu2ya7ThsdyM
         Z1KFs5Z6aVoY7fWDho/QLih0qEFc37XSUCf1sZQGVwJVPa5hvmC2zolU0QC/x9fEK1M2
         sa7Zx79HuceJrWU+9YHreSyZEGlSkUuVNon54dcAguMTsR9TGxuGVC6Qq9Hb56KPRTbe
         KOjtwbr2g101Vhyhk2ehSBd9sJFLz0Fn4xfSE3YVFt0EVnnOsNbjY3UpjP+nQHXCmoaV
         r4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mcWde5DhfxVwLrw2zsouKr6v70yrDHFnrJ3TD1Kx6cQ=;
        b=f9z74w3SQFGBm3QsGnZDVbrVCbu170nAfVLhveotsoeAhQkkN3HCb8F/bVF7RHFDOm
         IMwRLrpCp7EfEVsHRmqvfFbf9bIHzjlkFL8jjfs2VfweSPzuMDzBcmG7Oc9Z6Mh3Jgpz
         H8yJhLwSnPKTJHyaeB+Q9/xdhFGF7smFGR4Jiol27yk/y9X9wPVABCC8z9/yHVPOyKER
         FIL8yHbpbqCDgkTf7m38/ft3Pw8/OhtCf5Pe+mOR79/fiGk3lw+RtR6s33gkCUkuevJR
         JS2nlBlZ7CtpjJvusU8ILbCXMg5dzG41H+GQZ6Sa+ZwNui6FbVh9UyOscNSr/Vga82hb
         qrug==
X-Gm-Message-State: APjAAAWpWw+1ImgVut21wosFsfD5hQRb2wwdRqFIq3yejr3ZMBsJkj4x
        35e1G9wZc0U+rF6VD6sgGzU=
X-Google-Smtp-Source: APXvYqzGgCPhqFkXwKsT9TY4G+cQuY7D/gXV0g8dYpzWDHVdEyyqxaB+0mrKNiZkDqmb1WpnMbJYpQ==
X-Received: by 2002:a05:600c:2550:: with SMTP id e16mr15166090wma.90.1559570729029;
        Mon, 03 Jun 2019 07:05:29 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y132sm24267182wmd.35.2019.06.03.07.05.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 07:05:28 -0700 (PDT)
Date:   Mon, 3 Jun 2019 16:05:26 +0200
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
Message-ID: <20190603140526.GF30132@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
 <20190603110946.4952-3-boris.brezillon@collabora.com>
 <20190603123020.GC30132@ulmo>
 <20190603145058.0c46febd@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TdkiTnkLhLQllcMS"
Content-Disposition: inline
In-Reply-To: <20190603145058.0c46febd@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--TdkiTnkLhLQllcMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 02:51:13PM +0200, Boris Brezillon wrote:
> +Maxime
>=20
> Oops, just realized Maxime was not Cc-ed on this series.
>=20
> On Mon, 3 Jun 2019 14:30:20 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Mon, Jun 03, 2019 at 01:09:42PM +0200, Boris Brezillon wrote:
> > > Some stateless decoders don't support per-slice decoding (or at least
> > > not in a way that would make them efficient or easy to use).
> > > Let's expose a menu to control and expose the supported decoding mode=
s.
> > > Drivers are allowed to support only one decoding but they can support
> > > both too.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 42 +++++++++++++++++=
+-
> > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> > >  include/media/h264-ctrls.h                    | 13 ++++++
> > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Docum=
entation/media/uapi/v4l/ext-ctrls-codec.rst
> > > index 82547d5de250..188f625acb7c 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_=
type -
> > >      * - __u32
> > >        - ``size``
> > >        -
> > > +    * - __u32
> > > +      - ``start_byte_offset``
> > > +      - Where the slice payload starts in the output buffer. Useful =
when
> > > +        operating in per frame decoding mode and decoding multi-slic=
e content.
> > > +        In this case, the output buffer will contain more than one s=
lice and
> > > +        some codecs need to know where each slice starts. Note that =
this
> > > +        offsets points to the beginning of the slice which is suppos=
ed to
> > > +        contain an ANNEX B start code
> > >      * - __u32
> > >        - ``header_bit_size``
> > >        -
> > > @@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_=
type -
> > >        -
> > >      * - __u16
> > >        - ``num_slices``
> > > -      - Number of slices needed to decode the current frame
> > > +      - Number of slices needed to decode the current frame/field. W=
hen
> > > +        operating in per-slice decoding mode (see
> > > +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> > > +        should always be set to one
> > >      * - __u16
> > >        - ``nal_ref_idc``
> > >        - NAL reference ID value coming from the NAL Unit header
> > > @@ -2022,6 +2033,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_=
type -
> > >        - 0x00000004
> > >        - The DPB entry is a long term reference frame
> > > =20
> > > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > > +    Specifies the decoding mode to use. Currently exposes per slice =
and per
> > > +    frame decoding but new modes might be added later on.
> > > +
> > > +    .. note::
> > > +
> > > +       This menu control is not yet part of the public kernel API and
> > > +       it is expected to change.
> > > +
> > > +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE``
> > > +      - 0
> > > +      - The decoding is done per slice. v4l2_ctrl_h264_decode_params=
->num_slices
> > > +        must be set to 1 and the output buffer should contain only o=
ne slice. =20
> >=20
> > I wonder if we need to be that strict. Wouldn't it be possible for
> > drivers to just iterate over a number of slices and decode each in turn
> > if userspace passed more than one?
> >=20
> > Or perhaps a decoder can batch queue a couple of slices. I'm not sure
> > how frequent this is, but consider something like a spike in activity on
> > your system, causing some slices to get delayed so you actually get a
> > few buffered up before you get a chance to hand them to the V4L2 device.
> > Processing them all at once may help conceal the lag.
>=20
> Hm, so we'd be in some kind of slice-batch mode, which means we could
> trigger a decode operation with more than one slice, but not
> necessarily all the slices needed to decode a frame. TBH, supporting
> per-frame (or the batch mode you suggest) on a HW that supports
> per-slice decoding should be pretty simple and has not real impact on
> perfs (as you said, it's just a matter of iterating over all the slices
> attached to a decode operation), so I'm fine relaxing the rule here and
> patching the cedrus driver accordingly (I can't really test the
> changes though). Paul, Maxime, what's your opinion?

We could perhaps have a test program to orchestrate such a scenario. I
think the assumption should obviously still be that we don't cross the
frame boundary using slices in one batch. Just that if a frame was made
up of, say, 4 slices and you first pass 3 slices, then 1, that it'd be
nice if the driver would be able to cope with that. It's something that
could probably even be implemented in the framework as a helper, though
I suspect it'd be just a couple of lines of extra code to wrap a loop
around everything.

Thierry

--TdkiTnkLhLQllcMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1KSQACgkQ3SOs138+
s6G/EBAAmg96uma2FxLZkV76lDCW6J11n0ZvUP0OVk+MxcB2rSqpCOXveb0jjH5E
32UuRQYCNPvij4IHKBDolPDAIPjo6/Wsv+wXrCQ7tgdeUZ3aAbQYUx/xlGBQzTZ5
T91nTvcqBprYF7gZwHMCzEMtZ5yKyx4H2Db4i5SuPEsErP0xmhFBrW2esXCaXRNI
ULqKVJnHABp5j26/P+LFfUVTCJhXGjACGZZrJ1YvzpCqoUkW+FE6dZIfYm3YSd68
ZWFCM4StXUHfnOpdlN7U7NalPM08Si2pp9O6Hfmsy2VWgCkCBxwFUflg0taML7Vc
kty/lSI32vIMILIZwrwoimwD2Vv36qeSO9WXLbTU0JO4a8k+mHKAE0nCDRckT8ue
WGlbhdCMmXDDfOg4k2ssYde7ursQk3zOcZlY1fg+k5Xl1T952pNI6Dxuirl4kPL1
CW8AlRszFEw137HsdixuLvfjMhh90EeLyxAALDUcbK9OCkmWyLhcENgR3yoW6vP+
WeiZfDT3QbbkX9N9fW92n2WrT4x/ZCBqSh2aWeJxm1Ha+kH3Xw8lnxnfuejT/mus
tvT2qR48yJIxnwg8dKaa5ltAeA67LJyAalTevF4JbQ4gvcwddWZZq5OSvB+ty+Xy
+qPBk+ejkjTBxSTfJlVLuyxpgxWYYfNSw4PP43/6l6KdQSEJkf0=
=JRZB
-----END PGP SIGNATURE-----

--TdkiTnkLhLQllcMS--
