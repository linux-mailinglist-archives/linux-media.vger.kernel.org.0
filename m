Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423BB1CD977
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 14:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgEKMRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 08:17:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49796 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbgEKMRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 08:17:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id E08E42A0FD7
Message-ID: <49a15300a5db8b4c61115c4a89eac1762dc3f31a.camel@collabora.com>
Subject: Re: [PATCH v3 2/3] media: uapi: Add VP9 stateless decoder controls
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Mon, 11 May 2020 08:17:06 -0400
In-Reply-To: <7846cb19-c5e0-4f95-c361-cf78d2c1b16a@xs4all.nl>
References: <20200505134110.3435-1-ezequiel@collabora.com>
         <20200505134110.3435-3-ezequiel@collabora.com>
         <6459bd9f-20f6-9910-8d45-04870a19019d@xs4all.nl>
         <f885e94250778916c09a29269f9c9f42eb67cb66.camel@collabora.com>
         <7846cb19-c5e0-4f95-c361-cf78d2c1b16a@xs4all.nl>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-7FJdwtw3aqO6RvgErWDP"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-7FJdwtw3aqO6RvgErWDP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 08 mai 2020 =C3=A0 15:16 +0200, Hans Verkuil a =C3=A9crit :
> > I think this comes directly from the spec. The Rockchip VDEC doesn't
> > seem to use it.
> > Do you think we can drop it from here, and rely on the V4L2 colorspace
> > passed in the format negotiation?
>=20
>=20
> That would be preferred, yes. Otherwise you would have two places where y=
ou can
> define colorspaces, and that's confusing.

This is indeed redundant with the color information in the format. In
VP8/9 there is only 1 header for everything, so it's harder to figure-
out what to filter. While in H.264/HEVC this information is usually set
an an extension header.

Though this do re-open the discussion about SPS in H.264/HEVC. In there
you will find the coded size and the crop window and the sub-sampling.
I don't remember exactly what was the conclusion, but I think it was
kept to allow allow bitstream reconstruction. But it will effectively
overlap directly (or indirectly) with some V4L2 generic API.

regards,
Nicolas

--=-7FJdwtw3aqO6RvgErWDP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXrlCQgAKCRBxUwItrAao
HBt3AJ9qVuHoo7obOay42xsXt2h91zXANwCfTanxrgZ1TNarsZjy64md+ngxdW4=
=eeld
-----END PGP SIGNATURE-----

--=-7FJdwtw3aqO6RvgErWDP--

