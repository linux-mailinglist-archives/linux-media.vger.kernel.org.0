Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599FD233356
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 15:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgG3NsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 09:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgG3NsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 09:48:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86646C061574;
        Thu, 30 Jul 2020 06:48:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 652012948B5
Message-ID: <74dbf137d8838967c6e1433463b2af708be4da03.camel@collabora.com>
Subject: Re: [PATCH 03/10] media: uapi: h264: Split prediction weight
 parameters
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 30 Jul 2020 09:48:01 -0400
In-Reply-To: <CAPBb6MVJ+baQshWRJJrwKJ6bKss_KqHoC1xP9kvGtDqC0iFZWw@mail.gmail.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-4-ezequiel@collabora.com>
         <CAPBb6MVJ+baQshWRJJrwKJ6bKss_KqHoC1xP9kvGtDqC0iFZWw@mail.gmail.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-wiNEtf151ipqvNyTRQIL"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-wiNEtf151ipqvNyTRQIL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 25 juillet 2020 =C3=A0 22:30 +0900, Alexandre Courbot a =C3=A9cri=
t :
> On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> =
wrote:
> > The prediction weight parameters are only required under
> > certain conditions, which depend on slice header parameters.
> >=20
> > The slice header syntax specifies that the prediction
> > weight table is present if:
> >=20
> > ((weighted_pred_flag && (slice_type =3D=3D P || slice_type =3D=3D SP)) =
|| \
> > (weighted_bipred_idc =3D=3D 1 && slice_type =3D=3D B))
>=20
> This is a pretty important bit - how about mentioning in the documentatio=
n when
> this new control is expected to be present, so both drivers and
> userspace submit it
> or omit it in a consistent manner?

This is copy paste from the spec. We can add a reference to the syntax
chapter in the spec that express exactly this if condition (syntax is
express in pseudo code). The bitstream works exactly the same. Note
that it's not a fault to provide the control even if not needed,
drivers will kindly ignore it.

Reference: 7.3.3 Slice header syntax

Nicolas

--=-wiNEtf151ipqvNyTRQIL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXyLPkQAKCRBxUwItrAao
HDL8AKCtSvcMrSUmQXK5ljp++0GzWttLYwCfclTwQk9ZR4oVP+PZbA3QNpTHNOA=
=K+qX
-----END PGP SIGNATURE-----

--=-wiNEtf151ipqvNyTRQIL--

