Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00BA78CE4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 15:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfG2NdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 09:33:12 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43439 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfG2NdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 09:33:11 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7F606FF814;
        Mon, 29 Jul 2019 13:33:06 +0000 (UTC)
Date:   Mon, 29 Jul 2019 15:33:06 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
Message-ID: <20190729133306.GB31073@aptenodytes>
References: <20190703122849.6316-2-boris.brezillon@collabora.com>
 <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
 <20190705191618.3467c417@collabora.com>
 <20190725084228.2306171e@collabora.com>
 <20190725193616.GD14499@aptenodytes>
 <75b515e22494690ab467dd769c4d5902af414c7a.camel@collabora.com>
 <20190726082828.0844011d@collabora.com>
 <20190726093028.3a94bda0@collabora.com>
 <df545d0fe07766c5637e36c0f1fbd1d479721dec.camel@collabora.com>
 <20190727154908.13e8a34b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <20190727154908.13e8a34b@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat 27 Jul 19, 15:49, Boris Brezillon wrote:
> On Sat, 27 Jul 2019 09:52:24 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
>=20
>=20
> > > >=20
> > > > That's not my understanding of the Annex B section (quoting the spec
> > > > for reference):
> > > >=20
> > > > "
> > > > The byte stream format consists of a sequence of byte stream NAL un=
it
> > > > syntax structures. Each byte stream NAL unit syntax structure conta=
ins
> > > > one start code prefix followed by one nal_unit( NumBytesInNALunit )
> > > > syntax structure. It may (and under some circumstances, it shall) a=
lso
> > > > contain an additional zero_byte syntax element. It may also contain=
 one
