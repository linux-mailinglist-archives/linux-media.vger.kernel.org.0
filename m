Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8401520A18B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 17:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405512AbgFYPGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 11:06:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37680 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405309AbgFYPGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 11:06:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 857A72A5609
Message-ID: <00e105d0706d6ae704eaedb2fe5371606fb2f9d6.camel@collabora.com>
Subject: Re: [RFC 3/7] media: uapi: h264: clarify pic_order_cnt_bit_size
 field
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 11:06:37 -0400
In-Reply-To: <20200623182809.1375-4-ezequiel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-4-ezequiel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-HRCQ/pXd/WmidTPZ7a7p"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-HRCQ/pXd/WmidTPZ7a7p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 juin 2020 =C3=A0 15:28 -0300, Ezequiel Garcia a =C3=A9crit :
> From: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> Since pic_order_cnt_bit_size is not a syntax element itself, explicitly
> state that it is the total size in bits of the pic_order_cnt_lsb,
> delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
> delta_pic_order_cnt[1] syntax elements contained in the slice.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> [Ezequiel: rebase]
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 7af12447a5b0..0808a36777b6 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1813,7 +1813,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type =
-
>        - Size in bits of the dec_ref_pic_marking() syntax element.
>      * - __u32
>        - ``pic_order_cnt_bit_size``
> -      -
> +      - Combined size in bits of the picture order count related syntax
> +        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
> +        delta_pic_order_cnt0, and delta_pic_order_cnt1.
>      * - __u8
>        - ``cabac_init_idc``
>        -

--=-HRCQ/pXd/WmidTPZ7a7p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXvS9fQAKCRBxUwItrAao
HHIhAKCIRsmacXsXoKdS6FG/g6sNjw0MVwCfcaJ1P8AWKbUk4BbBbwId7VvbekI=
=neI2
-----END PGP SIGNATURE-----

--=-HRCQ/pXd/WmidTPZ7a7p--

