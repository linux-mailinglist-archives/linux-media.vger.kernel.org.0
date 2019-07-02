Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E3B5CC3A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 10:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfGBIvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 04:51:53 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35627 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfGBIvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 04:51:53 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4D38520011;
        Tue,  2 Jul 2019 08:51:48 +0000 (UTC)
Date:   Tue, 2 Jul 2019 10:53:04 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-vin: Clean up correct notifier in error path
Message-ID: <20190702085304.qisp4d3hsyw5hdeo@uno.localdomain>
References: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="olz4acqeb6axyovd"
Content-Disposition: inline
In-Reply-To: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--olz4acqeb6axyovd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Jul 02, 2019 at 03:24:58AM +0200, Niklas S=C3=B6derlund wrote:
> When adding the v4l2_async_notifier_cleanup() callas the wrong notifier

I would re-word this by removing "When adding" (and fix the 'callas'
Sergei noticed here) with something along the lines of:

"The parallel input initialization error path cleans up the wrong
async notifier, leaking the resources associated with the one whose
registration actually failed.

Fix this by cleaning up the correct notifier in the parallel input
registration error handling."

What do you think?

> was cleaned up if the parallel notifier registration failed. Fix this by
> cleaning up the correct one.
>
> Fixes: 9863bc8695bc36e3 ("media: rcar-vin: Cleanup notifier in error path=
")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

The patch itself is good! Nice catch!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/=
platform/rcar-vin/rcar-core.c
> index 64f9cf790445d14e..a6efe1a8099a6ae6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -633,7 +633,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>  	ret =3D v4l2_async_notifier_register(&vin->v4l2_dev, &vin->notifier);
>  	if (ret < 0) {
>  		vin_err(vin, "Notifier registration failed\n");
> -		v4l2_async_notifier_cleanup(&vin->group->notifier);
> +		v4l2_async_notifier_cleanup(&vin->notifier);
>  		return ret;
>  	}
>
> --
> 2.21.0
>

--olz4acqeb6axyovd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0bG3AACgkQcjQGjxah
Vjxt+hAAnxIYsLLy6uo/ji4lZiE/4uxIOKBJJzz+TK9y9C3WO+F1SEAfgUQaFd++
FeNJ6niBIi7jH+GhVfO/DvkCq3NxfHHCNQFY6EDaZGgZvNMfGtCmHvbpkJAVG4n4
wfWXqPjsbBwngVq7jFbS1T5CehR3/J87QPcVUz3VkZsS7UU6XOjuqTcBbnHc/2Jc
4dHzZ9uyGr9vzwTKC/Sv+6e6tSjUMyFKlZYuUGHMFCuu+I0N/f5RdjlDq3grxSnW
zlVxddPythTSY8cE6g7axd511kRLHe67egivnmzRlyoPouizXMno98PQRvyH7J9Y
T7vHa+F3fFwU41GprmLWWAWtXLX05hhZLUz5EsJi2ZaRRNj1A5zweGfv2TOjAIaS
fveY4lOHf+rhe/zbzxcNfLexbfB3m70PCEvlpUX1Pm3m4hdFfSdp9fjnJwQCDSku
+uzt+QSvLtfNc88xK91iE053+YXUKt2j3zrjOaB+LwOwllZ54j4XZppXTnoyFa+v
cc8758z2g/OpyHkTun9Gvdx7lMm76XLeHHlfK8q1/BT1FTrs/zwvgyAsaE8fB1Gt
/aK2NfJ4N8rdv0o9jPE9Ht/0iGkoAA9cadyedjQsMkvRHjgLj6iTSASw61V0Mb0G
zcZDPhDlRLHAkI4+N9A1No39OlU3eQDqm5t+fAHf+Ye46Dh+bmo=
=IZal
-----END PGP SIGNATURE-----

--olz4acqeb6axyovd--