> > > > or more additional trailing_zero_8bits syntax elements. When it is =
the
> > > > first byte stream NAL unit in the bitstream, it may also contain on=
e or
> > > > more additional leading_zero_8bits syntax elements.
> > > > "
> > > >  =20
> >=20
> > Right. I wonder what the "may or shall" part is really specifying.
> >=20
> > However, note that the table B.1.1 and its comments B.1.2 is might
> > be interpreted differently. To me, there's a difference between the dif=
ferent
> > syntax elements (zero-bytes elements vs. the start code prefix element).
> >=20
> > This is what it says about the zero_byte syntax element:
> >=20
> > """
> > zero_byte is a single byte equal to 0x00.
> > When any of the following conditions are fulfilled, the zero_byte synta=
x element shall be present.
> > =E2=80=93 the nal_unit_type within the nal_unit( ) is equal to 7 (seque=
nce parameter set) or 8 (picture parameter set)
> > =E2=80=93 the byte stream NAL unit syntax structure contains the first =
NAL unit of an access unit in decoding order, as
> > specified by subclause 7.4.1.2.3.
> > """
> >=20
> > We are not dealing with SPS or PPS here, but we are discussing multisli=
ce content,
> > so IIUC this syntax element would be part of our bitstream pixfmt.
> >=20
> > And this is what it says about the start code prefix:
> >=20
> > """
> > start_code_prefix_one_3bytes is a fixed-value sequence of 3 bytes equal=
 to 0x000001. This syntax element is called a
> > start code prefix.
> > """
> >=20
> > These elements are used in such a way that it might seem
> > you have two start codes options 3-byte or 4-byte, though.
>=20
> This is correct, but I was actually referring to:
>=20
> "
> It may also contain one or more additional trailing_zero_8bits syntax
> elements. When it is the first byte stream NAL unit in the
> bitstream, it may also contain one or more additional
> leading_zero_8bits syntax elements.
> "
>=20
> which would allow userspace to put additional zeros at the beginning
> in order to fulfill the HW alignment constraints. I'm not saying this is
> a good solution, just saying it can be done.
>=20
>=20
> > > > > > I guess it's not such a high price to pay for a unified codec i=
nterface :)   =20
> > > >=20
> > > > If by unified you mean exposing only one pixel format, then yes, it=
's
> > > > unified. Doesn't make it easier to deal with from the userspace
> > > > perspective IMHO.
> > > >=20
> > > > To sum-up, I'm fine keeping one pixel format, but I'm no longer sure
> > > > not exposing the NAL header type is a good option. We've seen that
> > > > providing alignment guarantees for HW expecting raw bitstream (with=
out
> > > > the start code) might become challenging at some point. So I'd opt =
for
> > > > making this selection explicit. After all, it's just an extra contr=
ol
> > > > to set from userspace, and 2 extra switch-case: one to select the m=
ost
> > > > appropriate NAL header type, and another one to fill the buffer with
> > > > the appropriate header (if there's one). =20
> >=20
> > I must admit I'm confused by what you mean about NAL header type, I tho=
ught
> > we weren't trying to support AVC, and only the Annex B bitstream format.
>=20
> I'm not trying to support AVC headers, but designing something that
> allows us to extend the interface and support that case (if we ever need
> to) is a good thing IMO.
>=20
> > =20
> > That said, I don't see the interface getting any simpler with a unified
> > pixfmt, given the menu control to expose frame or slice decoding.
>=20
> I agree. I think it's pretty much the same complexity anyway
> ('additional ctrl to set the start-code/header/preamble type' vs
> 'additional pixfmt'), so it's mostly a matter of taste.

The reason why I am strongly in favor of a single format is that the combin=
atory
possibilities of all the little things that can be different would eventual=
ly
lead us to having one pixel format per hardware implementation and I believ=
e it
makes no sense. I really don't find it to be an elegant or scalable way to
expose the differences between decoder implementations.

So the approach I currently like best is to have as much information as pos=
sible
passed to the driver, both as offsets to each relevant part of the data in =
codec
controls and through specific controls (or maybe pixfmt flags could be rele=
vant
in some cases) that reflect hardware-specific constraints.

Apparently this is also the approach on stateful codecs (e.g. the patch exp=
osing
whether boundaries can be detected by the hardware or not, without adding a=
 new
pixfmt for each case).

> >=20
> > Proper applications need to support both modes anyway, where in the lat=
ter
> > it'll have to parse the bitstream to extract the slices.
>=20
> Hm, the current uAPI forces us to pass slice offsets, which means we
> have to parse the bitstream anyway. I think we should keep it like that
> because I don't think we can assume the HW is smart enough to detect
> slice boundaries.

Agreed.

Cheers,

Paul

> > What's so bad
> > about just supporting an extra pixel format, where the slices are strip=
ped
> > of its start codes and zero-byte elements?
>=20
> I'm not opposed to that solution, but Paul is, so I'm just trying to
> find something that makes everyone happy, hence the "NAL header
> type" (or "start code type"/"preamble type" if you prefer, though
> it's not really a start code for AVC) proposal.
>=20
> >=20
> > And how come this is any more complex than exposing alignment constrain=
ts,
> > so that applications can artificially add leading_zero_8bits or trailin=
g_zero_8bits
> > elements to comply with a driver dma alignment. To be honest, the more =
I think
> > about it, the more this option sounds just horrible :-)
>=20
> Also think this option is more complicated and less future proof
> (AFAICT, AVC headers/start-codes can't be extended like Annex B ones).
>=20
> >=20
> > To me, it's far simpler to just expose what the devices support. If a d=
river
> > will expect to parse the bitstream, and accepts multi-slice content,
> > we expose that as a bitstream pixfmt.
>=20
> Those 2 problems are orthogonal. You could have HW dealing with
> multi-slice content while still requiring things to be passed without
> Annex B start codes. The H264 pixfmt is really just about NAL headers:
> No NAL headers vs Annex B headers vs AVC headers.
>=20
> > And if another driver expects
> > no-start-code slices, then we have another pixfmt.
>=20
> Yep, but I don't want to argue endlessly on this, and I'd be fine with
> the "NAL header/preamble/start-code/whatever type ctrl" too.

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl0+9ZIACgkQ3cLmz3+f
v9GkxQf+PXQDeySgLyjxMaNLRBLkacsvuSMn+hWTpiUsJ1+cvEIIuVIyOvI5z/95
jfsBDXiI7ehLRHvVnmWek8Q7zklc7kN4PRR+XGuOHJF0bwkf8s9U4gkBDSq/Bl+i
W15Elr8wdnnB2x73qCZDcu458VUmjiDMgzCkZqCrsLWY776gyqTsBYHTcEqti+ua
+141xrXdTKJFER7jP7UhAKeAQgqBQPiva6y3Uph94CM6Yitx7Y4si7/11HX3pdok
NaojA3ndCBegyw6ewrix2CC9P/pS62TALRuP/y6CkVEmpZaWTNzCHH1aX+0fIFDz
FtQOEQ002qEeZr2SCHsnS/CxCCa9Pg==
=LlkM
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
