Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F34C48D5
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 09:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfJBHww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 03:52:52 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56279 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJBHww (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 03:52:52 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DBCFC2000D;
        Wed,  2 Oct 2019 07:52:48 +0000 (UTC)
Date:   Wed, 2 Oct 2019 09:54:32 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Pass default bus type when parsing
 fwnode endpoint
Message-ID: <20191002075432.bkee4fl6cfcr25iv@uno.localdomain>
References: <20191001145503.5170-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="73eelba4s6ofsnjc"
Content-Disposition: inline
In-Reply-To: <20191001145503.5170-1-manivannan.sadhasivam@linaro.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--73eelba4s6ofsnjc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Manivannan,

On Tue, Oct 01, 2019 at 08:25:03PM +0530, Manivannan Sadhasivam wrote:
> The caller of v4l2_fwnode_endpoint_alloc_parse() is expected to pass a
> valid bus_type parameter for proper working of this API. Hence, pass
> V4L2_MBUS_CSI2_DPHY as the bus_type parameter as this driver only supports
> MIPI CSI2 for now. Without this commit, the API fails on 96Boards
> Dragonboard410c connected to MAX9286 deserializer.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>
> This patch depends on the latest "MAX9286 GMSL Support" series posted
> by Kieran Bingham.
>
>  drivers/media/i2c/max9286.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 9390edf5ad9c..6e1299f15493 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -976,7 +976,9 @@ static int max9286_parse_dt(struct max9286_device *max9286)
>
>  		/* For the source endpoint just parse the bus configuration. */
>  		if (ep.port == MAX9286_SRC_PAD) {
> -			struct v4l2_fwnode_endpoint vep;
> +			struct v4l2_fwnode_endpoint vep = {
> +				.bus_type = V4L2_MBUS_CSI2_DPHY
> +			};

Isn't the bus_type just an hint ? __v4l2_fwnode_endpoint_parse()
should try to parse CSI2 first, and should be able to to deduct the bus
type from the properties specified in DT...

Anyway, I'm not against this change, the contrary actually, I'm just
afraid it might hide some more subtile bug, as we don't need this on
our platforms...

Is the db410c mainline ? Do you have DT snippets for db410c+max9286 to
share?

Thanks
  j

>  			int ret;
>
>  			ret = v4l2_fwnode_endpoint_alloc_parse(
> --
> 2.17.1
>

--73eelba4s6ofsnjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2UV7cACgkQcjQGjxah
VjxWExAAtghKwPYvUCH7VoaEBwFknLuPPuZHr0trVa+rx+fRqR1uCTfuQJObVH9N
bNoWunYlzVU000Bs0fOBQyZrjgtwqNycqNXy3blERdXDPDPNOoEeSObUNqKrMse+
NVcwlsNA/Z/ZffDe9wy0LOvhuXA7ThauMr2PIC6q97NJmZjFKeOH+IOfecbPBhjr
yWzSkes1b3zJ2TxxaSlxnPOeSxAdTkFUzc5hhZAn7vhIStsVJtATWRyGaAb8o4Lp
qvldjHq9/3bgLmdVOV4IxoR6n0l9/YYOTBSXDIwVr36OdvB8SksJfIW08iZXX3Y2
SIu5T9mSIsHFeBTboW1WSFUV5iJmZCNfeWzTeKVapLS9e8wUYjwV6nIGbXz60epU
cD+h36zq0C+a5OuvQFcDfoZbHy7xBk6UJKZh4a5DnzTFHRF1rKaOAB0J4RQGSNrx
q5N0hF6ulPxYOKV/siEWbOe+N8zJAin7IzCbBCQy4iu4Qf36WWSlNM9hICw/BOTa
QmA0lF1rg4r6PZJ2+8U1KmQz9iRxmw1LjB6O/1jrx2qu0lPUW+xRYiBKRwQdKK8n
n9IDtrpFC4noZsjsz1PwLQKwRdL2tf6p4kuVChJb68Q+nSYmTF3d+sTxoB+G7AE6
ZfA958GpLdLBd41o0dGgnbZ8OzkrTyt3qnlGtUlu0kddy0KSSuQ=
=JA7y
-----END PGP SIGNATURE-----

--73eelba4s6ofsnjc--
