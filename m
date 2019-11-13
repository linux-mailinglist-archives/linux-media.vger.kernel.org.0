Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44966FBAA4
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 22:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfKMVZs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 16:25:48 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39631 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfKMVZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 16:25:48 -0500
Received: by mail-qk1-f193.google.com with SMTP id 15so3137292qkh.6
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2019 13:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=9A0k8x6LCiOQbpKbVFiIou6Hz8BO5b64kpQ7e3eJ0fs=;
        b=R/opMvgU4mfAao+oVan5V9VTf7Ea8gnJXr6ginPi65ZDuFbttI5Fco04y5tMO2p5zA
         7Wan1hhpZYkAzmB1YLlQTB0yAuInBqNXMa8JksAH6XCw0TlqGApGQFlAyeLASb8PIbge
         aHr6zxUSEV4w2eCxdIupbvW41QAWwkMj9R1VB73JPX8gH4S9a14T4xRYooZa8U4+Oz9X
         AGuBDksyEAqAJ6pNm+vxnqVdY6HGKzCEXWhiGJIZYqgFcPe8XWo+riaiyH7hzRcNb86g
         WPB0atIB6jpj2MI572KtMYGvUmhm/aRoYMsv0NaDH3UMVSg5DaE+wkA3JPvRPjyynLC/
         eJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=9A0k8x6LCiOQbpKbVFiIou6Hz8BO5b64kpQ7e3eJ0fs=;
        b=jz4BPZlD5YTDD4ZK+M1NxPMXLCBKqPJBb1Fm1A5SNqK9XQn6rIl1xCoO1ImKbHkm4n
         pJYBNEFiZxhrc40ByFs9jw9ptOoId1IM/L9+MHNxGYtH+/tcie0L2CiIQNr5LEv6yhhd
         1HIhlrrk/fJfDX/z+ZoWwIDiUzbIxvcRcRvQ+VPpHu2m+ELTXNL2kSZ1WafWNCp1yafV
         OwEmO/cOuhleAqy1iSwkqbuLF7yRxgks/A9R+mDGGUepDMvaJowm2CUCQN2UVkhszMAP
         mvLj+wW/PxawDjtZb8cB8VmGmlTke0DIbJMjVDAFi0diYZlvxz6WdQrNoAeExYVLHETn
         N50w==
X-Gm-Message-State: APjAAAU8L/HB+5t3ftwuZNdbIzom1exuYnu8HegpJgdapp5r4LZ+1A91
        BJ2QcDZQb3dPwXrSc3azwVIFWw==
X-Google-Smtp-Source: APXvYqzXoeo0u5+lj7mtG1wgC93i+esUAhYMYnMRj16arb9V/yuSslZ0rpCAEplAo4g9QKqHxlYvJw==
X-Received: by 2002:a05:620a:a9a:: with SMTP id v26mr4449695qkg.71.1573680347227;
        Wed, 13 Nov 2019 13:25:47 -0800 (PST)
Received: from tpx230-nicolas ([2610:98:8005::780])
        by smtp.gmail.com with ESMTPSA id 189sm1538181qki.10.2019.11.13.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 13:25:46 -0800 (PST)
Message-ID: <5cb26c107bac785a31f4d9c9bb500aaf776e6291.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Date:   Wed, 13 Nov 2019 16:25:44 -0500
In-Reply-To: <35d04054-0ad4-4f4b-961a-2795e6f5cfa1@gmail.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
         <e65ca03c095c99dc8482e9c36dcd099b6c69fc38.camel@collabora.com>
         <35d04054-0ad4-4f4b-961a-2795e6f5cfa1@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-UaR905rw3u/rrdB1/4Mq"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-UaR905rw3u/rrdB1/4Mq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 13 novembre 2019 =C3=A0 21:36 +0100, Jacek Anaszewski a =C3=A9c=
rit :
> Hi Philipp, Ezequiel,
>=20
> On 11/13/19 8:42 PM, Ezequiel Garcia wrote:
> > Hi Philipp,
> >=20
> > Thanks a lot for working on this. I'm so glad about
> > both efforts: the CODA JPEG support and the JPEG
> > helpers.
> >=20
> > On Wed, 2019-11-13 at 16:05 +0100, Philipp Zabel wrote:
> > > Hi,
> > >=20
> > > as far as I can tell we currently have three JPEG header parsers in t=
he
> > > media tree (in the rcar_jpu, s5p-jpeg, and mtk-jpeg drivers). I would
> > > like to add support for the CODA960 JPEG decoder to the coda-vpu driv=
er
> > > without adding yet another.
> > >=20
> > > To this end, this patch series adds some common JPEG code to v4l2-cor=
e.
> > > For now this just contains header parsing helpers (I have tried to ke=
ep
> > > the terminology close to JPEG ITU-T.81) that should be usable for all=
 of
> > > the current drivers. In the future we might want to move JPEG header
> > > generation for encoders and common quantization tables in there as we=
ll.
> > >=20
> >=20
> > Indeed, moving encoders to use these helpers sounds like the right thin=
g
> > to do. IIRC, quantization tables are implementation defined, and not im=
posed
> > by anything. I believe gspca drivers use some tables that don't follow
> > any recomendation.
> >=20
> > I guess it's fine to leave some drivers unconverted, without using any =
helpers,
> > and move others to use a helper-derived quantization table. =20
>=20
> I fully agree here. I don't have longer access to Exynos4x12 and 3250
> based boards to test the patches and the volume of changes allows
> to assume that not everything will go smoothly. That can lead to
> unpleasant hangups during decoding, caused by not arrived IRQ when
> e.g. unsupported JPEG->raw format subsampling transition is requested.

My experience with the exynos jpeg decoder was that they are not very
well tested. So better leave them like this until someone have the time
to stabilise them and renew the code a bit.

regards,
Nicolas

>=20
> > > I have tested this on hardware only with coda-vpu, the other drivers =
are
> > > just compile-tested.
> > >=20
> > > Feedback very welcome, especially whether this actually works for the
> > > other drivers, and if this could be structured any better. I'm a bit
> > > unhappy with the (current) need for separate frame/scan header and
> > > quantization/hfufman table parsing functions, but those are required
> > > by s5p-jpeg, which splits localization and parsing of the marker
> > > segments. Also, could this be used for i.MX8 JPEGDEC as is?
> > >=20
> > [..]
> >=20
> > Regards,
> > Ezequiel
> >=20
> >=20

--=-UaR905rw3u/rrdB1/4Mq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXcx02AAKCRBxUwItrAao
HMx8AJ9U/jCMlsbBw556Pu/RnXEEkY/vegCcCJBt3fvdU6IUkW4VUp5yQ4UUQ4E=
=tQFM
-----END PGP SIGNATURE-----

--=-UaR905rw3u/rrdB1/4Mq--

