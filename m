Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60E71C43CF
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 20:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731198AbgEDSBk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 14:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731196AbgEDSBk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 14:01:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2274C061A0E;
        Mon,  4 May 2020 11:01:39 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 73E842A0458
Message-ID: <e53824aed3eeb27419e5399576cce028f0ba8203.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: uapi: Add VP9 stateless decoder controls
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Date:   Mon, 04 May 2020 14:01:32 -0400
In-Reply-To: <db9fa91be8084fe9c87f263a4a97dc38d46f9bd1.camel@collabora.com>
References: <20200410115113.31728-1-ezequiel@collabora.com>
         <20200410115113.31728-3-ezequiel@collabora.com>
         <9126475c-275d-71ab-0308-6ae85e22446b@xs4all.nl>
         <bf475e70cca6f9ebf645aed51276e57668eaf43b.camel@collabora.com>
         <20200502203707.402ea3cd@collabora.com>
         <db9fa91be8084fe9c87f263a4a97dc38d46f9bd1.camel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-OSiYpnCOHGwM5bzGy/T7"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-OSiYpnCOHGwM5bzGy/T7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 02 mai 2020 =C3=A0 19:55 -0300, Ezequiel Garcia a =C3=A9crit :
> +Nicolas
>=20
> On Sat, 2020-05-02 at 20:37 +0200, Boris Brezillon wrote:
> > On Fri, 01 May 2020 13:57:49 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >=20
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_reset_frame_context
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> > > > > +      - Do not reset any frame context.
> > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE_ALT``
> > > > > +      - Do not reset any frame context. This is an alternative v=
alue for
> > > > > +        V4L2_VP9_RESET_FRAME_CTX_NONE. =20
> > > >=20
> > > > Add `` around V4L2_VP9_RESET_FRAME_CTX_NONE.
> > > >  =20
> > >=20
> > > Hm, now that I look closer, what's the point
> > > of having the NONE_ALT in our uAPI if it
> > > has same meaning as NONE?
> > >=20
> > > I think it can be removed.
> >=20
> > The intent was to match the spec so that one can pass the value
> > extracted from the bitstream directly.

reset_frame_contextspecifies whether the frame context should be reset
to default values:
  =E2=88=92 0 or 1 means do not reset any frame context
  =E2=88=92 2 resets just the context specified in the frame header
  =E2=88=92 3 resets all cont

But aren't we going too far by making this an emum ? In Microsfot DXVA,
we pass that value without interpreting it in userspace. For the
following RKVDEC, it is (suspiciously ?) ignored. Maybe just passing
over the value would make more sense, less work ?

> >=20
> > > > I got several smatch warnings:
> > > >=20
> > > > smatch: ERRORS
> > > > drivers/media/v4l2-core/v4l2-ctrls.c:1880 validate_vp9_frame_decode=
_params() warn: was && intended here instead of ||?
> > > >=20
> > > > (Commented on this ^^^ one above)
> > > >=20
> > > > drivers/staging/media/rkvdec/rkvdec-vp9.c:426 init_intra_only_probs=
() error: buffer overflow 'ptr' 9 <=3D 69
> > > > drivers/staging/media/rkvdec/rkvdec-vp9.c:1478 rkvdec_vp9_done() er=
ror: potentially dereferencing uninitialized 'ctrl'.
> > > > drivers/staging/media/rkvdec/rkvdec-vp9.c:1483 rkvdec_vp9_done() er=
ror: uninitialized symbol 'dec_dst_buf'.
> > > > drivers/staging/media/rkvdec/rkvdec-vp9.c:941:6: warning: variable =
'ret' set but not used [-Wunused-but-set-variable]
> > > > drivers/staging/media/rkvdec/rkvdec-vp9.c:1466:40: warning: variabl=
e 'fctx' set but not used [-Wunused-but-set-variable]
> > > >  =20
> > >=20
> > > Oh, I'll run smatch and fix them all.
> >=20
> > Oops!
>=20
>=20

--=-OSiYpnCOHGwM5bzGy/T7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXrBYfAAKCRBxUwItrAao
HEl0AKCsffGNkgR8IRMvRvpqEdfuIJofVACgwecGH6S4+u9ily9wRCE4jpdn++E=
=ONvy
-----END PGP SIGNATURE-----

--=-OSiYpnCOHGwM5bzGy/T7--

