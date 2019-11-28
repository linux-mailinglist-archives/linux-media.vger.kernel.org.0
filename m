Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6841D10C834
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 12:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfK1Lvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 06:51:40 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53453 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfK1Lvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 06:51:40 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ADE29FF808;
        Thu, 28 Nov 2019 11:51:37 +0000 (UTC)
Date:   Thu, 28 Nov 2019 12:53:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 06/23] media: adv748x: csi2: Implement get_fwnode_pad
Message-ID: <20191128115345.k6mn6kjyleahvw7n@uno.localdomain>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-7-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ggkggm5lktxz7hau"
Content-Disposition: inline
In-Reply-To: <20191124190703.12138-7-slongerbeam@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ggkggm5lktxz7hau
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Steve,

On Sun, Nov 24, 2019 at 11:06:46AM -0800, Steve Longerbeam wrote:
> If the given endpoint fwnode passed to the .get_fwnode_pad() op is
> the adv748x-csi2 TXA/TXB source endpoint, return the associated media
> pad index ADV748X_CSI2_SOURCE. The adv748x-csi2 has no other media pads
> that are associated with fwnode endpoints.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 2091cda50935..810085a1f2f0 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -228,6 +228,24 @@ static const struct v4l2_subdev_ops adv748x_csi2_ops = {
>  	.pad = &adv748x_csi2_pad_ops,
>  };
>
> +/* -----------------------------------------------------------------------------
> + * media_entity_operations
> + */
> +
> +static int adv748x_csi2_get_fwnode_pad(struct media_entity *entity,
> +				       struct fwnode_endpoint *endpoint)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +
> +	return endpoint->local_fwnode == tx->sd.fwnode ?
> +		ADV748X_CSI2_SOURCE : -ENXIO;

Couldn't you check if the endpoint port is either 10 or 11, as those
are the only port numbers that provide a CSI-2 source pad ?

In that case you could drop extending get_fwnode_pad() with th entity
argument, as it is only used here (this one is actually the first user
in the whole code base of this operation)

> +}
> +
> +static const struct media_entity_operations adv748x_csi2_entity_ops = {
> +	.get_fwnode_pad = adv748x_csi2_get_fwnode_pad,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Subdev module and controls
>   */
> @@ -295,6 +313,9 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  	/* Register internal ops for incremental subdev registration */
>  	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
>
> +	/* Register media_entity ops */
> +	tx->sd.entity.ops = &adv748x_csi2_entity_ops;
> +
>  	tx->pads[ADV748X_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
>  	tx->pads[ADV748X_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>
> --
> 2.17.1
>

--ggkggm5lktxz7hau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3ftUkACgkQcjQGjxah
VjyY/BAAk3Yl3JXlzC6d4BCpMVfi7K+1ZR3YOGwCPlfAA/rgUomTJxPwR9plQWQs
FOOGi57JbExgLNVRyaFMPoc86WQMVA+YkyrcZ5gCa/AiG0sytWDakickcxpHEP0o
s+pcQ3dqcmu4m4CrxsQLJJL0Ou7DWiMqHVDV6RcR6U/WPb43nu4UHKyjIX1sBVS5
8AmIlYlX6TU2k1T2U5lQSTULpJSo88pRmX9eK0Losi1S0WLzZ1U0Ghpgad0NVxcX
Y5+ScZFNY6BijKgW7qZjBovzGKsC0FukFccE4IOXtcWVSkxnApdpdXk6b8EOZ2Yt
CsSY8o4XJ0JLuyy5+JT0bR2s7jqjMac3LuyO7ahXZmI70rt9eStaDy2PzKx0Q6Ny
VNE53gUhVkg593Zm07LJCJT9O4hQoBpXe85Tbf15rA4kqhqPFtIrITQFgz5Eh+x8
pf+q/w7kvIpRIB+PzTKTjygsnd04Z0U6k+CZd/M6Ce0FP5HgbVK5qevGAVZQBzV+
X8xhPwITqL3bhAj2Zyuex+qNf0mjEaM8I0Hy4aLA7DLjj7bCP0YMPoWq/7/rvTGz
dTJ8hNeGINdyacmqMZp0bGonQQEhxPMrp0HG+zfDUxALkCimWALuBcjboO8IIs46
w0UbMe+WMU2Mb9WGbgG3172wiqtiYxlVpPTANYii6rORvA2NBD0=
=cfEt
-----END PGP SIGNATURE-----

--ggkggm5lktxz7hau--
