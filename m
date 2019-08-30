Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD431A3CDE
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 19:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfH3RTv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 13:19:51 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37344 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbfH3RTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 13:19:50 -0400
Received: by mail-qk1-f195.google.com with SMTP id s14so6821223qkm.4
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=Lv7F7XfXtTfsXJ4fsL2rJKslKTnu6PBtRjHrGo9jnJc=;
        b=vhE/pRy0Rqd3VBQJA5AOWcACzc014lyGB4mWKq6KKlKsiZYlKftqO2Nt8QRZnyj4SB
         XgH0ppxgYw2ebO+hAXlpMeL3tBwYbT1ckNr2kR5sta3R6QVhaBsq/2k4rXkcA3W1JXf9
         c7+NWxG0azeMGQ9waD084P8ygY1qHdiHZBfo34hgS2atU4V2jscUlJ88KkNw2wkiabt3
         tTvesrhPc9OOwARdzWh2y3OS8Ueo7LmIX67GwQDmVgXQ16t1ElTttGbYxAYFsLFty2/C
         SS/yYlHVUEgb7YJs4n/thMT7LIclenx2VyhO6A3/c4qb1zH3Dzp1POGnHwbgFY+aX+Ib
         hHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Lv7F7XfXtTfsXJ4fsL2rJKslKTnu6PBtRjHrGo9jnJc=;
        b=GbYVL4+UvZglAWrC/mdK6zZ9C+NwqehNittH+hisk+/3gdVa113mqc4IWXcNe2uvCX
         K0gkhmtgEWViv0ElRoYexdZxxZOXNHpZgDCr9Rzn81vG6KypDI3TGRcQoPsIpB9Kbxhx
         +jVcZTowdpi8JF9ga0m2SXhwL+fSRHN9Ma5wBFt7dKGccG/vo8aMOMv3bnjkjDOeUoF5
         UKyzk2s7FsF1GDsFVg8ipdY4GIiwdaeeSmq/Z8lcbLTsZcbGnpojmOaMHqXQgNOgIJOs
         9gdo6XiQBlNxjIdPTaDppAfCNXX0D7ss/SIj5gmn2RFpsGVJxoCUgMjAWp8vvnlkl90B
         +cdw==
X-Gm-Message-State: APjAAAWkLQFEClwgQi/W9diQOpwEZo8O+Qq75nyWJeYTir6Ng/ZGpvuS
        nF+Byt/qb7k3U0PKyjhNK6VfWw==
X-Google-Smtp-Source: APXvYqzFCIDQ4rnTVqgs8xMi2NAdoI5wuK0m/PpbK+c/0M2O94L/SiDiAMj2ybLbsAwNMNggOuV7Dw==
X-Received: by 2002:a37:92c6:: with SMTP id u189mr15710250qkd.69.1567185589116;
        Fri, 30 Aug 2019 10:19:49 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id z187sm3372624qke.99.2019.08.30.10.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 10:19:46 -0700 (PDT)
Message-ID: <3580d4f1549c405173f061c5e2ece3c8f2cfa7e4.camel@ndufresne.ca>
Subject: Re: [PATCH 5/8] media: cedrus: Detect first slice of a frame
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Date:   Fri, 30 Aug 2019 13:19:42 -0400
In-Reply-To: <20190830074806.78a2b8b4@collabora.com>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
         <20190822194500.2071-6-jernej.skrabec@siol.net>
         <20190826202831.311c7c20@collabora.com> <3132748.mYbjOY1tKM@jernej-laptop>
         <20190830074806.78a2b8b4@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-0LtRcsKKEiURq7JtFoDE"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-0LtRcsKKEiURq7JtFoDE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 30 ao=C3=BBt 2019 =C3=A0 07:48 +0200, Boris Brezillon a =C3=A9c=
rit :
> On Thu, 29 Aug 2019 21:04:28 +0200
> Jernej =C5=A0krabec <jernej.skrabec@siol.net> wrote:
>=20
> > Dne ponedeljek, 26. avgust 2019 ob 20:28:31 CEST je Boris Brezillon=20
> > napisal(a):
> > > Hi Jernej,
> > >=20
> > > On Thu, 22 Aug 2019 21:44:57 +0200
> > >=20
> > > Jernej Skrabec <jernej.skrabec@siol.net> wrote: =20
> > > > When codec supports multiple slices in one frame, VPU has to know w=
hen
> > > > first slice of each frame is being processed, presumably to correct=
ly
> > > > clear/set data in auxiliary buffers.
> > > >=20
> > > > Add first_slice field to cedrus_run structure and set it according =
to
> > > > timestamps of capture and output buffers. If timestamps are differe=
nt,
> > > > it's first slice and viceversa.
> > > >=20
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > ---
> > > >=20
> > > >  drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
> > > >  drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 2 ++
> > > >  2 files changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > > > 2f017a651848..32cb38e541c6 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > > @@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
> > > >=20
> > > >  struct cedrus_run {
> > > > =20
> > > >  	struct vb2_v4l2_buffer	*src;
> > > >  	struct vb2_v4l2_buffer	*dst;
> > > >=20
> > > > +	bool first_slice;
> > > >=20
> > > >  	union {
> > > >  =09
> > > >  		struct cedrus_h264_run	h264;
> > > >=20
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > > b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> > > > 56ca4c9ad01c..d7b54accfe83 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > > @@ -31,6 +31,8 @@ void cedrus_device_run(void *priv)
> > > >=20
> > > >  	run.src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > >  	run.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > >=20
> > > > +	run.first_slice =3D
> > > > +		run.src->vb2_buf.timestamp !=3D run.dst- =20
> > > vb2_buf.timestamp;
> > >=20
> > > Can't we use slice->first_mb_in_slice to determine if a slice is the
> > > first? I'd expect ->first_mb_in_slice to be 0 (unless we decide to
> > > support ASO). =20
> >=20
> > I looked in all VPU documentation available to me (which isn't much) an=
d there=20
> > is no indication if ASO is supported or not. Do you have any sample vid=
eo with=20
> > out-of-order slices? It's my understanding that this is uncommon.
>=20
> I'm not entirely sure, but my understanding was that it might be used
> when streaming over network where some packets might be lost and
> re-emitted later on.
>=20
> > If it's=20
> > supported, I would leave code as-is.
>=20
> I remember seeing the ASO acronym mentioned in the hantro G1 spec, but
> at the same time we're doing frame-based decoding, so I guess the HW
> block expects slices to be ordered in that case. Honestly I don't know,
> so let's keep the code as-is.

We had an ASO interrupt when we tried to do slice decoding rather then
frame. I believe on Hantro, the way to do ASO is to actually re-order
in software.

ASO is a feature of baseline profile use to reduce latency. As an
example, VA-API does not support baseline profile (only constrained-
baseline, which excludes ASO).

Nicolas


--=-0LtRcsKKEiURq7JtFoDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXWlarwAKCRBxUwItrAao
HBNPAJ9N2BBAFQLk5dhvhHq+DkURXWdFXQCcDJNUwgnp0u1Q8T6rWaMoTSg5Kck=
=hsiz
-----END PGP SIGNATURE-----

--=-0LtRcsKKEiURq7JtFoDE--

