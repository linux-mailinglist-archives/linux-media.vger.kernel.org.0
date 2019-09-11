Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1C5BB04A3
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 21:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfIKTtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 15:49:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60076 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbfIKTtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 15:49:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id DBB1128D47A
Message-ID: <20b4042dc3627b46e336e8c1c6fc401622bf3df9.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] Enable Hantro G1 post-processor
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
In-Reply-To: <6e493142690d48ee7e65c1cb2a4d6aec1e3b671b.camel@collabora.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
         <CAAFQd5AdikoN+7TG=0ZGFkSzaK2UFHM4VG7SYtfUtmjQgD61zA@mail.gmail.com>
         <6e493142690d48ee7e65c1cb2a4d6aec1e3b671b.camel@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-v1t+JGEHFAUPnEcHoFwA"
MIME-Version: 1.0
Date:   Wed, 11 Sep 2019 15:48:29 -0400
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-v1t+JGEHFAUPnEcHoFwA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 11 septembre 2019 =C3=A0 09:27 +0100, Ezequiel Garcia a =C3=A9c=
rit :
> On Mon, 2019-09-09 at 16:07 +0900, Tomasz Figa wrote:
> > Hi Ezequiel,
> >=20
> > On Wed, Sep 4, 2019 at 3:17 AM Ezequiel Garcia <ezequiel@collabora.com>=
 wrote:
> > > Hi all,
> > >=20
> > > This series enables the post-processor support available
> > > on the Hantro G1 VPU. The post-processor block can be
> > > pipelined with the decoder hardware, allowing to perform
> > > operations such as color conversion, scaling, rotation,
> > > cropping, among others.
> > >=20
> > > The decoder hardware needs its own set of NV12 buffers
> > > (the native decoder format), and the post-processor is the
> > > owner of the CAPTURE buffers. This allows the application
> > > get processed (scaled, converted, etc) buffers, completely
> > > transparently.
> > >=20
> > > This feature is implemented by exposing other CAPTURE pixel
> > > formats to the application (ENUM_FMT). When the application
> > > sets a pixel format other than NV12, the driver will enable
> > > and use the post-processor transparently.
> >=20
> > I'll try to review the series a bit later, but a general comment here
> > is that the userspace wouldn't have a way to distinguish between the
> > native and post-processed formats. I'm pretty much sure that
> > post-processing at least imposes some power penalty, so it would be
> > good if the userspace could avoid it if unnecessary.
> >=20
>=20
> Hm, that's true, good catch.
>=20
> So, it would be desirable to retain the current behavior of allowing
> the application to just set a different pixel format and get
> a post-processed frame, transparently.
>=20
> But at the same time, it would be nice if the application is somehow
> aware of the post-processing happening. Maybe we can expose a more
> accurate media controller topology, have applications enable
> the post-processing pipeline explicitly.

How it works on the stateful side is that userspace set the encoding
type (the codec), then passes a header (in our case, there will be
parsed structures replacing this) first. The driver then configure
capture format, giving a hint of the "default" or "native" format. This
may or may not be sufficient, but it does work in giving userspace a
hint.

>=20
> Thanks for the feedback,
> Ezequiel
>=20

--=-v1t+JGEHFAUPnEcHoFwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXXlPiQAKCRBxUwItrAao
HII0AJ4pjy8CgdrB0H02TI6NAG3s7SUkWACffzXziQp0QiEe8fgzFulcgFS/XSU=
=q71o
-----END PGP SIGNATURE-----

--=-v1t+JGEHFAUPnEcHoFwA--

