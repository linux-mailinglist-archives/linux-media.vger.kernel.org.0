Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B187F17A71F
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 15:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgCEOGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 09:06:52 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56711 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgCEOGw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 09:06:52 -0500
X-Originating-IP: 90.89.41.158
Received: from aptenodytes (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 20B5F60018;
        Thu,  5 Mar 2020 14:06:51 +0000 (UTC)
Date:   Thu, 5 Mar 2020 15:06:50 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] v4l2-ctrls: v4l2_ctrl_request_complete() should always
 set ref->req
Message-ID: <20200305140650.GB172958@aptenodytes>
References: <7be79448-bbf8-3abf-f757-004a6187039b@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <7be79448-bbf8-3abf-f757-004a6187039b@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 03 Mar 20, 11:34, Hans Verkuil wrote:
> When the request is completed, all controls are copied to the request obj=
ect.
> However, when VIDIOC_G_EXT_CTRLS attempts to read control values from the
> request it will read the current value instead for any control reference =
that
> has a NULL ref->req pointer. But that's wrong: after completing the reque=
st
> *all* controls should have a non-NULL ref->req pointer since they are aft=
er
> all copied to the request.
>=20
> So set ref->req if it wasn't set already.

Works fine here with this patch!

Tested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index 2928c5e0a73d..93d33d1db4e8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -4296,10 +4296,17 @@ void v4l2_ctrl_request_complete(struct media_requ=
est *req,
>  			continue;
>=20
>  		v4l2_ctrl_lock(ctrl);
> -		if (ref->req)
> +		if (ref->req) {
>  			ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
> -		else
> +		} else {
>  			ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req);
> +			/*
> +			 * Set ref->req to ensure that when userspace wants to
> +			 * obtain the controls of this request it will take
> +			 * this value and not the current value of the control.
> +			 */
> +			ref->req =3D ref;
> +		}
>  		v4l2_ctrl_unlock(ctrl);
>  	}
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl5hB3oACgkQ3cLmz3+f
v9G24Qf/e8EV7fj4IoEFGMwMg6JuDMsN8oVg2Av+ch/CrE49pp2wBgaN2WSn1lFd
uMATRbkGou3RRdIo115twhddCY8IUzQqHUx9w9fpx+qTzXOQwEpVq5k8VuTLRTLm
rbYQ4HdeCyzRjUeQb193jl8yuU2+mZ7iEHaXWxPME375wD0+JK+Rwd3aIzFaxW4b
zmV9bVnYDWIi+St3YxO7Z1d0c44PmWQRw7KTgjITmpC1dNs6szHnxDPHOqUYXCJ3
DahlXCTR4DfWnnomqJqP+R2zr/sKIRQr4UURrNHqYhIa6LO5n8bu3XC7Qlgk0147
xY1jjXlPJ453h/ZobXvr87dWkg0eFQ==
=Dq/4
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
